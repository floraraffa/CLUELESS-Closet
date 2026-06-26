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
exports.ClosetCardUI = void 0;
var __selfType = requireType("./ClosetCardUI");
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
/**
 * ClosetCardUI.ts — Vehicle Card display & UI state for DGNS Vehicle Scanner
 *
 * Handles:
 *   - Displaying vehicle identification results (text, stat bars, rarity)
 *   - UI state machine (loading / error / results / idle)
 *   - Vehicle Card close button polling & connection (Frame component lifecycle)
 *   - Universal button connector utility
 *
 * Exposes public methods for the orchestrator to drive the UI.
 *
 * @author DGNS
 * @license MIT
 */
const ClosetTypes_1 = require("./ClosetTypes");
const Localization_1 = require("./Localization");
let ClosetCardUI = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var ClosetCardUI = _classThis = class extends _classSuper {
        constructor() {
            super();
            // =====================================================================
            // INPUTS — Vehicle Card elements
            // =====================================================================
            this.vehicleCard = this.vehicleCard;
            this.brandModelText = this.brandModelText;
            this.carTypeText = this.carTypeText;
            this.carYearText = this.carYearText;
            this.carRarityText = this.carRarityText;
            this.carBrandLogo = this.carBrandLogo;
            // =====================================================================
            // INPUTS — Stat bars
            // =====================================================================
            this.topSpeedBar = this.topSpeedBar;
            this.accelerationBar = this.accelerationBar;
            this.brakingBar = this.brakingBar;
            this.tractionBar = this.tractionBar;
            this.comfortBar = this.comfortBar;
            this.topSpeedText = this.topSpeedText;
            this.accelerationText = this.accelerationText;
            this.brakingText = this.brakingText;
            this.tractionText = this.tractionText;
            this.comfortText = this.comfortText;
            this.cardStatusText = this.cardStatusText;
            this.styleNotesText = this.styleNotesText;
            this.editNoteButton = this.editNoteButton;
            // =====================================================================
            // CALLBACKS — Set by orchestrator
            // =====================================================================
            /** Called when the Vehicle Card close button is pressed. */
            this.onCardClosed = null;
            /** Called when scan starts (status text should show "Scanning..."). */
            this.onScanStarted = null;
            /** Called when scan ends / UI state leaves loading. */
            this.onScanEnded = null;
            /** Called to show an error on the status text. */
            this.onShowError = null;
            /** Called whenever the user edits the note shown on the Closet Card. */
            this.onNoteChanged = null;
            // =====================================================================
            // INTERNAL STATE
            // =====================================================================
            this.closeButtonConnected = false;
            this.noteEditButtonConnected = false;
            this.currentNoteText = '';
            // =====================================================================
            // LIFECYCLE
            // =====================================================================
            this.cardStatusHideEvent = null;
        }
        __initialize() {
            super.__initialize();
            // =====================================================================
            // INPUTS — Vehicle Card elements
            // =====================================================================
            this.vehicleCard = this.vehicleCard;
            this.brandModelText = this.brandModelText;
            this.carTypeText = this.carTypeText;
            this.carYearText = this.carYearText;
            this.carRarityText = this.carRarityText;
            this.carBrandLogo = this.carBrandLogo;
            // =====================================================================
            // INPUTS — Stat bars
            // =====================================================================
            this.topSpeedBar = this.topSpeedBar;
            this.accelerationBar = this.accelerationBar;
            this.brakingBar = this.brakingBar;
            this.tractionBar = this.tractionBar;
            this.comfortBar = this.comfortBar;
            this.topSpeedText = this.topSpeedText;
            this.accelerationText = this.accelerationText;
            this.brakingText = this.brakingText;
            this.tractionText = this.tractionText;
            this.comfortText = this.comfortText;
            this.cardStatusText = this.cardStatusText;
            this.styleNotesText = this.styleNotesText;
            this.editNoteButton = this.editNoteButton;
            // =====================================================================
            // CALLBACKS — Set by orchestrator
            // =====================================================================
            /** Called when the Vehicle Card close button is pressed. */
            this.onCardClosed = null;
            /** Called when scan starts (status text should show "Scanning..."). */
            this.onScanStarted = null;
            /** Called when scan ends / UI state leaves loading. */
            this.onScanEnded = null;
            /** Called to show an error on the status text. */
            this.onShowError = null;
            /** Called whenever the user edits the note shown on the Closet Card. */
            this.onNoteChanged = null;
            // =====================================================================
            // INTERNAL STATE
            // =====================================================================
            this.closeButtonConnected = false;
            this.noteEditButtonConnected = false;
            this.currentNoteText = '';
            // =====================================================================
            // LIFECYCLE
            // =====================================================================
            this.cardStatusHideEvent = null;
        }
        onAwake() {
            if (this.vehicleCard)
                this.vehicleCard.enabled = false;
            if (this.cardStatusText) {
                const obj = this.cardStatusText.getSceneObject();
                if (obj)
                    obj.enabled = false;
            }
            this.hideScanResultReviewButton();
        }
        showCardStatus(text) {
            if (!this.cardStatusText)
                return;
            const obj = this.cardStatusText.getSceneObject();
            if (obj)
                obj.enabled = true;
            this.cardStatusText.text = text;
            if (this.cardStatusHideEvent) {
                try {
                    this.cardStatusHideEvent.enabled = false;
                }
                catch (e) { /* ignore */ }
                this.cardStatusHideEvent = null;
            }
        }
        hideCardStatusAfterDelay(seconds) {
            if (this.cardStatusHideEvent) {
                try {
                    this.cardStatusHideEvent.enabled = false;
                }
                catch (e) { /* ignore */ }
            }
            const ev = this.createEvent('DelayedCallbackEvent');
            ev.bind(() => {
                if (this.cardStatusText) {
                    const obj = this.cardStatusText.getSceneObject();
                    if (obj)
                        obj.enabled = false;
                    this.cardStatusText.text = '';
                }
            });
            ev.reset(seconds);
            this.cardStatusHideEvent = ev;
        }
        // =====================================================================
        // PUBLIC API
        // =====================================================================
        /**
         * Displays vehicle identification results on the Vehicle Card.
         * Updates all text, stat bars, and rarity display.
         */
        displayResults(data) {
            print('ClosetCardUI: Displaying results...');
            if (this.vehicleCard) {
                this.vehicleCard.enabled = true;
                (0, ClosetTypes_1.enableAllDescendants)(this.vehicleCard);
                this.hideScanResultReviewButton();
            }
            // Legacy input name; in Closet Club this is the result-card garment photo slot.
            if (this.carBrandLogo)
                this.carBrandLogo.enabled = true;
            const displayName = data.item_name || data.brand_model;
            const detailParts = [];
            if (data.year || data.collection_year)
                detailParts.push(data.collection_year || data.year || '');
            if (data.collection)
                detailParts.push(data.collection);
            if (data.quality)
                detailParts.push(data.quality);
            if (detailParts.length === 0) {
                if (data.color)
                    detailParts.push(data.color);
                if (data.material)
                    detailParts.push(data.material);
                if (data.fit)
                    detailParts.push(data.fit);
            }
            if (this.brandModelText)
                this.brandModelText.text = displayName;
            if (this.carTypeText)
                this.carTypeText.text = (0, ClosetTypes_1.formatCarType)(data.category || data.type);
            if (this.carYearText)
                this.carYearText.text = detailParts.length > 0 ? detailParts.join(' / ') : (data.subcategory || data.year || '');
            // Rarity display (★★★☆☆ Uncommon)
            const rarityDisplay = (0, ClosetTypes_1.formatRarityText)(data.rarity, data.rarity_label);
            if (this.carRarityText) {
                this.carRarityText.text = rarityDisplay;
            }
            else if (this.vehicleCard) {
                const rarityObj = (0, ClosetTypes_1.findChildByName)(this.vehicleCard, 'Car Rarity');
                if (rarityObj) {
                    const textComp = rarityObj.getComponent('Component.Text');
                    if (textComp)
                        textComp.text = rarityDisplay;
                }
            }
            // Stat rows
            this.updateStatBar(this.topSpeedBar, data.top_speed, (0, Localization_1.t)('top_speed'));
            this.updateStatBar(this.accelerationBar, data.acceleration, (0, Localization_1.t)('acceleration'));
            this.updateStatBar(this.brakingBar, data.braking, (0, Localization_1.t)('braking'));
            this.updateStatBar(this.tractionBar, data.traction, (0, Localization_1.t)('traction'));
            this.updateStatBar(this.comfortBar, data.comfort, (0, Localization_1.t)('comfort'));
            this.setNoteText(data.user_note || data.ai_note || this.buildStyleNote(data));
            this.setupNoteEditButton();
            this.forceTextTreeBlack(this.vehicleCard, 0);
            print('ClosetCardUI: ' + displayName + ' (' + (0, ClosetTypes_1.formatCarType)(data.category || data.type) + ') ' + (data.color || ''));
        }
        /**
         * Applies the captured scan photo to the result card's visual slot.
         * The scene still uses the legacy input name carBrandLogo, but the object
         * now sits behind the polaroid overlay as the garment/look image.
         */
        applyItemPhoto(texture) {
            if (!texture || !this.carBrandLogo)
                return;
            this.carBrandLogo.enabled = true;
            try {
                const imgComp = this.carBrandLogo.getComponent('Component.Image');
                if (imgComp && imgComp.mainPass) {
                    if (imgComp.mainMaterial)
                        imgComp.mainMaterial = imgComp.mainMaterial.clone();
                    imgComp.enabled = true;
                    imgComp.mainPass.baseTex = texture;
                    return;
                }
                const meshComp = this.carBrandLogo.getComponent('Component.RenderMeshVisual');
                if (meshComp && meshComp.mainPass) {
                    if (meshComp.mainMaterial)
                        meshComp.mainMaterial = meshComp.mainMaterial.clone();
                    meshComp.enabled = true;
                    meshComp.mainPass.baseTex = texture;
                }
            }
            catch (e) {
                print('ClosetCardUI: applyItemPhoto error: ' + e);
            }
        }
        /** Applies a decoded copy of the scan photo, which is more stable in Spectacles recordings. */
        applyItemPhotoBase64(base64) {
            if (!base64 || base64.length === 0)
                return;
            try {
                Base64.decodeTextureAsync(base64, (texture) => {
                    print('ClosetCardUI: applying fixed scan photo texture');
                    this.applyItemPhoto(texture);
                }, () => { print('ClosetCardUI: failed to decode fixed scan photo'); });
            }
            catch (e) {
                print('ClosetCardUI: applyItemPhotoBase64 error: ' + e);
            }
        }
        /**
         * Sets the main UI state (loading / error / results / idle).
         * Manages Vehicle Card visibility and delegates status text to callbacks.
         * Triggers close button setup when entering 'results' state.
         */
        setUIState(state, hideScanInterface) {
            if (state === 'results') {
                if (this.vehicleCard) {
                    this.vehicleCard.enabled = true;
                    this.hideScanResultReviewButton();
                    // Frame initializes when SceneObject is enabled — connect close button now
                    if (!this.closeButtonConnected) {
                        let delayFrames = 0;
                        const delayEvent = this.createEvent('UpdateEvent');
                        delayEvent.bind(() => {
                            delayFrames++;
                            if (delayFrames >= 5) {
                                delayEvent.enabled = false;
                                this.setupCloseButton();
                            }
                        });
                    }
                }
                if (hideScanInterface)
                    hideScanInterface();
                if (this.onScanEnded)
                    this.onScanEnded();
            }
            else if (state === 'idle') {
                if (this.vehicleCard)
                    this.vehicleCard.enabled = false;
                if (this.onScanEnded)
                    this.onScanEnded();
            }
            else if (state === 'loading') {
                if (this.vehicleCard)
                    this.vehicleCard.enabled = false;
                if (this.onScanStarted)
                    this.onScanStarted();
            }
            else if (state === 'error') {
                if (this.onScanEnded)
                    this.onScanEnded();
            }
        }
        /** Shows an error message via the status text callback. */
        showErrorMessage(message) {
            if (this.onShowError)
                this.onShowError(message);
        }
        /**
         * Universal button connector - tries multiple strategies to connect a button event.
         * Searches the object and descendants because Lens Studio buttons often keep
         * RectangleButton/PinchButton scripts on a child visual node.
         * Returns true if successfully connected.
         */
        connectButton(buttonObj, callback, debugName) {
            const connected = this.connectButtonRecursive(buttonObj, callback, debugName, 0);
            if (!connected) {
                print('ClosetCardUI: [' + debugName + '] no compatible button event found');
            }
            return connected;
        }
        connectButtonRecursive(buttonObj, callback, debugName, depth) {
            if (!buttonObj || depth > 8)
                return false;
            const scripts = buttonObj.getComponents('Component.ScriptComponent');
            for (let i = 0; i < scripts.length; i++) {
                const script = scripts[i];
                if (!script)
                    continue;
                if (script.enabled === false)
                    continue;
                // PinchButton (SIK)
                if (script.onButtonPinched && typeof script.onButtonPinched.add === 'function') {
                    script.onButtonPinched.add(() => callback());
                    print('ClosetCardUI: [' + debugName + '] connected via onButtonPinched on ' + buttonObj.name);
                    return true;
                }
                // UIKit onTriggerUp
                if (script.onTriggerUp && typeof script.onTriggerUp.add === 'function') {
                    script.onTriggerUp.add(() => callback());
                    print('ClosetCardUI: [' + debugName + '] connected via onTriggerUp on ' + buttonObj.name);
                    return true;
                }
                // SIK onTriggerEnd
                if (script.onTriggerEnd && typeof script.onTriggerEnd.add === 'function') {
                    script.onTriggerEnd.add(() => callback());
                    print('ClosetCardUI: [' + debugName + '] connected via onTriggerEnd on ' + buttonObj.name);
                    return true;
                }
                // SIK onTriggerStart
                if (script.onTriggerStart && typeof script.onTriggerStart.add === 'function') {
                    script.onTriggerStart.add(() => callback());
                    print('ClosetCardUI: [' + debugName + '] connected via onTriggerStart on ' + buttonObj.name);
                    return true;
                }
                // Toggle onStateChanged
                if (script.onStateChanged && typeof script.onStateChanged.add === 'function') {
                    script.onStateChanged.add(() => callback());
                    print('ClosetCardUI: [' + debugName + '] connected via onStateChanged on ' + buttonObj.name);
                    return true;
                }
                // SIK onInteractorTriggerEnd
                if (script.onInteractorTriggerEnd && typeof script.onInteractorTriggerEnd.add === 'function') {
                    script.onInteractorTriggerEnd.add(() => callback());
                    print('ClosetCardUI: [' + debugName + '] connected via onInteractorTriggerEnd on ' + buttonObj.name);
                    return true;
                }
            }
            const childCount = buttonObj.getChildrenCount();
            for (let c = 0; c < childCount; c++) {
                const child = buttonObj.getChild(c);
                if (child && this.connectButtonRecursive(child, callback, debugName, depth + 1)) {
                    return true;
                }
            }
            return false;
        }
        // =====================================================================
        // STAT BARS
        // =====================================================================
        updateStatBar(barObject, value, label) {
            if (!barObject)
                return;
            const clampedValue = Math.max(0, Math.min(5, Math.round(value)));
            const childCount = barObject.getChildrenCount();
            let textComp = null;
            for (let i = 0; i < childCount; i++) {
                const child = barObject.getChild(i);
                if (!child)
                    continue;
                const visual = child.getComponent('Component.RenderMeshVisual');
                if (visual) {
                    child.enabled = false;
                    continue;
                }
                const text = child.getComponent('Component.Text');
                if (text) {
                    textComp = text;
                    child.enabled = true;
                }
            }
            if (textComp) {
                textComp.text = this.formatStatRow(label || this.getStatLabelFromBar(barObject), clampedValue);
            }
        }
        formatStatRow(label, value) {
            return label.toUpperCase() + '    ' + this.formatStars(value);
        }
        formatStars(value) {
            const clampedValue = Math.max(0, Math.min(5, Math.round(value)));
            let result = '';
            for (let i = 0; i < 5; i++)
                result += i < clampedValue ? '★' : '☆';
            return result;
        }
        getStatLabelFromBar(barObject) {
            const name = barObject.name || '';
            if (name.indexOf('Top Speed') >= 0)
                return (0, Localization_1.t)('top_speed');
            if (name.indexOf('Acceleration') >= 0)
                return (0, Localization_1.t)('acceleration');
            if (name.indexOf('Braking') >= 0)
                return (0, Localization_1.t)('braking');
            if (name.indexOf('Traction') >= 0)
                return (0, Localization_1.t)('traction');
            if (name.indexOf('Comfort') >= 0)
                return (0, Localization_1.t)('comfort');
            return '';
        }
        // =====================================================================
        // STYLE NOTES — display + optional runtime edit
        // =====================================================================
        getNoteText() {
            const noteText = this.getStyleNotesText();
            if (noteText && noteText.text)
                return noteText.text;
            return this.currentNoteText;
        }
        setNoteText(text) {
            this.currentNoteText = text || '';
            const noteText = this.getStyleNotesText();
            if (noteText) {
                noteText.text = this.currentNoteText;
                this.forceTextBlack(noteText);
            }
        }
        forceTextTreeBlack(obj, depth) {
            if (!obj || depth > 12)
                return;
            const text = obj.getComponent('Component.Text');
            if (text)
                this.forceTextBlack(text);
            const childCount = obj.getChildrenCount();
            for (let i = 0; i < childCount; i++) {
                this.forceTextTreeBlack(obj.getChild(i), depth + 1);
            }
        }
        forceTextBlack(textComp) {
            if (!textComp)
                return;
            try {
                textComp.textFill.color = new vec4(0, 0, 0, 1);
            }
            catch (e) { /* optional textFill */ }
        }
        startEditingNote() {
            const noteText = this.getStyleNotesText();
            if (!noteText) {
                print('ClosetCardUI: No Style Notes text found for editing');
                return;
            }
            try {
                if (!global.textInputSystem) {
                    print('ClosetCardUI: TextInputSystem unavailable on this device/preview');
                    return;
                }
                const options = new TextInputSystem.KeyboardOptions();
                options.enablePreview = true;
                options.initialText = this.currentNoteText || noteText.text || '';
                options.initialSelectedRange = new vec2(options.initialText.length, options.initialText.length);
                options.keyboardType = TextInputSystem.KeyboardType.Text;
                options.returnKeyType = TextInputSystem.ReturnKeyType.Done;
                options.onTextChanged = (text) => {
                    this.setNoteText(text);
                    if (this.onNoteChanged)
                        this.onNoteChanged(text);
                };
                options.onReturnKeyPressed = () => {
                    try {
                        global.textInputSystem.dismissKeyboard();
                    }
                    catch (e) { /* ignore */ }
                };
                options.onError = (error, description) => {
                    print('ClosetCardUI: note keyboard error ' + error + ': ' + description);
                };
                global.textInputSystem.requestKeyboard(options);
            }
            catch (e) {
                print('ClosetCardUI: startEditingNote error: ' + e);
            }
        }
        buildStyleNote(data) {
            const parts = [];
            if (data.feedback && data.feedback.length > 0)
                parts.push(data.feedback);
            if (data.pairing_note && data.pairing_note.length > 0) {
                parts.push(data.pairing_note);
            }
            else if (data.suggested_pairings && data.suggested_pairings.length > 0) {
                parts.push('Pairs with: ' + data.suggested_pairings.join(', ') + '.');
            }
            if (parts.length === 0)
                return (0, Localization_1.t)('no_info_available');
            return parts.join('\n');
        }
        getStyleNotesText() {
            if (this.styleNotesText)
                return this.styleNotesText;
            if (!this.vehicleCard)
                return null;
            const noteObj = (0, ClosetTypes_1.findChildByName)(this.vehicleCard, 'Style Notes') ||
                (0, ClosetTypes_1.findChildByName)(this.vehicleCard, 'Card Notes') ||
                (0, ClosetTypes_1.findChildByName)(this.vehicleCard, 'User Note');
            if (!noteObj)
                return null;
            const textComp = noteObj.getComponent('Component.Text');
            if (textComp) {
                this.styleNotesText = textComp;
                return textComp;
            }
            return null;
        }
        setupNoteEditButton() {
            if (this.noteEditButtonConnected || !this.vehicleCard)
                return;
            const button = this.editNoteButton ||
                (0, ClosetTypes_1.findChildByName)(this.vehicleCard, 'Edit Note Button') ||
                (0, ClosetTypes_1.findChildByName)(this.vehicleCard, 'Edit Notes Button') ||
                (0, ClosetTypes_1.findChildByName)(this.vehicleCard, 'Edit Note') ||
                (0, ClosetTypes_1.findChildByName)(this.vehicleCard, 'Edit Notes');
            if (!button)
                return;
            if (this.connectButton(button, () => this.startEditingNote(), 'EditNote')) {
                this.noteEditButtonConnected = true;
            }
        }
        hideScanResultReviewButton() {
            if (!this.vehicleCard)
                return;
            const reviewButton = (0, ClosetTypes_1.findChildByName)(this.vehicleCard, 'Review Button');
            if (reviewButton)
                reviewButton.enabled = false;
        }
        // =====================================================================
        // CLOSE BUTTON — Polling & connection
        // =====================================================================
        setupCloseButton() {
            if (this.closeButtonConnected || !this.vehicleCard)
                return;
            if (!this.vehicleCard.enabled)
                return;
            let attempts = 0;
            const maxAttempts = 300;
            const pollEvent = this.createEvent('UpdateEvent');
            pollEvent.bind(() => {
                if (this.closeButtonConnected) {
                    pollEvent.enabled = false;
                    return;
                }
                attempts++;
                if (attempts > maxAttempts) {
                    pollEvent.enabled = false;
                    this.lastResortCloseButtonSearch();
                    return;
                }
                // Primary: Frame.closeButton
                try {
                    const scripts = this.vehicleCard.getComponents('Component.ScriptComponent');
                    for (let si = 0; si < scripts.length; si++) {
                        const script = scripts[si];
                        if (!script)
                            continue;
                        let closeBtn = null;
                        try {
                            closeBtn = script.closeButton;
                        }
                        catch (e) {
                            continue;
                        }
                        if (closeBtn) {
                            if (closeBtn.onTriggerUp && typeof closeBtn.onTriggerUp.add === 'function') {
                                closeBtn.onTriggerUp.add(() => this.handleCardClosed());
                                this.closeButtonConnected = true;
                                pollEvent.enabled = false;
                                print('ClosetCardUI: Close button connected via onTriggerUp');
                                return;
                            }
                            if (closeBtn.onButtonPinched && typeof closeBtn.onButtonPinched.add === 'function') {
                                closeBtn.onButtonPinched.add(() => this.handleCardClosed());
                                this.closeButtonConnected = true;
                                pollEvent.enabled = false;
                                print('ClosetCardUI: Close button connected via onButtonPinched');
                                return;
                            }
                        }
                    }
                }
                catch (e) { /* polling */ }
                // Fallback: search FrameObject children
                if (attempts % 30 === 0) {
                    const frameObj = (0, ClosetTypes_1.findChildByName)(this.vehicleCard, 'FrameObject');
                    if (frameObj && this.searchForCloseButtonIn(frameObj)) {
                        this.closeButtonConnected = true;
                        pollEvent.enabled = false;
                    }
                }
            });
        }
        handleCardClosed() {
            print('ClosetCardUI: Vehicle Card closed');
            if (this.vehicleCard)
                this.vehicleCard.enabled = false;
            if (this.onCardClosed)
                this.onCardClosed();
        }
        lastResortCloseButtonSearch() {
            if (this.closeButtonConnected || !this.vehicleCard)
                return;
            this.deepSearchForButton(this.vehicleCard, 0);
        }
        deepSearchForButton(parent, depth) {
            if (this.closeButtonConnected || depth > 10)
                return;
            const count = parent.getChildrenCount();
            for (let i = 0; i < count; i++) {
                if (this.closeButtonConnected)
                    return;
                const child = parent.getChild(i);
                if (!child)
                    continue;
                const scripts = child.getComponents('Component.ScriptComponent');
                for (let si = 0; si < scripts.length; si++) {
                    const script = scripts[si];
                    if (!script)
                        continue;
                    if (script.onTriggerUp && typeof script.onTriggerUp.add === 'function') {
                        script.onTriggerUp.add(() => this.handleCardClosed());
                        this.closeButtonConnected = true;
                        print('ClosetCardUI: Close button found via deep search on "' + child.name + '"');
                        return;
                    }
                }
                this.deepSearchForButton(child, depth + 1);
            }
        }
        searchForCloseButtonIn(parent) {
            const count = parent.getChildrenCount();
            for (let i = 0; i < count; i++) {
                const child = parent.getChild(i);
                if (!child)
                    continue;
                if (this.connectButton(child, () => this.handleCardClosed(), 'FrameClose')) {
                    return true;
                }
                if (this.searchForCloseButtonIn(child))
                    return true;
            }
            return false;
        }
    };
    __setFunctionName(_classThis, "ClosetCardUI");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        ClosetCardUI = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return ClosetCardUI = _classThis;
})();
exports.ClosetCardUI = ClosetCardUI;
//# sourceMappingURL=ClosetCardUI.js.map