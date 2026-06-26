/**
 * CardInteraction.ts — Hand interaction for collection cards in DGNS Vehicle Scanner
 *
 * Handles:
 *   - Frame translation hooks (pinch-to-grab via SpectaclesUIKit Frame "Allow Translation")
 *   - Card state transitions (IN_COLLECTION → PICKED → PLACED_IN_WORLD)
 *   - Per-frame card transform lerping (circle layout, scale up/down, billboard)
 *   - Carousel rotation by right-hand swipe only (no auto-rotation; pinch blocks swipe)
 *   - Back-card fade-out (cards behind the carousel become transparent)
 *   - Card billboard rotation facing the user
 *
 * State arrays (cardStates, cardFrameHooked, etc.) are owned by CollectionManager
 * and passed in via `initialize()`.
 *
 * @author DGNS
 * @license MIT
 */

import { SavedVehicleData } from './ClosetTypes';

@component
export class CardInteraction extends BaseScriptComponent {

    // =====================================================================
    // INPUTS — Hand tracking
    // =====================================================================
    @input
    @allowUndefined
    @hint('Right hand index finger tip SceneObject (index-3_end joint)')
    rightIndexTip: SceneObject;

    @input
    @allowUndefined
    @hint('Right hand thumb tip SceneObject (thumb-3_end joint)')
    rightThumbTip: SceneObject;

    @input
    @allowUndefined
    @hint('Card Collection Container — SceneObject under left wrist')
    cardCollectionContainer: SceneObject;

    @input
    @allowUndefined
    @hint('Left palm anchor SceneObject (for fallback hand position)')
    leftPalmAnchor: SceneObject;

    // =====================================================================
    // INPUTS — Carousel parameters (exposed in Inspector)
    // =====================================================================
    @input
    @hint('Scale of cards inside the carousel (small). Default: 0.18')
    collectionCardScale: number = 0.23;

    @input
    @hint('Scale of cards when picked / placed in world (big). Default: 0.36')
    pickedCardScale: number = 0.36;

    @input
    @hint('Minimum radius (cm) of the carousel circle. Default: 2.5')
    carouselRadius: number = 6.5;

    @input
    @hint('Sensitivity of right-hand swipe to rotate carousel (0 = off, 1 = normal)')
    carouselSwipeSensitivity: number = 0.65;

    @input
    @hint('Index–thumb distance (cm) below which swipe is blocked (pinch or near-pinch). Increase if carousel still rotates when approaching to grab.')
    pinchBlockSwipeDistanceCm: number = 7.5;

    @input
    @hint('If enabled, carousel only rotates counter-clockwise from swipe; otherwise clockwise only.')
    invertCarouselSwipeDirection: boolean = false;

    @input
    @hint('Enable pinch grab assist when Frame grab is hard to trigger')
    enablePinchGrabAssist: boolean = true;

    @input
    @hint('Pinch start distance (cm) between index and thumb')
    pinchStartDistanceCm: number = 2.8;

    @input
    @hint('Pinch release distance (cm) between index and thumb')
    pinchReleaseDistanceCm: number = 4.0;

    @input
    @hint('Max distance (cm) from pinch center to card to start assist grab')
    pinchGrabRadiusCm: number = 16.0;

    @input
    @hint('Hide when sin(angle) < -this (0 = only fade, no hide). Higher = pop/depop further behind wrist. Default 0.5 ≈ ~20° extra hidden each side.')
    carouselHideThreshold: number = 0.75;

    // =====================================================================
    // CONSTANTS
    // =====================================================================
    readonly STATE_IN_COLLECTION: number = 0;
    readonly STATE_PICKED: number = 1;
    readonly STATE_PLACED_IN_WORLD: number = 2;

    private readonly CIRCLE_TILT_DEG: number = 8;
    private readonly NEAR_CAROUSEL_DIST: number = 15.0;

    // =====================================================================
    // SHARED STATE — set via initialize(), owned by CollectionManager
    // =====================================================================
    private collectionCardObjects: SceneObject[] = [];
    private savedVehicles: SavedVehicleData[] = [];
    private cardStates: number[] = [];
    private cardFrameHooked: boolean[] = [];
    private collectionRoot: SceneObject | null = null;

    // =====================================================================
    // CALLBACKS — set by orchestrator / CollectionManager
    // =====================================================================
    onShowDescription: ((text: string) => void) | null = null;
    onHideDescriptionAfterDelay: ((seconds: number) => void) | null = null;
    onUpdateDeleteButtonVisibility: (() => void) | null = null;
    onGetUserHeadTransform: (() => { position: vec3; forward: vec3; rotation: quat } | null) | null = null;
    /** Fires when a card is returned to the carousel (clears the description subtitle). */
    onCardReturnedToCollection: ((serial: string) => void) | null = null;
    /** Lets CollectionManager consume a dropped card as an outfit-slot assignment. */
    onCardDroppedOnOutfitSlot: ((cardIndex: number, cardObj: SceneObject) => boolean) | null = null;

    // =====================================================================
    // INTERNAL STATE
    // =====================================================================
    private grabbedCardIndex: number = -1;
    private grabbedPreviousState: number = 0;
    private assistDragging: boolean = false;

    // Carousel angle (driven only by right-hand swipe, no auto-rotation)
    carouselAngleOffset: number = 0;
    private lastFrameTime: number = 0;
    private lastRightHandAngle: number | null = null;

    // =====================================================================
    // PUBLIC API
    // =====================================================================

    initialize(
        collectionCardObjects: SceneObject[],
        savedVehicles: SavedVehicleData[],
        cardStates: number[],
        cardFrameHooked: boolean[],
        collectionRoot: SceneObject | null,
    ): void {
        this.collectionCardObjects = collectionCardObjects;
        this.savedVehicles = savedVehicles;
        this.cardStates = cardStates;
        this.cardFrameHooked = cardFrameHooked;
        this.collectionRoot = collectionRoot;
        this.lastFrameTime = getTime();
    }

    setCollectionRoot(root: SceneObject | null): void {
        this.collectionRoot = root;
    }

    getGrabbedCardIndex(): number {
        return this.grabbedCardIndex;
    }

    setGrabbedCardIndex(idx: number): void {
        this.grabbedCardIndex = idx;
    }

    /**
     * Per-frame update — called by CollectionManager's update loop.
     * Updates carousel from right-hand swipe and lerps card transforms.
     */
    updateFrame(): void {
        this.updatePinchGrabAssist();
        this.updateAutoRotation();
        this.lerpCardTransforms();
    }

    hookCardFrameEvents(cardObj: SceneObject, cardIndex: number): void {
        if (this.cardFrameHooked[cardIndex]) return;

        let attempts = 0;
        const maxAttempts = 600;
        const pollEvent = this.createEvent('UpdateEvent');
        pollEvent.bind(() => {
            const currentIdx = this.collectionCardObjects.indexOf(cardObj);
            if (currentIdx < 0) { pollEvent.enabled = false; return; }
            if (this.cardFrameHooked[currentIdx]) { pollEvent.enabled = false; return; }
            attempts++;
            if (attempts > maxAttempts) { pollEvent.enabled = false; return; }
            if (!cardObj || !cardObj.enabled) return;

            try {
                const scripts = cardObj.getComponents('Component.ScriptComponent') as any[];
                for (let si = 0; si < scripts.length; si++) {
                    const script = scripts[si];
                    if (!script) continue;
                    this.tuneCardFrameHitArea(script);

                    if (script.onTranslationStart && typeof script.onTranslationStart.add === 'function'
                        && script.onTranslationEnd && typeof script.onTranslationEnd.add === 'function') {

                        const cardRef = cardObj;

                        script.onTranslationStart.add(() => {
                            const idx = this.collectionCardObjects.indexOf(cardRef);
                            if (idx >= 0) this.onCardTranslationStart(idx);
                        });

                        script.onTranslationEnd.add(() => {
                            const idx = this.collectionCardObjects.indexOf(cardRef);
                            if (idx >= 0) this.onCardTranslationEnd(idx);
                        });

                        const hookIdx = this.collectionCardObjects.indexOf(cardRef);
                        if (hookIdx >= 0) this.cardFrameHooked[hookIdx] = true;
                        pollEvent.enabled = false;
                        print('CardInteraction: Frame events hooked for card #' + hookIdx);
                        return;
                    }
                }
            } catch (e) { /* polling */ }
        });
    }

    private tuneCardFrameHitArea(script: any): void {
        try {
            if (script._inactive !== undefined) script._inactive = false;
            if (script._onlyInteractOnBorder !== undefined) script._onlyInteractOnBorder = false;
            if (script.onlyInteractOnBorder !== undefined) script.onlyInteractOnBorder = false;
            if (typeof script._width === 'number') script._width = Math.max(script._width, 8.0);
            if (script._size && script._size.x !== undefined) {
                script._size = new vec3(
                    Math.max(script._size.x, 8.0),
                    Math.max(script._size.y, 8.0),
                    script._size.z || 1.0
                );
            }
        } catch (e) {
            // Frame internals vary by SpectaclesUIKit version; this is best-effort.
        }
    }

    // =====================================================================
    // FRAME TRANSLATION CALLBACKS
    // =====================================================================

    private onCardTranslationStart(cardIndex: number): void {
        if (cardIndex < 0 || cardIndex >= this.collectionCardObjects.length) return;

        const name = this.savedVehicles[cardIndex]?.brand_model || '?';
        this.grabbedPreviousState = this.cardStates[cardIndex] || this.STATE_IN_COLLECTION;
        this.cardStates[cardIndex] = this.STATE_PICKED;
        this.grabbedCardIndex = cardIndex;

        print('CardInteraction: Grab card #' + cardIndex + ' (' + name + ')');
        if (this.onShowDescription) this.onShowDescription(name);
        if (this.onUpdateDeleteButtonVisibility) this.onUpdateDeleteButtonVisibility();
    }

    private onCardTranslationEnd(cardIndex: number): void {
        if (cardIndex < 0 || cardIndex >= this.collectionCardObjects.length) return;

        const card = this.collectionCardObjects[cardIndex];
        if (!card) { this.grabbedCardIndex = -1; return; }

        const name = this.savedVehicles[cardIndex]?.brand_model || '?';
        const cardWorldPos = card.getTransform().getWorldPosition();

        let distToCarousel = 999;
        if (this.collectionRoot) {
            distToCarousel = cardWorldPos.sub(this.collectionRoot.getTransform().getWorldPosition()).length;
        }

        const serial = this.savedVehicles[cardIndex]?.serial || '';

        if (this.onCardDroppedOnOutfitSlot && this.onCardDroppedOnOutfitSlot(cardIndex, card)) {
            this.cardStates[cardIndex] = this.STATE_IN_COLLECTION;
            if (this.collectionRoot && card.getParent() !== this.collectionRoot) {
                const oldParent = card.getParent();
                card.setParent(this.collectionRoot);
                card.getTransform().setLocalPosition(vec3.zero());
                card.getTransform().setLocalScale(new vec3(this.collectionCardScale, this.collectionCardScale, this.collectionCardScale));
                if (oldParent && oldParent.name && oldParent.name.indexOf('WorldCard_') >= 0) {
                    try { oldParent.destroy(); } catch (e) { /* ignore */ }
                }
            }
            this.setCardOpacity(card, 1.0);
            if (serial && this.onCardReturnedToCollection) {
                this.onCardReturnedToCollection(serial);
            }
            this.grabbedCardIndex = -1;
            if (this.onUpdateDeleteButtonVisibility) this.onUpdateDeleteButtonVisibility();
            return;
        }

        if (distToCarousel <= this.NEAR_CAROUSEL_DIST) {
            this.cardStates[cardIndex] = this.STATE_IN_COLLECTION;
            if (this.collectionRoot && card.getParent() !== this.collectionRoot) {
                const oldParent = card.getParent();
                card.setParent(this.collectionRoot);
                card.getTransform().setLocalPosition(vec3.zero());
                card.getTransform().setLocalScale(new vec3(this.collectionCardScale, this.collectionCardScale, this.collectionCardScale));
                if (oldParent && oldParent.name && oldParent.name.indexOf('WorldCard_') >= 0) {
                    try { oldParent.destroy(); } catch (e) { /* ignore */ }
                }
            }
            // Restore full opacity when returning to collection
            this.setCardOpacity(card, 1.0);
            if (this.onShowDescription) this.onShowDescription(name + ' returned');
            if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(2.0);

            // Always notify return-to-collection after a grab end near the carousel.
            // Even if the card was never world-placed, remote peers may have spawned
            // a grabbed clone on translation start that must be cleaned up.
            if (serial && this.onCardReturnedToCollection) {
                this.onCardReturnedToCollection(serial);
            }
        } else {
            this.cardStates[cardIndex] = this.STATE_PLACED_IN_WORLD;
            if (this.collectionRoot && card.getParent() === this.collectionRoot) {
                const curWPos = card.getTransform().getWorldPosition();
                const curWRot = card.getTransform().getWorldRotation();
                const curWScale = card.getTransform().getWorldScale();
                const anchor = global.scene.createSceneObject('WorldCard_' + cardIndex);
                card.setParent(anchor);
                card.getTransform().setWorldPosition(curWPos);
                card.getTransform().setWorldRotation(curWRot);
                card.getTransform().setWorldScale(curWScale);
            }
            // Ensure full opacity for placed cards
            this.setCardOpacity(card, 1.0);
            if (this.onShowDescription) this.onShowDescription(name + ' placed');
            if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(2.0);
        }

        this.grabbedCardIndex = -1;
        if (this.onUpdateDeleteButtonVisibility) this.onUpdateDeleteButtonVisibility();
    }

    // =====================================================================
    // CAROUSEL ROTATION — Right-hand swipe only (no auto-rotation)
    // =====================================================================

    /**
     * Updates carousel angle from right-hand sweep. No rotation when hand is
     * in pinch or near-pinch (index and thumb close).
     */
    private updateAutoRotation(): void {
        this.lastFrameTime = getTime();
        if (this.grabbedCardIndex >= 0) return;
        if (this.carouselSwipeSensitivity <= 0) return;
        if (!this.collectionRoot || !this.rightIndexTip || !this.rightThumbTip) return;

        const idxPos = this.rightIndexTip.getTransform().getWorldPosition();
        const thbPos = this.rightThumbTip.getTransform().getWorldPosition();
        const pinchDist = idxPos.sub(thbPos).length;

        if (pinchDist <= this.pinchBlockSwipeDistanceCm) {
            this.lastRightHandAngle = null;
            return;
        }

        const handCenter = new vec3(
            (idxPos.x + thbPos.x) * 0.5,
            (idxPos.y + thbPos.y) * 0.5,
            (idxPos.z + thbPos.z) * 0.5
        );
        const center = this.collectionRoot.getTransform().getWorldPosition();
        const dx = handCenter.x - center.x;
        const dz = handCenter.z - center.z;
        const curAngle = Math.atan2(dx, dz);

        if (this.lastRightHandAngle !== null) {
            let delta = curAngle - this.lastRightHandAngle;
            if (delta > Math.PI) delta -= 2 * Math.PI;
            if (delta < -Math.PI) delta += 2 * Math.PI;
            const clockwiseOnly = !this.invertCarouselSwipeDirection;
            const allowRotation = clockwiseOnly ? delta < 0 : delta > 0;
            if (allowRotation) {
                this.carouselAngleOffset -= delta * this.carouselSwipeSensitivity;
            }
        }
        this.lastRightHandAngle = curAngle;
    }

    // =====================================================================
    // PER-FRAME CARD TRANSFORM LERPING
    // =====================================================================

    private lerpCardTransforms(): void {
        const n = this.collectionCardObjects.length;
        if (n === 0) return;

        const lerpSpeed = 0.15;
        const grabLerpSpeed = 0.3;

        let inCollectionCount = 0;
        for (let i = 0; i < n; i++) {
            if ((this.cardStates[i] || this.STATE_IN_COLLECTION) === this.STATE_IN_COLLECTION) inCollectionCount++;
        }

        const radius = Math.max(this.carouselRadius, inCollectionCount * 0.7);
        const angleStep = inCollectionCount > 0 ? (2 * Math.PI) / inCollectionCount : 0;
        let circleIdx = 0;

        for (let i = 0; i < n; i++) {
            const card = this.collectionCardObjects[i];
            if (!card) continue;

            const transform = card.getTransform();
            const cardState = this.cardStates[i] || this.STATE_IN_COLLECTION;

            if (cardState === this.STATE_PICKED) {
                // Frame (or pinch assist) handles position/rotation — we only scale up
                const curLS = transform.getLocalScale();
                const newS = curLS.x + (this.pickedCardScale - curLS.x) * grabLerpSpeed;
                transform.setLocalScale(new vec3(newS, newS, newS));

            } else if (cardState === this.STATE_PLACED_IN_WORLD) {
                // Stay in place, billboard + PICKED_SCALE
                const cardWorldPos = transform.getWorldPosition();
                const billboardRot = this.getCardBillboardRotation(cardWorldPos);
                transform.setWorldRotation(quat.slerp(transform.getWorldRotation(), billboardRot, lerpSpeed));
                const curLS = transform.getLocalScale();
                const newS = curLS.x + (this.pickedCardScale - curLS.x) * lerpSpeed;
                transform.setLocalScale(new vec3(newS, newS, newS));

            } else {
                // IN_COLLECTION — circle position + billboard + scale + fade
                const angle = circleIdx * angleStep + this.carouselAngleOffset;
                circleIdx++;

                const targetX = radius * Math.cos(angle);
                const targetZ = radius * Math.sin(angle);

                const curPos = transform.getLocalPosition();
                transform.setLocalPosition(new vec3(
                    curPos.x + (targetX - curPos.x) * lerpSpeed,
                    curPos.y + (0 - curPos.y) * lerpSpeed,
                    curPos.z + (targetZ - curPos.z) * lerpSpeed
                ));

                const curScale = transform.getLocalScale();
                const newS = curScale.x + (this.collectionCardScale - curScale.x) * lerpSpeed;
                transform.setLocalScale(new vec3(newS, newS, newS));

                // Billboard facing user + slight tilt
                const cardWorldPos = transform.getWorldPosition();
                const billboardRot = this.getCardBillboardRotation(cardWorldPos);
                const tiltRad = this.CIRCLE_TILT_DEG * (Math.PI / 180);
                const tiltQuat = quat.fromEulerAngles(-tiltRad, 0, 0);
                const finalRot = billboardRot.multiply(tiltQuat);
                transform.setWorldRotation(quat.slerp(transform.getWorldRotation(), finalRot, lerpSpeed));

                // FPS optimization: fully hide cards behind carousel (no render), show when they come back
                const sinVal = Math.sin(angle);
                if (this.carouselHideThreshold > 0 && sinVal < -this.carouselHideThreshold) {
                    card.enabled = false;
                } else {
                    card.enabled = true;
                    this.applyCarouselFade(card, angle);
                }
            }
        }
    }

    // =====================================================================
    // PINCH GRAB ASSIST (fallback when Frame grab is hard)
    // =====================================================================
    private updatePinchGrabAssist(): void {
        if (!this.enablePinchGrabAssist) return;
        if (!this.rightIndexTip || !this.rightThumbTip) return;

        const idxPos = this.rightIndexTip.getTransform().getWorldPosition();
        const thbPos = this.rightThumbTip.getTransform().getWorldPosition();
        const pinchDist = idxPos.sub(thbPos).length;
        const pinchCenter = new vec3(
            (idxPos.x + thbPos.x) * 0.5,
            (idxPos.y + thbPos.y) * 0.5,
            (idxPos.z + thbPos.z) * 0.5
        );

        const isPinching = pinchDist <= this.pinchStartDistanceCm;
        const isReleasing = pinchDist >= this.pinchReleaseDistanceCm;

        // Start assist grab only if nothing is currently grabbed by Frame.
        if (!this.assistDragging && this.grabbedCardIndex < 0 && isPinching) {
            const nearest = this.findNearestGrabbableCard(pinchCenter, this.pinchGrabRadiusCm);
            if (nearest >= 0) {
                this.assistDragging = true;
                this.onCardTranslationStart(nearest);
            }
        }

        if (!this.assistDragging) return;
        if (this.grabbedCardIndex < 0 || this.grabbedCardIndex >= this.collectionCardObjects.length) {
            this.assistDragging = false;
            return;
        }

        const card = this.collectionCardObjects[this.grabbedCardIndex];
        if (!card || !card.enabled) {
            this.assistDragging = false;
            return;
        }

        // While pinching, drive the card from pinch center.
        if (!isReleasing) {
            const head = this.onGetUserHeadTransform ? this.onGetUserHeadTransform() : null;
            let targetPos = pinchCenter;
            if (head) {
                // Keep card slightly in front of fingers for readability and easier release.
                targetPos = pinchCenter.add(head.forward.uniformScale(6.0));
                card.getTransform().setWorldRotation(this.getCardBillboardRotation(targetPos));
            }
            card.getTransform().setWorldPosition(targetPos);
            return;
        }

        // Release assist grab.
        const idx = this.grabbedCardIndex;
        this.assistDragging = false;
        this.onCardTranslationEnd(idx);
    }

    private findNearestGrabbableCard(center: vec3, radius: number): number {
        let bestIdx = -1;
        let bestDist = radius;

        for (let i = 0; i < this.collectionCardObjects.length; i++) {
            const card = this.collectionCardObjects[i];
            if (!card || !card.enabled) continue;

            const state = this.cardStates[i] || this.STATE_IN_COLLECTION;
            if (state !== this.STATE_IN_COLLECTION && state !== this.STATE_PLACED_IN_WORLD) continue;

            const d = card.getTransform().getWorldPosition().sub(center).length;
            if (d <= bestDist) {
                bestDist = d;
                bestIdx = i;
            }
        }
        return bestIdx;
    }

    // =====================================================================
    // CAROUSEL FADE — Cards at the back become transparent
    // =====================================================================

    /**
     * Fades cards based on their angular position in the carousel.
     * Front-facing cards (toward user) are fully opaque.
     * Back-facing cards smoothly fade to near-transparent.
     *
     * Uses the user head direction to determine "front" vs "back".
     * Fallback: uses the carousel's local Z axis (sin of angle).
     */
    private applyCarouselFade(card: SceneObject, angle: number): void {
        // Normalize angle to determine front/back position
        // sin(angle) > 0 = "front" side, sin(angle) < 0 = "back" side
        // We want: front = 1.0 opacity, back = 0.0 opacity, sides = partial
        const sinVal = Math.sin(angle);
        // Map [-1, 1] to [0, 1]: front=1, back=0
        const rawOpacity = (sinVal + 1.0) * 0.5;
        // Apply a curve for smoother transition: ease in/out
        const opacity = rawOpacity * rawOpacity * (3 - 2 * rawOpacity);
        // Clamp to a minimum so cards don't fully vanish (keeps a hint of presence)
        const finalOpacity = Math.max(0.0, Math.min(1.0, opacity));

        this.setCardOpacity(card, finalOpacity);
    }

    /**
     * Sets the opacity of all visual components on a card.
     * Works with RenderMeshVisual (planes, 3D elements) and Image components.
     */
    private setCardOpacity(card: SceneObject, opacity: number): void {
        this.applyOpacityRecursive(card, opacity);
    }

    private applyOpacityRecursive(obj: SceneObject, opacity: number): void {
        // RenderMeshVisual — for 3D planes, stat bars, etc.
        const meshVisual = obj.getComponent('Component.RenderMeshVisual') as RenderMeshVisual;
        if (meshVisual && meshVisual.mainPass) {
            try {
                const baseColor = meshVisual.mainPass.baseColor;
                meshVisual.mainPass.baseColor = new vec4(baseColor.r, baseColor.g, baseColor.b, opacity);
            } catch (e) { /* some materials don't support baseColor alpha */ }
        }

        // Image — for card image, brand logo, etc.
        const imageComp = obj.getComponent('Component.Image') as Image;
        if (imageComp && imageComp.mainPass) {
            try {
                const baseColor = imageComp.mainPass.baseColor;
                imageComp.mainPass.baseColor = new vec4(baseColor.r, baseColor.g, baseColor.b, opacity);
            } catch (e) { /* ignore */ }
        }

        // Text — for labels, stats text, rarity, etc.
        const textComp = obj.getComponent('Component.Text') as Text;
        if (textComp) {
            try {
                const tc = textComp.textFill.color;
                textComp.textFill.color = new vec4(tc.r, tc.g, tc.b, opacity);
            } catch (e) {
                // Fallback: try outlineSettings or just skip
            }
        }

        // Recurse into children
        const childCount = obj.getChildrenCount();
        for (let i = 0; i < childCount; i++) {
            const child = obj.getChild(i);
            if (child) this.applyOpacityRecursive(child, opacity);
        }
    }

    // =====================================================================
    // BILLBOARD ROTATION
    // =====================================================================

    private getCardBillboardRotation(cardWorldPos: vec3): quat {
        if (this.onGetUserHeadTransform) {
            const headData = this.onGetUserHeadTransform();
            if (headData) {
                const toUser = headData.position.sub(cardWorldPos);
                if (toUser.length > 0.01) return quat.lookAt(toUser.normalize(), vec3.up());
            }
        }
        const toOrigin = vec3.zero().sub(cardWorldPos);
        if (toOrigin.length > 0.01) return quat.lookAt(toOrigin.normalize(), vec3.up());
        return quat.fromEulerAngles(0, 0, 0);
    }
}
