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

import { VehicleData, formatCarType, formatRarityText, findChildByName, enableAllDescendants } from './ClosetTypes';
import { t } from './Localization';

@component
export class ClosetCardUI extends BaseScriptComponent {

    // =====================================================================
    // INPUTS — Vehicle Card elements
    // =====================================================================
    @input
    @allowUndefined
    @hint('Vehicle Card SceneObject (3D card displayed above the vehicle)')
    vehicleCard: SceneObject;

    @input
    @allowUndefined
    @hint('Text component for brand and model')
    brandModelText: Text;

    @input
    @allowUndefined
    @hint('Text component for vehicle type')
    carTypeText: Text;

    @input
    @allowUndefined
    @hint('Text component for production year')
    carYearText: Text;

    @input
    @allowUndefined
    @hint('"Car Rarity" Text component (displays ★★★☆☆ Uncommon)')
    carRarityText: Text;

    @input
    @allowUndefined
    @hint('"Item Accent" SceneObject used as the result-card garment photo')
    carBrandLogo: SceneObject;

    // =====================================================================
    // INPUTS — Stat bars
    // =====================================================================
    @input
    @allowUndefined
    @hint('"Top Speed Bar" SceneObject containing 5 Planes + 1 Text')
    topSpeedBar: SceneObject;

    @input
    @allowUndefined
    @hint('"Acceleration Bar" SceneObject containing 5 Planes + 1 Text')
    accelerationBar: SceneObject;

    @input
    @allowUndefined
    @hint('"Braking Bar" SceneObject containing 5 Planes + 1 Text')
    brakingBar: SceneObject;

    @input
    @allowUndefined
    @hint('"Traction Bar" SceneObject containing 5 Planes + 1 Text')
    tractionBar: SceneObject;

    @input
    @allowUndefined
    @hint('"Comfort Bar" SceneObject containing 5 Planes + 1 Text')
    comfortBar: SceneObject;

    @input
    @allowUndefined
    @hint('Text label "Top Speed"')
    topSpeedText: Text;

    @input
    @allowUndefined
    @hint('Text label "Acceleration"')
    accelerationText: Text;

    @input
    @allowUndefined
    @hint('Text label "Braking"')
    brakingText: Text;

    @input
    @allowUndefined
    @hint('Text label "Traction"')
    tractionText: Text;

    @input
    @allowUndefined
    @hint('Text label "Comfort"')
    comfortText: Text;

    @input
    @allowUndefined
    @hint('"Debug card text" — used for card generation status messages (separate from subtitles)')
    cardStatusText: Text;

    @input
    @allowUndefined
    @hint('"Style Notes" Text component on the Closet Card')
    styleNotesText: Text;

    @input
    @allowUndefined
    @hint('Optional button that opens keyboard editing for Style Notes')
    editNoteButton: SceneObject;

    // =====================================================================
    // CALLBACKS — Set by orchestrator
    // =====================================================================

    /** Called when the Vehicle Card close button is pressed. */
    onCardClosed: (() => void) | null = null;

    /** Called when scan starts (status text should show "Scanning..."). */
    onScanStarted: (() => void) | null = null;
    /** Called when scan ends / UI state leaves loading. */
    onScanEnded: (() => void) | null = null;
    /** Called to show an error on the status text. */
    onShowError: ((message: string) => void) | null = null;
    /** Called whenever the user edits the note shown on the Closet Card. */
    onNoteChanged: ((note: string) => void) | null = null;

    // =====================================================================
    // INTERNAL STATE
    // =====================================================================
    private closeButtonConnected: boolean = false;
    private noteEditButtonConnected: boolean = false;
    private currentNoteText: string = '';

    // =====================================================================
    // LIFECYCLE
    // =====================================================================
    private cardStatusHideEvent: SceneEvent | null = null;

    onAwake(): void {
        if (this.vehicleCard) this.vehicleCard.enabled = false;
        if (this.cardStatusText) {
            const obj = this.cardStatusText.getSceneObject();
            if (obj) obj.enabled = false;
        }
        this.hideScanResultReviewButton();
    }

    showCardStatus(text: string): void {
        if (!this.cardStatusText) return;
        const obj = this.cardStatusText.getSceneObject();
        if (obj) obj.enabled = true;
        this.cardStatusText.text = text;
        if (this.cardStatusHideEvent) {
            try { this.cardStatusHideEvent.enabled = false; } catch (e) { /* ignore */ }
            this.cardStatusHideEvent = null;
        }
    }

    hideCardStatusAfterDelay(seconds: number): void {
        if (this.cardStatusHideEvent) {
            try { this.cardStatusHideEvent.enabled = false; } catch (e) { /* ignore */ }
        }
        const ev = this.createEvent('DelayedCallbackEvent');
        ev.bind(() => {
            if (this.cardStatusText) {
                const obj = this.cardStatusText.getSceneObject();
                if (obj) obj.enabled = false;
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
    displayResults(data: VehicleData): void {
        print('ClosetCardUI: Displaying results...');

        if (this.vehicleCard) {
            this.vehicleCard.enabled = true;
            enableAllDescendants(this.vehicleCard);
            this.hideScanResultReviewButton();
        }

        // Legacy input name; in Closet Club this is the result-card garment photo slot.
        if (this.carBrandLogo) this.carBrandLogo.enabled = true;

        const displayName = data.item_name || data.brand_model;
        const detailParts: string[] = [];
        if (data.year || data.collection_year) detailParts.push(data.collection_year || data.year || '');
        if (data.collection) detailParts.push(data.collection);
        if (data.quality) detailParts.push(data.quality);
        if (detailParts.length === 0) {
            if (data.color) detailParts.push(data.color);
            if (data.material) detailParts.push(data.material);
            if (data.fit) detailParts.push(data.fit);
        }

        if (this.brandModelText) this.brandModelText.text = displayName;
        if (this.carTypeText) this.carTypeText.text = formatCarType(data.category || data.type);
        if (this.carYearText) this.carYearText.text = detailParts.length > 0 ? detailParts.join(' / ') : (data.subcategory || data.year || '');

        // Rarity display (★★★☆☆ Uncommon)
        const rarityDisplay = formatRarityText(data.rarity, data.rarity_label);
        if (this.carRarityText) {
            this.carRarityText.text = rarityDisplay;
        } else if (this.vehicleCard) {
            const rarityObj = findChildByName(this.vehicleCard, 'Car Rarity');
            if (rarityObj) {
                const textComp = rarityObj.getComponent('Component.Text') as Text;
                if (textComp) textComp.text = rarityDisplay;
            }
        }

        // Stat rows
        this.updateStatBar(this.topSpeedBar, data.top_speed, t('top_speed'));
        this.updateStatBar(this.accelerationBar, data.acceleration, t('acceleration'));
        this.updateStatBar(this.brakingBar, data.braking, t('braking'));
        this.updateStatBar(this.tractionBar, data.traction, t('traction'));
        this.updateStatBar(this.comfortBar, data.comfort, t('comfort'));

        this.setNoteText(data.user_note || data.ai_note || this.buildStyleNote(data));
        this.setupNoteEditButton();
        this.forceTextTreeBlack(this.vehicleCard, 0);

        print('ClosetCardUI: ' + displayName + ' (' + formatCarType(data.category || data.type) + ') ' + (data.color || ''));
    }

    /**
     * Applies the captured scan photo to the result card's visual slot.
     * The scene still uses the legacy input name carBrandLogo, but the object
     * now sits behind the polaroid overlay as the garment/look image.
     */
    applyItemPhoto(texture: Texture | null): void {
        if (!texture || !this.carBrandLogo) return;
        this.carBrandLogo.enabled = true;
        try {
            const imgComp = this.carBrandLogo.getComponent('Component.Image') as Image;
            if (imgComp && imgComp.mainPass) {
                if (imgComp.mainMaterial) imgComp.mainMaterial = imgComp.mainMaterial.clone();
                imgComp.enabled = true;
                imgComp.mainPass.baseTex = texture;
                return;
            }
            const meshComp = this.carBrandLogo.getComponent('Component.RenderMeshVisual') as RenderMeshVisual;
            if (meshComp && meshComp.mainPass) {
                if (meshComp.mainMaterial) meshComp.mainMaterial = meshComp.mainMaterial.clone();
                meshComp.enabled = true;
                meshComp.mainPass.baseTex = texture;
            }
        } catch (e) {
            print('ClosetCardUI: applyItemPhoto error: ' + e);
        }
    }

    /** Applies a decoded copy of the scan photo, which is more stable in Spectacles recordings. */
    applyItemPhotoBase64(base64: string): void {
        if (!base64 || base64.length === 0) return;
        try {
            Base64.decodeTextureAsync(
                base64,
                (texture: Texture) => {
                    print('ClosetCardUI: applying fixed scan photo texture');
                    this.applyItemPhoto(texture);
                },
                () => { print('ClosetCardUI: failed to decode fixed scan photo'); }
            );
        } catch (e) {
            print('ClosetCardUI: applyItemPhotoBase64 error: ' + e);
        }
    }

    /**
     * Sets the main UI state (loading / error / results / idle).
     * Manages Vehicle Card visibility and delegates status text to callbacks.
     * Triggers close button setup when entering 'results' state.
     */
    setUIState(state: 'loading' | 'error' | 'results' | 'idle', hideScanInterface?: () => void): void {
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
            if (hideScanInterface) hideScanInterface();
            if (this.onScanEnded) this.onScanEnded();
        } else if (state === 'idle') {
            if (this.vehicleCard) this.vehicleCard.enabled = false;
            if (this.onScanEnded) this.onScanEnded();
        } else if (state === 'loading') {
            if (this.vehicleCard) this.vehicleCard.enabled = false;
            if (this.onScanStarted) this.onScanStarted();
        } else if (state === 'error') {
            if (this.onScanEnded) this.onScanEnded();
        }
    }

    /** Shows an error message via the status text callback. */
    showErrorMessage(message: string): void {
        if (this.onShowError) this.onShowError(message);
    }

    /**
     * Universal button connector - tries multiple strategies to connect a button event.
     * Searches the object and descendants because Lens Studio buttons often keep
     * RectangleButton/PinchButton scripts on a child visual node.
     * Returns true if successfully connected.
     */
    connectButton(buttonObj: SceneObject, callback: () => void, debugName: string): boolean {
        const connected = this.connectButtonRecursive(buttonObj, callback, debugName, 0);
        if (!connected) {
            print('ClosetCardUI: [' + debugName + '] no compatible button event found');
        }
        return connected;
    }

    private connectButtonRecursive(buttonObj: SceneObject, callback: () => void, debugName: string, depth: number): boolean {
        if (!buttonObj || depth > 8) return false;

        const scripts = buttonObj.getComponents('Component.ScriptComponent') as any[];
        for (let i = 0; i < scripts.length; i++) {
            const script = scripts[i];
            if (!script) continue;
            if (script.enabled === false) continue;

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
    private updateStatBar(barObject: SceneObject, value: number, label?: string): void {
        if (!barObject) return;

        const clampedValue = Math.max(0, Math.min(5, Math.round(value)));
        const childCount = barObject.getChildrenCount();
        let textComp: Text | null = null;

        for (let i = 0; i < childCount; i++) {
            const child = barObject.getChild(i);
            if (!child) continue;

            const visual = child.getComponent('Component.RenderMeshVisual') as RenderMeshVisual;
            if (visual) {
                child.enabled = false;
                continue;
            }

            const text = child.getComponent('Component.Text') as Text;
            if (text) {
                textComp = text;
                child.enabled = true;
            }
        }

        if (textComp) {
            textComp.text = this.formatStatRow(label || this.getStatLabelFromBar(barObject), clampedValue);
        }
    }

    private formatStatRow(label: string, value: number): string {
        return label.toUpperCase() + '    ' + this.formatStars(value);
    }

    private formatStars(value: number): string {
        const clampedValue = Math.max(0, Math.min(5, Math.round(value)));
        let result = '';
        for (let i = 0; i < 5; i++) result += i < clampedValue ? '★' : '☆';
        return result;
    }

    private getStatLabelFromBar(barObject: SceneObject): string {
        const name = barObject.name || '';
        if (name.indexOf('Top Speed') >= 0) return t('top_speed');
        if (name.indexOf('Acceleration') >= 0) return t('acceleration');
        if (name.indexOf('Braking') >= 0) return t('braking');
        if (name.indexOf('Traction') >= 0) return t('traction');
        if (name.indexOf('Comfort') >= 0) return t('comfort');
        return '';
    }

    // =====================================================================
    // STYLE NOTES — display + optional runtime edit
    // =====================================================================

    getNoteText(): string {
        const noteText = this.getStyleNotesText();
        if (noteText && noteText.text) return noteText.text;
        return this.currentNoteText;
    }

    setNoteText(text: string): void {
        this.currentNoteText = text || '';
        const noteText = this.getStyleNotesText();
        if (noteText) {
            noteText.text = this.currentNoteText;
            this.forceTextBlack(noteText);
        }
    }

    private forceTextTreeBlack(obj: SceneObject | null, depth: number): void {
        if (!obj || depth > 12) return;
        const text = obj.getComponent('Component.Text') as Text;
        if (text) this.forceTextBlack(text);
        const childCount = obj.getChildrenCount();
        for (let i = 0; i < childCount; i++) {
            this.forceTextTreeBlack(obj.getChild(i), depth + 1);
        }
    }

    private forceTextBlack(textComp: Text | null): void {
        if (!textComp) return;
        try {
            textComp.textFill.color = new vec4(0, 0, 0, 1);
        } catch (e) { /* optional textFill */ }
    }

    startEditingNote(): void {
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
            options.onTextChanged = (text: string) => {
                this.setNoteText(text);
                if (this.onNoteChanged) this.onNoteChanged(text);
            };
            options.onReturnKeyPressed = () => {
                try { global.textInputSystem.dismissKeyboard(); } catch (e) { /* ignore */ }
            };
            options.onError = (error: number, description: string) => {
                print('ClosetCardUI: note keyboard error ' + error + ': ' + description);
            };
            global.textInputSystem.requestKeyboard(options);
        } catch (e) {
            print('ClosetCardUI: startEditingNote error: ' + e);
        }
    }

    private buildStyleNote(data: VehicleData): string {
        const parts: string[] = [];
        if (data.feedback && data.feedback.length > 0) parts.push(data.feedback);
        if (data.pairing_note && data.pairing_note.length > 0) {
            parts.push(data.pairing_note);
        } else if (data.suggested_pairings && data.suggested_pairings.length > 0) {
            parts.push('Pairs with: ' + data.suggested_pairings.join(', ') + '.');
        }
        if (parts.length === 0) return t('no_info_available');
        return parts.join('\n');
    }

    private getStyleNotesText(): Text | null {
        if (this.styleNotesText) return this.styleNotesText;
        if (!this.vehicleCard) return null;
        const noteObj =
            findChildByName(this.vehicleCard, 'Style Notes') ||
            findChildByName(this.vehicleCard, 'Card Notes') ||
            findChildByName(this.vehicleCard, 'User Note');
        if (!noteObj) return null;
        const textComp = noteObj.getComponent('Component.Text') as Text;
        if (textComp) {
            this.styleNotesText = textComp;
            return textComp;
        }
        return null;
    }

    private setupNoteEditButton(): void {
        if (this.noteEditButtonConnected || !this.vehicleCard) return;
        const button =
            this.editNoteButton ||
            findChildByName(this.vehicleCard, 'Edit Note Button') ||
            findChildByName(this.vehicleCard, 'Edit Notes Button') ||
            findChildByName(this.vehicleCard, 'Edit Note') ||
            findChildByName(this.vehicleCard, 'Edit Notes');
        if (!button) return;
        if (this.connectButton(button, () => this.startEditingNote(), 'EditNote')) {
            this.noteEditButtonConnected = true;
        }
    }

    private hideScanResultReviewButton(): void {
        if (!this.vehicleCard) return;
        const reviewButton = findChildByName(this.vehicleCard, 'Review Button');
        if (reviewButton) reviewButton.enabled = false;
    }

    // =====================================================================
    // CLOSE BUTTON — Polling & connection
    // =====================================================================

    private setupCloseButton(): void {
        if (this.closeButtonConnected || !this.vehicleCard) return;
        if (!this.vehicleCard.enabled) return;

        let attempts = 0;
        const maxAttempts = 300;
        const pollEvent = this.createEvent('UpdateEvent');
        pollEvent.bind(() => {
            if (this.closeButtonConnected) { pollEvent.enabled = false; return; }
            attempts++;
            if (attempts > maxAttempts) {
                pollEvent.enabled = false;
                this.lastResortCloseButtonSearch();
                return;
            }

            // Primary: Frame.closeButton
            try {
                const scripts = this.vehicleCard.getComponents('Component.ScriptComponent') as any[];
                for (let si = 0; si < scripts.length; si++) {
                    const script = scripts[si];
                    if (!script) continue;

                    let closeBtn: any = null;
                    try { closeBtn = script.closeButton; } catch (e) { continue; }

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
            } catch (e) { /* polling */ }

            // Fallback: search FrameObject children
            if (attempts % 30 === 0) {
                const frameObj = findChildByName(this.vehicleCard, 'FrameObject');
                if (frameObj && this.searchForCloseButtonIn(frameObj)) {
                    this.closeButtonConnected = true;
                    pollEvent.enabled = false;
                }
            }
        });
    }

    private handleCardClosed(): void {
        print('ClosetCardUI: Vehicle Card closed');
        if (this.vehicleCard) this.vehicleCard.enabled = false;
        if (this.onCardClosed) this.onCardClosed();
    }

    private lastResortCloseButtonSearch(): void {
        if (this.closeButtonConnected || !this.vehicleCard) return;
        this.deepSearchForButton(this.vehicleCard, 0);
    }

    private deepSearchForButton(parent: SceneObject, depth: number): void {
        if (this.closeButtonConnected || depth > 10) return;
        const count = parent.getChildrenCount();
        for (let i = 0; i < count; i++) {
            if (this.closeButtonConnected) return;
            const child = parent.getChild(i);
            if (!child) continue;
            const scripts = child.getComponents('Component.ScriptComponent') as any[];
            for (let si = 0; si < scripts.length; si++) {
                const script = scripts[si];
                if (!script) continue;
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

    private searchForCloseButtonIn(parent: SceneObject): boolean {
        const count = parent.getChildrenCount();
        for (let i = 0; i < count; i++) {
            const child = parent.getChild(i);
            if (!child) continue;
            if (this.connectButton(child, () => this.handleCardClosed(), 'FrameClose')) {
                return true;
            }
            if (this.searchForCloseButtonIn(child)) return true;
        }
        return false;
    }
}
