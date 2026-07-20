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
import { HandInputData } from 'SpectaclesInteractionKit.lspkg/Providers/HandInputData/HandInputData';

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

    @input
    @hint('Depth emphasis: back/side cards shrink to this fraction of the front card (1 = no depth, 0.6 = back cards 60% size). Front/focused card stays full size for readability.')
    carouselBackScale: number = 0.6;

    // =====================================================================
    // INPUTS — Grid (open-palm) mode
    // =====================================================================
    @input
    @hint('Open the LEFT palm outward (away from you) while the collection is open to fan all cards into a grid that follows your hand. 0 = feature off.')
    enableGridGesture: boolean = true;

    @input
    @hint('Palm-facing angle (deg) above which the open-palm-outward gesture activates. >30 = palm faces away from you. Default 60.')
    gridGestureEnterAngle: number = 60;

    @input
    @hint('Palm-facing angle (deg) below which grid mode releases (hysteresis, < enter). Default 40.')
    gridGestureExitAngle: number = 40;

    @input
    @hint('Number of columns in the grid array. Default 5.')
    gridColumns: number = 5;

    @input
    @hint('Horizontal spacing (cm) between grid cards. Default 13.')
    gridSpacingX: number = 13.0;

    @input
    @hint('Vertical spacing (cm) between grid cards. Default 16.')
    gridSpacingY: number = 16.0;

    @input
    @hint('Card scale in grid mode. Default 0.4')
    gridCardScale: number = 0.4;

    @input
    @hint('How far (cm) to push the grid wall away from your eyes, beyond the palm. Higher = further. Default 25.')
    gridForwardOffset: number = 25.0;

    @input
    @hint('Grid offset X (cm) — shifts the whole array right (+) / left (-) relative to the hand.')
    gridOffsetX: number = 0.0;

    @input
    @hint('Grid offset Y (cm) — shifts the whole array up (+) / down (-) relative to the hand.')
    gridOffsetY: number = 0.0;

    @input
    @hint('Grid offset Z (cm) — shifts the whole array further (+) / closer (-) on top of gridForwardOffset.')
    gridOffsetZ: number = 0.0;

    @input
    @hint('Concave curve depth (cm): how far the grid edges wrap toward you. 0 = flat. Default 8.')
    gridCurveDepth: number = 8.0;

    @input
    @hint('Rows per page in the MY CLOSET grid. Page size = columns x rows. Default 2.')
    gridPageRows: number = 2;

    @input
    @hint('Gap (cm) between the last grid row and the category bar panel. Default 14.')
    gridBarDropOffset: number = 14.0;

    @input
    @hint('Card scale in the MY CLOSET panel. Default 0.45.')
    gridPanelCardScale: number = 0.45;

    @input
    @hint('Horizontal spacing (cm) between MY CLOSET panel cards. Default 18.')
    gridPanelSpacingX: number = 18.0;

    @input
    @hint('Vertical spacing (cm) between MY CLOSET panel cards. Default 22.')
    gridPanelSpacingY: number = 22.0;

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
    private reviewButtonHooked: boolean[] = [];
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
    private pinchGrabAssistSuppressedUntil: number = 0;

    // Carousel angle (driven only by right-hand swipe, no auto-rotation)
    carouselAngleOffset: number = 0;
    private lastFrameTime: number = 0;
    private lastRightHandAngle: number | null = null;

    // Depth-sorted render order: each visible card's visual components are offset
    // by its depth rank so a back card's (transparent, depthTest-off) text can't
    // draw over a nearer card. Front/focused card keeps its original orders (0
    // offset) so nothing changes relative to other scene UI; cards behind it step
    // DOWN. Step must exceed a card's internal renderOrder spread (~15).
    private readonly RENDER_DEPTH_STEP: number = 24;
    private cardRenderCache: Array<{ card: SceneObject; comps: Array<{ comp: any; order: number }> }> = [];

    // Grid (open-palm) mode
    private handProvider: any = null;
    private leftHand: any = null;
    private gridMode: boolean = false;
    private gridCategory: string = 'all';
    private gridPage: number = 0;
    private gridPageCount: number = 1;
    private gridOriginSmoothed: vec3 | null = null;
    private gridBarObject: SceneObject | null = null;
    private gridTitleObject: SceneObject | null = null;
    private gridPrevButton: SceneObject | null = null;
    private gridNextButton: SceneObject | null = null;
    private gridPageText: any = null;
    private gridLostTrackingFrames: number = 0;

    // =====================================================================
    // PUBLIC API
    // =====================================================================

    initialize(
        collectionCardObjects: SceneObject[],
        savedVehicles: SavedVehicleData[],
        cardStates: number[],
        cardFrameHooked: boolean[],
        collectionRoot: SceneObject | null,
        reviewButtonHooked?: boolean[],
    ): void {
        this.collectionCardObjects = collectionCardObjects;
        this.savedVehicles = savedVehicles;
        this.cardStates = cardStates;
        this.cardFrameHooked = cardFrameHooked;
        this.reviewButtonHooked = reviewButtonHooked || [];
        this.collectionRoot = collectionRoot;
        this.lastFrameTime = getTime();
        this.ensureCardRenderCache();
    }

    // =====================================================================
    // DEPTH-SORTED RENDER ORDER
    // =====================================================================

    /**
     * (Re)captures each card's visual components and their ORIGINAL renderOrder.
     * Rebuilds only when the card set changes — freshly instantiated cards carry
     * clean prefab orders, while persisting cards keep their captured originals,
     * so applied offsets never compound across collection open/close.
     */
    private ensureCardRenderCache(): void {
        let sameSet = this.cardRenderCache.length === this.collectionCardObjects.length;
        if (sameSet) {
            for (let i = 0; i < this.collectionCardObjects.length; i++) {
                if (this.cardRenderCache[i].card !== this.collectionCardObjects[i]) { sameSet = false; break; }
            }
        }
        if (sameSet) return;

        this.cardRenderCache = [];
        for (let i = 0; i < this.collectionCardObjects.length; i++) {
            const card = this.collectionCardObjects[i];
            const comps: Array<{ comp: any; order: number }> = [];
            if (card) this.collectRenderComps(card, comps);
            this.cardRenderCache.push({ card: card, comps: comps });
        }
    }

    private collectRenderComps(obj: SceneObject, out: Array<{ comp: any; order: number }>): void {
        // getComponents needs literal type names (not a string variable), so list them out.
        const groups: any[][] = [
            obj.getComponents('Component.RenderMeshVisual') as any[],
            obj.getComponents('Component.Image') as any[],
            obj.getComponents('Component.Text') as any[],
        ];
        for (let g = 0; g < groups.length; g++) {
            const comps = groups[g];
            for (let c = 0; c < comps.length; c++) {
                const comp = comps[c];
                if (comp && typeof comp.renderOrder === 'number') {
                    out.push({ comp: comp, order: comp.renderOrder });
                }
            }
        }
        const n = obj.getChildrenCount();
        for (let i = 0; i < n; i++) {
            const child = obj.getChild(i);
            if (child) this.collectRenderComps(child, out);
        }
    }

    /** Offsets every visual component of card `index` by `offset` from its original renderOrder. */
    private applyCardRenderOffset(index: number, offset: number): void {
        if (index < 0 || index >= this.cardRenderCache.length) return;
        const entry = this.cardRenderCache[index];
        if (!entry || entry.card !== this.collectionCardObjects[index]) return;
        for (let i = 0; i < entry.comps.length; i++) {
            try { entry.comps[i].comp.renderOrder = entry.comps[i].order + offset; } catch (e) { /* ignore */ }
        }
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

    getRightPinchInfo(): { center: vec3; distance: number; isPinching: boolean } | null {
        if (!this.rightIndexTip || !this.rightThumbTip) return null;

        const idxPos = this.rightIndexTip.getTransform().getWorldPosition();
        const thbPos = this.rightThumbTip.getTransform().getWorldPosition();
        const distance = idxPos.sub(thbPos).length;
        const center = new vec3(
            (idxPos.x + thbPos.x) * 0.5,
            (idxPos.y + thbPos.y) * 0.5,
            (idxPos.z + thbPos.z) * 0.5
        );

        return {
            center: center,
            distance: distance,
            isPinching: distance <= this.pinchStartDistanceCm,
        };
    }

    suppressPinchGrabAssist(seconds: number = 0.5): void {
        this.pinchGrabAssistSuppressedUntil = Math.max(this.pinchGrabAssistSuppressedUntil, getTime() + seconds);
        if (this.assistDragging) {
            this.assistDragging = false;
            this.grabbedCardIndex = -1;
        }
    }

    /**
     * Per-frame update — called by CollectionManager's update loop.
     * Updates carousel from right-hand swipe and lerps card transforms.
     */
    updateFrame(): void {
        this.updateGridGesture();
        this.updatePinchGrabAssist();
        this.updateAutoRotation();
        this.lerpCardTransforms();
    }

    // =====================================================================
    // GRID (OPEN-PALM) MODE — fan all cards into a hand-anchored grid
    // =====================================================================

    private ensureHandProvider(): void {
        if (this.handProvider) return;
        try {
            this.handProvider = HandInputData.getInstance();
            this.leftHand = this.handProvider.getHand('left');
        } catch (e) {
            this.handProvider = null;
            this.leftHand = null;
        }
    }

    /**
     * Detects the LEFT open-palm-outward gesture (palm facing away from the user)
     * and toggles grid mode with angle hysteresis + a short grace period so brief
     * tracking dropouts don't collapse the grid. Pinching never counts (so grabbing
     * a card out of the grid doesn't end grid mode).
     */
    private updateGridGesture(): void {
        if (!this.enableGridGesture) { this.gridMode = false; return; }
        this.ensureHandProvider();

        const hand = this.leftHand;
        const tracked = !!hand && typeof hand.isTracked === 'function' && hand.isTracked();
        if (!tracked) {
            // Keep grid up across brief tracking gaps, then release.
            this.gridLostTrackingFrames++;
            if (this.gridLostTrackingFrames > 12) this.gridMode = false;
            return;
        }
        this.gridLostTrackingFrames = 0;

        const angle = typeof hand.getFacingCameraAngle === 'function' ? hand.getFacingCameraAngle() : null;
        const pinching = typeof hand.isPinching === 'function' ? hand.isPinching() : false;
        if (angle === null) return;

        if (this.gridMode) {
            // Stay in grid while palm remains roughly outward.
            this.gridMode = angle > this.gridGestureExitAngle;
        } else {
            // Enter grid on a clear outward palm that isn't pinching.
            this.gridMode = angle > this.gridGestureEnterAngle && !pinching;
        }
    }

    /** True while the open-palm grid is active (read by CollectionManager if needed). */
    isGridMode(): boolean {
        return this.gridMode;
    }

    /** Selects which category the MY CLOSET grid shows ('all' shows everything). */
    setGridCategory(cat: string): void {
        const c = ((cat || 'all') + '').toLowerCase();
        if (c !== this.gridCategory) {
            this.gridCategory = c;
            this.gridPage = 0;
        }
    }

    getGridCategory(): string {
        return this.gridCategory;
    }

    gridNextPage(): void {
        this.gridPage = Math.min(this.gridPage + 1, Math.max(0, this.gridPageCount - 1));
    }

    gridPrevPage(): void {
        this.gridPage = Math.max(0, this.gridPage - 1);
    }

    /** Category-bar / title panels (user-authored) anchored to the grid; pageText shows "1/3". */
    setGridBarObject(obj: SceneObject | null, pageText: any, titleObj: SceneObject | null): void {
        this.gridBarObject = obj;
        this.gridPageText = pageText;
        this.gridTitleObject = titleObj;
    }

    /** Prev/Next buttons — auto-hidden when there's nowhere to page to. */
    setGridPagerButtons(prevBtn: SceneObject | null, nextBtn: SceneObject | null): void {
        if (prevBtn) this.gridPrevButton = prevBtn;
        if (nextBtn) this.gridNextButton = nextBtn;
    }

    /** Panel design: 4 cards per row max (extra Inspector columns are capped). */
    private gridPanelColumns(): number {
        return Math.max(1, Math.min(4, this.gridColumns));
    }

    private cardMatchesGridFilter(i: number): boolean {
        if (this.gridCategory === 'all') return true;
        if (this.gridCategory === 'favorite') {
            const vf: any = this.savedVehicles ? this.savedVehicles[i] : null;
            return !!(vf && vf.favorite === true);
        }
        const v: any = this.savedVehicles ? this.savedVehicles[i] : null;
        const cat = v ? ((v.category || v.type || '') + '').toLowerCase() : '';
        if (cat === this.gridCategory) return true;
        // Tolerate AI variants of the canonical category names.
        const aliases: { [key: string]: string[] } = {
            top: ['tops', 'shirt', 't-shirt', 'tshirt', 'blouse', 'sweater', 'hoodie'],
            bottom: ['bottoms', 'pants', 'trousers', 'jeans', 'skirt', 'shorts'],
            shoes: ['shoe', 'footwear', 'sneakers', 'boots', 'sandals', 'loafers'],
            outerwear: ['jacket', 'jackets', 'coat', 'layer', 'blazer', 'cardigan'],
            accessory: ['accessories', 'bag', 'hat', 'cap', 'belt', 'scarf', 'jewelry', 'sunglasses', 'glasses'],
            dress: ['dresses', 'gown'],
            look: ['looks', 'outfit', 'full look', 'full_look'],
        };
        const list = aliases[this.gridCategory];
        return list ? list.indexOf(cat) >= 0 : false;
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

        // Depth-rank the visible cards (back → front) so render order matches depth:
        // the backmost card keeps its original orders (offset 0), each nearer card
        // steps UP by RENDER_DEPTH_STEP so it covers the cards behind it. Built once
        // per frame. A grabbed/placed card sits above the whole collection.
        const topOffset = (inCollectionCount + 1) * this.RENDER_DEPTH_STEP;
        const renderOffsetByIndex: number[] = [];
        {
            const vis: Array<{ idx: number; front: number }> = [];
            let ci = 0;
            for (let i = 0; i < n; i++) {
                if ((this.cardStates[i] || this.STATE_IN_COLLECTION) !== this.STATE_IN_COLLECTION) continue;
                const ang = ci * angleStep + this.carouselAngleOffset;
                ci++;
                vis.push({ idx: i, front: Math.sin(ang) });
            }
            vis.sort((a, b) => a.front - b.front); // back (lowest sin) first
            for (let r = 0; r < vis.length; r++) {
                // Backmost card keeps its original orders (offset 0 — same as before,
                // so it never drops behind the grey UI backplate); each nearer card
                // steps UP so its background covers the card behind it.
                renderOffsetByIndex[vis[r].idx] = r * this.RENDER_DEPTH_STEP;
            }
        }

        // Out-of-collection cards (grabbed / placed in the world) also need depth-sorted
        // render order, or two overlapping loose cards bleed each other's text through.
        // Sort them by distance to the user (nearest highest) and stack them ABOVE the
        // whole carousel (≥ topOffset).
        const outRenderOffsetByIndex: number[] = [];
        {
            const head = this.onGetUserHeadTransform ? this.onGetUserHeadTransform() : null;
            const outs: Array<{ idx: number; dist: number }> = [];
            for (let i = 0; i < n; i++) {
                const st = this.cardStates[i] || this.STATE_IN_COLLECTION;
                if (st !== this.STATE_PICKED && st !== this.STATE_PLACED_IN_WORLD) continue;
                const card = this.collectionCardObjects[i];
                if (!card) continue;
                const dist = head ? card.getTransform().getWorldPosition().sub(head.position).length : 0;
                outs.push({ idx: i, dist: dist });
            }
            outs.sort((a, b) => b.dist - a.dist); // farthest first → lowest offset
            for (let r = 0; r < outs.length; r++) {
                outRenderOffsetByIndex[outs[r].idx] = topOffset + r * this.RENDER_DEPTH_STEP;
            }
        }

        // Grid (open-palm) frame: a plane anchored at the LEFT palm, facing the user,
        // so the fanned-out grid follows the hand and you can walk / move it by moving
        // your arm. Computed once per frame; falls back to the carousel if unavailable.
        let gridReady = false;
        let gridOrigin: vec3 | null = null;
        let gridRight: vec3 | null = null;
        let gridUp: vec3 | null = null;
        let gridToUser: vec3 | null = null;
        // MY CLOSET panel: only the selected category's current page is laid out;
        // every other in-collection card hides (carousel branch re-enables on exit).
        const gridDisplaySlot: number[] = [];
        let gridPageCardCount = 0;
        if (this.gridMode) {
            // Fixed panel: 4 per row, gridPageRows rows per page — always paginated.
            const pageSize = Math.max(1, this.gridPanelColumns() * Math.max(1, this.gridPageRows));
            const matchOrder: number[] = [];
            for (let gi = 0; gi < n; gi++) {
                gridDisplaySlot[gi] = -1;
                const stG = this.cardStates[gi] || this.STATE_IN_COLLECTION;
                if (stG !== this.STATE_IN_COLLECTION) continue;
                if (!this.collectionCardObjects[gi]) continue;
                // Never filter out a card whose buttons aren't hooked yet (hooker skips disabled cards).
                const hookedG = this.reviewButtonHooked.length === 0 || this.reviewButtonHooked[gi];
                if (this.cardMatchesGridFilter(gi) || !hookedG) matchOrder.push(gi);
            }
            this.gridPageCount = Math.max(1, Math.ceil(matchOrder.length / pageSize));
            if (this.gridPage > this.gridPageCount - 1) this.gridPage = this.gridPageCount - 1;
            const pageStart = this.gridPage * pageSize;
            for (let s = 0; s < pageSize && pageStart + s < matchOrder.length; s++) {
                gridDisplaySlot[matchOrder[pageStart + s]] = s;
                gridPageCardCount++;
            }
        }
        const gridRows = this.gridMode
            ? Math.max(1, this.gridPageRows)
            : Math.max(1, Math.ceil(inCollectionCount / Math.max(1, this.gridColumns)));
        if (this.gridMode) {
            const palm = this.leftHand && typeof this.leftHand.getPalmCenter === 'function'
                ? this.leftHand.getPalmCenter() : null;
            const head = this.onGetUserHeadTransform ? this.onGetUserHeadTransform() : null;
            if (palm && head) {
                // Use the HORIZONTAL palm→user direction so the grid is an upright
                // vertical wall (world-up rows), not a flat slab that tilts when you
                // look down at your hand. Cards still billboard to face your eyes.
                const toUser = head.position.sub(palm);
                const flat = new vec3(toUser.x, 0, toUser.z);
                if (flat.length > 0.001) {
                    const tuFlat = flat.normalize();          // horizontal, palm → you
                    const up = vec3.up();
                    const right = up.cross(tuFlat).normalize();
                    gridToUser = tuFlat;
                    gridRight = right;
                    gridUp = up;
                    // Push the wall away from your eyes (beyond the palm) + tunable X/Y/Z offset.
                    // +17: panel sits deeper so it doesn't crowd the user (was +10; +20% total depth).
                    gridOrigin = palm
                        .add(tuFlat.uniformScale(-this.gridForwardOffset - this.gridOffsetZ - 17))
                        .add(right.uniformScale(this.gridOffsetX))
                        .add(up.uniformScale(this.gridOffsetY));
                    gridReady = true;
                }
            }
        }
        // Damp hand tremor: the raw palm anchor jitters frame to frame, which made
        // the whole panel vibrate. Smooth it before laying anything out.
        if (this.gridMode && gridReady) {
            this.gridOriginSmoothed = this.gridOriginSmoothed
                ? vec3.lerp(this.gridOriginSmoothed, gridOrigin as vec3, 0.12)
                : (gridOrigin as vec3);
            gridOrigin = this.gridOriginSmoothed;
        } else {
            this.gridOriginSmoothed = null;
        }

        // One shared rotation for the whole wall — cards stay coplanar instead of
        // individually billboarding (which made them look like different depths).
        const gridWallRot: quat | null = gridReady ? this.getCardBillboardRotation(gridOrigin as vec3) : null;

        // In grid mode, ALL shown cards (in-array + grabbed + placed) share ONE
        // depth-sorted render order by distance to the user, so an out-of-array card
        // sitting BEHIND an array card doesn't draw its text over it.
        const gridDepthOffsetByIndex: number[] = [];
        if (this.gridMode) {
            const head = this.onGetUserHeadTransform ? this.onGetUserHeadTransform() : null;
            const all: Array<{ idx: number; dist: number }> = [];
            for (let i = 0; i < n; i++) {
                const st = this.cardStates[i] || this.STATE_IN_COLLECTION;
                if (st !== this.STATE_IN_COLLECTION && st !== this.STATE_PICKED && st !== this.STATE_PLACED_IN_WORLD) continue;
                const c = this.collectionCardObjects[i];
                if (!c) continue;
                const dist = head ? c.getTransform().getWorldPosition().sub(head.position).length : 0;
                all.push({ idx: i, dist: dist });
            }
            all.sort((a, b) => b.dist - a.dist); // farthest first → lowest offset
            for (let r = 0; r < all.length; r++) {
                gridDepthOffsetByIndex[all[r].idx] = r * this.RENDER_DEPTH_STEP;
            }
        }

        // Category bar below the panel + optional title above, both nudged a few cm
        // toward the user so they read IN FRONT of the card wall, never behind it.
        const panelHalfHeight = ((Math.max(1, this.gridPageRows) - 1) / 2) * this.gridPanelSpacingY;
        if (this.gridBarObject) {
            if (this.gridMode && gridReady) {
                this.gridBarObject.enabled = true;
                const barPos = (gridOrigin as vec3)
                    .add((gridUp as vec3).uniformScale(-panelHalfHeight - this.gridBarDropOffset))
                    .add((gridToUser as vec3).uniformScale(6));
                const barT = this.gridBarObject.getTransform();
                barT.setWorldPosition(vec3.lerp(barT.getWorldPosition(), barPos, lerpSpeed));
                barT.setWorldRotation(quat.slerp(barT.getWorldRotation(), gridWallRot as quat, lerpSpeed));
            } else {
                this.gridBarObject.enabled = false;
            }
        }
        if (this.gridTitleObject) {
            if (this.gridMode && gridReady) {
                this.gridTitleObject.enabled = true;
                const titlePos = (gridOrigin as vec3)
                    .add((gridUp as vec3).uniformScale(panelHalfHeight + this.gridBarDropOffset))
                    .add((gridToUser as vec3).uniformScale(6));
                const titleT = this.gridTitleObject.getTransform();
                titleT.setWorldPosition(vec3.lerp(titleT.getWorldPosition(), titlePos, lerpSpeed));
                titleT.setWorldRotation(quat.slerp(titleT.getWorldRotation(), gridWallRot as quat, lerpSpeed));
            } else {
                this.gridTitleObject.enabled = false;
            }
        }
        // Prev/Next only when there's actually another page in that direction,
        // and the "1 / 3" indicator only when there is more than one page.
        if (this.gridPrevButton) {
            this.gridPrevButton.enabled = this.gridMode && gridReady && this.gridPage > 0;
        }
        if (this.gridNextButton) {
            this.gridNextButton.enabled = this.gridMode && gridReady && this.gridPage < this.gridPageCount - 1;
        }
        if (this.gridMode && gridReady && this.gridPageText) {
            try {
                this.gridPageText.text = this.gridPageCount > 1
                    ? (this.gridPage + 1) + ' / ' + this.gridPageCount
                    : '';
            } catch (e) { /* text destroyed */ }
        }

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
                this.applyCardRenderOffset(i, this.gridMode ? (gridDepthOffsetByIndex[i] || 0) : (outRenderOffsetByIndex[i] !== undefined ? outRenderOffsetByIndex[i] : topOffset));

            } else if (cardState === this.STATE_PLACED_IN_WORLD) {
                // Stay in place, billboard + PICKED_SCALE
                const cardWorldPos = transform.getWorldPosition();
                const billboardRot = this.getCardBillboardRotation(cardWorldPos);
                transform.setWorldRotation(quat.slerp(transform.getWorldRotation(), billboardRot, lerpSpeed));
                const curLS = transform.getLocalScale();
                const newS = curLS.x + (this.pickedCardScale - curLS.x) * lerpSpeed;
                transform.setLocalScale(new vec3(newS, newS, newS));
                this.applyCardRenderOffset(i, this.gridMode ? (gridDepthOffsetByIndex[i] || 0) : (outRenderOffsetByIndex[i] !== undefined ? outRenderOffsetByIndex[i] : topOffset));

            } else if (this.gridMode && gridReady) {
                // GRID (open-palm) mode — MY CLOSET panel: current category page only.
                circleIdx++;
                const displayIndex = gridDisplaySlot[i] !== undefined ? gridDisplaySlot[i] : -1;
                if (displayIndex < 0) {
                    card.enabled = false;
                    continue;
                }

                const panelCols = this.gridPanelColumns();
                const col = displayIndex % panelCols;
                const row = Math.floor(displayIndex / panelCols);
                const x = (col - (panelCols - 1) / 2) * this.gridPanelSpacingX;
                const y = ((gridRows - 1) / 2 - row) * this.gridPanelSpacingY;
                // Flat aligned wall — every card on the same plane, same depth.
                const targetPos = (gridOrigin as vec3)
                    .add((gridRight as vec3).uniformScale(x))
                    .add((gridUp as vec3).uniformScale(y));

                const curW = transform.getWorldPosition();
                transform.setWorldPosition(vec3.lerp(curW, targetPos, lerpSpeed));

                const curScaleG = transform.getLocalScale();
                const newSG = curScaleG.x + (this.gridPanelCardScale - curScaleG.x) * lerpSpeed;
                transform.setLocalScale(new vec3(newSG, newSG, newSG));

                transform.setWorldRotation(quat.slerp(transform.getWorldRotation(), gridWallRot as quat, lerpSpeed));

                // Unified depth-sorted render order across array + out cards.
                card.enabled = true;
                this.applyCardRenderOffset(i, gridDepthOffsetByIndex[i] || 0);

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

                // Depth emphasis (readability): the front/centre card (sin≈1) stays
                // full size; cards toward the sides and back recede toward
                // carouselBackScale so they stop cluttering / overlapping the focused
                // card. Scale-based, not alpha — the card visuals share materials, so a
                // per-card alpha fade flickers (that's why the old fade was removed).
                const sinVal = Math.sin(angle);            // 1 = front centre, -1 = behind
                let frontness = (sinVal + 1) * 0.5;         // 0 (back) .. 1 (front)
                frontness = Math.max(0, Math.min(1, frontness));
                const depthFactor = this.carouselBackScale + (1 - this.carouselBackScale) * (frontness * frontness);
                const targetScale = this.collectionCardScale * depthFactor;

                const curScale = transform.getLocalScale();
                const newS = curScale.x + (targetScale - curScale.x) * lerpSpeed;
                transform.setLocalScale(new vec3(newS, newS, newS));

                // Billboard facing user + slight tilt
                const cardWorldPos = transform.getWorldPosition();
                const billboardRot = this.getCardBillboardRotation(cardWorldPos);
                const tiltRad = this.CIRCLE_TILT_DEG * (Math.PI / 180);
                const tiltQuat = quat.fromEulerAngles(-tiltRad, 0, 0);
                const finalRot = billboardRot.multiply(tiltQuat);
                transform.setWorldRotation(quat.slerp(transform.getWorldRotation(), finalRot, lerpSpeed));

                // FPS optimization: fully hide cards behind carousel (no render), show when they come back.
                // BUT never hide a card whose per-card delete button hasn't been hooked yet —
                // a disabled card is skipped by the deferred button hooker, so a card that
                // starts in the depop zone would never get its delete button connected.
                const hooked = this.reviewButtonHooked.length === 0 || this.reviewButtonHooked[i];
                if (this.carouselHideThreshold > 0 && sinVal < -this.carouselHideThreshold && hooked) {
                    card.enabled = false;
                } else {
                    card.enabled = true;
                    // Depth-sorted render order: front card at its original orders,
                    // cards behind it stepped down so their text can't bleed over.
                    this.applyCardRenderOffset(i, renderOffsetByIndex[i] || 0);
                }
            }
        }
    }

    // =====================================================================
    // PINCH GRAB ASSIST (fallback when Frame grab is hard)
    // =====================================================================
    private updatePinchGrabAssist(): void {
        if (!this.enablePinchGrabAssist) return;
        if (getTime() < this.pinchGrabAssistSuppressedUntil) return;
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
     * Keeps visible cards fully opaque.
     *
     * The old carousel alpha fade made Polaroids flicker and look washed out
     * while images were loading. Cards can still be hidden behind the wrist by
     * carouselHideThreshold, but any enabled card stays visually stable.
     */
    private applyCarouselFade(card: SceneObject, angle: number): void {
        this.setCardOpacity(card, 1.0);
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
