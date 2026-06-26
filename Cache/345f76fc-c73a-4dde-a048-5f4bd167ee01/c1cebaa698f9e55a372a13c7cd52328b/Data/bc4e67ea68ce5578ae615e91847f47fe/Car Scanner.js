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
exports.CarScanner = void 0;
var __selfType = requireType("./Car Scanner");
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
const Localization_1 = require("./Localization");
// Declare coarse location permission (required by Spectacles for city-level location)
require('LensStudio:ProcessedLocationModule');
let CarScanner = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var CarScanner = _classThis = class extends _classSuper {
        constructor() {
            super();
            // =====================================================================
            // INPUTS — Module references (assign in Inspector)
            // =====================================================================
            this.vehicleScanner = this.vehicleScanner;
            this.vehicleCardUI = this.vehicleCardUI;
            this.vehicleNarrator = this.vehicleNarrator;
            this.brandLogoLoader = this.brandLogoLoader;
            this.collectionManager = this.collectionManager;
            this.cardInteraction = this.cardInteraction;
            this.xpManager = this.xpManager;
            this.welcomeManager = this.welcomeManager;
            this.connectedLensManager = this.connectedLensManager;
            this.cloudManager = this.cloudManager;
            this.analyticsManager = this.analyticsManager;
            this.musicPlayer = this.musicPlayer;
            // =====================================================================
            // INPUTS — Scene elements managed by orchestrator
            // =====================================================================
            this.scanButton = this.scanButton;
            this.carScanInterface = this.carScanInterface;
            this.scannerButton = this.scannerButton;
            this.openCollectionDebugButton = this.openCollectionDebugButton;
            // =====================================================================
            // INPUTS — SFX (assign in Inspector)
            // =====================================================================
            this.sfxAudio = this.sfxAudio;
            this.sfxScanWaiting = this.sfxScanWaiting;
            this.sfxVehicleCardShown = this.sfxVehicleCardShown;
            this.sfxCardGenerationWaiting = this.sfxCardGenerationWaiting;
            this.sfxCardGenerationSuccess = this.sfxCardGenerationSuccess;
            this.sfxCardFlyToInventory = this.sfxCardFlyToInventory;
            this.sfxCardGenerationFailed = this.sfxCardGenerationFailed;
            this.sfxReviewGenerationWaiting = this.sfxReviewGenerationWaiting;
            this.sfxCheatDetected = this.sfxCheatDetected;
            this.sfxCheatReprimand = this.sfxCheatReprimand;
            this.sfxPositiveProgress = this.sfxPositiveProgress;
            this.sfxNegativeProgress = this.sfxNegativeProgress;
            this.sfxShareProfileSuccess = this.sfxShareProfileSuccess;
            this.sfxShareProfileFailed = this.sfxShareProfileFailed;
            this.sfxLevelUp = this.sfxLevelUp;
            // =====================================================================
            // INTERNAL STATE
            // =====================================================================
            this.scanInterfaceCloseButtonConnected = false;
            this.scannerButtonTextComp = null;
            this.isScanInProgress = false;
            this.sfxMuted = false;
            this.activeSfxState = 'none';
            this.activeSfxTrack = null;
            this.oneShotQueue = [];
            this.suppressNextNegativeProgressSfx = false;
        }
        __initialize() {
            super.__initialize();
            // =====================================================================
            // INPUTS — Module references (assign in Inspector)
            // =====================================================================
            this.vehicleScanner = this.vehicleScanner;
            this.vehicleCardUI = this.vehicleCardUI;
            this.vehicleNarrator = this.vehicleNarrator;
            this.brandLogoLoader = this.brandLogoLoader;
            this.collectionManager = this.collectionManager;
            this.cardInteraction = this.cardInteraction;
            this.xpManager = this.xpManager;
            this.welcomeManager = this.welcomeManager;
            this.connectedLensManager = this.connectedLensManager;
            this.cloudManager = this.cloudManager;
            this.analyticsManager = this.analyticsManager;
            this.musicPlayer = this.musicPlayer;
            // =====================================================================
            // INPUTS — Scene elements managed by orchestrator
            // =====================================================================
            this.scanButton = this.scanButton;
            this.carScanInterface = this.carScanInterface;
            this.scannerButton = this.scannerButton;
            this.openCollectionDebugButton = this.openCollectionDebugButton;
            // =====================================================================
            // INPUTS — SFX (assign in Inspector)
            // =====================================================================
            this.sfxAudio = this.sfxAudio;
            this.sfxScanWaiting = this.sfxScanWaiting;
            this.sfxVehicleCardShown = this.sfxVehicleCardShown;
            this.sfxCardGenerationWaiting = this.sfxCardGenerationWaiting;
            this.sfxCardGenerationSuccess = this.sfxCardGenerationSuccess;
            this.sfxCardFlyToInventory = this.sfxCardFlyToInventory;
            this.sfxCardGenerationFailed = this.sfxCardGenerationFailed;
            this.sfxReviewGenerationWaiting = this.sfxReviewGenerationWaiting;
            this.sfxCheatDetected = this.sfxCheatDetected;
            this.sfxCheatReprimand = this.sfxCheatReprimand;
            this.sfxPositiveProgress = this.sfxPositiveProgress;
            this.sfxNegativeProgress = this.sfxNegativeProgress;
            this.sfxShareProfileSuccess = this.sfxShareProfileSuccess;
            this.sfxShareProfileFailed = this.sfxShareProfileFailed;
            this.sfxLevelUp = this.sfxLevelUp;
            // =====================================================================
            // INTERNAL STATE
            // =====================================================================
            this.scanInterfaceCloseButtonConnected = false;
            this.scannerButtonTextComp = null;
            this.isScanInProgress = false;
            this.sfxMuted = false;
            this.activeSfxState = 'none';
            this.activeSfxTrack = null;
            this.oneShotQueue = [];
            this.suppressNextNegativeProgressSfx = false;
        }
        // =====================================================================
        // LIFECYCLE
        // =====================================================================
        onAwake() {
            print('CarScanner: Initializing orchestrator...');
            this.createEvent('OnStartEvent').bind(() => {
                this.wireModules();
                this.setupScanButton();
                this.setupScannerButton();
                this.setupOpenCollectionDebugButton();
                this.setupScanInterfaceCloseButton();
                // Hide all hand buttons until the game actually starts
                this.setHandButtonsEnabled(false);
                // Check if launched via "Active Nearby" — skip menus and go directly to multiplayer
                let startedAsMultiplayer = false;
                try {
                    startedAsMultiplayer = global.launchParams && global.launchParams.getBool('StartMultiplayer');
                }
                catch (e) { /* launchParams not available */ }
                if (startedAsMultiplayer && this.connectedLensManager) {
                    print('CarScanner: Launched via Active Nearby — starting multiplayer directly');
                    this.hideScanInterface();
                    if (this.welcomeManager)
                        this.welcomeManager.hide();
                    if (!this.isInternetAvailable()) {
                        print('CarScanner: No internet — falling back to language selection');
                        if (this.welcomeManager)
                            this.welcomeManager.show();
                    }
                    else {
                        this.connectedLensManager.startSession();
                    }
                }
                else if (this.welcomeManager) {
                    this.welcomeManager.show();
                    this.hideScanInterface();
                    print('CarScanner: Showing Language selection screen');
                }
                else {
                    this.showScanInterface();
                }
                print('CarScanner: All modules wired and ready');
            });
        }
        // =====================================================================
        // MODULE WIRING — Connect callbacks between modules
        // =====================================================================
        /**
         * Connects all inter-module callbacks so modules can communicate
         * without direct references to each other.
         */
        wireModules() {
            // --- VehicleCardUI callbacks ---
            if (this.vehicleCardUI) {
                this.vehicleCardUI.onCardClosed = () => {
                    print('CarScanner: Vehicle Card closed');
                    if (this.vehicleNarrator)
                        this.vehicleNarrator.hideDescription();
                    this.showScanInterface();
                };
                this.vehicleCardUI.onScanStarted = () => {
                    if (this.vehicleNarrator)
                        this.vehicleNarrator.startScanningMode();
                };
                this.vehicleCardUI.onScanEnded = () => {
                    // Scanning finished — idle mode will restart when scan interface re-appears
                };
                this.vehicleCardUI.onShowError = (message) => {
                    if (this.vehicleNarrator)
                        this.vehicleNarrator.showStatusError(message);
                };
                this.vehicleCardUI.onNoteChanged = (note) => {
                    if (this.collectionManager)
                        this.collectionManager.setLastVehicleNote(note);
                };
            }
            if (this.vehicleNarrator) {
                this.vehicleNarrator.onMuteStateChanged = (muted) => {
                    this.setSfxMuted(muted);
                };
                this.vehicleNarrator.onReviewGenerationStarted = () => {
                    this.startWaitingSfx(this.sfxReviewGenerationWaiting, 'review_wait');
                };
                this.vehicleNarrator.onReviewGenerationFinished = () => {
                    this.stopWaitingSfx('review_wait');
                };
                this.vehicleNarrator.onTTSPlaybackStarted = () => {
                    if (this.musicPlayer)
                        this.musicPlayer.setNarrationDucked(true);
                };
                this.vehicleNarrator.onTTSPlaybackEnded = () => {
                    if (this.musicPlayer)
                        this.musicPlayer.setNarrationDucked(false);
                };
                this.setSfxMuted(this.vehicleNarrator.isMuted());
            }
            // --- CollectionManager callbacks ---
            if (this.collectionManager) {
                this.collectionManager.onShowDescription = (text) => {
                    if (this.vehicleNarrator)
                        this.vehicleNarrator.showDescriptionText(text);
                };
                this.collectionManager.onShowAnimatedDescription = (text) => {
                    if (this.vehicleNarrator)
                        this.vehicleNarrator.showAnimatedDescriptionText(text);
                };
                this.collectionManager.onHideDescriptionAfterDelay = (seconds) => {
                    if (this.vehicleNarrator)
                        this.vehicleNarrator.hideDescriptionAfterDelay(seconds);
                };
                this.collectionManager.onConnectButton = (obj, cb, name) => {
                    if (this.vehicleCardUI)
                        return this.vehicleCardUI.connectButton(obj, cb, name);
                    return false;
                };
                this.collectionManager.onCombineLook = (data, closetItems, cardReviewText) => {
                    if (this.vehicleNarrator)
                        this.vehicleNarrator.triggerCombination(data, closetItems, cardReviewText);
                };
                this.collectionManager.onAskOutfitFeedback = (outfitItems, slotLabels, outfitText, percentText, matchPercent) => {
                    if (this.vehicleNarrator)
                        this.vehicleNarrator.triggerOutfitFeedback(outfitItems, slotLabels, outfitText, percentText, matchPercent);
                };
                this.collectionManager.onShowCardStatus = (text) => {
                    if (this.vehicleCardUI)
                        this.vehicleCardUI.showCardStatus(text);
                };
                this.collectionManager.onHideCardStatus = (seconds) => {
                    if (this.vehicleCardUI)
                        this.vehicleCardUI.hideCardStatusAfterDelay(seconds);
                };
                this.collectionManager.onCardGenerationStarted = () => {
                    this.startWaitingSfx(this.sfxCardGenerationWaiting, 'card_wait');
                };
                this.collectionManager.onCardGenerationSuccess = () => {
                    this.stopWaitingSfx('card_wait');
                    this.playOneShotSfx(this.sfxCardGenerationSuccess);
                };
                this.collectionManager.onCardGenerationFailed = () => {
                    this.stopWaitingSfx('card_wait');
                    this.playOneShotSfx(this.sfxCardGenerationFailed);
                };
                this.collectionManager.onCardFlyToInventory = () => {
                    this.playOneShotSfx(this.sfxCardFlyToInventory);
                };
                this.collectionManager.onGetTrustDisplayString = () => {
                    if (this.xpManager)
                        return this.xpManager.getTrustDisplayString();
                    return 'Trust: Unknown';
                };
                this.collectionManager.onGetCurrentNote = () => {
                    return this.vehicleCardUI ? this.vehicleCardUI.getNoteText() : '';
                };
                // XP attribution when a card is successfully saved
                this.collectionManager.onCardSaved = (data) => {
                    if (this.xpManager) {
                        const rarity = data.rarity || 2;
                        print('CarScanner: Card saved — awarding XP for rarity ' + rarity);
                        this.xpManager.awardScanXP(rarity);
                        this.xpManager.rewardTrust();
                    }
                    if (this.analyticsManager)
                        this.analyticsManager.logSave(0);
                };
                this.collectionManager.refreshButtonConnections();
            }
            // --- CardInteraction callbacks ---
            if (this.cardInteraction) {
                this.cardInteraction.onShowDescription = (text) => {
                    if (this.vehicleNarrator)
                        this.vehicleNarrator.showDescriptionText(text);
                };
                this.cardInteraction.onHideDescriptionAfterDelay = (seconds) => {
                    if (this.vehicleNarrator)
                        this.vehicleNarrator.hideDescriptionAfterDelay(seconds);
                };
                this.cardInteraction.onUpdateDeleteButtonVisibility = () => {
                    if (this.collectionManager)
                        this.collectionManager.updateDeleteButtonVisibility();
                };
                this.cardInteraction.onGetUserHeadTransform = () => {
                    if (this.collectionManager)
                        return this.collectionManager.getUserHeadTransformPublic();
                    return null;
                };
                this.cardInteraction.onCardPlacedInWorld = (serial, pos, rot, scale) => {
                    if (this.connectedLensManager) {
                        this.connectedLensManager.broadcastCardPlaced(serial, pos, rot, scale);
                    }
                };
                this.cardInteraction.onCardReturnedToCollection = (serial) => {
                    if (this.vehicleNarrator)
                        this.vehicleNarrator.hideDescription();
                    if (this.connectedLensManager) {
                        this.connectedLensManager.broadcastCardReturned(serial);
                    }
                };
                this.cardInteraction.onCardGrabbed = (serial, pos, rot, scale) => {
                    if (this.connectedLensManager) {
                        this.connectedLensManager.broadcastCardGrabbed(serial, pos, rot, scale);
                    }
                };
                this.cardInteraction.onCardMoving = (serial, pos, rot, scale) => {
                    if (this.connectedLensManager) {
                        this.connectedLensManager.broadcastCardMoving(serial, pos, rot, scale);
                    }
                };
            }
            // --- XPManager callbacks ---
            if (this.xpManager) {
                this.xpManager.onConnectButton = (obj, cb, name) => {
                    if (this.vehicleCardUI)
                        return this.vehicleCardUI.connectButton(obj, cb, name);
                    return false;
                };
                this.xpManager.onXPGained = (amount, newTotal) => {
                    print('CarScanner: XP gained +' + amount + ' (total: ' + newTotal + ')');
                };
                this.xpManager.onLevelUp = (newLevel, levelName) => {
                    print('CarScanner: LEVEL UP! ' + newLevel + ' — ' + levelName);
                    this.playOneShotSfx(this.sfxLevelUp);
                    if (this.vehicleNarrator) {
                        this.vehicleNarrator.showDescriptionText((0, Localization_1.tf)('level_up', { level: newLevel, name: levelName }));
                        this.vehicleNarrator.hideDescriptionAfterDelay(5.0);
                    }
                };
                this.xpManager.onPositiveProgress = () => {
                    this.playOneShotSfx(this.sfxPositiveProgress);
                };
                this.xpManager.onNegativeProgress = () => {
                    if (this.suppressNextNegativeProgressSfx) {
                        this.suppressNextNegativeProgressSfx = false;
                        return;
                    }
                    this.playOneShotSfx(this.sfxNegativeProgress);
                };
                this.xpManager.onUserCardOpened = () => {
                    if (this.collectionManager) {
                        this.collectionManager.closeAllPopups();
                        this.collectionManager.setDeleteButtonForceDisabled(true);
                    }
                };
                this.xpManager.onUserCardClosed = () => {
                    if (this.collectionManager) {
                        this.collectionManager.setDeleteButtonForceDisabled(false);
                    }
                };
                this.xpManager.onGetUserHeadTransform = () => {
                    if (this.collectionManager)
                        return this.collectionManager.getUserHeadTransformPublic();
                    return null;
                };
            }
            // --- WelcomeManager callbacks ---
            if (this.welcomeManager) {
                this.welcomeManager.onConnectButton = (obj, cb, name) => {
                    if (this.vehicleCardUI)
                        return this.vehicleCardUI.connectButton(obj, cb, name);
                    return false;
                };
                this.welcomeManager.onLanguageSelected = (lang) => {
                    print('CarScanner: Language selected — ' + lang);
                    this.translateAllStaticUI();
                };
                this.welcomeManager.onSoloModeSelected = () => {
                    print('CarScanner: Solo mode selected — opening scanner interface');
                    this.showScanInterface();
                };
                this.welcomeManager.onConnectedLensModeSelected = () => {
                    print('CarScanner: Connected Lens mode selected');
                    if (!this.isInternetAvailable()) {
                        print('CarScanner: No internet — cannot start Connected Lens');
                        if (this.vehicleNarrator) {
                            this.vehicleNarrator.showDescriptionText((0, Localization_1.t)('no_internet'));
                            this.vehicleNarrator.hideDescriptionAfterDelay(4.0);
                        }
                        return;
                    }
                    if (this.connectedLensManager) {
                        this.connectedLensManager.startSession();
                    }
                };
                this.welcomeManager.onShowMessage = (text) => {
                    if (this.vehicleNarrator) {
                        this.vehicleNarrator.showDescriptionText(text);
                        this.vehicleNarrator.hideDescriptionAfterDelay(3.0);
                    }
                };
            }
            // --- ConnectedLensManager callbacks ---
            if (this.connectedLensManager) {
                // Wire wrist anchor for remote carousel positioning (broadcasts wrist pos to remote players)
                if (this.collectionManager && this.collectionManager.cardCollectionContainer) {
                    this.connectedLensManager.wristAnchor = this.collectionManager.cardCollectionContainer;
                    print('CarScanner: Wrist anchor wired to cardCollectionContainer');
                }
                this.connectedLensManager.onConnectButton = (obj, cb, name) => {
                    if (this.vehicleCardUI)
                        return this.vehicleCardUI.connectButton(obj, cb, name);
                    return false;
                };
                this.connectedLensManager.onSessionConnected = () => {
                    print('CarScanner: Connected Lens session connected — waiting for colocation');
                    // Do NOT show Car Scan Interface yet — wait for colocation to complete
                    // Guidance messages are shown via onShowGuidance → XP Display
                };
                this.connectedLensManager.onSessionReady = () => {
                    print('CarScanner: Connected Lens session fully ready (colocation complete) — showing scan interface');
                    this.showScanInterface();
                };
                this.connectedLensManager.onSessionFailed = (reason) => {
                    print('CarScanner: Connected Lens session FAILED — ' + reason);
                    this.hideScanInterface();
                    this.setHandButtonsEnabled(false);
                    if (this.welcomeManager) {
                        this.welcomeManager.show();
                        print('CarScanner: Returned to Welcome screen after session failure');
                    }
                };
                this.connectedLensManager.onSessionCancelled = () => {
                    print('CarScanner: User cancelled session dialog — returning to Welcome');
                    this.hideScanInterface();
                    this.setHandButtonsEnabled(false);
                    if (this.welcomeManager) {
                        this.welcomeManager.show();
                    }
                };
                this.connectedLensManager.onSessionLost = () => {
                    print('CarScanner: Session lost mid-game — showing message and returning to Welcome');
                    if (this.xpManager && this.xpManager.xpDisplay) {
                        this.xpManager.enqueueCustomPopup((0, Localization_1.t)('session_lost'), 1, 0.3, 0.1, 4.0, -1);
                    }
                    const returnDelay = this.createEvent('DelayedCallbackEvent');
                    returnDelay.bind(() => {
                        this.hideScanInterface();
                        this.setHandButtonsEnabled(false);
                        if (this.welcomeManager) {
                            this.welcomeManager.show();
                            print('CarScanner: Returned to Welcome screen after mid-game disconnect');
                        }
                    });
                    returnDelay.reset(4.5);
                };
                this.connectedLensManager.onPlayerJoined = (name) => {
                    print('CarScanner: Player joined — ' + name);
                    if (this.vehicleNarrator) {
                        this.vehicleNarrator.showDescriptionText(name + ' joined the session!');
                        this.vehicleNarrator.hideDescriptionAfterDelay(3.0);
                    }
                };
                this.connectedLensManager.onPlayerLeft = (name) => {
                    print('CarScanner: Player left — ' + name);
                    if (this.vehicleNarrator) {
                        this.vehicleNarrator.showDescriptionText(name + ' left the session');
                        this.vehicleNarrator.hideDescriptionAfterDelay(3.0);
                    }
                };
                this.connectedLensManager.onShowMessage = (text) => {
                    if (this.vehicleNarrator) {
                        this.vehicleNarrator.showDescriptionText(text);
                        this.vehicleNarrator.hideDescriptionAfterDelay(3.0);
                    }
                };
                // Colocation guidance — use XP Display (camera-attached) as primary display
                // because the dedicated Colocated Guidance text is shared with SnapCloudRequirements
                this.connectedLensManager.onShowGuidance = (text) => {
                    print('CarScanner: [GUIDANCE] ' + text.replace(/\n/g, ' | '));
                    if (this.xpManager && this.xpManager.xpDisplay) {
                        const displayObj = this.xpManager.xpDisplay.getSceneObject();
                        if (displayObj)
                            displayObj.enabled = true;
                        this.xpManager.xpDisplay.text = text;
                        try {
                            this.xpManager.xpDisplay.textFill.color = new vec4(1, 1, 1, 1);
                        }
                        catch (e) { /* ignore */ }
                    }
                };
                this.connectedLensManager.onHideGuidance = () => {
                    if (this.xpManager && this.xpManager.xpDisplay) {
                        const displayObj = this.xpManager.xpDisplay.getSceneObject();
                        if (displayObj)
                            displayObj.enabled = false;
                        this.xpManager.xpDisplay.text = '';
                    }
                };
                // Card received from another player — add to persistent collection (with optional image)
                this.connectedLensManager.onCardReceived = (card, imageB64) => {
                    print('CarScanner: Received card from trade — ' + card.brand_model
                        + (imageB64 ? ' (with image)' : ' (no image)'));
                    if (this.collectionManager) {
                        this.collectionManager.addReceivedCard(card, imageB64);
                        this.collectionManager.addTradeRecord({
                            timestamp: Date.now(),
                            type: 'received',
                            serial: card.serial || '',
                            brand_model: card.brand_model || '?',
                            rarity: card.rarity || 2,
                            partnerName: '',
                            method: 'colocated',
                        });
                    }
                    if (this.xpManager) {
                        this.xpManager.awardTradeXP(card.serial);
                    }
                    if (this.analyticsManager)
                        this.analyticsManager.logTrade('received', 'colocated');
                };
                // Card given away — remove from persistent collection + award XP to giver
                this.connectedLensManager.onCardGivenAway = (serial) => {
                    print('CarScanner: Card given away — serial: ' + serial);
                    if (this.collectionManager) {
                        const vehicles = this.collectionManager.getSavedVehicles();
                        const v = vehicles.find((v) => v.serial === serial);
                        this.collectionManager.addTradeRecord({
                            timestamp: Date.now(),
                            type: 'given',
                            serial: serial,
                            brand_model: v ? v.brand_model : '?',
                            rarity: v ? v.rarity : 2,
                            partnerName: '',
                            method: 'colocated',
                        });
                        this.collectionManager.removeCardBySerial(serial);
                    }
                    if (this.xpManager) {
                        this.xpManager.awardGiveXP(serial);
                    }
                    if (this.analyticsManager)
                        this.analyticsManager.logTrade('given', 'colocated');
                };
                // Wire image retrieval callbacks for network image transmission
                if (this.collectionManager) {
                    this.connectedLensManager.onGetCardImageBase64 = (savedAt) => {
                        return this.collectionManager.getCardImageBase64(savedAt);
                    };
                    this.connectedLensManager.onGetSavedAtForSerial = (serial) => {
                        return this.collectionManager.getSavedAtForSerial(serial);
                    };
                    this.connectedLensManager.onHasCardSerial = (serial) => {
                        if (!this.collectionManager)
                            return false;
                        const vehicles = this.collectionManager.getSavedVehicles();
                        return vehicles.some((v) => v.serial === serial);
                    };
                    this.connectedLensManager.onLoadBrandLogo = (logoObj, brand) => {
                        if (!this.collectionManager || !this.collectionManager.brandLogoLoader)
                            return;
                        const loader = this.collectionManager.brandLogoLoader;
                        const url = loader.getBrandLogoUrl(brand);
                        if (url)
                            loader.loadLogoOntoObject(logoObj, url);
                    };
                }
                if (this.xpManager) {
                    this.connectedLensManager.onGetLevelBadgeUrl = (level) => {
                        return this.xpManager ? this.xpManager.getLevelBadgeUrl(level) : '';
                    };
                }
                // Wire CollectionManager carousel visibility to ConnectedLensManager (with angle for remote rotation)
                if (this.collectionManager) {
                    this.collectionManager.onCarouselVisibilityChanged = (visible, cardData, carouselAngle) => {
                        if (this.connectedLensManager) {
                            this.connectedLensManager.setLocalCarouselVisible(visible, cardData, carouselAngle);
                        }
                    };
                }
                // Sync local carousel rotation so remote player sees the same rotation
                this.connectedLensManager.onGetCarouselState = () => ({
                    visible: this.collectionManager?.isCollectionOpen ?? false,
                    angle: this.cardInteraction?.carouselAngleOffset ?? 0,
                });
                // Send local player stats to remote players whenever XP changes
                if (this.xpManager) {
                    // Push initial stats once session connects
                    this.connectedLensManager.onSessionConnected = ((prevCb) => {
                        return () => {
                            if (prevCb)
                                prevCb();
                            this.pushLocalPlayerStats();
                        };
                    })(this.connectedLensManager.onSessionConnected);
                    // Push updated stats whenever XP is gained
                    const prevOnXPGained = this.xpManager.onXPGained;
                    this.xpManager.onXPGained = (amount, totalXP) => {
                        if (prevOnXPGained)
                            prevOnXPGained(amount, totalXP);
                        this.pushLocalPlayerStats();
                    };
                }
            }
            // --- CloudManager callbacks ---
            this.wireCloudManager();
        }
        // =====================================================================
        // CLOUD MANAGER WIRING
        // =====================================================================
        wireCloudManager() {
            if (!this.cloudManager) {
                print('CarScanner: CloudManager not assigned — cloud features disabled');
                return;
            }
            // --- Auth callbacks ---
            this.cloudManager.onAuthenticated = (userId) => {
                print('CarScanner: [CLOUD] Authenticated — uid=' + userId.substring(0, 8) + '...');
                // Sync profile to cloud on auth
                if (this.xpManager) {
                    const profile = this.xpManager.getProfile();
                    this.cloudManager.syncProfile(profile, profile.totalScans || 0, profile.totalTrades || 0);
                }
                // Sync full collection to cloud on auth
                if (this.collectionManager) {
                    const vehicles = this.collectionManager.getSavedVehicles();
                    if (vehicles.length > 0) {
                        this.cloudManager.syncFullCollection(vehicles);
                    }
                }
                // Fetch leaderboard
                this.cloudManager.fetchLeaderboard(10);
            };
            this.cloudManager.onAuthFailed = (error) => {
                print('CarScanner: [CLOUD] Auth failed — ' + error);
            };
            this.cloudManager.onProfileSynced = (cloudProfile) => {
                print('CarScanner: [CLOUD] Profile synced — LVL ' + cloudProfile.level);
            };
            this.cloudManager.onCollectionSynced = (count) => {
                print('CarScanner: [CLOUD] Collection synced — ' + count + ' vehicles');
            };
            this.cloudManager.onLeaderboardReady = (entries, myRank) => {
                print('CarScanner: [CLOUD] Leaderboard ready — '
                    + entries.length + ' entries, my rank=#' + myRank);
                if (myRank > 0 && this.vehicleNarrator) {
                    this.vehicleNarrator.showDescriptionText((0, Localization_1.tf)('global_rank', { rank: myRank, total: entries.length }));
                    this.vehicleNarrator.hideDescriptionAfterDelay(4.0);
                }
            };
            this.cloudManager.onTradeReceived = (trade) => {
                print('CarScanner: [CLOUD] Trade received — ' + trade.offered_brand_model);
                if (this.vehicleNarrator) {
                    this.vehicleNarrator.showDescriptionText((0, Localization_1.tf)('trade_request_card', { name: trade.offered_brand_model, rarity: trade.offered_rarity }));
                    this.vehicleNarrator.hideDescriptionAfterDelay(6.0);
                }
            };
            this.cloudManager.onShowMessage = (text) => {
                if (this.vehicleNarrator) {
                    this.vehicleNarrator.showDescriptionText(text);
                    this.vehicleNarrator.hideDescriptionAfterDelay(3.0);
                }
            };
            this.cloudManager.onAsyncTradeCompleted = (cloudVehicle) => {
                print('CarScanner: [CLOUD] Async trade completed — ' + cloudVehicle.brand_model);
                if (this.collectionManager) {
                    const card = {
                        brand_model: cloudVehicle.brand_model || '?',
                        type: cloudVehicle.type || 'sedan',
                        rarity: cloudVehicle.rarity || 2,
                        rarity_label: cloudVehicle.rarity_label || '',
                        serial: cloudVehicle.serial || '',
                        top_speed: cloudVehicle.top_speed || 2,
                        acceleration: cloudVehicle.acceleration || 2,
                        braking: cloudVehicle.braking || 2,
                        traction: cloudVehicle.traction || 2,
                        comfort: cloudVehicle.comfort || 3,
                        year: cloudVehicle.year || '',
                        scene: cloudVehicle.scene || '',
                    };
                    this.collectionManager.addReceivedCard(card);
                    this.collectionManager.addTradeRecord({
                        timestamp: Date.now(),
                        type: 'received',
                        serial: card.serial,
                        brand_model: card.brand_model,
                        rarity: card.rarity,
                        partnerName: '',
                        method: 'async',
                    });
                }
                if (this.xpManager) {
                    this.xpManager.awardTradeXP(cloudVehicle.serial);
                }
            };
            // --- CollectionManager → Cloud callbacks ---
            if (this.collectionManager) {
                this.collectionManager.onCloudSyncVehicle = (vehicle) => {
                    if (this.cloudManager && this.cloudManager.isReady()) {
                        this.cloudManager.syncVehicle(vehicle).then((ok) => {
                            if (!ok || !this.cloudManager || !this.collectionManager)
                                return;
                            const imageB64 = this.collectionManager.getCardImageBase64(vehicle.savedAt);
                            if (imageB64 && imageB64.length > 0) {
                                this.cloudManager.uploadCardImage(vehicle.serial, imageB64);
                            }
                        });
                    }
                };
                this.collectionManager.onCloudUploadImage = (serial, base64) => {
                    if (this.cloudManager && this.cloudManager.isReady()) {
                        this.cloudManager.uploadCardImage(serial, base64);
                    }
                };
                this.collectionManager.onCloudDeleteVehicle = (serial) => {
                    if (this.cloudManager && this.cloudManager.isReady()) {
                        this.cloudManager.deleteCloudVehicle(serial);
                    }
                };
                this.collectionManager.onCloudSyncTradeHistory = (entry) => {
                    if (this.cloudManager && this.cloudManager.isReady()) {
                        this.cloudManager.syncTradeHistoryEntry(entry);
                    }
                };
                this.collectionManager.onCloudSyncFullCollection = (vehicles) => {
                    if (this.cloudManager && this.cloudManager.isReady()) {
                        this.cloudManager.syncFullCollection(vehicles).then(() => {
                            if (!this.cloudManager || !this.collectionManager)
                                return;
                            for (let i = 0; i < vehicles.length; i++) {
                                const vehicle = vehicles[i];
                                if (!vehicle || !vehicle.serial || !vehicle.savedAt)
                                    continue;
                                const imageB64 = this.collectionManager.getCardImageBase64(vehicle.savedAt);
                                if (imageB64 && imageB64.length > 0) {
                                    this.cloudManager.uploadCardImage(vehicle.serial, imageB64);
                                }
                            }
                        });
                    }
                };
                this.collectionManager.onCloudResetCollection = () => {
                    if (this.cloudManager && this.cloudManager.isReady()) {
                        this.cloudManager.resetCloudCollection();
                    }
                    if (this.xpManager) {
                        this.xpManager.fullReset();
                        print('CarScanner: [RESET] Local profile reset to level 1');
                    }
                };
                this.collectionManager.onShareCollection = (callback) => {
                    const doShare = () => {
                        this.cloudManager.shareCollection().then((url) => {
                            callback(url);
                        }).catch((err) => {
                            print('CarScanner: [CLOUD] Share failed — ' + err);
                            this.playOneShotSfx(this.sfxShareProfileFailed);
                            callback((0, Localization_1.tf)('share_failed_err', { error: err }));
                        });
                    };
                    if (this.cloudManager && this.cloudManager.isReady()) {
                        doShare();
                    }
                    else if (this.cloudManager) {
                        this.cloudManager.tryReconnect().then((ok) => {
                            if (ok) {
                                print('CarScanner: [CLOUD] Reconnected — sharing collection');
                                doShare();
                            }
                            else {
                                this.playOneShotSfx(this.sfxShareProfileFailed);
                                callback((0, Localization_1.t)('cloud_not_connected'));
                            }
                        }).catch(() => {
                            this.playOneShotSfx(this.sfxShareProfileFailed);
                            callback((0, Localization_1.t)('cloud_not_connected'));
                        });
                    }
                    else {
                        this.playOneShotSfx(this.sfxShareProfileFailed);
                        callback((0, Localization_1.t)('cloud_not_connected'));
                    }
                };
            }
            // --- XPManager → Cloud profile sync ---
            if (this.xpManager) {
                this.xpManager.onCloudSyncProfile = (profile) => {
                    if (this.cloudManager && this.cloudManager.isReady()) {
                        this.cloudManager.syncProfile(profile, profile.totalScans || 0, profile.totalTrades || 0);
                    }
                };
            }
            // --- Share Gallery callbacks ---
            this.cloudManager.onGetProfile = () => {
                if (this.xpManager)
                    return this.xpManager.getProfile();
                return { level: 1, totalXP: 0, prestige: 0, lastLoginDate: '', streakDays: 0, totalScans: 0, totalTrades: 0, trustScore: 80, consecutiveCheats: 0, totalCheats: 0, cardsGiven: 0, cardsReceived: 0 };
            };
            this.cloudManager.onGetCollection = () => {
                if (this.collectionManager)
                    return this.collectionManager.getSavedVehicles();
                return [];
            };
            this.cloudManager.onGetUsername = () => {
                if (this.xpManager)
                    return this.xpManager.getUsername();
                return '';
            };
            this.cloudManager.onGetAvatarUrl = () => {
                return this.cloudManager.getAvatarUrl();
            };
            this.cloudManager.onShareComplete = (url) => {
                print('CarScanner: [CLOUD] Gallery shared — ' + url);
                if (this.vehicleNarrator) {
                    this.vehicleNarrator.showDescriptionText((0, Localization_1.tf)('gallery_shared', { url: url }));
                    this.vehicleNarrator.hideDescriptionAfterDelay(10.0);
                }
            };
            this.cloudManager.onShareSucceeded = () => {
                this.playOneShotSfx(this.sfxShareProfileSuccess);
            };
            this.cloudManager.onShareFailed = () => {
                this.playOneShotSfx(this.sfxShareProfileFailed);
            };
            this.cloudManager.onGetLocalImage = (savedAt) => {
                try {
                    if (!this.collectionManager)
                        return '';
                    return this.collectionManager.getCardImageBase64(savedAt) || '';
                }
                catch (e) {
                    return '';
                }
            };
            print('CarScanner: CloudManager wired');
        }
        // =====================================================================
        // SCAN BUTTON
        // =====================================================================
        setupScanButton() {
            if (!this.scanButton) {
                print('CarScanner: scanButton not assigned');
                return;
            }
            if (this.vehicleCardUI) {
                const connected = this.vehicleCardUI.connectButton(this.scanButton, () => {
                    print('CarScanner: Scan button pressed');
                    this.onScanButtonPressed();
                }, 'ScanLook');
                if (connected) {
                    print('CarScanner: Scan button connected');
                    return;
                }
            }
            const btnScript = this.scanButton.getComponent('Component.ScriptComponent');
            if (btnScript && btnScript.enabled !== false && btnScript.onTriggerUp && typeof btnScript.onTriggerUp.add === 'function') {
                btnScript.onTriggerUp.add(() => {
                    print('CarScanner: Scan button pressed');
                    this.onScanButtonPressed();
                });
                print('CarScanner: Scan button connected via direct fallback');
                return;
            }
            print('CarScanner: Scan button could not connect - no compatible button event found');
        }
        // =====================================================================
        // SCANNER BUTTON — Reopens Car Scan Interface if closed via (x)
        // =====================================================================
        setupScannerButton() {
            if (!this.scannerButton)
                return;
            this.scannerButtonTextComp = this.findTextInHierarchy(this.scannerButton);
            if (this.vehicleCardUI) {
                if (this.vehicleCardUI.connectButton(this.scannerButton, () => {
                    this.toggleScanInterface();
                }, 'ScannerButton')) {
                    print('CarScanner: Scanner Button connected');
                }
            }
        }
        toggleScanInterface() {
            if (this.carScanInterface && this.carScanInterface.enabled) {
                this.hideScanInterface();
            }
            else {
                this.showScanInterface();
            }
        }
        findTextInHierarchy(obj) {
            try {
                const t = obj.getComponent('Component.Text');
                if (t)
                    return t;
            }
            catch (e) { /* no text on this object */ }
            const count = obj.getChildrenCount();
            for (let i = 0; i < count; i++) {
                const child = obj.getChild(i);
                if (!child)
                    continue;
                const found = this.findTextInHierarchy(child);
                if (found)
                    return found;
            }
            return null;
        }
        updateScannerButtonLabel() {
            if (!this.scannerButtonTextComp)
                return;
            const isOpen = this.carScanInterface && this.carScanInterface.enabled;
            this.scannerButtonTextComp.text = isOpen ? (0, Localization_1.t)('close_scanner') : (0, Localization_1.t)('open_scanner');
        }
        // =====================================================================
        // DEBUG COLLECTION BUTTON — Opens carousel in front of camera (preview testing)
        // =====================================================================
        setupOpenCollectionDebugButton() {
            if (!this.openCollectionDebugButton)
                return;
            if (this.vehicleCardUI) {
                if (this.vehicleCardUI.connectButton(this.openCollectionDebugButton, () => {
                    print('CarScanner: Open Collection Debug pressed');
                    if (this.collectionManager) {
                        // If collection is empty, create test cards for preview testing
                        if (this.collectionManager.collectionCardObjects.length === 0) {
                            print('CarScanner: Collection empty — creating debug cards for testing');
                            this.collectionManager.createDebugCards();
                        }
                        this.collectionManager.toggleCollection();
                    }
                }, 'OpenCollectionDebug')) {
                    print('CarScanner: Open Collection Debug button connected');
                }
            }
        }
        startScanAfterDelay(seconds, source) {
            const delayedScan = this.createEvent('DelayedCallbackEvent');
            delayedScan.bind(() => {
                if (this.carScanInterface && !this.carScanInterface.enabled) {
                    print('CarScanner: Auto scan canceled — scan interface is closed');
                    return;
                }
                print('CarScanner: Auto scan requested from ' + source);
                this.onScanButtonPressed();
            });
            delayedScan.reset(seconds);
        }
        // =====================================================================
        // SCAN FLOW — Orchestrates the full scan pipeline
        // =====================================================================
        async onScanButtonPressed() {
            if (!this.vehicleScanner) {
                print('CarScanner: Scan ignored — vehicleScanner not assigned');
                return;
            }
            if (this.vehicleScanner.getIsScanning() || this.isScanInProgress) {
                print('CarScanner: Scan ignored — scan already in progress');
                return;
            }
            print('CarScanner: Scan flow started');
            this.isScanInProgress = true;
            this.startWaitingSfx(this.sfxScanWaiting, 'scan_wait');
            // Notify Connected Lens that we started scanning
            if (this.connectedLensManager)
                this.connectedLensManager.setLocalScanning(true);
            // Refresh city cache before each scan (async callback will update cache)
            if (this.collectionManager)
                this.collectionManager.prefetchCity();
            // Reset previous state
            if (this.vehicleNarrator)
                this.vehicleNarrator.hideDescription();
            if (this.vehicleCardUI)
                this.vehicleCardUI.setUIState('loading', () => this.hideScanInterface());
            const scanStartTime = Date.now();
            try {
                // Step 1+2+3: Capture, analyze, position (all inside VehicleScanner)
                const vehicleData = await this.vehicleScanner.scanVehicle();
                const scanDurationMs = Date.now() - scanStartTime;
                if (!vehicleData) {
                    this.stopWaitingSfx('scan_wait');
                    const reason = this.vehicleScanner.getLastRejectionReason();
                    if (this.analyticsManager) {
                        this.analyticsManager.logScan(scanDurationMs, false);
                    }
                    if (reason === 'SCREEN_OR_PHOTO_DETECTED' && this.vehicleScanner.enableAntiCheat) {
                        if (this.analyticsManager)
                            this.analyticsManager.logAntiCheatBlock();
                        this.showCheatSequence();
                    }
                    this.showNoCarDetected();
                    return;
                }
                if (this.analyticsManager)
                    this.analyticsManager.logScan(scanDurationMs, true);
                print('CarScanner: Vehicle identified: ' + vehicleData.brand_model);
                if (this.vehicleNarrator)
                    this.vehicleNarrator.showStatusProcessing((0, Localization_1.t)('car_detected'));
                // Pass data to narrator for "Fetch Info" feature
                if (this.vehicleNarrator)
                    this.vehicleNarrator.setVehicleData(vehicleData);
                // Pass data to collection manager for "Save" feature
                if (this.collectionManager)
                    this.collectionManager.setLastVehicleData(vehicleData);
                // Pass the compressed captured photo for Image Edit (gpt-image-1)
                if (this.collectionManager && this.vehicleScanner) {
                    this.collectionManager.setLastCapturedImage(this.vehicleScanner.getLastCapturedBase64ForEdit());
                }
                // Display results on Vehicle Card
                if (this.vehicleCardUI) {
                    this.vehicleCardUI.displayResults(vehicleData);
                    if (this.vehicleScanner) {
                        this.vehicleCardUI.applyItemPhoto(this.vehicleScanner.getLastCapturedTexture());
                        this.vehicleCardUI.applyItemPhotoBase64(this.vehicleScanner.getLastCapturedBase64ForEdit());
                    }
                }
                // Show Vehicle Card
                if (this.vehicleCardUI)
                    this.vehicleCardUI.setUIState('results', () => this.hideScanInterface());
                this.stopWaitingSfx('scan_wait');
                this.playOneShotSfx(this.sfxVehicleCardShown);
                // Closet Club uses the visual slot for the captured garment/look photo,
                // not for external brand logos.
            }
            catch (error) {
                this.stopWaitingSfx('scan_wait');
                print('CarScanner: Scan error: ' + error);
                if (this.vehicleNarrator)
                    this.vehicleNarrator.showStatusError((0, Localization_1.t)('scan_failed'));
                if (this.analyticsManager)
                    this.analyticsManager.logError('scan', String(error));
            }
            finally {
                this.isScanInProgress = false;
                if (this.connectedLensManager)
                    this.connectedLensManager.setLocalScanning(false);
            }
        }
        showNoCarDetected() {
            const reason = this.vehicleScanner ? this.vehicleScanner.getLastRejectionReason() : '';
            if (reason === 'SCREEN_OR_PHOTO_DETECTED') {
                if (this.vehicleNarrator) {
                    const cheats = this.xpManager ? this.xpManager.getConsecutiveCheats() : 1;
                    const messages = (0, Localization_1.getCheatMessages)();
                    const idx = Math.min(cheats - 1, messages.length - 1);
                    this.vehicleNarrator.showStatusError(messages[idx], 8.0);
                }
                print('CarScanner: ANTI-CHEAT blocked scan — screen/photo detected');
            }
            else {
                if (this.vehicleNarrator)
                    this.vehicleNarrator.showStatusError((0, Localization_1.t)('no_car_detected'));
            }
            if (this.vehicleScanner)
                this.vehicleScanner.restoreLiveCameraFeed();
            this.showScanInterface();
        }
        showCheatSequence() {
            if (!this.xpManager)
                return;
            this.playOneShotSfx(this.sfxCheatDetected);
            this.playOneShotSfx(this.sfxCheatReprimand);
            const cheats = this.xpManager.getConsecutiveCheats();
            const messages = (0, Localization_1.getCheatMessages)();
            const idx = Math.min(cheats, messages.length - 1);
            this.xpManager.enqueueCustomPopup(messages[idx], 1, 0.3, 0.1, 4.0, 0);
            this.suppressNextNegativeProgressSfx = true;
            this.xpManager.penalizeTrust();
            this.playOneShotSfx(this.sfxNegativeProgress);
        }
        setSfxMuted(muted) {
            this.sfxMuted = muted;
            if (this.sfxAudio) {
                this.sfxAudio.volume = muted ? 0.0 : 1.0;
            }
            if (muted)
                this.stopAllSfx();
        }
        stopAllSfx() {
            if (!this.sfxAudio)
                return;
            try {
                this.sfxAudio.stop(true);
                this.activeSfxState = 'none';
                this.activeSfxTrack = null;
                this.oneShotQueue = [];
                this.sfxAudio.setOnFinish(null);
            }
            catch (e) {
                print('CarScanner: SFX stop failed: ' + e);
            }
        }
        startWaitingSfx(track, state) {
            this.oneShotQueue = [];
            this.playSfxInternal(track, state);
        }
        stopWaitingSfx(state) {
            if (this.activeSfxState !== state)
                return;
            this.stopAllSfx();
        }
        playOneShotSfx(track) {
            if (!track || !this.sfxAudio || this.sfxMuted)
                return;
            this.oneShotQueue.push(track);
            // Already playing a one-shot: keep queue order.
            if (this.activeSfxState === 'oneshot')
                return;
            // Interrupt any waiting loop and start queued one-shots now.
            this.playNextQueuedOneShot();
        }
        playSfxInternal(track, state) {
            if (this.sfxMuted || !this.sfxAudio || !track)
                return;
            try {
                this.sfxAudio.stop(true);
            }
            catch (e) { /* ignore */ }
            try {
                this.sfxAudio.setOnFinish(() => this.onSfxFinished());
                this.sfxAudio.audioTrack = track;
                this.sfxAudio.play(1);
                this.activeSfxState = state;
                this.activeSfxTrack = track;
            }
            catch (e) {
                print('CarScanner: SFX playback failed: ' + e);
                this.activeSfxState = 'none';
                this.activeSfxTrack = null;
            }
        }
        playNextQueuedOneShot() {
            if (this.sfxMuted || !this.sfxAudio)
                return;
            if (this.oneShotQueue.length === 0)
                return;
            const next = this.oneShotQueue.shift();
            if (!next)
                return;
            this.playSfxInternal(next, 'oneshot');
        }
        onSfxFinished() {
            if (this.sfxMuted || !this.sfxAudio)
                return;
            // Waiting sounds loop until explicitly stopped/replaced.
            if (this.activeSfxState === 'scan_wait'
                || this.activeSfxState === 'card_wait'
                || this.activeSfxState === 'review_wait') {
                if (this.activeSfxTrack) {
                    try {
                        this.sfxAudio.audioTrack = this.activeSfxTrack;
                        this.sfxAudio.play(1);
                    }
                    catch (e) {
                        this.activeSfxState = 'none';
                        this.activeSfxTrack = null;
                    }
                }
                return;
            }
            if (this.oneShotQueue.length > 0) {
                this.playNextQueuedOneShot();
                return;
            }
            this.activeSfxState = 'none';
            this.activeSfxTrack = null;
        }
        showOnXPDisplay(text, r, g, b, duration) {
            if (!this.xpManager || !this.xpManager.xpDisplay)
                return;
            const displayObj = this.xpManager.xpDisplay.getSceneObject();
            if (!displayObj)
                return;
            displayObj.enabled = true;
            this.xpManager.xpDisplay.text = text;
            try {
                this.xpManager.xpDisplay.textFill.color = new vec4(r, g, b, 1);
            }
            catch (e) { /* ignore */ }
            const hideEvent = this.createEvent('DelayedCallbackEvent');
            hideEvent.bind(() => {
                if (displayObj)
                    displayObj.enabled = false;
            });
            hideEvent.reset(duration);
        }
        // =====================================================================
        // CONNECTED LENS — Push local player stats to network
        // =====================================================================
        pushLocalPlayerStats() {
            if (!this.connectedLensManager || !this.xpManager)
                return;
            const profile = this.xpManager.getProfile();
            if (!profile)
                return;
            this.connectedLensManager.setLocalPlayerStats(profile.level || 1, profile.prestige || 0, profile.totalXP || 0, this.xpManager.getTrustScore());
        }
        // =====================================================================
        // SCAN INTERFACE MANAGEMENT
        // =====================================================================
        showScanInterface() {
            if (this.carScanInterface) {
                this.positionInFrontOfUser(this.carScanInterface);
                this.carScanInterface.enabled = true;
                if (this.vehicleScanner)
                    this.vehicleScanner.restoreLiveCameraFeed();
                if (this.vehicleNarrator && !this.vehicleNarrator.isShowingError()) {
                    this.vehicleNarrator.startIdleMode();
                }
                if (!this.scanInterfaceCloseButtonConnected) {
                    this.setupScanInterfaceCloseButton();
                }
                this.updateScannerButtonLabel();
                this.setHandButtonsEnabled(true);
                print('CarScanner: Scan interface shown');
            }
        }
        positionInFrontOfUser(container) {
            if (!this.collectionManager)
                return;
            const head = this.collectionManager.getUserHeadTransformPublic();
            if (!head)
                return;
            try {
                const spawnPos = head.position.add(head.forward.uniformScale(60));
                container.getTransform().setWorldPosition(spawnPos);
                container.getTransform().setWorldRotation(quat.quatIdentity());
            }
            catch (e) { /* ignore */ }
        }
        hideScanInterface() {
            if (this.carScanInterface) {
                this.carScanInterface.enabled = false;
                if (this.vehicleNarrator)
                    this.vehicleNarrator.stopStatusText();
                this.updateScannerButtonLabel();
                print('CarScanner: Scan interface hidden');
            }
        }
        setupScanInterfaceCloseButton() {
            if (!this.carScanInterface || this.scanInterfaceCloseButtonConnected)
                return;
            let attempts = 0;
            const pollEvent = this.createEvent('UpdateEvent');
            pollEvent.bind(() => {
                if (this.scanInterfaceCloseButtonConnected) {
                    pollEvent.enabled = false;
                    return;
                }
                attempts++;
                if (attempts > 120) {
                    pollEvent.enabled = false;
                    return;
                }
                if (this.deepSearchCloseButton(this.carScanInterface)) {
                    this.scanInterfaceCloseButtonConnected = true;
                    pollEvent.enabled = false;
                }
            });
        }
        deepSearchCloseButton(root) {
            const count = root.getChildrenCount();
            for (let i = 0; i < count; i++) {
                const child = root.getChild(i);
                if (!child)
                    continue;
                if (child.name === 'FrameObject') {
                    if (this.hookButtonIn(child))
                        return true;
                }
                if (this.deepSearchCloseButton(child))
                    return true;
            }
            return false;
        }
        // =====================================================================
        // STATIC UI TRANSLATION — Called after language selection
        // =====================================================================
        translateAllStaticUI() {
            if (this.collectionManager)
                this.collectionManager.translateStaticTexts();
            if (this.connectedLensManager)
                this.connectedLensManager.translateStaticTexts();
            this.translateScanInterface();
            this.updateScannerButtonLabel();
            print('CarScanner: All static UI texts translated');
        }
        translateScanInterface() {
            if (!this.carScanInterface)
                return;
            this.walkAndTranslateScanUI(this.carScanInterface);
        }
        walkAndTranslateScanUI(obj) {
            const name = obj.name;
            try {
                const textComp = obj.getComponent('Component.Text');
                if (textComp) {
                    // Keep the scanner title text as authored in Inspector (no runtime override).
                    if (name === 'Loading') {
                        textComp.text = (0, Localization_1.t)('loading_text');
                    }
                    else if (name.indexOf('Press the button') >= 0 || name.indexOf('front of a vehicle') >= 0) {
                        textComp.text = (0, Localization_1.t)('press_button_hint');
                    }
                    else if (name.indexOf('Scan vehicle button text') >= 0) {
                        textComp.text = (0, Localization_1.t)('scan_vehicle');
                    }
                    else if (name.indexOf('Find cars') >= 0 || name.indexOf('collect them all') >= 0) {
                        const phrases = (0, Localization_1.getIdlePhrases)();
                        textComp.text = phrases.length > 0 ? phrases[0] : '';
                    }
                }
            }
            catch (e) { /* no text component */ }
            const count = obj.getChildrenCount();
            for (let i = 0; i < count; i++) {
                const child = obj.getChild(i);
                if (child)
                    this.walkAndTranslateScanUI(child);
            }
        }
        // =====================================================================
        // HAND BUTTONS — Enable/disable all hand-mounted UI buttons
        // =====================================================================
        isInternetAvailable() {
            try {
                return global.deviceInfoSystem && global.deviceInfoSystem.isInternetAvailable();
            }
            catch (e) {
                return true;
            }
        }
        setHandButtonsEnabled(enabled) {
            if (this.scannerButton)
                this.scannerButton.enabled = enabled;
            if (this.collectionManager) {
                if (this.collectionManager.openCollectionButton) {
                    this.collectionManager.openCollectionButton.enabled = enabled;
                }
            }
            if (this.xpManager) {
                if (this.xpManager.userCardButton) {
                    this.xpManager.userCardButton.enabled = enabled;
                }
            }
            print('CarScanner: Hand buttons ' + (enabled ? 'ENABLED' : 'DISABLED'));
        }
        hookButtonIn(parent) {
            const count = parent.getChildrenCount();
            for (let i = 0; i < count; i++) {
                const child = parent.getChild(i);
                if (!child)
                    continue;
                const scripts = child.getComponents('Component.ScriptComponent');
                for (let si = 0; si < scripts.length; si++) {
                    try {
                        const s = scripts[si];
                        if (!s)
                            continue;
                        if (s.onTriggerUp && typeof s.onTriggerUp.add === 'function') {
                            s.onTriggerUp.add(() => this.hideScanInterface());
                            print('CarScanner: Scan interface close button hooked');
                            return true;
                        }
                        if (s.onButtonPinched && typeof s.onButtonPinched.add === 'function') {
                            s.onButtonPinched.add(() => this.hideScanInterface());
                            print('CarScanner: Scan interface close button hooked (pinch)');
                            return true;
                        }
                    }
                    catch (e) { /* ignore */ }
                }
                if (this.hookButtonIn(child))
                    return true;
            }
            return false;
        }
    };
    __setFunctionName(_classThis, "CarScanner");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        CarScanner = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return CarScanner = _classThis;
})();
exports.CarScanner = CarScanner;
//# sourceMappingURL=Car%20Scanner.js.map