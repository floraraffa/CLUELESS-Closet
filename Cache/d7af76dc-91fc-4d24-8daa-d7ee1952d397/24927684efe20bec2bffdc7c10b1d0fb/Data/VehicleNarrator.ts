/**
 * VehicleNarrator.ts — Style note + TTS + status text for Closet Club
 *
 * Handles:
 *   - "Fetch Info" GPT stylist note + TTS readout
 *   - Scrolling subtitle text synchronized with audio
 *   - Mute toggle
 *   - Unified status text on closet scanner interface ("Loading" element) for:
 *       • Idle mode: rotating fun phrases with typewriter animation
 *       • Scanning: animated "Scanning..." dots
 *       • Errors: brief error display, then back to idle
 *
 * @author Closet Club
 * @license MIT
 */

import { OpenAI } from 'RemoteServiceGateway.lspkg/HostedExternal/OpenAI';
import { VehicleData } from './VehicleTypes';
import { t, tf, getIdlePhrases } from './Localization';

@component
export class VehicleNarrator extends BaseScriptComponent {

    // =====================================================================
    // INPUTS
    // =====================================================================
    @input
    @allowUndefined
    @hint('"Get More Info Button" SceneObject (with RectangleButton)')
    fetchInfoButton: SceneObject;

    @input
    @allowUndefined
    @hint('"Car Description Subtitles" Text for narrative description')
    carDescriptionText: Text;

    @input
    @allowUndefined
    @hint('AudioComponent for TTS playback')
    ttsAudioPlayer: AudioComponent;

    @input
    @allowUndefined
    @hint('"Mute Button" SceneObject (with RectangleButton/BaseButton)')
    muteButton: SceneObject;

    @input
    @allowUndefined
    @hint('Text element under Mute Button to display mute/unmute icon')
    muteButtonText: Text;

    @input
    @allowUndefined
    @hint('"Loading" Text component on Car Scan Interface — unified status text (idle phrases, scanning, errors)')
    statusText: Text;

    // =====================================================================
    // CALLBACKS — Set by orchestrator
    // =====================================================================
    /** Called when narrator mute state changes. */
    onMuteStateChanged: ((muted: boolean) => void) | null = null;
    /** Called when review/fetch generation starts (text + TTS generation phase). */
    onReviewGenerationStarted: (() => void) | null = null;
    /** Called when review/fetch generation ends (success or failure). */
    onReviewGenerationFinished: (() => void) | null = null;
    /** Called when audible TTS playback starts. */
    onTTSPlaybackStarted: (() => void) | null = null;
    /** Called when audible TTS playback ends/stops. */
    onTTSPlaybackEnded: (() => void) | null = null;

    // Idle phrases are loaded from Localization module at runtime

    // =====================================================================
    // INTERNAL STATE
    // =====================================================================
    private isFetchingInfo: boolean = false;
    private lastVehicleData: VehicleData | null = null;
    private isTtsMuted: boolean = false;
    private ttsIsPlaying: boolean = false;

    // Text scroll state
    private scrollSentences: string[] = [];
    private scrollIndex: number = 0;
    private scrollDelayEvent: SceneEvent | null = null;
    private readonly WORDS_PER_MINUTE: number = 155;

    // Dots animation state
    private subtitleDotsEvent: SceneEvent | null = null;

    // Card review override — temporarily swaps carDescriptionText for collector card reviews
    private savedDescriptionText: Text | null = null;
    private isReviewFromCard: boolean = false;

    // Status text state (idle typewriter + scanning + errors)
    private statusMode: 'idle' | 'scanning' | 'error' | 'off' = 'off';
    private idlePhraseIndex: number = 0;
    private typewriterCharIndex: number = 0;
    private typewriterEvent: SceneEvent | null = null;
    private idleCycleEvent: SceneEvent | null = null;
    private scanningDotsEvent: SceneEvent | null = null;
    private errorTimerEvent: SceneEvent | null = null;

    // =====================================================================
    // LIFECYCLE
    // =====================================================================
    onAwake(): void {
        // Hide description at startup
        if (this.carDescriptionText) {
            const descParent = this.carDescriptionText.getSceneObject();
            if (descParent) descParent.enabled = false;
        }

        this.createEvent('OnStartEvent').bind(() => {
            this.setupFetchInfoButton();
            this.setupMuteButton();
            // Start idle phrases immediately
            this.startIdleMode();
        });
    }

    // =====================================================================
    // PUBLIC API — Status text (unified Loading element)
    // =====================================================================

    /**
     * Starts idle mode — shows rotating fun phrases with typewriter animation.
     * Called at launch and whenever the scan interface re-appears.
     */
    startIdleMode(): void {
        this.stopAllStatusAnimations();
        this.statusMode = 'idle';
        // Shuffle starting phrase
        this.idlePhraseIndex = Math.floor(Math.random() * getIdlePhrases().length);
        this.typewriteNextPhrase();
    }

    /**
     * Starts scanning mode — shows animated "Scanning..." on the status text.
     */
    startScanningMode(): void {
        this.stopAllStatusAnimations();
        this.statusMode = 'scanning';
        if (!this.statusText) return;
        this.statusText.text = t('scanning') + '.';
        this.animateScanningDots(1);
    }

    /**
     * Shows an error message on the status text, then returns to idle after delay.
     */
    showStatusError(message: string, delaySec: number = 2.5): void {
        this.stopAllStatusAnimations();
        if (this.errorTimerEvent) {
            try { this.errorTimerEvent.enabled = false; } catch (e) { /* ignore */ }
            this.errorTimerEvent = null;
        }
        this.statusMode = 'error';
        if (this.statusText) this.statusText.text = message;

        const ev = this.createEvent('DelayedCallbackEvent');
        ev.bind(() => {
            if (this.statusMode === 'error') {
                this.errorTimerEvent = null;
                this.startIdleMode();
            }
        });
        ev.reset(delaySec);
        this.errorTimerEvent = ev;
    }

    /**
     * Returns true if the status text is currently displaying an error message.
     */
    isShowingError(): boolean {
        return this.statusMode === 'error';
    }

    /**
     * Shows a processing message on the status text (stays until replaced by another mode).
     */
    showStatusProcessing(message: string): void {
        this.stopAllStatusAnimations();
        this.statusMode = 'scanning';
        if (this.statusText) this.statusText.text = message;
    }

    /**
     * Stops all status text animations (used when scan interface hides).
     */
    stopStatusText(): void {
        this.stopAllStatusAnimations();
        this.statusMode = 'off';
        if (this.statusText) this.statusText.text = '';
    }

    // =====================================================================
    // PUBLIC API — Description text (subtitle area on Vehicle Card)
    // =====================================================================

    /** Sets the vehicle data to describe when "Fetch Info" is pressed. */
    setVehicleData(data: VehicleData | null): void {
        this.lastVehicleData = data;
    }

    /**
     * Triggers a vehicle review/narration with the given data.
     * Used by collector cards to launch a TopGear-style review for any saved vehicle.
     * Same logic as the "Fetch Info" button, but accepts data directly.
     *
     * @param data The vehicle data to narrate.
     * @param cardReviewText Optional Text component on the collector card ("Car Review").
     *   If provided, the narration text will display on this text instead of the Vehicle Card subtitle.
     */
    triggerReview(data: VehicleData, cardReviewText?: Text): void {
        if (this.isFetchingInfo) {
            if (cardReviewText) {
                const obj = cardReviewText.getSceneObject();
                if (obj) obj.enabled = true;
                cardReviewText.text = t('review_in_progress');
            } else {
                this.showDescriptionText(t('review_in_progress'));
            }
            return;
        }

        // Temporarily swap carDescriptionText to the card's review text
        if (cardReviewText) {
            this.savedDescriptionText = this.carDescriptionText;
            this.carDescriptionText = cardReviewText;
            this.isReviewFromCard = true;
            const obj = cardReviewText.getSceneObject();
            if (obj) obj.enabled = true;
            print('VehicleNarrator: Review target swapped to card text');
        }

        this.lastVehicleData = data;
        this.onFetchInfoPressed();
    }

    /**
     * Generates a styling suggestion using the selected item plus the saved closet.
     * This replaces the old collector-card review action for the Closet Club closet flow.
     */
    async triggerCombination(data: VehicleData, closetItems: VehicleData[], cardReviewText?: Text): Promise<void> {
        if (this.isFetchingInfo) {
            if (cardReviewText) {
                const obj = cardReviewText.getSceneObject();
                if (obj) obj.enabled = true;
                cardReviewText.text = t('combine_in_progress');
            } else {
                this.showDescriptionText(t('combine_in_progress'));
            }
            return;
        }

        if (cardReviewText) {
            this.savedDescriptionText = this.carDescriptionText;
            this.carDescriptionText = cardReviewText;
            this.isReviewFromCard = true;
            const obj = cardReviewText.getSceneObject();
            if (obj) obj.enabled = true;
            print('VehicleNarrator: Combine Look target swapped to card text');
        }

        this.isFetchingInfo = true;
        if (this.onReviewGenerationStarted) this.onReviewGenerationStarted();
        this.showAnimatedDescriptionText(t('combining_look'));

        try {
            const candidates = this.getCombinationCandidates(data, closetItems);
            if (candidates.length === 0) {
                this.showDescriptionText(t('combine_need_more_items'));
                return;
            }

            let suggestion = await this.fetchCombinationSuggestion(data, candidates);
            if (!suggestion || suggestion.trim().length === 0) {
                suggestion = this.buildFallbackCombination(data, candidates);
            }
            if (cardReviewText) this.showDescriptionText(suggestion);
            else await this.speakDescription(suggestion);
        } catch (error) {
            print('VehicleNarrator: Combine Look error: ' + error);
            const fallback = this.buildFallbackCombination(data, this.getCombinationCandidates(data, closetItems));
            if (cardReviewText) this.showDescriptionText(fallback);
            else await this.speakDescription(fallback);
        } finally {
            this.isFetchingInfo = false;
            this.restoreCardReviewText();
            if (this.onReviewGenerationFinished) this.onReviewGenerationFinished();
        }
    }

    async triggerOutfitFeedback(outfitItems: VehicleData[], slotLabels?: string[], outfitText?: Text | null, percentText?: Text | null, matchPercent?: number): Promise<void> {
        if (this.isFetchingInfo) {
            if (outfitText) this.setExternalText(outfitText, t('combine_in_progress'));
            else this.showDescriptionText(t('combine_in_progress'));
            return;
        }

        if (!outfitItems || outfitItems.length < 2) {
            if (outfitText) this.setExternalText(outfitText, t('outfit_need_items'));
            else this.showDescriptionText(t('outfit_need_items'));
            return;
        }

        if (percentText && typeof matchPercent === 'number' && isFinite(matchPercent)) {
            this.setExternalText(percentText, Math.round(matchPercent) + '%');
        }
        if (outfitText) {
            this.savedDescriptionText = this.carDescriptionText;
            this.carDescriptionText = outfitText;
            this.isReviewFromCard = true;
            this.setExternalText(outfitText, t('outfit_feedback_loading'));
        }

        this.isFetchingInfo = true;
        if (this.onReviewGenerationStarted) this.onReviewGenerationStarted();
        this.showAnimatedDescriptionText(t('outfit_feedback_loading'));

        try {
            let suggestion = await this.fetchOutfitFeedback(outfitItems, slotLabels || [], matchPercent);
            if (!suggestion || suggestion.trim().length === 0) {
                suggestion = this.buildFallbackOutfitFeedback(outfitItems);
            }
            await this.speakDescription(suggestion);
        } catch (error) {
            print('VehicleNarrator: Outfit feedback error: ' + error);
            await this.speakDescription(this.buildFallbackOutfitFeedback(outfitItems));
        } finally {
            this.isFetchingInfo = false;
            if (this.onReviewGenerationFinished) this.onReviewGenerationFinished();
        }
    }

    private setExternalText(textComp: Text | null | undefined, value: string): void {
        if (!textComp) return;
        try {
            const obj = textComp.getSceneObject();
            if (obj) obj.enabled = true;
            textComp.text = value;
        } catch (e) { /* optional UI text */ }
    }

    /**
     * Restores the original carDescriptionText after a card review finishes.
     * Called automatically when TTS finishes or narration ends.
     */
    private restoreCardReviewText(): void {
        if (this.isReviewFromCard && this.savedDescriptionText) {
            this.carDescriptionText = this.savedDescriptionText;
            this.savedDescriptionText = null;
            this.isReviewFromCard = false;
            print('VehicleNarrator: Review text target restored');
        }
    }

    /** Shows a simple static message in the description text area. */
    showDescriptionText(text: string): void {
        this.stopTextScroll();
        this.stopDotsAnimation();
        if (!this.carDescriptionText) return;
        const descObj = this.carDescriptionText.getSceneObject();
        if (descObj) descObj.enabled = true;
        this.carDescriptionText.text = text;
    }

    /** Hides the description text and stops scrolling + TTS. */
    hideDescription(): void {
        try {
            this.stopTextScroll();
            this.stopDotsAnimation();
            const wasTtsPlaying = this.ttsIsPlaying;
            this.ttsIsPlaying = false;

            if (this.carDescriptionText) {
                const descObj = this.carDescriptionText.getSceneObject();
                if (descObj) descObj.enabled = false;
                this.carDescriptionText.text = '';
            }

            if (this.ttsAudioPlayer) {
                try { this.ttsAudioPlayer.stop(true); } catch (e) { /* ignore */ }
            }
            if (wasTtsPlaying && this.onTTSPlaybackEnded) this.onTTSPlaybackEnded();
        } catch (err) {
            print('VehicleNarrator: hideDescription error: ' + err);
        }
    }

    /** Hides the description text immediately. */
    hideDescriptionText(): void {
        if (this.carDescriptionText) {
            const descObj = this.carDescriptionText.getSceneObject();
            if (descObj) descObj.enabled = false;
            this.carDescriptionText.text = '';
        }
    }

    /** Hides the description text after a delay (seconds). */
    hideDescriptionAfterDelay(seconds: number): void {
        const ev = this.createEvent('DelayedCallbackEvent');
        ev.bind(() => {
            if (this.carDescriptionText) {
                const descObj = this.carDescriptionText.getSceneObject();
                if (descObj) descObj.enabled = false;
                this.carDescriptionText.text = '';
            }
        });
        ev.reset(seconds);
    }

    /** Shows a message with animated dots: "text.", "text..", "text..." */
    showAnimatedDescriptionText(baseText: string): void {
        this.stopTextScroll();
        this.stopDotsAnimation();
        if (!this.carDescriptionText) return;
        const descObj = this.carDescriptionText.getSceneObject();
        if (descObj) descObj.enabled = true;
        this.carDescriptionText.text = baseText + '.';
        this.animateDescriptionDots(baseText, 1);
    }

    /** Stops the subtitle dots animation. */
    stopDotsAnimation(): void {
        if (this.subtitleDotsEvent) {
            try { this.subtitleDotsEvent.enabled = false; } catch (e) { /* ignore */ }
            this.subtitleDotsEvent = null;
        }
    }

    // =====================================================================
    // BUTTON SETUP
    // =====================================================================

    private setupFetchInfoButton(): void {
        if (!this.fetchInfoButton) return;
        const btnScript = this.fetchInfoButton.getComponent('Component.ScriptComponent') as any;
        if (btnScript && btnScript.onTriggerUp && typeof btnScript.onTriggerUp.add === 'function') {
            btnScript.onTriggerUp.add(() => { this.onFetchInfoPressed(); });
            print('VehicleNarrator: Fetch Info button connected');
        }
    }

    private setupMuteButton(): void {
        if (!this.muteButton) return;
        this.updateMuteIcon();
        const btnScript = this.muteButton.getComponent('Component.ScriptComponent') as any;
        if (btnScript && btnScript.onTriggerUp && typeof btnScript.onTriggerUp.add === 'function') {
            btnScript.onTriggerUp.add(() => { this.onMuteButtonPressed(); });
            print('VehicleNarrator: Mute button connected');
        }
    }

    private onMuteButtonPressed(): void {
        this.isTtsMuted = !this.isTtsMuted;
        if (this.ttsAudioPlayer) {
            this.ttsAudioPlayer.volume = this.isTtsMuted ? 0.0 : 1.0;
        }
        if (this.ttsIsPlaying) {
            if (this.isTtsMuted) {
                if (this.onTTSPlaybackEnded) this.onTTSPlaybackEnded();
            } else {
                if (this.onTTSPlaybackStarted) this.onTTSPlaybackStarted();
            }
        }
        this.updateMuteIcon();
        if (this.onMuteStateChanged) this.onMuteStateChanged(this.isTtsMuted);
    }

    private updateMuteIcon(): void {
        if (!this.muteButtonText) return;
        this.muteButtonText.text = this.isTtsMuted ? '\u{1F507}' : '\u{1F50A}';
    }

    // =====================================================================
    // FETCH INFO — GPT narrative + TTS
    // =====================================================================

    private async onFetchInfoPressed(): Promise<void> {
        if (this.isFetchingInfo) return;
        if (!this.lastVehicleData) {
            this.showDescriptionText(t('scan_vehicle_first'));
            return;
        }

        this.isFetchingInfo = true;
        if (this.onReviewGenerationStarted) this.onReviewGenerationStarted();
        this.showAnimatedDescriptionText(t('loading_info'));

        const vehicle = this.lastVehicleData;
        if (vehicle.feedback && vehicle.feedback.length > 0) {
            this.showAnimatedDescriptionText(vehicle.feedback);
            await this.speakDescription(vehicle.feedback);
            this.isFetchingInfo = false;
            return;
        }

        const vehicleName = vehicle.item_name || vehicle.brand_model || 'Unknown';
        const vehicleType = vehicle.category || vehicle.type || 'Unknown';
        const brand = vehicle.brand || '';

        try {
            const description = await this.fetchVehicleDescription(vehicleName, vehicleType, brand);
            if (!description || description.trim().length === 0) {
                this.showDescriptionText(t('no_info_available'));
                this.isFetchingInfo = false;
                return;
            }

            this.showAnimatedDescriptionText(t('generating_audio'));
            await this.speakDescription(description);
        } catch (error) {
            print('VehicleNarrator: Fetch info error: ' + error);
            this.showDescriptionText(t('error_loading_info'));
            this.restoreCardReviewText();
        } finally {
            this.isFetchingInfo = false;
            if (this.onReviewGenerationFinished) this.onReviewGenerationFinished();
        }
    }

    /** Returns whether narrator audio is currently muted. */
    isMuted(): boolean {
        return this.isTtsMuted;
    }

    private async fetchVehicleDescription(vehicleName: string, vehicleType: string, brand: string): Promise<string> {
        const langInstruction = t('gpt_narrator_lang');
        const systemPrompt = `You are a concise fashion stylist for an AI closet app called Closet Club.

YOUR STYLE:
- Practical, direct, visual, and lightly opinionated
- Explain why the garment or look works
- Suggest one useful pairing or improvement
- Avoid body commentary and sensitive personal traits

CONTENT TO COVER (70-110 words max):
1. What the item or look is
2. The style/aesthetic
3. Where it works
4. One pairing or improvement

IMPORTANT RULES:
- Reply ONLY with the narrative text, no markdown formatting, no headings
- No bullet points or lists
${langInstruction}
- The text will be read aloud, so make it sound natural and flowing
- Maximum 110 words
- Start directly with the text, no "Here is..." or meta introduction`;

        const userPrompt = tf('gpt_narrator_prompt', { vehicle: vehicleName, type: vehicleType, brand: brand });

        const response = await OpenAI.chatCompletions({
            messages: [
                { role: 'system', content: systemPrompt },
                { role: 'user', content: userPrompt },
            ],
            model: 'gpt-4o',
            max_tokens: 500,
            temperature: 0.9,
        });

        if (response?.choices?.length > 0 && response.choices[0].message?.content) {
            return response.choices[0].message.content.trim();
        }
        return '';
    }

    private async fetchCombinationSuggestion(target: VehicleData, closetItems: VehicleData[]): Promise<string> {
        const langInstruction = t('gpt_narrator_lang');
        const targetLine = this.formatClosetItem(target, 0);
        const closetLines: string[] = [];
        for (let i = 0; i < closetItems.length; i++) {
            closetLines.push(this.formatClosetItem(closetItems[i], i + 1));
        }

        const systemPrompt = `You are a practical fashion stylist inside an AI closet app called Closet Club.

TASK:
- Suggest the best outfit combination for the target item using ONLY the saved closet items provided.
- Mention the exact item or items from the saved closet that should be combined.
- Explain briefly why the combination works.
- If useful, add one small styling note such as shoe, layer, or occasion.

RULES:
- Do not invent items that are not listed, except very generic basics like "simple sneakers" only if needed.
- Do not make comments about the user's body, size, attractiveness, gender, age, or sensitive traits.
- Reply as a short natural note, 35-75 words.
- No markdown, no headings, no bullets.
${langInstruction}`;

        const userPrompt = 'Target item:\n' + targetLine + '\n\nSaved closet items:\n' + closetLines.join('\n')
            + '\n\nChoose the strongest combination from the saved closet.';

        const response = await OpenAI.chatCompletions({
            messages: [
                { role: 'system', content: systemPrompt },
                { role: 'user', content: userPrompt },
            ],
            model: 'gpt-4o',
            max_tokens: 260,
            temperature: 0.7,
        });

        if (response?.choices?.length > 0 && response.choices[0].message?.content) {
            return response.choices[0].message.content.trim();
        }
        return '';
    }

    private async fetchOutfitFeedback(outfitItems: VehicleData[], slotLabels: string[], matchPercent?: number): Promise<string> {
        const langInstruction = t('gpt_narrator_lang');
        const outfitLines: string[] = [];
        for (let i = 0; i < outfitItems.length; i++) {
            const slot = slotLabels && slotLabels[i] ? slotLabels[i] : 'Slot ' + (i + 1);
            outfitLines.push(slot + ': ' + this.formatClosetItem(outfitItems[i], i + 1));
        }
        const percentLine = (typeof matchPercent === 'number' && isFinite(matchPercent))
            ? '\nMatch percentage: ' + Math.round(matchPercent) + '%'
            : '';

        const systemPrompt = `You are a practical fashion stylist inside an AI closet app called Closet Club.

TASK:
- Evaluate the outfit made from the saved closet items provided.
- Start with a clear verdict in the user's language: it matches, or it does not match.
- If a match percentage is provided, mention it once in the first sentence.
- If it does not match, explicitly say that it does not match and explain why.
- Explain why the pieces work together or what feels off.
- Give one concise adjustment if the outfit can improve.
- Be specific about color, proportion, style, occasion, and cohesion.
- Treat the slot label as intentional placement. If shoes are placed as torso, or a top is placed as shoes, say it does not match because the slot placement is wrong.

RULES:
- Use ONLY the listed closet items.
- Do not invent garments that are not listed, except a generic styling suggestion only if needed.
- Do not make comments about the user's body, size, attractiveness, gender, age, or sensitive traits.
- Reply as a natural spoken note, 45-85 words.
- No markdown, no headings, no bullets.
${langInstruction}`;

        const userPrompt = 'Composed outfit slots:\n' + outfitLines.join('\n')
            + percentLine
            + '\n\nGive text and voice-ready feedback. The first phrase must clearly say whether this outfit matches or does not match.';

        const response = await OpenAI.chatCompletions({
            messages: [
                { role: 'system', content: systemPrompt },
                { role: 'user', content: userPrompt },
            ],
            model: 'gpt-4o',
            max_tokens: 280,
            temperature: 0.7,
        });

        if (response?.choices?.length > 0 && response.choices[0].message?.content) {
            return response.choices[0].message.content.trim();
        }
        return '';
    }

    private getCombinationCandidates(target: VehicleData, closetItems: VehicleData[]): VehicleData[] {
        const result: VehicleData[] = [];
        const targetSerial = this.getVehicleSerial(target);
        const targetSavedAt = this.getVehicleSavedAt(target);

        for (let i = 0; i < closetItems.length; i++) {
            const item = closetItems[i];
            if (!item) continue;
            if (item === target) continue;

            const itemSerial = this.getVehicleSerial(item);
            const itemSavedAt = this.getVehicleSavedAt(item);
            if (targetSerial && itemSerial && targetSerial === itemSerial) continue;
            if (targetSavedAt > 0 && itemSavedAt > 0 && targetSavedAt === itemSavedAt) continue;

            result.push(item);
        }

        return result;
    }

    private buildFallbackCombination(target: VehicleData, closetItems: VehicleData[]): string {
        if (!closetItems || closetItems.length === 0) {
            return t('combine_need_more_items');
        }

        const best = this.pickBestCombinationMatch(target, closetItems);
        return tf('combine_fallback', {
            target: this.getVehicleDisplayName(target),
            match: this.getVehicleDisplayName(best),
        });
    }

    private buildFallbackOutfitFeedback(outfitItems: VehicleData[]): string {
        if (!outfitItems || outfitItems.length < 2) return t('outfit_need_items');
        const names: string[] = [];
        for (let i = 0; i < outfitItems.length; i++) {
            names.push(this.getVehicleDisplayName(outfitItems[i]));
        }
        const matches = this.outfitHasBasicMatch(outfitItems);
        return tf(matches ? 'outfit_feedback_fallback_match' : 'outfit_feedback_fallback_nomatch', { items: names.join(', ') });
    }

    private outfitHasBasicMatch(outfitItems: VehicleData[]): boolean {
        let hasTop = false;
        let hasBottom = false;
        let hasShoe = false;
        let hasDress = false;
        let hasOuterwear = false;
        let hasAccessory = false;

        for (let i = 0; i < outfitItems.length; i++) {
            const family = this.getFamily(this.getVehicleCategoryText(outfitItems[i]));
            if (family === 'top') hasTop = true;
            else if (family === 'bottom') hasBottom = true;
            else if (family === 'shoe') hasShoe = true;
            else if (family === 'dress') hasDress = true;
            else if (family === 'outerwear') hasOuterwear = true;
            else if (family === 'accessory') hasAccessory = true;
        }

        if (hasDress && (hasShoe || hasOuterwear || hasAccessory || outfitItems.length >= 2)) return true;
        if (hasTop && hasBottom) return true;
        if ((hasTop || hasBottom) && hasShoe && outfitItems.length >= 3) return true;
        return false;
    }

    private pickBestCombinationMatch(target: VehicleData, closetItems: VehicleData[]): VehicleData {
        let best = closetItems[0];
        let bestScore = -999;
        for (let i = 0; i < closetItems.length; i++) {
            const item = closetItems[i];
            const score = this.scoreCombination(target, item);
            if (score > bestScore) {
                bestScore = score;
                best = item;
            }
        }
        return best;
    }

    private scoreCombination(target: VehicleData, candidate: VehicleData): number {
        const targetType = this.getVehicleCategoryText(target);
        const candidateType = this.getVehicleCategoryText(candidate);
        const targetFamily = this.getFamily(targetType);
        const candidateFamily = this.getFamily(candidateType);
        let score = 0;

        score += this.getFamilyPairScore(targetFamily, candidateFamily);
        if (targetFamily === candidateFamily) {
            if (targetFamily === 'top' || targetFamily === 'bottom' || targetFamily === 'shoe') score -= 8;
            else if (targetFamily === 'outerwear') score -= 5;
            else if (targetFamily === 'accessory') score -= 3;
        }

        score += this.getColorHarmonyScore(target.color || '', candidate.color || '');
        if (target.style_tags && candidate.style_tags && this.hasSharedString(target.style_tags, candidate.style_tags)) score += 4;
        if (target.occasion_tags && candidate.occasion_tags && this.hasSharedString(target.occasion_tags, candidate.occasion_tags)) score += 3;
        if (target.season_tags && candidate.season_tags && this.hasSharedString(target.season_tags, candidate.season_tags)) score += 1;

        return score;
    }

    private formatClosetItem(item: VehicleData, index: number): string {
        const parts: string[] = [];
        if (item.category || item.type) parts.push('category: ' + (item.category || item.type));
        if (item.brand) parts.push('brand: ' + item.brand);
        if (item.color) parts.push('color: ' + item.color);
        if (item.material) parts.push('material: ' + item.material);
        if (item.pattern) parts.push('pattern: ' + item.pattern);
        if (item.fit) parts.push('fit: ' + item.fit);
        if (item.collection || item.collection_year || item.year) {
            parts.push('collection/year: ' + (item.collection || '') + ' ' + (item.collection_year || item.year || ''));
        }
        if (item.style_tags && item.style_tags.length > 0) parts.push('style: ' + item.style_tags.join(', '));
        if (item.occasion_tags && item.occasion_tags.length > 0) parts.push('occasion: ' + item.occasion_tags.join(', '));
        if (item.season_tags && item.season_tags.length > 0) parts.push('season: ' + item.season_tags.join(', '));

        return String(index) + '. ' + this.getVehicleDisplayName(item) + ' (' + parts.join('; ') + ')';
    }

    private getVehicleDisplayName(item: VehicleData): string {
        return item.item_name || item.brand_model || item.category || item.type || 'this item';
    }

    private getVehicleCategoryText(item: VehicleData): string {
        return [
            item.category || '',
            item.type || '',
            item.subcategory || '',
            item.item_name || '',
            item.brand_model || '',
        ].join(' ').toLowerCase();
    }

    private getVehicleSerial(item: VehicleData): string {
        const raw = (item as any).serial;
        return raw ? String(raw) : '';
    }

    private getVehicleSavedAt(item: VehicleData): number {
        const raw = (item as any).savedAt;
        return raw ? Number(raw) : 0;
    }

    private getFamily(text: string): string {
        if (this.isBottomLike(text)) return 'bottom';
        if (this.isTopLike(text)) return 'top';
        if (this.isShoeLike(text)) return 'shoe';
        if (this.isOuterwearLike(text)) return 'outerwear';
        if (this.isAccessoryLike(text)) return 'accessory';
        if (this.isDressLike(text)) return 'dress';
        return 'unknown';
    }

    private getFamilyPairScore(a: string, b: string): number {
        if (a === 'top' && b === 'bottom') return 16;
        if (a === 'bottom' && b === 'top') return 16;
        if (a === 'top' && b === 'outerwear') return 8;
        if (a === 'outerwear' && b === 'top') return 8;
        if (a === 'bottom' && b === 'outerwear') return 7;
        if (a === 'outerwear' && b === 'bottom') return 7;
        if (a === 'top' && b === 'shoe') return 6;
        if (a === 'shoe' && b === 'top') return 6;
        if (a === 'bottom' && b === 'shoe') return 7;
        if (a === 'shoe' && b === 'bottom') return 7;
        if (a === 'dress' && (b === 'shoe' || b === 'outerwear' || b === 'accessory')) return 8;
        if (b === 'dress' && (a === 'shoe' || a === 'outerwear' || a === 'accessory')) return 8;
        if (a === 'accessory' && b !== 'accessory' && b !== 'unknown') return 3;
        if (b === 'accessory' && a !== 'accessory' && a !== 'unknown') return 3;
        return 0;
    }

    private getColorHarmonyScore(a: string, b: string): number {
        const aColors = this.getColorKeywords(a);
        const bColors = this.getColorKeywords(b);
        if (aColors.length === 0 || bColors.length === 0) return 0;
        if (this.hasSharedString(aColors, bColors)) {
            return (this.hasNeutralColor(aColors) || this.hasNeutralColor(bColors)) ? 2 : 1;
        }
        if (this.hasNeutralColor(aColors) || this.hasNeutralColor(bColors)) return 3;
        if (this.hasComplementaryColors(aColors, bColors)) return 3;
        return 0;
    }

    private getColorKeywords(text: string): string[] {
        const source = String(text || '').toLowerCase();
        const colors = [
            'black', 'white', 'cream', 'beige', 'tan', 'brown', 'gray', 'grey',
            'navy', 'blue', 'denim', 'red', 'burgundy', 'pink', 'purple',
            'green', 'olive', 'yellow', 'orange',
        ];
        const result: string[] = [];
        for (let i = 0; i < colors.length; i++) {
            if (source.indexOf(colors[i]) >= 0) result.push(colors[i]);
        }
        return result;
    }

    private hasNeutralColor(colors: string[]): boolean {
        return this.hasSharedString(colors, ['black', 'white', 'cream', 'beige', 'tan', 'brown', 'gray', 'grey', 'navy', 'denim']);
    }

    private hasComplementaryColors(a: string[], b: string[]): boolean {
        return this.hasColorPair(a, b, 'blue', 'orange')
            || this.hasColorPair(a, b, 'navy', 'white')
            || this.hasColorPair(a, b, 'red', 'denim')
            || this.hasColorPair(a, b, 'red', 'blue')
            || this.hasColorPair(a, b, 'green', 'brown')
            || this.hasColorPair(a, b, 'olive', 'beige')
            || this.hasColorPair(a, b, 'pink', 'gray')
            || this.hasColorPair(a, b, 'pink', 'grey')
            || this.hasColorPair(a, b, 'yellow', 'navy');
    }

    private hasColorPair(a: string[], b: string[], first: string, second: string): boolean {
        return (a.indexOf(first) >= 0 && b.indexOf(second) >= 0)
            || (a.indexOf(second) >= 0 && b.indexOf(first) >= 0);
    }

    private hasSharedString(a: string[], b: string[]): boolean {
        for (let i = 0; i < a.length; i++) {
            const av = String(a[i]).toLowerCase();
            for (let j = 0; j < b.length; j++) {
                if (av === String(b[j]).toLowerCase()) return true;
            }
        }
        return false;
    }

    private hasAny(text: string, words: string[]): boolean {
        for (let i = 0; i < words.length; i++) {
            if (text.indexOf(words[i]) >= 0) return true;
        }
        return false;
    }

    private isTopLike(text: string): boolean {
        return this.hasAny(text, ['top', 'shirt', 't-shirt', 'tee', 'sweater', 'sweatshirt', 'blouse', 'hoodie', 'knit', 'camisa', 'remera', 'pullover']);
    }

    private isBottomLike(text: string): boolean {
        return this.hasAny(text, ['bottom', 'pants', 'jeans', 'trouser', 'skirt', 'shorts', 'denim', 'pantal', 'falda']);
    }

    private isShoeLike(text: string): boolean {
        return this.hasAny(text, ['shoe', 'sneaker', 'boot', 'loafer', 'heel', 'zapato', 'zapatilla', 'bota']);
    }

    private isOuterwearLike(text: string): boolean {
        return this.hasAny(text, ['outerwear', 'jacket', 'coat', 'blazer', 'cardigan', 'chaqueta', 'abrigo']);
    }

    private isAccessoryLike(text: string): boolean {
        return this.hasAny(text, ['accessory', 'accessories', 'bag', 'belt', 'hat', 'cap', 'glasses', 'sunglasses', 'scarf', 'jewelry', 'accesorio', 'accesorios', 'bolso', 'cinturon']);
    }

    private isDressLike(text: string): boolean {
        return this.hasAny(text, ['dress', 'vestido']);
    }

    private async speakDescription(text: string): Promise<void> {
        if (!this.ttsAudioPlayer) {
            this.ttsIsPlaying = false;
            this.startTextScroll(text);
            // Restore card review text after scroll if applicable
            if (this.isReviewFromCard) {
                const restoreEv = this.createEvent('DelayedCallbackEvent');
                restoreEv.bind(() => {
                    if (this.carDescriptionText) this.carDescriptionText.text = text;
                    this.restoreCardReviewText();
                });
                restoreEv.reset(15.0);
            }
            return;
        }

        try {
            const audioTrack = await OpenAI.speech({
                model: 'gpt-4o-mini-tts',
                input: text,
                voice: 'onyx',
                speed: 1.0,
                instructions: t('tts_instruction'),
            });

            this.ttsAudioPlayer.setOnFinish(() => {
                this.ttsIsPlaying = false;
                if (this.onTTSPlaybackEnded) this.onTTSPlaybackEnded();
                this.stopTextScroll();
                if (this.isReviewFromCard) {
                    if (this.carDescriptionText) this.carDescriptionText.text = text;
                    // Card review: keep last text visible, restore target after delay
                    const restoreEv = this.createEvent('DelayedCallbackEvent');
                    restoreEv.bind(() => this.restoreCardReviewText());
                    restoreEv.reset(3.0);
                } else {
                    this.hideDescriptionAfterDelay(1.5);
                }
            });

            this.ttsAudioPlayer.volume = this.isTtsMuted ? 0.0 : 1.0;
            this.ttsIsPlaying = true;
            this.ttsAudioPlayer.audioTrack = audioTrack;
            this.startTextScroll(text);
            this.ttsAudioPlayer.play(1);
            if (!this.isTtsMuted && this.onTTSPlaybackStarted) this.onTTSPlaybackStarted();
        } catch (error) {
            print('VehicleNarrator: TTS error: ' + error);
            if (this.ttsIsPlaying && this.onTTSPlaybackEnded) this.onTTSPlaybackEnded();
            this.ttsIsPlaying = false;
            this.startTextScroll(text);
            // Restore card review text after scroll if applicable
            if (this.isReviewFromCard) {
                const restoreEv = this.createEvent('DelayedCallbackEvent');
                restoreEv.bind(() => {
                    if (this.carDescriptionText) this.carDescriptionText.text = text;
                    this.restoreCardReviewText();
                });
                restoreEv.reset(15.0);
            }
        }
    }

    // =====================================================================
    // TEXT SCROLL
    // =====================================================================

    private startTextScroll(fullText: string): void {
        this.stopTextScroll();
        this.stopDotsAnimation();
        if (!this.carDescriptionText) return;

        const descObj = this.carDescriptionText.getSceneObject();
        if (descObj) descObj.enabled = true;

        const rawSentences = fullText.match(/[^.!?]+[.!?]+/g);
        if (!rawSentences || rawSentences.length === 0) {
            this.carDescriptionText.text = fullText;
            return;
        }

        this.scrollSentences = rawSentences.map((s) => s.trim());
        this.scrollIndex = 0;
        this.updateScrollDisplay();
        this.scheduleNextScroll();
    }

    private updateScrollDisplay(): void {
        if (!this.carDescriptionText) return;
        const start = Math.max(0, this.scrollIndex - 1);
        const end = Math.min(this.scrollSentences.length, this.scrollIndex + 2);
        this.carDescriptionText.text = this.scrollSentences.slice(start, end).join(' ');
    }

    private scheduleNextScroll(): void {
        if (this.scrollIndex >= this.scrollSentences.length - 1) {
            if (!this.ttsIsPlaying) this.hideDescriptionAfterDelay(3.0);
            return;
        }

        const currentSentence = this.scrollSentences[this.scrollIndex];
        const wordCount = currentSentence.split(/\s+/).length;
        const readingTimeSeconds = Math.max(2, (wordCount / this.WORDS_PER_MINUTE) * 60);

        const event = this.createEvent('DelayedCallbackEvent');
        event.bind(() => {
            this.scrollIndex++;
            if (this.scrollIndex < this.scrollSentences.length) {
                this.updateScrollDisplay();
                this.scheduleNextScroll();
            }
        });
        event.reset(readingTimeSeconds);
        this.scrollDelayEvent = event;
    }

    private stopTextScroll(): void {
        if (this.scrollDelayEvent) {
            try { this.scrollDelayEvent.enabled = false; } catch (e) { /* ignore */ }
            this.scrollDelayEvent = null;
        }
        this.scrollSentences = [];
        this.scrollIndex = 0;
    }

    // =====================================================================
    // SUBTITLE DOTS ANIMATION
    // =====================================================================

    private animateDescriptionDots(baseText: string, step: number): void {
        if (!this.carDescriptionText) return;
        const dotCount = (step % 3) + 1;
        const ev = this.createEvent('DelayedCallbackEvent');
        ev.bind(() => {
            try {
                this.carDescriptionText.text = baseText + '.'.repeat(dotCount);
                this.animateDescriptionDots(baseText, step + 1);
            } catch (e) { /* Text component destroyed */ }
        });
        ev.reset(0.45);
        this.subtitleDotsEvent = ev;
    }

    // =====================================================================
    // STATUS TEXT — Internal helpers
    // =====================================================================

    /** Stops all status text animations (typewriter, idle cycle, scanning dots). */
    private stopAllStatusAnimations(): void {
        if (this.typewriterEvent) {
            try { this.typewriterEvent.enabled = false; } catch (e) { /* ignore */ }
            this.typewriterEvent = null;
        }
        if (this.idleCycleEvent) {
            try { this.idleCycleEvent.enabled = false; } catch (e) { /* ignore */ }
            this.idleCycleEvent = null;
        }
        if (this.scanningDotsEvent) {
            try { this.scanningDotsEvent.enabled = false; } catch (e) { /* ignore */ }
            this.scanningDotsEvent = null;
        }
    }

    /**
     * Starts typewriting the current idle phrase, character by character.
     * Once finished, waits a pause, then moves to the next phrase.
     */
    private typewriteNextPhrase(): void {
        if (this.statusMode !== 'idle' || !this.statusText) return;
        const phrases = getIdlePhrases();
        const phrase = phrases[this.idlePhraseIndex % phrases.length];
        this.typewriterCharIndex = 0;
        this.statusText.text = '';
        this.typewriteStep(phrase);
    }

    /** Types one character at a time, then schedules the next. */
    private typewriteStep(phrase: string): void {
        if (this.statusMode !== 'idle' || !this.statusText) return;

        if (this.typewriterCharIndex >= phrase.length) {
            // Phrase fully typed — hold for a moment, then move to next
            this.statusText.text = phrase;
            const waitEv = this.createEvent('DelayedCallbackEvent');
            waitEv.bind(() => {
                if (this.statusMode !== 'idle') return;
                this.idlePhraseIndex = (this.idlePhraseIndex + 1) % getIdlePhrases().length;
                this.typewriteNextPhrase();
            });
            waitEv.reset(3.5);
            this.idleCycleEvent = waitEv;
            return;
        }

        this.typewriterCharIndex++;
        this.statusText.text = phrase.substring(0, this.typewriterCharIndex);

        const charDelay = this.createEvent('DelayedCallbackEvent');
        charDelay.bind(() => {
            this.typewriteStep(phrase);
        });
        // Slight variation in typing speed for a natural feel
        const speed = 0.04 + Math.random() * 0.03;
        charDelay.reset(speed);
        this.typewriterEvent = charDelay;
    }

    /** Animated "Scanning." -> "Scanning.." -> "Scanning..." loop. */
    private animateScanningDots(step: number): void {
        if (this.statusMode !== 'scanning' || !this.statusText) return;
        const dotCount = (step % 3) + 1;
        const ev = this.createEvent('DelayedCallbackEvent');
        ev.bind(() => {
            if (this.statusMode !== 'scanning') return;
            try {
                this.statusText.text = t('scanning') + '.'.repeat(dotCount);
                this.animateScanningDots(step + 1);
            } catch (e) { /* destroyed */ }
        });
        ev.reset(0.45);
        this.scanningDotsEvent = ev;
    }
}
