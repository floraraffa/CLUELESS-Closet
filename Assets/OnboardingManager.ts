/**
 * OnboardingManager.ts — First-launch guided tutorial for Closet Club
 *
 * Plays ONCE on the very first launch (gated by a persistent flag). If the user
 * resets their profile/collection, the flag is cleared and the tutorial replays
 * on the next launch.
 *
 * Flow (each step: localized on-screen text + TTS voice + a 3D hand hint, and we
 * advance when the real action is detected):
 *   1. WELCOME      — "Welcome... first select your language" (language container)
 *   2. SKIP_ANNOUNCE— announce the Skip button / "say Skip Tutorial out loud"
 *   3. SCAN         — frame a garment + pinch the Scan button (Pinch hint)
 *   4. SAVE         — result card shown → press "Save the look"
 *   5. CONGRATS     — first piece saved (to the closet AND the web)
 *   6. PROFILE      — ring-finger profile: your personal web access code
 *   7. CLOSET       — open the closet on the right wrist
 *   8. CAROUSEL     — swipe right hand up to rotate (counter-clockwise only)
 *   9. GRID         — open palm outward to spread cards into a grid
 *  10. OUTFIT       — the Outfit Tester + AI outfit suggestions
 *  11. DONE         — flag set, tutorial UI hidden
 *
 * This script is intentionally self-contained: ClosetClubScanner simply NOTIFIES
 * it (notifyLanguageAccepted / notifyScanStarted / notifyScanEnded /
 * notifyCardSaved / notifyCollectionOpened), so it never fights the orchestrator
 * over single-assignment callbacks. Carousel rotation and grid mode are polled
 * directly from CardInteraction.
 *
 * @author Closet Club
 * @license MIT
 */

import { StyleNarrator } from './StyleNarrator';
import { CardInteraction } from './CardInteraction';
import { t } from './Localization';
import { InteractionHintController, HandMode, HandAnimationsLibrary, HandAnimationClipInfo } from 'Spectacles3DHandHints.lspkg/Scripts/InteractionHintController';

const ONBOARDING_FLAG_KEY = 'dgns_onboarding_complete';

// Step indices for the tutorial state machine.
const STEP_INACTIVE = -1;
const STEP_WELCOME = 0;
const STEP_SKIP_ANNOUNCE = 1;
const STEP_SCAN = 2;
const STEP_SAVE = 3;
const STEP_CONGRATS = 4;
const STEP_CLOSET = 5;
const STEP_CAROUSEL = 6;
const STEP_GRID = 7;
const STEP_OUTFIT = 8;
const STEP_DONE = 9;
const STEP_PROFILE = 10; // entre CONGRATS y CLOSET (orden por transiciones, no por numero)

@component
export class OnboardingManager extends BaseScriptComponent {

    // =====================================================================
    // INPUTS — Module references
    // =====================================================================
    @input
    @hint('StyleNarrator script — used for the tutorial TTS voice')
    narrator: StyleNarrator;

    @input
    @hint('CardInteraction script — polled to detect carousel rotation + grid gesture')
    cardInteraction: CardInteraction;

    // =====================================================================
    // INPUTS — Tutorial UI
    // =====================================================================
    @input
    @allowUndefined
    @hint('Optional root SceneObject for the tutorial text panel (shown during onboarding, hidden after)')
    tutorialPanel: SceneObject;

    @input
    @allowUndefined
    @hint('Text component that displays the current tutorial instruction (mirrors the spoken line)')
    tutorialText: Text;

    @input
    @allowUndefined
    @hint('"Skip Tutorial" button SceneObject')
    skipButton: SceneObject;

    @input
    @allowUndefined
    @hint('Text component of the Skip button label')
    skipButtonText: Text;

    // =====================================================================
    // INPUTS — 3D Hand Hints (Spectacles3DHandHints package)
    // =====================================================================
    // We drive ONE InteractionHintController in the scene and play the right
    // animation per step (pinch on the Scan button, swipe up to rotate the
    // carousel, open palm for the grid, finger tap on the wrist button). The
    // hint is positioned by re-parenting the controller onto an anchor.
    @input
    @allowUndefined
    @hint('Spectacles 3D Hand Hints — drag the object that has the InteractionHintController component. The tutorial plays the correct hand animation per step.')
    handHints: InteractionHintController;

    @input
    @allowUndefined
    @hint('Anchor SceneObject for the Pinch hint — place it at/near the Scan button. Shown during the SCAN step.')
    pinchAnchor: SceneObject;

    @input
    @allowUndefined
    @hint('Anchor SceneObject for gesture hints (the LEFT-wrist closet button, carousel, grid). Place an empty object where you want the hint to appear.')
    gestureAnchor: SceneObject;

    @input
    @allowUndefined
    @hint('Anchor SceneObject for the language step — place it near the flags / Accept button at the bottom of the Language Container. The pinch hint points here at launch.')
    languageAnchor: SceneObject;

    @input
    @allowUndefined
    @hint('Head-tracked Camera SceneObject. Hints parent to this so they always appear in front of the user (at the per-step offset) no matter where the user stands. Used whenever a step has no specific anchor.')
    headCamera: SceneObject;

    // =====================================================================
    // INPUTS — Per-step hand-hint position (tune live in Preview)
    // =====================================================================
    // Each value is the hint's LOCAL offset (cm) from that step's anchor. With
    // a camera anchor, more negative Z pushes it further from your eyes.
    @input('vec3')
    @hint('LANGUAGE step — hand-hint offset (cm) from the language anchor (toward the flags).')
    languageHintOffset: vec3 = new vec3(0, 0, -60);

    @input('vec3')
    @hint('SCAN step — hand-hint offset (cm) from the pinch anchor (Scan button).')
    scanHintOffset: vec3 = new vec3(0, 0, -60);

    @input('vec3')
    @hint('SAVE step — hand-hint offset (cm) from the pinch anchor (Save the look).')
    saveHintOffset: vec3 = new vec3(0, 0, -60);

    @input('vec3')
    @hint('CLOSET step — hand-hint offset (cm) from the gesture anchor (open the left-wrist closet).')
    closetHintOffset: vec3 = new vec3(0, 0, -60);

    @input('vec3')
    @hint('CAROUSEL step — hand-hint offset (cm) from the gesture anchor.')
    carouselHintOffset: vec3 = new vec3(0, 0, -60);

    @input('vec3')
    @hint('GRID step — hand-hint offset (cm) from the gesture anchor.')
    gridHintOffset: vec3 = new vec3(0, 0, -60);

    @input
    @widget(new SliderWidget(0.1, 2.0, 0.05))
    @hint('Overall scale of the 3D hand hints. Lower = smaller. Applied every time a hint is shown.')
    handHintSize: number = 0.5;

    // =====================================================================
    // INPUTS — Debug (Preview only)
    // =====================================================================
    @input
    @hint('DEBUG: always run the tutorial on launch, ignoring the saved "completed" flag.')
    alwaysShowTutorial: boolean = false;

    @input
    @hint('DEBUG: on launch, jump straight to the LANGUAGE step.')
    debugStartLanguage: boolean = false;

    @input
    @hint('DEBUG: on launch, jump straight to the SCAN step.')
    debugStartScan: boolean = false;

    @input
    @hint('DEBUG: on launch, jump straight to the SAVE step.')
    debugStartSave: boolean = false;

    @input
    @hint('DEBUG: on launch, jump straight to the CLOSET step.')
    debugStartCloset: boolean = false;

    @input
    @hint('DEBUG: on launch, jump straight to the CAROUSEL step.')
    debugStartCarousel: boolean = false;

    @input
    @hint('DEBUG: on launch, jump straight to the GRID step.')
    debugStartGrid: boolean = false;

    // =====================================================================
    // INPUTS — Voice ("Skip Tutorial" command, optional)
    // =====================================================================
    @input
    @allowUndefined
    @hint('VoiceML Module asset — enables the spoken "Skip Tutorial" command. Optional: the Skip button always works without it.')
    voiceMLModule: Asset;

    // =====================================================================
    // INPUTS — Tuning
    // =====================================================================
    @input
    @hint('Carousel rotation (radians) the user must reach to clear the CAROUSEL step')
    carouselRotationThreshold: number = 0.35;

    // =====================================================================
    // CALLBACKS — set by orchestrator (ClosetClubScanner)
    // =====================================================================
    onConnectButton: ((obj: SceneObject, cb: () => void, name: string) => boolean) | null = null;

    // =====================================================================
    // INTERNAL STATE
    // =====================================================================
    private step: number = STEP_INACTIVE;
    private active: boolean = false;
    private narrating: boolean = false;
    private skipConnected: boolean = false;
    private pollEvent: SceneEvent | null = null;
    private carouselBaseline: number = 0;
    private voiceStarted: boolean = false;

    // Current hand-hint so a watchdog can re-assert it if external code hides it.
    private hintShouldShow: boolean = false;
    private lastHintMode: HandMode = HandMode.Right;
    private lastHintAnim: string = HandAnimationsLibrary.Right.PinchFar;
    private lastHintAnchor: SceneObject | null = null;
    private lastHintOffset: vec3 = new vec3(0, 0, -60);

    // =====================================================================
    // LIFECYCLE
    // =====================================================================
    onAwake(): void {
        // Hide tutorial UI by default; we only reveal it if onboarding runs.
        // NOTE: we do NOT disable the hand-hints object here — its controller
        // needs to initialize (it keeps the hands faded out / invisible at rest),
        // and disabling its SceneObject before its own onAwake would break setup.
        if (this.skipButton) this.skipButton.enabled = false;
        // The on-screen tutorial text is no longer used (voice + hints only) —
        // keep it hidden so it never clashes with other UI.
        if (this.tutorialPanel) this.tutorialPanel.enabled = false;
        if (this.tutorialText) {
            const tso = this.tutorialText.getSceneObject();
            if (tso) tso.enabled = false;
        }

        this.createEvent('OnStartEvent').bind(() => {
            // Hide the hand-hints rig now that its controller has finished onAwake
            // (OnStartEvent runs after all onAwake calls). At rest the package
            // leaves both hand meshes enabled with an active occluder material,
            // which would otherwise show "ghost hands" at the world origin.
            this.hideHint();

            // Debug overrides force the tutorial to run even if already completed.
            const forced = this.alwaysShowTutorial || this.anyDebugJump();
            if (!forced && this.isOnboardingComplete()) {
                print('OnboardingManager: already completed — tutorial skipped.');
                this.active = false;
                return;
            }
            // Run the tutorial. Small delay so the other managers finish wiring
            // (WelcomeManager enables the language container, etc.).
            this.active = true;
            const startEv = this.createEvent('DelayedCallbackEvent');
            startEv.bind(() => this.begin());
            startEv.reset(0.6);
        });
    }

    // =====================================================================
    // PERSISTENCE
    // =====================================================================
    private getStore(): GeneralDataStore | null {
        try {
            return global.persistentStorageSystem.store;
        } catch (e) {
            return null;
        }
    }

    private isOnboardingComplete(): boolean {
        const store = this.getStore();
        if (!store) return false;
        try {
            return store.getString(ONBOARDING_FLAG_KEY) === '1';
        } catch (e) {
            return false;
        }
    }

    private markOnboardingComplete(): void {
        const store = this.getStore();
        if (!store) return;
        try { store.putString(ONBOARDING_FLAG_KEY, '1'); } catch (e) { /* ignore */ }
    }

    /** Called from the reset flow so the tutorial replays on next launch. */
    resetOnboarding(): void {
        const store = this.getStore();
        if (store) {
            try { store.putString(ONBOARDING_FLAG_KEY, ''); } catch (e) { /* ignore */ }
        }
        print('OnboardingManager: onboarding flag cleared — tutorial will replay next launch.');
    }

    // =====================================================================
    // TUTORIAL START
    // =====================================================================
    private begin(): void {
        if (!this.active) return;
        print('OnboardingManager: starting first-launch tutorial.');

        this.setupSkipButton();
        this.setupVoiceSkip();

        // Robustness watchdog: keeps the active hint visible if anything hides it.
        const wd = this.createEvent('UpdateEvent');
        wd.bind(() => this.watchdogTick());

        // Show the Skip button from the very start so the user can always bail
        // out (and so it is visible even while the language screen is up).
        if (this.skipButton) this.skipButton.enabled = true;
        if (this.skipButtonText) this.skipButtonText.text = t('onb_skip_button');

        // DEBUG: jump straight to a chosen step in Preview (first checkbox wins).
        if (this.debugStartGrid) { print('OnboardingManager: DEBUG jump → GRID'); this.enterGridStep(); return; }
        if (this.debugStartCarousel) { print('OnboardingManager: DEBUG jump → CAROUSEL'); this.enterCarouselStep(); return; }
        if (this.debugStartCloset) { print('OnboardingManager: DEBUG jump → CLOSET'); this.enterClosetStep(); return; }
        if (this.debugStartSave) {
            print('OnboardingManager: DEBUG jump → SAVE');
            this.step = STEP_SAVE;
            this.showHandHint(this.pinchAnchor, this.saveHintOffset);
            this.say(t('onb_save'));
            return;
        }
        if (this.debugStartScan) { print('OnboardingManager: DEBUG jump → SCAN'); this.enterScanStep(); return; }

        // Step 1: welcome + a pinch-far hint pointing at the flags (the most
        // common drop-off point). We wait for notifyLanguageAccepted().
        this.step = STEP_WELCOME;
        this.showHandHint(this.languageAnchor, this.languageHintOffset);
        this.say(t('onb_welcome'));
    }

    private anyDebugJump(): boolean {
        return this.debugStartLanguage || this.debugStartScan || this.debugStartSave ||
            this.debugStartCloset || this.debugStartCarousel || this.debugStartGrid;
    }

    // =====================================================================
    // NARRATION HELPER
    // =====================================================================
    private say(text: string, onDone?: () => void): void {
        // Voice + hand hints ONLY — no on-screen tutorial text (it was too long /
        // small and clashed with other messages like "Welcome back, <user>").
        this.narrating = true;
        let done = false;
        const finish = () => {
            if (done) return;
            done = true;
            this.narrating = false;
            if (onDone) onDone();
        };
        if (this.narrator) {
            this.narrator.speakOnboarding(text, null, finish);
        }
        // Backup timer so the tutorial ALWAYS advances even if the shared
        // narrator audio gets interrupted by another part of the app (in which
        // case the audio's onFinish — and thus onDone — would never fire).
        const backup = this.createEvent('DelayedCallbackEvent');
        backup.bind(finish);
        backup.reset(Math.max(5.0, Math.min(18.0, text.length * 0.09)));
    }

    // =====================================================================
    // PUBLIC NOTIFICATIONS (called by ClosetClubScanner)
    // =====================================================================
    notifyLanguageAccepted(): void {
        if (!this.active || this.step !== STEP_WELCOME) return;
        // Language chosen — all further lines are now in the selected language.
        this.hideHint();
        this.step = STEP_SKIP_ANNOUNCE;
        if (this.skipButton) this.skipButton.enabled = true;
        if (this.skipButtonText) this.skipButtonText.text = t('onb_skip_button');
        this.say(t('onb_skip_hint'), () => this.enterScanStep());
    }

    private enterScanStep(): void {
        if (!this.active) return;
        this.step = STEP_SCAN;
        this.showHandHint(this.pinchAnchor, this.scanHintOffset);
        this.say(t('onb_scan'));
        // Advances on notifyScanStarted().
    }

    notifyScanStarted(): void {
        if (!this.active || this.step !== STEP_SCAN) return;
        this.hideHint();
        // Wait for the result card (notifyScanEnded) before the Save instruction.
    }

    notifyScanEnded(): void {
        if (!this.active || this.step !== STEP_SCAN) return;
        this.step = STEP_SAVE;
        this.showHandHint(this.pinchAnchor, this.saveHintOffset);
        this.say(t('onb_save'));
        // Advances on notifyCardSaved().
    }

    notifyCardSaved(): void {
        if (!this.active) return;
        if (this.step !== STEP_SAVE && this.step !== STEP_SCAN) return;
        this.hideHint();
        this.step = STEP_CONGRATS;
        this.say(t('onb_congrats'), () => this.enterProfileStep());
    }

    private enterProfileStep(): void {
        if (!this.active) return;
        this.step = STEP_PROFILE;
        this.hideHint();
        this.say(t('onb_profile'), () => this.enterClosetStep());
    }

    private enterClosetStep(): void {
        if (!this.active) return;
        this.step = STEP_CLOSET;
        this.showHandHint(this.gestureAnchor, this.closetHintOffset);
        this.say(t('onb_closet_intro'));
        // Advances on notifyCollectionOpened().
    }

    notifyCollectionOpened(): void {
        if (!this.active) return;
        if (this.step !== STEP_CLOSET) return;
        this.hideHint();
        this.enterCarouselStep();
    }

    private enterCarouselStep(): void {
        this.step = STEP_CAROUSEL;
        this.carouselBaseline = this.readCarouselAngle();
        this.showHandHint(this.gestureAnchor, this.carouselHintOffset);
        this.say(t('onb_carousel'));
        this.startPolling();
        // Advances when carousel rotation passes the threshold (polled).
    }

    private enterGridStep(): void {
        this.step = STEP_GRID;
        this.showHandHint(this.gestureAnchor, this.gridHintOffset);
        this.say(t('onb_grid'));
        this.startPolling();
        // Advances when CardInteraction.isGridMode() becomes true (polled).
    }

    private enterOutfitStep(): void {
        this.step = STEP_OUTFIT;
        this.hideHint();
        this.say(t('onb_outfit'), () => this.finish());
    }

    // =====================================================================
    // POLLING — carousel rotation & grid gesture
    // =====================================================================
    private startPolling(): void {
        if (this.pollEvent) return;
        this.pollEvent = this.createEvent('UpdateEvent');
        this.pollEvent.bind(() => this.poll());
    }

    private stopPolling(): void {
        if (this.pollEvent) {
            this.pollEvent.enabled = false;
            this.pollEvent = null;
        }
    }

    private poll(): void {
        if (!this.active) { this.stopPolling(); return; }

        if (this.step === STEP_CAROUSEL) {
            const angle = this.readCarouselAngle();
            if (Math.abs(angle - this.carouselBaseline) >= this.carouselRotationThreshold) {
                this.stopPolling();
                this.enterGridStep();
            }
        } else if (this.step === STEP_GRID) {
            if (this.isGridActive()) {
                this.stopPolling();
                this.enterOutfitStep();
            }
        } else {
            this.stopPolling();
        }
    }

    private readCarouselAngle(): number {
        try {
            const ci = this.cardInteraction as any;
            if (ci && typeof ci.carouselAngleOffset === 'number') return ci.carouselAngleOffset;
        } catch (e) { /* ignore */ }
        return 0;
    }

    private isGridActive(): boolean {
        try {
            const ci = this.cardInteraction as any;
            if (ci && typeof ci.isGridMode === 'function') return !!ci.isGridMode();
        } catch (e) { /* ignore */ }
        return false;
    }

    // =====================================================================
    // FINISH / SKIP
    // =====================================================================
    private finish(): void {
        if (!this.active) return;
        this.step = STEP_DONE;
        this.say(t('onb_done'), () => this.teardown());
        this.markOnboardingComplete();
    }

    /** Skip the whole tutorial (Skip button or "Skip Tutorial" voice command). */
    skip(): void {
        print('OnboardingManager: skip() requested (active=' + this.active + ').');
        if (!this.active) return;
        print('OnboardingManager: tutorial skipped by user.');
        if (this.narrator) this.narrator.stopOnboarding();
        this.markOnboardingComplete();
        this.teardown();
    }

    private teardown(): void {
        this.active = false;
        this.step = STEP_INACTIVE;
        this.narrating = false;
        this.stopPolling();
        this.stopVoiceSkip();
        this.hideHint();
        if (this.skipButton) this.skipButton.enabled = false;
        if (this.tutorialPanel) this.tutorialPanel.enabled = false;
        if (this.tutorialText) {
            this.tutorialText.text = '';
            const tso = this.tutorialText.getSceneObject();
            if (tso) tso.enabled = false;
        }
        print('OnboardingManager: tutorial finished.');
    }

    // =====================================================================
    // HAND HINTS (drive the InteractionHintController)
    // =====================================================================
    // Show a looping hand-hint animation, optionally re-parented onto an anchor
    // so it appears at the right place (the button/gesture the user must do).
    // Per request, EVERY step uses the same "pinch far" hint (most recognizable),
    // only the anchor changes. Records the desired hint so the watchdog can
    // re-assert it if something external disables the rig.
    private showHandHint(anchor?: SceneObject, offset?: vec3): void {
        this.hintShouldShow = true;
        this.lastHintMode = HandMode.Right;
        this.lastHintAnim = HandAnimationsLibrary.Right.PinchFar;
        this.lastHintAnchor = anchor || null;
        this.lastHintOffset = offset ? new vec3(offset.x, offset.y, offset.z) : new vec3(0, 0, -60);
        this.applyHint();
    }

    private applyHint(): void {
        if (!this.handHints) return;
        try {
            const so = this.handHints.getSceneObject();
            if (!so) return;
            // Always parent to SOMETHING head-relative so the hint follows the
            // user. Prefer the step's specific anchor; fall back to the head
            // camera. (Without a parent, the offset would be interpreted in world
            // space near the scene origin — invisible once the user walks away.)
            const parent = this.lastHintAnchor || this.headCamera;
            if (parent) so.setParent(parent);
            so.enabled = true;
            // Scale the whole hand-hint rig (the package authors them large).
            const s = this.handHintSize > 0 ? this.handHintSize : 1.0;
            so.getTransform().setLocalScale(new vec3(s, s, s));
            // Use a sequence clip so we can pass the local OFFSET as the clip's
            // position — playHintAnimation() would force the position back to
            // zero (i.e. right at the camera) on every loop.
            const clip = new HandAnimationClipInfo(this.lastHintMode, this.lastHintAnim as any, this.lastHintOffset);
            // High loop count → keeps looping until we hide it when the step is done.
            this.handHints.playHintAnimationSequence([clip], 100);
            // Force the hands to draw ON TOP of all UI (buttons, flags, panels).
            this.forceHintOnTop(so);
        } catch (e) {
            print('OnboardingManager: hand hint error: ' + e);
        }
    }

    // Make every RenderMeshVisual in the hand-hint rig render in the foreground:
    // disable depth test/write (so closer UI can't occlude it) and push a high
    // render order (so it draws after the UI).
    private forceHintOnTop(root: SceneObject): void {
        try {
            this.applyOnTopRecursive(root, 0);
        } catch (e) {
            print('OnboardingManager: forceHintOnTop error: ' + e);
        }
    }

    private applyOnTopRecursive(obj: SceneObject, depth: number): void {
        if (!obj || depth > 40) return;
        const rmv = obj.getComponent('Component.RenderMeshVisual') as any;
        if (rmv) {
            try {
                if (typeof rmv.setRenderOrder === 'function') rmv.setRenderOrder(10000);
                else rmv.renderOrder = 10000;
            } catch (e) { /* ignore */ }
            try {
                const count = (typeof rmv.getMaterialsCount === 'function')
                    ? rmv.getMaterialsCount()
                    : (rmv.materials ? rmv.materials.length : 0);
                for (let i = 0; i < count; i++) {
                    const mat = rmv.getMaterial(i);
                    if (mat && mat.mainPass) {
                        mat.mainPass.depthTest = false;
                        mat.mainPass.depthWrite = false;
                    }
                }
            } catch (e) { /* some passes may not expose depth flags */ }
        }
        const n = obj.getChildrenCount();
        for (let i = 0; i < n; i++) {
            const c = obj.getChild(i);
            if (c) this.applyOnTopRecursive(c, depth + 1);
        }
    }

    private hideHint(): void {
        this.hintShouldShow = false;
        if (!this.handHints) return;
        try {
            const so = this.handHints.getSceneObject();
            if (so) so.enabled = false;
        } catch (e) { /* ignore */ }
    }

    // Robustness watchdog: if a hint should be showing but the rig got disabled
    // (e.g. the user did something unexpected), bring it back.
    private watchdogTick(): void {
        if (!this.active || !this.hintShouldShow || !this.handHints) return;
        try {
            const so = this.handHints.getSceneObject();
            if (so && !so.enabled) this.applyHint();
        } catch (e) { /* ignore */ }
    }

    // =====================================================================
    // SKIP BUTTON WIRING
    // =====================================================================
    private setupSkipButton(): void {
        if (this.skipConnected || !this.skipButton) return;
        this.skipConnected = true;

        // Path 1: the orchestrator connector (same path the other buttons use).
        if (this.onConnectButton) {
            this.onConnectButton(this.skipButton, () => this.skip(), 'SkipTutorial');
        }

        // Path 2 (belt-and-suspenders): hook the button's OWN events directly so
        // a press fires skip() whether it exposes onButtonPinched (UIKit) or
        // onTriggerUp (SIK). Double-firing is harmless — skip() is idempotent.
        let attempts = 0;
        let pinchHooked = false;
        let triggerHooked = false;
        const pollEv = this.createEvent('UpdateEvent');
        pollEv.bind(() => {
            if (++attempts > 300 || (pinchHooked && triggerHooked)) { pollEv.enabled = false; return; }
            try {
                const scripts = this.skipButton.getComponents('Component.ScriptComponent') as any[];
                for (let i = 0; i < scripts.length; i++) {
                    const s = scripts[i];
                    if (!s) continue;
                    if (!pinchHooked && s.onButtonPinched && typeof s.onButtonPinched.add === 'function') {
                        s.onButtonPinched.add(() => this.skip());
                        pinchHooked = true;
                        print('OnboardingManager: Skip hooked via onButtonPinched');
                    }
                    if (!triggerHooked && s.onTriggerUp && typeof s.onTriggerUp.add === 'function') {
                        s.onTriggerUp.add(() => this.skip());
                        triggerHooked = true;
                        print('OnboardingManager: Skip hooked via onTriggerUp');
                    }
                }
            } catch (e) { /* keep polling */ }
        });
    }

    // =====================================================================
    // VOICE "SKIP TUTORIAL" — optional, defensive (Spectacles 2024 VoiceML)
    // =====================================================================
    // Written with `any` casts + try/catch so a missing module or an API shape
    // difference never breaks the tutorial: the Skip button is the guaranteed
    // path; voice is a best-effort enhancement.
    private setupVoiceSkip(): void {
        if (this.voiceStarted || !this.voiceMLModule) return;
        try {
            const vml: any = this.voiceMLModule;
            const VoiceMLNS: any = (typeof VoiceML !== 'undefined') ? VoiceML : null;
            if (!VoiceMLNS || !vml) return;

            const options = VoiceMLNS.ListeningOptions.create();
            options.shouldReturnAsrTranscription = false;
            options.shouldReturnInterimAsrTranscription = false;

            const keywordModel = VoiceMLNS.NlpKeywordModelOptions.create();
            keywordModel.addKeywordGroup('skip_tutorial', [
                'skip tutorial', 'skip the tutorial', 'skip', 'skip tuto',
            ]);
            options.nlpModels = [keywordModel];

            if (vml.onListeningUpdate && typeof vml.onListeningUpdate.add === 'function') {
                vml.onListeningUpdate.add((eventData: any) => this.onVoiceUpdate(eventData));
            }
            if (vml.onListeningError && typeof vml.onListeningError.add === 'function') {
                vml.onListeningError.add((err: any) => print('OnboardingManager: VoiceML error: ' + err));
            }

            const startListening = () => {
                try { vml.startListening(options); } catch (e) { print('OnboardingManager: startListening failed: ' + e); }
            };
            if (vml.onListeningEnabled && typeof vml.onListeningEnabled.add === 'function') {
                vml.onListeningEnabled.add(() => startListening());
            } else {
                startListening();
            }

            this.voiceStarted = true;
            print('OnboardingManager: voice "Skip Tutorial" listener armed.');
        } catch (e) {
            print('OnboardingManager: VoiceML setup skipped: ' + e);
        }
    }

    private onVoiceUpdate(eventData: any): void {
        if (!this.active) return;
        try {
            const vml: any = this.voiceMLModule;
            let responses: any[] | null = null;
            if (vml && typeof vml.parseKeywordResponses === 'function') {
                responses = vml.parseKeywordResponses(eventData);
            } else if (eventData && typeof eventData.getKeywordResponses === 'function') {
                responses = eventData.getKeywordResponses();
            }
            if (!responses) return;
            for (let i = 0; i < responses.length; i++) {
                const r = responses[i];
                const kw: string = (r && (r.keyword || r.keywordName)) || '';
                if (kw && kw.indexOf('#SNAP_ERROR') === -1 && kw.indexOf('skip') !== -1) {
                    print('OnboardingManager: heard "' + kw + '" → skipping tutorial.');
                    this.skip();
                    return;
                }
            }
        } catch (e) { /* ignore malformed events */ }
    }

    private stopVoiceSkip(): void {
        if (!this.voiceStarted || !this.voiceMLModule) return;
        try {
            const vml: any = this.voiceMLModule;
            if (typeof vml.stopListening === 'function') vml.stopListening();
        } catch (e) { /* ignore */ }
        this.voiceStarted = false;
    }
}
