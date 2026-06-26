"use strict";
var __esDecorate = (this && this.__esDecorate) || function (ctor, descriptorIn, decorators, contextIn, initializers, extraInitializers) {
    function accept(f) { if (f !== void 0 && typeof f !== "function") throw new TypeError("Function expected"); return f; }
    var kind = contextIn.kind, key = kind === "getter" ? "get" : kind === "setter" ? "set" : "value";
    var target = !descriptorIn && ctor ? contextIn["static"] ? ctor : ctor.prototype : null;
    var descriptor = descriptorIn || (target ? Object.getOwnPropertyDescriptor(target, contextIn.name) : {});
    var _, done = false;
    for (var i = decorators.length - 1; i >= 0; i--) {
        var context = {};
        for (var p in contextIn) context[p] = p === "access" ? {} : contextIn[p];
        for (var p in contextIn.access) context.access[p] = contextIn.access[p];
        context.addInitializer = function (f) { if (done) throw new TypeError("Cannot add initializers after decoration has completed"); extraInitializers.push(accept(f || null)); };
        var result = (0, decorators[i])(kind === "accessor" ? { get: descriptor.get, set: descriptor.set } : descriptor[key], context);
        if (kind === "accessor") {
            if (result === void 0) continue;
            if (result === null || typeof result !== "object") throw new TypeError("Object expected");
            if (_ = accept(result.get)) descriptor.get = _;
            if (_ = accept(result.set)) descriptor.set = _;
            if (_ = accept(result.init)) initializers.unshift(_);
        }
        else if (_ = accept(result)) {
            if (kind === "field") initializers.unshift(_);
            else descriptor[key] = _;
        }
    }
    if (target) Object.defineProperty(target, contextIn.name, descriptor);
    done = true;
};
var __runInitializers = (this && this.__runInitializers) || function (thisArg, initializers, value) {
    var useValue = arguments.length > 2;
    for (var i = 0; i < initializers.length; i++) {
        value = useValue ? initializers[i].call(thisArg, value) : initializers[i].call(thisArg);
    }
    return useValue ? value : void 0;
};
var __setFunctionName = (this && this.__setFunctionName) || function (f, name, prefix) {
    if (typeof name === "symbol") name = name.description ? "[".concat(name.description, "]") : "";
    return Object.defineProperty(f, "name", { configurable: true, value: prefix ? "".concat(prefix, " ", name) : name });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.CardInteraction = void 0;
var __selfType = requireType("./CardInteraction");
function component(target) {
    target.getTypeName = function () { return __selfType; };
    if (target.prototype.hasOwnProperty("getTypeName"))
        return;
    Object.defineProperty(target.prototype, "getTypeName", {
        value: function () { return __selfType; },
        configurable: true,
        writable: true
    });
}
let CardInteraction = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var CardInteraction = _classThis = class extends _classSuper {
        constructor() {
            super();
            // =====================================================================
            // INPUTS — Hand tracking
            // =====================================================================
            this.rightIndexTip = this.rightIndexTip;
            this.rightThumbTip = this.rightThumbTip;
            this.cardCollectionContainer = this.cardCollectionContainer;
            this.leftPalmAnchor = this.leftPalmAnchor;
            // =====================================================================
            // INPUTS — Carousel parameters (exposed in Inspector)
            // =====================================================================
            this.collectionCardScale = this.collectionCardScale;
            this.pickedCardScale = this.pickedCardScale;
            this.carouselRadius = this.carouselRadius;
            this.carouselSwipeSensitivity = this.carouselSwipeSensitivity;
            this.pinchBlockSwipeDistanceCm = this.pinchBlockSwipeDistanceCm;
            this.invertCarouselSwipeDirection = this.invertCarouselSwipeDirection;
            this.enablePinchGrabAssist = this.enablePinchGrabAssist;
            this.pinchStartDistanceCm = this.pinchStartDistanceCm;
            this.pinchReleaseDistanceCm = this.pinchReleaseDistanceCm;
            this.pinchGrabRadiusCm = this.pinchGrabRadiusCm;
            this.carouselHideThreshold = this.carouselHideThreshold;
            // =====================================================================
            // CONSTANTS
            // =====================================================================
            this.STATE_IN_COLLECTION = 0;
            this.STATE_PICKED = 1;
            this.STATE_PLACED_IN_WORLD = 2;
            this.CIRCLE_TILT_DEG = 8;
            this.NEAR_CAROUSEL_DIST = 15.0;
            // =====================================================================
            // SHARED STATE — set via initialize(), owned by CollectionManager
            // =====================================================================
            this.collectionCardObjects = [];
            this.savedVehicles = [];
            this.cardStates = [];
            this.cardFrameHooked = [];
            this.collectionRoot = null;
            // =====================================================================
            // CALLBACKS — set by orchestrator / CollectionManager
            // =====================================================================
            this.onShowDescription = null;
            this.onHideDescriptionAfterDelay = null;
            this.onUpdateDeleteButtonVisibility = null;
            this.onGetUserHeadTransform = null;
            /** Fires when a card is returned to the carousel (clears the description subtitle). */
            this.onCardReturnedToCollection = null;
            /** Lets CollectionManager consume a dropped card as an outfit-slot assignment. */
            this.onCardDroppedOnOutfitSlot = null;
            // =====================================================================
            // INTERNAL STATE
            // =====================================================================
            this.grabbedCardIndex = -1;
            this.grabbedPreviousState = 0;
            this.assistDragging = false;
            // Carousel angle (driven only by right-hand swipe, no auto-rotation)
            this.carouselAngleOffset = 0;
            this.lastFrameTime = 0;
            this.lastRightHandAngle = null;
        }
        __initialize() {
            super.__initialize();
            // =====================================================================
            // INPUTS — Hand tracking
            // =====================================================================
            this.rightIndexTip = this.rightIndexTip;
            this.rightThumbTip = this.rightThumbTip;
            this.cardCollectionContainer = this.cardCollectionContainer;
            this.leftPalmAnchor = this.leftPalmAnchor;
            // =====================================================================
            // INPUTS — Carousel parameters (exposed in Inspector)
            // =====================================================================
            this.collectionCardScale = this.collectionCardScale;
            this.pickedCardScale = this.pickedCardScale;
            this.carouselRadius = this.carouselRadius;
            this.carouselSwipeSensitivity = this.carouselSwipeSensitivity;
            this.pinchBlockSwipeDistanceCm = this.pinchBlockSwipeDistanceCm;
            this.invertCarouselSwipeDirection = this.invertCarouselSwipeDirection;
            this.enablePinchGrabAssist = this.enablePinchGrabAssist;
            this.pinchStartDistanceCm = this.pinchStartDistanceCm;
            this.pinchReleaseDistanceCm = this.pinchReleaseDistanceCm;
            this.pinchGrabRadiusCm = this.pinchGrabRadiusCm;
            this.carouselHideThreshold = this.carouselHideThreshold;
            // =====================================================================
            // CONSTANTS
            // =====================================================================
            this.STATE_IN_COLLECTION = 0;
            this.STATE_PICKED = 1;
            this.STATE_PLACED_IN_WORLD = 2;
            this.CIRCLE_TILT_DEG = 8;
            this.NEAR_CAROUSEL_DIST = 15.0;
            // =====================================================================
            // SHARED STATE — set via initialize(), owned by CollectionManager
            // =====================================================================
            this.collectionCardObjects = [];
            this.savedVehicles = [];
            this.cardStates = [];
            this.cardFrameHooked = [];
            this.collectionRoot = null;
            // =====================================================================
            // CALLBACKS — set by orchestrator / CollectionManager
            // =====================================================================
            this.onShowDescription = null;
            this.onHideDescriptionAfterDelay = null;
            this.onUpdateDeleteButtonVisibility = null;
            this.onGetUserHeadTransform = null;
            /** Fires when a card is returned to the carousel (clears the description subtitle). */
            this.onCardReturnedToCollection = null;
            /** Lets CollectionManager consume a dropped card as an outfit-slot assignment. */
            this.onCardDroppedOnOutfitSlot = null;
            // =====================================================================
            // INTERNAL STATE
            // =====================================================================
            this.grabbedCardIndex = -1;
            this.grabbedPreviousState = 0;
            this.assistDragging = false;
            // Carousel angle (driven only by right-hand swipe, no auto-rotation)
            this.carouselAngleOffset = 0;
            this.lastFrameTime = 0;
            this.lastRightHandAngle = null;
        }
        // =====================================================================
        // PUBLIC API
        // =====================================================================
        initialize(collectionCardObjects, savedVehicles, cardStates, cardFrameHooked, collectionRoot) {
            this.collectionCardObjects = collectionCardObjects;
            this.savedVehicles = savedVehicles;
            this.cardStates = cardStates;
            this.cardFrameHooked = cardFrameHooked;
            this.collectionRoot = collectionRoot;
            this.lastFrameTime = getTime();
        }
        setCollectionRoot(root) {
            this.collectionRoot = root;
        }
        getGrabbedCardIndex() {
            return this.grabbedCardIndex;
        }
        setGrabbedCardIndex(idx) {
            this.grabbedCardIndex = idx;
        }
        /**
         * Per-frame update — called by CollectionManager's update loop.
         * Updates carousel from right-hand swipe and lerps card transforms.
         */
        updateFrame() {
            this.updatePinchGrabAssist();
            this.updateAutoRotation();
            this.lerpCardTransforms();
        }
        hookCardFrameEvents(cardObj, cardIndex) {
            if (this.cardFrameHooked[cardIndex])
                return;
            let attempts = 0;
            const maxAttempts = 600;
            const pollEvent = this.createEvent('UpdateEvent');
            pollEvent.bind(() => {
                const currentIdx = this.collectionCardObjects.indexOf(cardObj);
                if (currentIdx < 0) {
                    pollEvent.enabled = false;
                    return;
                }
                if (this.cardFrameHooked[currentIdx]) {
                    pollEvent.enabled = false;
                    return;
                }
                attempts++;
                if (attempts > maxAttempts) {
                    pollEvent.enabled = false;
                    return;
                }
                if (!cardObj || !cardObj.enabled)
                    return;
                try {
                    const scripts = cardObj.getComponents('Component.ScriptComponent');
                    for (let si = 0; si < scripts.length; si++) {
                        const script = scripts[si];
                        if (!script)
                            continue;
                        this.tuneCardFrameHitArea(script);
                        if (script.onTranslationStart && typeof script.onTranslationStart.add === 'function'
                            && script.onTranslationEnd && typeof script.onTranslationEnd.add === 'function') {
                            const cardRef = cardObj;
                            script.onTranslationStart.add(() => {
                                const idx = this.collectionCardObjects.indexOf(cardRef);
                                if (idx >= 0)
                                    this.onCardTranslationStart(idx);
                            });
                            script.onTranslationEnd.add(() => {
                                const idx = this.collectionCardObjects.indexOf(cardRef);
                                if (idx >= 0)
                                    this.onCardTranslationEnd(idx);
                            });
                            const hookIdx = this.collectionCardObjects.indexOf(cardRef);
                            if (hookIdx >= 0)
                                this.cardFrameHooked[hookIdx] = true;
                            pollEvent.enabled = false;
                            print('CardInteraction: Frame events hooked for card #' + hookIdx);
                            return;
                        }
                    }
                }
                catch (e) { /* polling */ }
            });
        }
        tuneCardFrameHitArea(script) {
            try {
                if (script._inactive !== undefined)
                    script._inactive = false;
                if (script._onlyInteractOnBorder !== undefined)
                    script._onlyInteractOnBorder = false;
                if (script.onlyInteractOnBorder !== undefined)
                    script.onlyInteractOnBorder = false;
                if (typeof script._width === 'number')
                    script._width = Math.max(script._width, 8.0);
                if (script._size && script._size.x !== undefined) {
                    script._size = new vec3(Math.max(script._size.x, 8.0), Math.max(script._size.y, 8.0), script._size.z || 1.0);
                }
            }
            catch (e) {
                // Frame internals vary by SpectaclesUIKit version; this is best-effort.
            }
        }
        // =====================================================================
        // FRAME TRANSLATION CALLBACKS
        // =====================================================================
        onCardTranslationStart(cardIndex) {
            if (cardIndex < 0 || cardIndex >= this.collectionCardObjects.length)
                return;
            const name = this.savedVehicles[cardIndex]?.brand_model || '?';
            this.grabbedPreviousState = this.cardStates[cardIndex] || this.STATE_IN_COLLECTION;
            this.cardStates[cardIndex] = this.STATE_PICKED;
            this.grabbedCardIndex = cardIndex;
            print('CardInteraction: Grab card #' + cardIndex + ' (' + name + ')');
            if (this.onShowDescription)
                this.onShowDescription(name);
            if (this.onUpdateDeleteButtonVisibility)
                this.onUpdateDeleteButtonVisibility();
        }
        onCardTranslationEnd(cardIndex) {
            if (cardIndex < 0 || cardIndex >= this.collectionCardObjects.length)
                return;
            const card = this.collectionCardObjects[cardIndex];
            if (!card) {
                this.grabbedCardIndex = -1;
                return;
            }
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
                        try {
                            oldParent.destroy();
                        }
                        catch (e) { /* ignore */ }
                    }
                }
                this.setCardOpacity(card, 1.0);
                if (serial && this.onCardReturnedToCollection) {
                    this.onCardReturnedToCollection(serial);
                }
                this.grabbedCardIndex = -1;
                if (this.onUpdateDeleteButtonVisibility)
                    this.onUpdateDeleteButtonVisibility();
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
                        try {
                            oldParent.destroy();
                        }
                        catch (e) { /* ignore */ }
                    }
                }
                // Restore full opacity when returning to collection
                this.setCardOpacity(card, 1.0);
                if (this.onShowDescription)
                    this.onShowDescription(name + ' returned');
                if (this.onHideDescriptionAfterDelay)
                    this.onHideDescriptionAfterDelay(2.0);
                // Always notify return-to-collection after a grab end near the carousel.
                // Even if the card was never world-placed, remote peers may have spawned
                // a grabbed clone on translation start that must be cleaned up.
                if (serial && this.onCardReturnedToCollection) {
                    this.onCardReturnedToCollection(serial);
                }
            }
            else {
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
                if (this.onShowDescription)
                    this.onShowDescription(name + ' placed');
                if (this.onHideDescriptionAfterDelay)
                    this.onHideDescriptionAfterDelay(2.0);
            }
            this.grabbedCardIndex = -1;
            if (this.onUpdateDeleteButtonVisibility)
                this.onUpdateDeleteButtonVisibility();
        }
        // =====================================================================
        // CAROUSEL ROTATION — Right-hand swipe only (no auto-rotation)
        // =====================================================================
        /**
         * Updates carousel angle from right-hand sweep. No rotation when hand is
         * in pinch or near-pinch (index and thumb close).
         */
        updateAutoRotation() {
            this.lastFrameTime = getTime();
            if (this.grabbedCardIndex >= 0)
                return;
            if (this.carouselSwipeSensitivity <= 0)
                return;
            if (!this.collectionRoot || !this.rightIndexTip || !this.rightThumbTip)
                return;
            const idxPos = this.rightIndexTip.getTransform().getWorldPosition();
            const thbPos = this.rightThumbTip.getTransform().getWorldPosition();
            const pinchDist = idxPos.sub(thbPos).length;
            if (pinchDist <= this.pinchBlockSwipeDistanceCm) {
                this.lastRightHandAngle = null;
                return;
            }
            const handCenter = new vec3((idxPos.x + thbPos.x) * 0.5, (idxPos.y + thbPos.y) * 0.5, (idxPos.z + thbPos.z) * 0.5);
            const center = this.collectionRoot.getTransform().getWorldPosition();
            const dx = handCenter.x - center.x;
            const dz = handCenter.z - center.z;
            const curAngle = Math.atan2(dx, dz);
            if (this.lastRightHandAngle !== null) {
                let delta = curAngle - this.lastRightHandAngle;
                if (delta > Math.PI)
                    delta -= 2 * Math.PI;
                if (delta < -Math.PI)
                    delta += 2 * Math.PI;
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
        lerpCardTransforms() {
            const n = this.collectionCardObjects.length;
            if (n === 0)
                return;
            const lerpSpeed = 0.15;
            const grabLerpSpeed = 0.3;
            let inCollectionCount = 0;
            for (let i = 0; i < n; i++) {
                if ((this.cardStates[i] || this.STATE_IN_COLLECTION) === this.STATE_IN_COLLECTION)
                    inCollectionCount++;
            }
            const radius = Math.max(this.carouselRadius, inCollectionCount * 0.7);
            const angleStep = inCollectionCount > 0 ? (2 * Math.PI) / inCollectionCount : 0;
            let circleIdx = 0;
            for (let i = 0; i < n; i++) {
                const card = this.collectionCardObjects[i];
                if (!card)
                    continue;
                const transform = card.getTransform();
                const cardState = this.cardStates[i] || this.STATE_IN_COLLECTION;
                if (cardState === this.STATE_PICKED) {
                    // Frame (or pinch assist) handles position/rotation — we only scale up
                    const curLS = transform.getLocalScale();
                    const newS = curLS.x + (this.pickedCardScale - curLS.x) * grabLerpSpeed;
                    transform.setLocalScale(new vec3(newS, newS, newS));
                }
                else if (cardState === this.STATE_PLACED_IN_WORLD) {
                    // Stay in place, billboard + PICKED_SCALE
                    const cardWorldPos = transform.getWorldPosition();
                    const billboardRot = this.getCardBillboardRotation(cardWorldPos);
                    transform.setWorldRotation(quat.slerp(transform.getWorldRotation(), billboardRot, lerpSpeed));
                    const curLS = transform.getLocalScale();
                    const newS = curLS.x + (this.pickedCardScale - curLS.x) * lerpSpeed;
                    transform.setLocalScale(new vec3(newS, newS, newS));
                }
                else {
                    // IN_COLLECTION — circle position + billboard + scale + fade
                    const angle = circleIdx * angleStep + this.carouselAngleOffset;
                    circleIdx++;
                    const targetX = radius * Math.cos(angle);
                    const targetZ = radius * Math.sin(angle);
                    const curPos = transform.getLocalPosition();
                    transform.setLocalPosition(new vec3(curPos.x + (targetX - curPos.x) * lerpSpeed, curPos.y + (0 - curPos.y) * lerpSpeed, curPos.z + (targetZ - curPos.z) * lerpSpeed));
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
                    }
                    else {
                        card.enabled = true;
                        this.applyCarouselFade(card, angle);
                    }
                }
            }
        }
        // =====================================================================
        // PINCH GRAB ASSIST (fallback when Frame grab is hard)
        // =====================================================================
        updatePinchGrabAssist() {
            if (!this.enablePinchGrabAssist)
                return;
            if (!this.rightIndexTip || !this.rightThumbTip)
                return;
            const idxPos = this.rightIndexTip.getTransform().getWorldPosition();
            const thbPos = this.rightThumbTip.getTransform().getWorldPosition();
            const pinchDist = idxPos.sub(thbPos).length;
            const pinchCenter = new vec3((idxPos.x + thbPos.x) * 0.5, (idxPos.y + thbPos.y) * 0.5, (idxPos.z + thbPos.z) * 0.5);
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
            if (!this.assistDragging)
                return;
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
        findNearestGrabbableCard(center, radius) {
            let bestIdx = -1;
            let bestDist = radius;
            for (let i = 0; i < this.collectionCardObjects.length; i++) {
                const card = this.collectionCardObjects[i];
                if (!card || !card.enabled)
                    continue;
                const state = this.cardStates[i] || this.STATE_IN_COLLECTION;
                if (state !== this.STATE_IN_COLLECTION && state !== this.STATE_PLACED_IN_WORLD)
                    continue;
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
        applyCarouselFade(card, angle) {
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
        setCardOpacity(card, opacity) {
            this.applyOpacityRecursive(card, opacity);
        }
        applyOpacityRecursive(obj, opacity) {
            // RenderMeshVisual — for 3D planes, stat bars, etc.
            const meshVisual = obj.getComponent('Component.RenderMeshVisual');
            if (meshVisual && meshVisual.mainPass) {
                try {
                    const baseColor = meshVisual.mainPass.baseColor;
                    meshVisual.mainPass.baseColor = new vec4(baseColor.r, baseColor.g, baseColor.b, opacity);
                }
                catch (e) { /* some materials don't support baseColor alpha */ }
            }
            // Image — for card image, brand logo, etc.
            const imageComp = obj.getComponent('Component.Image');
            if (imageComp && imageComp.mainPass) {
                try {
                    const baseColor = imageComp.mainPass.baseColor;
                    imageComp.mainPass.baseColor = new vec4(baseColor.r, baseColor.g, baseColor.b, opacity);
                }
                catch (e) { /* ignore */ }
            }
            // Text — for labels, stats text, rarity, etc.
            const textComp = obj.getComponent('Component.Text');
            if (textComp) {
                try {
                    const tc = textComp.textFill.color;
                    textComp.textFill.color = new vec4(tc.r, tc.g, tc.b, opacity);
                }
                catch (e) {
                    // Fallback: try outlineSettings or just skip
                }
            }
            // Recurse into children
            const childCount = obj.getChildrenCount();
            for (let i = 0; i < childCount; i++) {
                const child = obj.getChild(i);
                if (child)
                    this.applyOpacityRecursive(child, opacity);
            }
        }
        // =====================================================================
        // BILLBOARD ROTATION
        // =====================================================================
        getCardBillboardRotation(cardWorldPos) {
            if (this.onGetUserHeadTransform) {
                const headData = this.onGetUserHeadTransform();
                if (headData) {
                    const toUser = headData.position.sub(cardWorldPos);
                    if (toUser.length > 0.01)
                        return quat.lookAt(toUser.normalize(), vec3.up());
                }
            }
            const toOrigin = vec3.zero().sub(cardWorldPos);
            if (toOrigin.length > 0.01)
                return quat.lookAt(toOrigin.normalize(), vec3.up());
            return quat.fromEulerAngles(0, 0, 0);
        }
    };
    __setFunctionName(_classThis, "CardInteraction");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        CardInteraction = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return CardInteraction = _classThis;
})();
exports.CardInteraction = CardInteraction;
//# sourceMappingURL=CardInteraction.js.map