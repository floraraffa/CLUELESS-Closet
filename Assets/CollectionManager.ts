/**
 * CollectionManager.ts — Closet card collection for CLUELESS
 *
 * The largest module, handling:
 *   - Saving scanned wardrobe items to the collection and persistent storage
 *   - Loading collection from PersistentStorageSystem on startup
 *   - Card prefab instantiation and population (texts, stat bars, logos, images)
 *   - Show / hide / toggle collection carousel
 *   - Circular layout for the carousel
 *   - Per-frame update loop (delegates to CardInteraction)
 *   - Delete card flow (button → confirm dialog → remove from arrays + storage)
 *   - Reveal animation for newly saved cards
 *   - AI image generation for collector cards (gpt-image-1 Image Edit)
 *   - Card image loading/saving from/to persistent storage
 *
 * Owns the parallel arrays: savedVehicles[], collectionCardObjects[],
 * cardStates[], cardImageReady[], cardFrameHooked[].
 *
 * @author DGNS
 * @license MIT
 */

import { OpenAI } from 'RemoteServiceGateway.lspkg/HostedExternal/OpenAI';
import {
    VehicleData, SavedVehicleData, SimplifiedCard, TradeHistoryEntry,
    findChildByName, enableAllDescendants, formatCarType,
    getRarityLabel, formatRarityText, clampStat, generateSerial,
    formatScanDate, getTrustColor, normalizeScanContext,
} from './VehicleTypes';
import { BrandLogoLoader } from './BrandLogoLoader';
import { t, tf } from './Localization';
import { CardInteraction } from './CardInteraction';

@component
export class CollectionManager extends BaseScriptComponent {

    // =====================================================================
    // MODULES
    // =====================================================================
    private remoteMediaModule: RemoteMediaModule = require('LensStudio:RemoteMediaModule');
    private internetModule: InternetModule = require('LensStudio:InternetModule');
    private depthModule: DepthModule = require('LensStudio:DepthModule');

    // Declare location permissions for Spectacles (both required)
    // GPS - Precise (for LocationService lat/lon)
    private rawLocationModule = require('LensStudio:RawLocationModule');
    // Location - Coarse (for processed/city-level location data)
    private processedLocationModule = require('LensStudio:ProcessedLocationModule');

    // =====================================================================
    // INPUTS — Collection UI
    // =====================================================================
    @input
    @allowUndefined
    @hint('"Save" button SceneObject on the Vehicle Card')
    saveButton: SceneObject;

    @input
    @allowUndefined
    @hint('ObjectPrefab for the Vertical Collector Card template')
    verticalCardPrefab: ObjectPrefab;

    @input
    @allowUndefined
    @hint('"Open Collection" PinchButton SceneObject on the wrist')
    openCollectionButton: SceneObject;

    @input
    @allowUndefined
    @hint('Text component on the Open Collection button (toggles "Open" / "Close")')
    openCollectionButtonText: Text;

    @input
    @allowUndefined
    @hint('Left palm anchor SceneObject (tracks the left palm center)')
    leftPalmAnchor: SceneObject;

    @input
    @allowUndefined
    @hint('Card Collection Container — SceneObject under Left Hand Wrist')
    cardCollectionContainer: SceneObject;

    @input
    @hint('Show saved closet cards in front of the user instead of attached to the left wrist')
    useWorldClosetView: boolean = false;

    @input
    @hint('Distance in cm for the virtual closet view')
    closetViewDistance: number = 75;

    @input
    @hint('Vertical offset in cm for the virtual closet view')
    closetViewHeightOffset: number = -8;

    // =====================================================================
    // INPUTS — Delete Card UI
    // =====================================================================
    @input
    @allowUndefined
    @hint('"Share Collection" button on left hand (inside User Card Info)')
    shareCollectionButton: SceneObject;

    @input
    @allowUndefined
    @hint('"Confirm Share Container" with confirmation text, URL text, Yes/Cancel buttons')
    confirmShareContainer: SceneObject;

    @input
    @allowUndefined
    @hint('"Yes CapsuleButton" inside Confirm Share Container')
    confirmShareYesButton: SceneObject;

    @input
    @allowUndefined
    @hint('"Cancel CapsuleButton" inside Confirm Share Container')
    confirmShareCancelButton: SceneObject;

    @input
    @allowUndefined
    @hint('"Collection Shared Confirmation" Text — displays the URL after sharing')
    shareConfirmationText: Text;

    @input
    @allowUndefined
    @hint('"Reset Profile" button inside User Card Info')
    resetCollectionButton: SceneObject;

    @input
    @allowUndefined
    @hint('"Confirm Reset Profile" container with Yes/Cancel buttons')
    confirmResetProfileContainer: SceneObject;

    @input
    @allowUndefined
    @hint('"Yes" button inside Confirm Reset Profile Container')
    confirmResetYesButton: SceneObject;

    @input
    @allowUndefined
    @hint('"Cancel" button inside Confirm Reset Profile Container')
    confirmResetCancelButton: SceneObject;

    @input
    @allowUndefined
    @hint('"Delete Card" button on left hand')
    deleteCardButton: SceneObject;

    @input
    @allowUndefined
    @hint('"Confirm Delete Card" container with Yes/Cancel buttons')
    confirmDeleteContainer: SceneObject;

    @input
    @allowUndefined
    @hint('"Yes" button inside Confirm Delete Container')
    confirmDeleteYesButton: SceneObject;

    @input
    @allowUndefined
    @hint('"Cancel" button inside Confirm Delete Container')
    confirmDeleteCancelButton: SceneObject;

    // =====================================================================
    // INPUTS — Script references (set in Inspector)
    // =====================================================================
    @input
    @allowUndefined
    @hint('BrandLogoLoader script reference (for loading logos onto collector cards)')
    brandLogoLoader: BrandLogoLoader;

    @input
    @allowUndefined
    @hint('CardInteraction script reference (handles grab/release, auto-rotation, lerp)')
    cardInteraction: CardInteraction;

    @input
    @allowUndefined
    @hint('Maximum number of cards in collection. Default: 25. Increase for premium users.')
    maxCollectionSize: number = 25;

    // =====================================================================
    // CALLBACKS — Set by orchestrator
    // =====================================================================
    /** Called to show description text. */
    onShowDescription: ((text: string) => void) | null = null;
    /** Called to show animated description text. */
    onShowAnimatedDescription: ((text: string) => void) | null = null;
    /** Called to show card generation status on a separate text element (does not interrupt subtitles). */
    onShowCardStatus: ((text: string) => void) | null = null;
    /** Called to hide the card status text after a delay. */
    onHideCardStatus: ((seconds: number) => void) | null = null;
    /** Called to hide description after delay. */
    onHideDescriptionAfterDelay: ((seconds: number) => void) | null = null;
    /** Called to connect a button (utility from VehicleCardUI). */
    onConnectButton: ((obj: SceneObject, cb: () => void, name: string) => boolean) | null = null;
    /** Legacy callback for older collector card review behavior. */
    onReviewVehicle: ((data: SavedVehicleData, cardReviewText?: Text) => void) | null = null;
    /** Called when a collector card's "Combine Look" button is pressed. */
    onCombineLook: ((data: SavedVehicleData, closetItems: SavedVehicleData[], cardReviewText?: Text) => void) | null = null;
    /** Called when review generation starts (audio+text fetch begins). */
    onReviewGenerationStarted: (() => void) | null = null;
    /** Called when a card is successfully saved to the collection (for XP attribution). */
    onCardSaved: ((data: SavedVehicleData) => void) | null = null;
    /** Called when card image generation starts. */
    onCardGenerationStarted: (() => void) | null = null;
    /** Called when card image generation succeeds and card is ready. */
    onCardGenerationSuccess: (() => void) | null = null;
    /** Called when card image generation fails. */
    onCardGenerationFailed: (() => void) | null = null;
    /** Called when reveal card starts flying back to inventory. */
    onCardFlyToInventory: (() => void) | null = null;
    /** Called when the carousel visibility changes (for Connected Lens sync). angle in radians. */
    onCarouselVisibilityChanged: ((visible: boolean, cardData: SimplifiedCard[], carouselAngle?: number) => void) | null = null;
    /** Called to sync a single vehicle to cloud after save. */
    onCloudSyncVehicle: ((vehicle: SavedVehicleData) => void) | null = null;
    /** Called to upload a card image to cloud storage. */
    onCloudUploadImage: ((serial: string, base64: string) => void) | null = null;
    /** Called to delete a vehicle from cloud. */
    onCloudDeleteVehicle: ((serial: string) => void) | null = null;
    /** Called to sync full collection to cloud (on startup). */
    onCloudSyncFullCollection: ((vehicles: SavedVehicleData[]) => void) | null = null;
    /** Called to share the collection to the web gallery. Returns the gallery URL via callback. */
    onShareCollection: ((callback: (url: string) => void) => void) | null = null;
    /** Called to reset (delete all) vehicles from cloud + gallery. */
    onCloudResetCollection: (() => void) | null = null;
    /** Returns trust display string for populating cards (username + rank + trust%). */
    onGetTrustDisplayString: (() => string) | null = null;
    /** Returns the note currently visible/edited on the result Closet Card. */
    onGetCurrentNote: (() => string) | null = null;

    // =====================================================================
    // CONSTANTS
    // =====================================================================
    private readonly STORAGE_KEY: string = 'clueless_closet_collection';
    private readonly IMAGE_KEY_PREFIX: string = 'clueless_img_';
    private readonly TRADE_HISTORY_KEY: string = 'dgns_trade_history';
    private readonly HTTP_USER_AGENT: string = 'LensStudio/5.15 SnapSpectacles CarScanner/1.0';

    // Card states (mirrors CardInteraction constants)
    private readonly STATE_IN_COLLECTION: number = 0;
    private readonly STATE_PICKED: number = 1;
    private readonly STATE_PLACED_IN_WORLD: number = 2;

    // =====================================================================
    // COLLECTION STATE — Parallel arrays, all kept in sync
    // =====================================================================
    private savedVehicles: SavedVehicleData[] = [];
    collectionCardObjects: SceneObject[] = [];
    private cardStates: number[] = [];
    private cardImageReady: boolean[] = [];
    private cardFrameHooked: boolean[] = [];
    private reviewButtonHooked: boolean[] = [];
    private saveButtonConnected: boolean = false;

    isCollectionOpen: boolean = false;
    private isSavingCard: boolean = false;
    private lastVehicleData: VehicleData | null = null;

    // Last captured photo (Base64, compressed) — used for OpenAI Image Edit (gpt-image-1)
    private lastCapturedBase64: string = '';

    // Trade history — persistent log of all trades
    private tradeHistory: TradeHistoryEntry[] = [];
    /** Called to sync a trade history entry to cloud. */
    onCloudSyncTradeHistory: ((entry: TradeHistoryEntry) => void) | null = null;

    // Image generation queue — processes one at a time to avoid overwhelming OpenAI API
    private _imageQueue: Array<{
        data: SavedVehicleData;
        capturedBase64: string;
        resolve: (tex: Texture) => void;
        reject: (err: any) => void;
    }> = [];
    private _imageQueueProcessing: boolean = false;

    // Delete card state
    private deleteTargetCardIndex: number = -1;
    private deleteButtonConnected: boolean = false;
    private confirmDeleteConnected: boolean = false;

    // Share collection state
    private shareButtonConnected: boolean = false;
    private confirmShareConnected: boolean = false;
    private isSharing: boolean = false;

    // Reset profile state
    private resetButtonConnected: boolean = false;
    private confirmResetConnected: boolean = false;
    private confirmResetTextComp: Text | null = null;

    // Collection root (parented to left hand wrist)
    private collectionRoot: SceneObject | null = null;

    // Cached city (pre-fetched asynchronously via UserContextSystem.requestCity)
    private cachedCity: string = '';

    // Reveal animation
    private revealParent: SceneObject | null = null;
    private isRevealAnimating: boolean = false;
    private revealAnimEvent: SceneEvent | null = null;

    // Update loop
    private collectionUpdateEvent: SceneEvent | null = null;

    // Depth data for head transform (reveal animation positioning)
    private depthSession: DepthFrameSession;
    private latestDepthData: DepthFrameData | null = null;

    // =====================================================================
    // LIFECYCLE
    // =====================================================================
    onAwake(): void {
        if (this.deleteCardButton) this.deleteCardButton.enabled = false;
        if (this.confirmDeleteContainer) this.confirmDeleteContainer.enabled = false;
        if (this.confirmShareContainer) this.confirmShareContainer.enabled = false;
        if (this.confirmResetProfileContainer) this.confirmResetProfileContainer.enabled = false;

        // Pre-fetch city as early as possible (async callback API)
        this.prefetchCity();

        this.createEvent('OnStartEvent').bind(() => {
            this.setupDepthTracking();
            this.setupOpenCollectionButton();
            this.setupSaveButton();
            this.setupDeleteCardButton();
            this.setupShareButton();
            this.setupResetButton();
            this.loadCollectionFromStorage();
            this.loadTradeHistory();
            this.hookFrameCloseButtons();
        });
    }

    // =====================================================================
    // CITY PRE-FETCH — Dual strategy: UserContextSystem + GPS reverse geocoding
    // =====================================================================

    /**
     * Pre-fetches the user's city using two parallel strategies:
     *
     * 1) UserContextSystem.requestCity() — Snap's built-in callback API.
     *    May or may not fire depending on platform/permissions.
     *
     * 2) GPS LocationService + Nominatim reverse geocoding — Official Spectacles
     *    Location API (requires RawLocationModule). Gets lat/lon then resolves
     *    city name via OpenStreetMap's free Nominatim API.
     *
     * Whichever resolves first populates `cachedCity`. The second result
     * is ignored if a city is already cached.
     *
     * Called at startup (onAwake) and refreshed before each scan.
     */
    prefetchCity(): void {
        // Strategy 1: UserContextSystem.requestCity()
        this.tryUserContextSystemCity();

        // Strategy 2: GPS + Reverse Geocoding (Spectacles official Location API)
        this.tryGPSCity();
    }

    /** Returns the cached city name (populated asynchronously). */
    getCachedCity(): string {
        return this.cachedCity;
    }

    // ----- Strategy 1: UserContextSystem.requestCity() -----

    private tryUserContextSystemCity(): void {
        try {
            const ucs = (global as any).userContextSystem;
            if (ucs && typeof ucs.requestCity === 'function') {
                ucs.requestCity((city: string) => {
                    if (city && typeof city === 'string' && city.length > 0) {
                        // Reject results that start with a comma (missing city, region only)
                        const trimmed = city.trim();
                        if (trimmed.startsWith(',') || trimmed.startsWith(' ,')) {
                            print('CollectionManager: [UCS] Incomplete result (no city): "' + city + '"');
                            return;
                        }
                        this.cachedCity = trimmed;
                        print('CollectionManager: [UCS] City = "' + trimmed + '"');
                    } else {
                        print('CollectionManager: [UCS] requestCity callback returned empty');
                    }
                });
                print('CollectionManager: [UCS] requestCity() called...');
            } else {
                print('CollectionManager: [UCS] UserContextSystem not available');
            }
        } catch (e) {
            print('CollectionManager: [UCS] Error: ' + e);
        }
    }

    // ----- Strategy 2: GPS LocationService + Nominatim reverse geocoding -----

    private tryGPSCity(): void {
        try {
            const locationService = GeoLocation.createLocationService();
            locationService.accuracy = GeoLocationAccuracy.Navigation;

            locationService.getCurrentPosition(
                (geoPosition: GeoPosition) => {
                    const lat = geoPosition.latitude;
                    const lon = geoPosition.longitude;
                    print('CollectionManager: [GPS] Position: lat=' + lat.toFixed(5) + ', lon=' + lon.toFixed(5));

                    // Always attempt reverse geocoding — it gives precise city names.
                    // Will overwrite UCS if UCS result was incomplete or empty.
                    this.reverseGeocode(lat, lon);
                },
                (error: string) => {
                    print('CollectionManager: [GPS] LocationService error: ' + error);
                }
            );
            print('CollectionManager: [GPS] getCurrentPosition() called...');
        } catch (e) {
            print('CollectionManager: [GPS] GeoLocation unavailable: ' + e);
        }
    }

    /**
     * Reverse geocodes lat/lon to a city name via OpenStreetMap Nominatim API.
     * Free, no API key required, lightweight JSON response.
     */
    private reverseGeocode(lat: number, lon: number): void {
        try {
            const url = 'https://nominatim.openstreetmap.org/reverse?format=json&lat='
                + lat + '&lon=' + lon + '&zoom=10&addressdetails=1';

            const request = RemoteServiceHttpRequest.create();
            request.url = url;
            request.setHeader('User-Agent', this.HTTP_USER_AGENT);
            request.setHeader('Accept', 'application/json');

            this.internetModule.performHttpRequest(request, (response: RemoteServiceHttpResponse) => {
                if (response.statusCode < 200 || response.statusCode >= 400) {
                    print('CollectionManager: [GEO] HTTP ' + response.statusCode);
                    return;
                }

                try {
                    const body = response.body;
                    const data = JSON.parse(body);

                    // Nominatim returns address.city, .town, .village, or .municipality
                    let city = '';
                    if (data && data.address) {
                        city = data.address.city
                            || data.address.town
                            || data.address.village
                            || data.address.municipality
                            || data.address.county
                            || '';
                    }

                    if (city.length > 0) {
                        // Always prefer Nominatim — it provides the actual city name
                        this.cachedCity = city;
                        print('CollectionManager: [GEO] City from Nominatim = "' + city + '"');
                    } else {
                        print('CollectionManager: [GEO] Nominatim returned no city. Address: '
                            + JSON.stringify(data.address || {}));
                    }
                } catch (parseErr) {
                    print('CollectionManager: [GEO] JSON parse error: ' + parseErr);
                }
            });
            print('CollectionManager: [GEO] Reverse geocoding request sent...');
        } catch (e) {
            print('CollectionManager: [GEO] Reverse geocode error: ' + e);
        }
    }

    // =====================================================================
    // PUBLIC API
    // =====================================================================

    /** Sets the last scanned vehicle data (needed for save). */
    setLastVehicleData(data: VehicleData | null): void {
        this.lastVehicleData = data;
    }

    /**
     * Stores the compressed Base64 photo captured by VehicleScanner.
     * This image will be sent to OpenAI Image Edit (gpt-image-1) to create
     * a collector card using the actual vehicle photo.
     */
    setLastCapturedImage(base64: string): void {
        this.lastCapturedBase64 = base64;
    }

    /** Stores the current runtime-edited wardrobe note before saving. */
    setLastVehicleNote(note: string): void {
        if (!this.lastVehicleData) return;
        this.lastVehicleData.user_note = note || '';
    }

    /** Returns true if a save or reveal animation is in progress. */
    isBusy(): boolean {
        return this.isSavingCard || this.isRevealAnimating;
    }

    /** Toggles collection open/closed. */
    toggleCollection(): void {
        if (this.isCollectionOpen) {
            this.hideCollection();
        } else {
            this.showCollection();
        }
    }

    /** Reconnects runtime button callbacks after the orchestrator has wired helpers. */
    refreshButtonConnections(): void {
        this.setupSaveButton();
    }

    // =====================================================================
    // DEPTH TRACKING (for reveal animation head positioning)
    // =====================================================================
    private setupDepthTracking(): void {
        try {
            this.depthSession = this.depthModule.createDepthFrameSession();
            this.depthSession.onNewFrame.add((depthData: DepthFrameData) => {
                this.latestDepthData = depthData;
            });
            this.depthSession.start();
        } catch (e) {
            print('CollectionManager: Depth tracking unavailable: ' + e);
        }
    }

    /** Returns the user head transform from depth tracking (public for billboard). */
    getUserHeadTransformPublic(): { position: vec3; forward: vec3; rotation: quat } | null {
        return this.getUserHeadTransform();
    }

    private getUserHeadTransform(): { position: vec3; forward: vec3; rotation: quat } | null {
        if (!this.latestDepthData) return null;
        try {
            const worldFromDevice = this.latestDepthData.toWorldTrackingOriginFromDeviceRef;
            const headPos = new vec3(worldFromDevice.column3.x, worldFromDevice.column3.y, worldFromDevice.column3.z);
            const forward = new vec3(-worldFromDevice.column2.x, -worldFromDevice.column2.y, -worldFromDevice.column2.z).normalize();
            const toUser = forward.uniformScale(-1);
            const rotation = quat.lookAt(toUser, vec3.up());
            return { position: headPos, forward, rotation };
        } catch (e) {
            return null;
        }
    }

    // =====================================================================
    // BUTTON SETUP
    // =====================================================================

    private setupOpenCollectionButton(): void {
        if (!this.openCollectionButton) return;
        if (this.onConnectButton) {
            this.onConnectButton(this.openCollectionButton, () => {
                print('CollectionManager: Open Collection pressed');
                this.toggleCollection();
            }, 'OpenCollection');
        }
        this.updateCollectionButtonLabel();
    }

    updateCollectionButtonLabel(): void {
        if (!this.openCollectionButtonText) return;
        if (this.isCollectionOpen) {
            this.openCollectionButtonText.text = t('close_collection');
        } else if (this.collectionCardObjects.length === 0) {
            this.openCollectionButtonText.text = t('no_vehicles_collection');
        } else {
            this.openCollectionButtonText.text = t('open_collection');
        }
    }

    private setupSaveButton(): void {
        if (!this.saveButton || this.saveButtonConnected) return;

        const callback = () => {
            print('CollectionManager: Save pressed');
            this.onSaveButtonPressed();
        };

        let connected = false;
        if (this.onConnectButton) {
            connected = this.onConnectButton(this.saveButton, callback, 'Save');
        }
        if (!connected) {
            connected = this.connectButtonFallback(this.saveButton, callback, 'Save');
        }

        if (connected) {
            this.saveButtonConnected = true;
        } else {
            print('CollectionManager: Save button did not connect - will retry after orchestrator wiring');
        }
    }

    private connectButtonFallback(buttonObj: SceneObject, callback: () => void, debugName: string): boolean {
        return this.connectButtonFallbackRecursive(buttonObj, callback, debugName, 0);
    }

    private connectButtonFallbackRecursive(buttonObj: SceneObject, callback: () => void, debugName: string, depth: number): boolean {
        if (!buttonObj || depth > 8) return false;

        const scripts = buttonObj.getComponents('Component.ScriptComponent') as any[];
        for (let i = 0; i < scripts.length; i++) {
            const script = scripts[i];
            if (!script) continue;
            if (script.onButtonPinched && typeof script.onButtonPinched.add === 'function') {
                script.onButtonPinched.add(() => callback());
                print('CollectionManager: [' + debugName + '] fallback connected via onButtonPinched on ' + buttonObj.name);
                return true;
            }
            if (script.onTriggerUp && typeof script.onTriggerUp.add === 'function') {
                script.onTriggerUp.add(() => callback());
                print('CollectionManager: [' + debugName + '] fallback connected via onTriggerUp on ' + buttonObj.name);
                return true;
            }
            if (script.onTriggerEnd && typeof script.onTriggerEnd.add === 'function') {
                script.onTriggerEnd.add(() => callback());
                print('CollectionManager: [' + debugName + '] fallback connected via onTriggerEnd on ' + buttonObj.name);
                return true;
            }
            if (script.onTriggerStart && typeof script.onTriggerStart.add === 'function') {
                script.onTriggerStart.add(() => callback());
                print('CollectionManager: [' + debugName + '] fallback connected via onTriggerStart on ' + buttonObj.name);
                return true;
            }
            if (script.onInteractorTriggerEnd && typeof script.onInteractorTriggerEnd.add === 'function') {
                script.onInteractorTriggerEnd.add(() => callback());
                print('CollectionManager: [' + debugName + '] fallback connected via onInteractorTriggerEnd on ' + buttonObj.name);
                return true;
            }
        }

        const childCount = buttonObj.getChildrenCount();
        for (let c = 0; c < childCount; c++) {
            const child = buttonObj.getChild(c);
            if (child && this.connectButtonFallbackRecursive(child, callback, debugName, depth + 1)) {
                return true;
            }
        }
        return false;
    }

    private setupDeleteCardButton(): void {
        if (this.deleteCardButton && !this.deleteButtonConnected && this.onConnectButton) {
            if (this.onConnectButton(this.deleteCardButton, () => this.onDeleteCardButtonPressed(), 'DeleteCard')) {
                this.deleteButtonConnected = true;
            }
        }
        if (this.confirmDeleteYesButton && !this.confirmDeleteConnected && this.onConnectButton) {
            if (this.onConnectButton(this.confirmDeleteYesButton, () => this.onConfirmDeleteYes(), 'ConfirmYes')) {
                this.confirmDeleteConnected = true;
            }
            if (this.confirmDeleteCancelButton) {
                this.onConnectButton(this.confirmDeleteCancelButton, () => this.onConfirmDeleteCancel(), 'ConfirmCancel');
            }
        }
    }

    private setupShareButton(): void {
        if (this.shareCollectionButton && !this.shareButtonConnected && this.onConnectButton) {
            if (this.onConnectButton(this.shareCollectionButton, () => this.onShareButtonPressed(), 'ShareCollection')) {
                this.shareButtonConnected = true;
            }
        }
        if (this.confirmShareYesButton && !this.confirmShareConnected && this.onConnectButton) {
            if (this.onConnectButton(this.confirmShareYesButton, () => this.onConfirmShareYes(), 'ShareYes')) {
                this.confirmShareConnected = true;
            }
            if (this.confirmShareCancelButton) {
                this.onConnectButton(this.confirmShareCancelButton, () => this.onConfirmShareCancel(), 'ShareCancel');
            }
        }
    }

    // =====================================================================
    // SHARE COLLECTION
    // =====================================================================

    private onShareButtonPressed(): void {
        if (this.isSharing) return;
        if (this.savedVehicles.length === 0) {
            if (this.onShowDescription) this.onShowDescription(t('no_vehicles_share'));
            return;
        }
        if (this.confirmShareContainer) {
            this.showContainer(this.confirmShareContainer, () => this.onConfirmShareCancel(), 'ConfirmShareClose');
        }
        if (this.shareConfirmationText) this.shareConfirmationText.text = t('share_confirm');
        if (this.onShowDescription) this.onShowDescription(t('share_collection_q'));
    }

    private onConfirmShareYes(): void {
        if (this.isSharing) return;
        this.isSharing = true;

        if (this.shareConfirmationText) this.shareConfirmationText.text = t('sharing');
        if (this.onShowDescription) this.onShowDescription(t('sharing_collection'));

        if (this.onShareCollection) {
            this.onShareCollection((url: string) => {
                this.isSharing = false;
                if (this.shareConfirmationText) this.shareConfirmationText.text = t('share_url') + url;
                if (this.onShowDescription) this.onShowDescription(t('collection_shared'));

                const hideDelay = this.createEvent('DelayedCallbackEvent');
                (hideDelay as any).reset(8.0);
                hideDelay.bind(() => {
                    if (this.confirmShareContainer) this.confirmShareContainer.enabled = false;
                });
            });
        } else {
            this.isSharing = false;
            if (this.shareConfirmationText) this.shareConfirmationText.text = t('share_unavailable');
            if (this.onShowDescription) this.onShowDescription(t('share_unavail_short'));

            const hideDelay = this.createEvent('DelayedCallbackEvent');
            (hideDelay as any).reset(4.0);
            hideDelay.bind(() => {
                if (this.confirmShareContainer) this.confirmShareContainer.enabled = false;
            });
        }
    }

    private onConfirmShareCancel(): void {
        this.isSharing = false;
        if (this.shareConfirmationText) this.shareConfirmationText.text = t('collection_not_shared');
        if (this.onShowDescription) this.onShowDescription(t('collection_not_shared'));

        const hideDelay = this.createEvent('DelayedCallbackEvent') as any;
        hideDelay.reset(3.0);
        hideDelay.bind(() => {
            if (this.confirmShareContainer) this.confirmShareContainer.enabled = false;
        });
    }

    // =====================================================================
    // RESET COLLECTION
    // =====================================================================

    private setupResetButton(): void {
        if (this.resetCollectionButton && !this.resetButtonConnected && this.onConnectButton) {
            if (this.onConnectButton(this.resetCollectionButton, () => this.onResetButtonPressed(), 'ResetProfile')) {
                this.resetButtonConnected = true;
            }
        }
        if (this.confirmResetYesButton && !this.confirmResetConnected && this.onConnectButton) {
            if (this.onConnectButton(this.confirmResetYesButton, () => this.onConfirmResetYes(), 'ResetYes')) {
                this.confirmResetConnected = true;
            }
            if (this.confirmResetCancelButton) {
                this.onConnectButton(this.confirmResetCancelButton, () => this.onConfirmResetCancel(), 'ResetCancel');
            }
        }
        this.resolveConfirmResetText();
    }

    private resolveConfirmResetText(): void {
        if (!this.confirmResetProfileContainer) return;
        const childCount = this.confirmResetProfileContainer.getChildrenCount();
        for (let i = 0; i < childCount; i++) {
            const child = this.confirmResetProfileContainer.getChild(i);
            if (!child) continue;
            try {
                const textComp = child.getComponent('Component.Text') as Text;
                if (textComp) {
                    this.confirmResetTextComp = textComp;
                    break;
                }
            } catch (e) { /* ignore */ }
        }
    }

    private onResetButtonPressed(): void {
        if (this.confirmResetTextComp) {
            this.confirmResetTextComp.text = t('reset_confirm');
        }
        if (this.confirmResetProfileContainer) {
            this.showContainer(this.confirmResetProfileContainer, () => this.onConfirmResetCancel(), 'ConfirmResetClose');
        }
        if (this.onShowDescription) this.onShowDescription(t('reset_profile_q'));
    }

    private onConfirmResetYes(): void {
        if (this.confirmResetProfileContainer) this.confirmResetProfileContainer.enabled = false;
        this.executeResetCollection();
    }

    private onConfirmResetCancel(): void {
        if (this.confirmResetProfileContainer) this.confirmResetProfileContainer.enabled = false;
        if (this.onShowDescription) this.onShowDescription(t('reset_cancelled'));
        if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(1.5);
    }

    private executeResetCollection(): void {
        // Cancel all active operations before destroying data
        this._imageQueue = [];
        this._imageQueueProcessing = false;
        this.isSavingCard = false;
        this.isRevealAnimating = false;
        if (this.revealAnimEvent) {
            try { this.revealAnimEvent.enabled = false; } catch (e) { /* ignore */ }
            this.revealAnimEvent = null;
        }

        const count = this.savedVehicles.length;

        // Cloud reset: deletes vehicles, shared gallery, and storage images
        if (this.onCloudResetCollection) {
            print('CollectionManager: [RESET] Triggering cloud reset (' + count + ' vehicles + gallery + images)');
            this.onCloudResetCollection();
        } else {
            print('CollectionManager: [RESET] WARNING — no cloud reset callback wired');
        }

        // Destroy all card SceneObjects
        for (let i = 0; i < this.collectionCardObjects.length; i++) {
            const card = this.collectionCardObjects[i];
            if (card) {
                const parent = card.getParent();
                try { card.destroy(); } catch (e) { /* ignore */ }
                if (parent && parent.name && parent.name.indexOf('WorldCard_') >= 0) {
                    try { parent.destroy(); } catch (e) { /* ignore */ }
                }
            }
        }

        // Clear stored images
        for (let i = 0; i < this.savedVehicles.length; i++) {
            const savedAt = this.savedVehicles[i]?.savedAt;
            if (savedAt) {
                try {
                    global.persistentStorageSystem.store.putString(this.IMAGE_KEY_PREFIX + savedAt.toString(), '');
                } catch (e) { /* ignore */ }
            }
        }

        // Clear all parallel arrays
        this.savedVehicles = [];
        this.collectionCardObjects = [];
        this.cardStates = [];
        this.cardImageReady = [];
        this.cardFrameHooked = [];
        this.reviewButtonHooked = [];

        if (this.cardInteraction) this.cardInteraction.setGrabbedCardIndex(-1);

        this.saveCollectionToStorage();
        if (this.isCollectionOpen) this.hideCollection();
        this.updateDeleteButtonVisibility();
        this.updateCollectionButtonLabel();

        if (this.onShowDescription) this.onShowDescription(tf('profile_reset', { count: count }));
        if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(4.0);
        print('CollectionManager: Collection reset — ' + count + ' cards destroyed');
    }

    // =====================================================================
    // DELETE CARD
    // =====================================================================

    private onDeleteCardButtonPressed(): void {
        let targetIdx = this.cardInteraction ? this.cardInteraction.getGrabbedCardIndex() : -1;

        if (targetIdx < 0) {
            for (let i = 0; i < this.cardStates.length; i++) {
                if (this.cardStates[i] === this.STATE_PLACED_IN_WORLD) { targetIdx = i; break; }
            }
        }
        if (targetIdx < 0) {
            for (let i = 0; i < this.cardStates.length; i++) {
                if (this.cardStates[i] === this.STATE_PICKED) { targetIdx = i; break; }
            }
        }
        if (targetIdx < 0) {
            if (this.onShowDescription) this.onShowDescription(t('no_card_delete'));
            if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(2.0);
            return;
        }

        this.deleteTargetCardIndex = targetIdx;
        if (this.confirmDeleteContainer) {
            this.showContainer(this.confirmDeleteContainer, () => this.onConfirmDeleteCancel(), 'ConfirmDeleteClose');
        }
        if (this.onShowDescription) this.onShowDescription(tf('delete_confirm', { name: this.savedVehicles[targetIdx]?.brand_model || '?' }));
    }

    private onConfirmDeleteYes(): void {
        if (this.confirmDeleteContainer) this.confirmDeleteContainer.enabled = false;

        const idx = this.deleteTargetCardIndex;
        if (idx < 0 || idx >= this.collectionCardObjects.length) {
            this.deleteTargetCardIndex = -1;
            return;
        }

        const name = this.savedVehicles[idx]?.brand_model || '?';
        const savedAt = this.savedVehicles[idx]?.savedAt;
        const serial = this.savedVehicles[idx]?.serial;

        // Cloud delete (fire-and-forget)
        if (serial && this.onCloudDeleteVehicle) this.onCloudDeleteVehicle(serial);

        // Destroy SceneObject
        const card = this.collectionCardObjects[idx];
        if (card) {
            const parent = card.getParent();
            try { card.destroy(); } catch (e) { /* ignore */ }
            if (parent && parent.name && parent.name.indexOf('WorldCard_') >= 0) {
                try { parent.destroy(); } catch (e) { /* ignore */ }
            }
        }

        // Clear stored image
        if (savedAt) {
            try {
                global.persistentStorageSystem.store.putString(this.IMAGE_KEY_PREFIX + savedAt.toString(), '');
            } catch (e) { /* ignore */ }
        }

        // Remove from parallel arrays
        this.savedVehicles.splice(idx, 1);
        this.collectionCardObjects.splice(idx, 1);
        this.cardStates.splice(idx, 1);
        this.cardImageReady.splice(idx, 1);
        this.cardFrameHooked.splice(idx, 1);
        this.reviewButtonHooked.splice(idx, 1);

        // Adjust grabbed index
        if (this.cardInteraction) {
            const grabbed = this.cardInteraction.getGrabbedCardIndex();
            if (grabbed === idx) this.cardInteraction.setGrabbedCardIndex(-1);
            else if (grabbed > idx) this.cardInteraction.setGrabbedCardIndex(grabbed - 1);
        }

        this.saveCollectionToStorage();
        if (this.isCollectionOpen) this.layoutCircularCards();
        this.updateDeleteButtonVisibility();
        this.updateCollectionButtonLabel();
        this.deleteTargetCardIndex = -1;

        if (this.onShowDescription) this.onShowDescription(tf('card_deleted', { name: name }));
        if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(2.5);
    }

    private onConfirmDeleteCancel(): void {
        if (this.confirmDeleteContainer) this.confirmDeleteContainer.enabled = false;
        if (this.onShowDescription) this.onShowDescription(t('delete_cancelled'));
        this.deleteTargetCardIndex = -1;
        if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(1.5);
    }

    private _deleteButtonForceDisabled: boolean = false;

    updateDeleteButtonVisibility(): void {
        if (!this.deleteCardButton) return;
        if (this._deleteButtonForceDisabled) {
            this.deleteCardButton.enabled = false;
            return;
        }
        let hasCardOutside = false;
        for (let i = 0; i < this.cardStates.length; i++) {
            if (this.cardStates[i] === this.STATE_PICKED || this.cardStates[i] === this.STATE_PLACED_IN_WORLD) {
                hasCardOutside = true; break;
            }
        }
        this.deleteCardButton.enabled = hasCardOutside;
        if (!hasCardOutside && this.confirmDeleteContainer) {
            this.confirmDeleteContainer.enabled = false;
            this.deleteTargetCardIndex = -1;
        }
    }

    /**
     * Force-disable the delete button (e.g. when User Card is open).
     * Pass false to re-evaluate normal visibility.
     */
    setDeleteButtonForceDisabled(disabled: boolean): void {
        this._deleteButtonForceDisabled = disabled;
        this.updateDeleteButtonVisibility();
    }

    /**
     * Hooks Frame.ts close buttons (X) on containers so they trigger our dismiss logic.
     * Frame.ts creates close buttons dynamically but doesn't auto-hide the container.
     */
    private hookFrameCloseButtons(): void {
        // Close buttons are hooked lazily via showContainer() because Frame.ts
        // only creates its FrameObject + buttons after its OnStartEvent fires,
        // which requires the container to be enabled first.
    }

    private _closeHooked: Set<SceneObject> = new Set();

    /**
     * Shows a container: positions it in front of the user's gaze, enables it,
     * and lazily hooks the Frame.ts close button if not already done.
     */
    showContainer(container: SceneObject, closeCallback: () => void, debugName: string): void {
        this.positionInFrontOfUser(container);
        container.enabled = true;

        if (!this._closeHooked.has(container)) {
            let attempts = 0;
            const poll = this.createEvent('UpdateEvent');
            poll.bind(() => {
                attempts++;
                if (this._closeHooked.has(container) || attempts > 120) {
                    poll.enabled = false;
                    return;
                }
                if (this.deepSearchAndHookClose(container, closeCallback, debugName)) {
                    this._closeHooked.add(container);
                    poll.enabled = false;
                }
            });
        }
    }

    private deepSearchAndHookClose(root: SceneObject, callback: () => void, debugName: string): boolean {
        const count = root.getChildrenCount();
        for (let i = 0; i < count; i++) {
            const child = root.getChild(i);
            if (!child) continue;
            if (child.name === 'FrameObject') {
                if (this.searchButtonsIn(child, callback, debugName)) return true;
            }
            if (this.deepSearchAndHookClose(child, callback, debugName)) return true;
        }
        return false;
    }

    private searchButtonsIn(parent: SceneObject, callback: () => void, debugName: string): boolean {
        const count = parent.getChildrenCount();
        for (let i = 0; i < count; i++) {
            const child = parent.getChild(i);
            if (!child) continue;
            const scripts = child.getComponents('Component.ScriptComponent') as any[];
            for (let si = 0; si < scripts.length; si++) {
                try {
                    const s = scripts[si];
                    if (!s) continue;
                    if (s.onTriggerUp && typeof s.onTriggerUp.add === 'function') {
                        s.onTriggerUp.add(() => callback());
                        print('CollectionManager: Frame close button hooked — ' + debugName);
                        return true;
                    }
                    if (s.onButtonPinched && typeof s.onButtonPinched.add === 'function') {
                        s.onButtonPinched.add(() => callback());
                        print('CollectionManager: Frame close button hooked (pinch) — ' + debugName);
                        return true;
                    }
                } catch (e) { /* ignore */ }
            }
            if (this.searchButtonsIn(child, callback, debugName)) return true;
        }
        return false;
    }

    private readonly CONTAINER_SPAWN_DISTANCE: number = 60;

    private positionInFrontOfUser(container: SceneObject): void {
        const head = this.getUserHeadTransform();
        if (!head) return;
        try {
            const spawnPos = head.position.add(head.forward.uniformScale(this.CONTAINER_SPAWN_DISTANCE));
            const transform = container.getTransform();
            transform.setWorldPosition(spawnPos);
            transform.setWorldRotation(quat.quatIdentity());
        } catch (e) { /* ignore */ }
    }

    /**
     * Translates all static UI texts in containers (Yes/Cancel buttons, question texts, warnings).
     * Called once after language selection.
     */
    translateStaticTexts(): void {
        if (this.confirmDeleteContainer) this.walkAndTranslate(this.confirmDeleteContainer);
        if (this.confirmShareContainer) this.walkAndTranslate(this.confirmShareContainer);
        if (this.confirmResetProfileContainer) this.walkAndTranslate(this.confirmResetProfileContainer);
        this.updateCollectionButtonLabel();
        print('CollectionManager: Static UI texts translated');
    }

    private walkAndTranslate(obj: SceneObject): void {
        const name = obj.name;
        try {
            const textComp = obj.getComponent('Component.Text') as Text;
            if (textComp) {
                if (name === 'Yes') {
                    textComp.text = t('yes');
                } else if (name === 'Cancel') {
                    textComp.text = t('cancel_btn');
                } else if (name.indexOf('action cannot be undone') >= 0 || name.indexOf('This action') >= 0) {
                    textComp.text = t('action_undone');
                } else if (name.indexOf('delete this card') >= 0) {
                    textComp.text = t('delete_card_question');
                } else if (name.indexOf('share your collection') >= 0) {
                    textComp.text = t('share_question');
                } else if (name.indexOf('Reset your closet') >= 0 || name.indexOf('reset your closet') >= 0) {
                    textComp.text = t('reset_question');
                }
            }
        } catch (e) { /* no text component */ }
        const count = obj.getChildrenCount();
        for (let i = 0; i < count; i++) {
            const child = obj.getChild(i);
            if (child) this.walkAndTranslate(child);
        }
    }

    /** Close all popup containers (confirm delete, confirm share, confirm reset). */
    closeAllPopups(): void {
        if (this.confirmDeleteContainer) {
            this.confirmDeleteContainer.enabled = false;
            this.deleteTargetCardIndex = -1;
        }
        if (this.confirmShareContainer) {
            this.confirmShareContainer.enabled = false;
        }
        if (this.confirmResetProfileContainer) {
            this.confirmResetProfileContainer.enabled = false;
        }
    }

    // =====================================================================
    // SAVE VEHICLE TO COLLECTION
    // =====================================================================

    private async onSaveButtonPressed(): Promise<void> {
        if (this.isSavingCard || this.isRevealAnimating) {
            if (this.onShowDescription) this.onShowDescription(t('save_in_progress'));
            return;
        }
        this.isSavingCard = true;
        if (!this.lastVehicleData) {
            if (this.onShowDescription) this.onShowDescription(t('scan_first_save'));
            this.isSavingCard = false;
            return;
        }
        if (!this.verticalCardPrefab) {
            if (this.onShowDescription) this.onShowDescription(t('error_prefab'));
            this.isSavingCard = false;
            return;
        }
        const maxSize = this.maxCollectionSize || 25;
        if (this.savedVehicles.length >= maxSize) {
            if (this.onShowAnimatedDescription) {
                this.onShowAnimatedDescription(tf('max_cards', { max: maxSize }));
            } else if (this.onShowDescription) {
                this.onShowDescription(tf('max_cards', { max: maxSize }));
            }
            this.isSavingCard = false;
            return;
        }

        try {
            const vehicleName = this.lastVehicleData.brand_model || 'Unknown';
            if (this.onShowDescription) this.onShowDescription(tf('saving', { name: vehicleName }));

            // Duplicate check
            const isDuplicate = this.savedVehicles.some(v => v.brand_model === this.lastVehicleData!.brand_model);
            if (isDuplicate) {
                if (this.onShowDescription) this.onShowDescription(tf('already_saved', { name: vehicleName }));
                this.isSavingCard = false;
                return;
            }

            const scanTimestamp = Date.now();
            const visibleNote = this.onGetCurrentNote ? (this.onGetCurrentNote() || '') : (this.lastVehicleData.user_note || '');
            const previousUserNote = this.lastVehicleData.user_note || '';
            this.lastVehicleData.user_note = '';
            const pairingNote = this.buildPairingNote(this.lastVehicleData);
            const aiNote = this.buildDisplayNote(this.lastVehicleData, pairingNote);
            const userNote = visibleNote.length > 0 && visibleNote !== aiNote ? visibleNote : previousUserNote;
            this.lastVehicleData.user_note = userNote;
            const capturedPhotoBase64 = this.lastCapturedBase64 || '';
            const savedData: SavedVehicleData = {
                vehicle_found: this.lastVehicleData.vehicle_found,
                clothing_found: this.lastVehicleData.clothing_found,
                mode: this.lastVehicleData.mode || 'single_item',
                scan_context: this.lastVehicleData.scan_context || 'unknown',
                brand: this.lastVehicleData.brand,
                brand_model: this.lastVehicleData.brand_model,
                item_name: this.lastVehicleData.item_name || this.lastVehicleData.brand_model,
                type: this.lastVehicleData.type,
                category: this.lastVehicleData.category || this.lastVehicleData.type,
                subcategory: this.lastVehicleData.subcategory || this.lastVehicleData.year || '',
                year: this.lastVehicleData.year,
                collection: this.lastVehicleData.collection || '',
                collection_year: this.lastVehicleData.collection_year || '',
                quality: this.lastVehicleData.quality || '',
                color: this.lastVehicleData.color || '',
                material: this.lastVehicleData.material || '',
                pattern: this.lastVehicleData.pattern || '',
                fit: this.lastVehicleData.fit || '',
                condition: this.lastVehicleData.condition || '',
                confidence: this.lastVehicleData.confidence || 0,
                style_tags: this.lastVehicleData.style_tags || [],
                occasion_tags: this.lastVehicleData.occasion_tags || [],
                season_tags: this.lastVehicleData.season_tags || [],
                items: this.lastVehicleData.items || [],
                look_summary: this.lastVehicleData.look_summary || '',
                suggested_pairings: this.lastVehicleData.suggested_pairings || [],
                pairing_note: pairingNote,
                feedback: this.lastVehicleData.feedback || '',
                ai_note: aiNote,
                user_note: userNote,
                top_speed: this.lastVehicleData.top_speed,
                acceleration: this.lastVehicleData.acceleration,
                braking: this.lastVehicleData.braking,
                traction: this.lastVehicleData.traction,
                comfort: this.lastVehicleData.comfort,
                rarity: this.lastVehicleData.rarity || 2,
                rarity_label: this.lastVehicleData.rarity_label || getRarityLabel(this.lastVehicleData.rarity || 2),
                scene: this.lastVehicleData.scene || '',
                savedAt: scanTimestamp,
                imageGenerated: capturedPhotoBase64.length > 0,
                serial: generateSerial(),
                dateScanned: formatScanDate(scanTimestamp),
                cityScanned: this.cachedCity,
            };

            print('CollectionManager: Card saved — serial=' + savedData.serial
                + ' date="' + savedData.dateScanned + '" city="' + savedData.cityScanned + '"');
            this.savedVehicles.push(savedData);
            if (capturedPhotoBase64.length > 0) {
                this.saveCardImageBase64ToStorage(vehicleName, savedData.savedAt, capturedPhotoBase64);
            }
            this.saveCollectionToStorage();

            // Cloud sync (fire-and-forget)
            if (this.onCloudSyncVehicle) this.onCloudSyncVehicle(savedData);

            const showStatus = this.onShowCardStatus || this.onShowAnimatedDescription;
            const hideStatus = this.onHideCardStatus || null;
            if (showStatus) showStatus(t('saving_scan_photo'));
            if (this.onCardGenerationStarted) this.onCardGenerationStarted();

            const revealRoot = this.getOrCreateRevealParent();
            const cardObj = this.verticalCardPrefab.instantiate(revealRoot);
            if (!cardObj) {
                if (showStatus) showStatus(t('card_instantiation_fail'));
                if (hideStatus) hideStatus(4.0);
                this.isSavingCard = false;
                return;
            }

            this.populateCollectorCard(cardObj, savedData);

            const texture = await this.decodeBase64Texture(capturedPhotoBase64);
            if (texture) this.applyCardImage(cardObj, texture);

            if (showStatus) showStatus(tf('card_ready', { name: vehicleName }));
            if (this.onCardGenerationSuccess) this.onCardGenerationSuccess();

            let saveFinalized = false;
            const finalizeSave = () => {
                if (saveFinalized) return;
                saveFinalized = true;
                if (this.revealAnimEvent) {
                    try { this.revealAnimEvent.enabled = false; } catch (e) { /* ignore */ }
                    this.revealAnimEvent = null;
                }
                this.isRevealAnimating = false;
                this.ensureCollectionRoot();
                if (this.collectionRoot) {
                    cardObj.setParent(this.collectionRoot);
                    const t = cardObj.getTransform();
                    t.setLocalPosition(vec3.zero());
                    t.setLocalRotation(quat.fromEulerAngles(0, 0, 0));
                    const s = this.cardInteraction ? this.cardInteraction.collectionCardScale : 0.18;
                    t.setLocalScale(new vec3(s, s, s));
                }
                cardObj.enabled = false;
                if (this.collectionCardObjects.indexOf(cardObj) < 0) {
                    this.collectionCardObjects.push(cardObj);
                    this.cardStates.push(this.STATE_IN_COLLECTION);
                    this.cardImageReady.push(texture != null || capturedPhotoBase64.length > 0);
                    this.cardFrameHooked.push(false);
                    this.reviewButtonHooked.push(false);
                }
                this.syncInteractionState();
                if (this.cardInteraction) {
                    this.cardInteraction.hookCardFrameEvents(cardObj, this.collectionCardObjects.length - 1);
                }
                this.isSavingCard = false;
                this.updateCollectionButtonLabel();
                if (showStatus) showStatus(tf('added_to_collection', { name: vehicleName, count: this.savedVehicles.length }));
                if (hideStatus) hideStatus(2.5);

                // Notify orchestrator for XP attribution
                if (this.onCardSaved) this.onCardSaved(savedData);
            };

            const saveFallbackEvent = this.createEvent('DelayedCallbackEvent');
            saveFallbackEvent.bind(() => {
                if (!saveFinalized) {
                    print('CollectionManager: Save reveal fallback — adding card directly to bracelet collection');
                    finalizeSave();
                }
            });
            saveFallbackEvent.reset(7.0);

            this.playCardRevealAnimation(cardObj, vehicleName, finalizeSave);
        } catch (error) {
            if (this.onShowDescription) this.onShowDescription(tf('save_error', { error: String(error) }));
            this.isSavingCard = false;
        }
    }

    // =====================================================================
    // COLLECTION DISPLAY
    // =====================================================================

    private showCollection(): void {
        if (this.isRevealAnimating) {
            if (this.onShowDescription) this.onShowDescription(t('wait_reveal'));
            return;
        }
        if (this.collectionCardObjects.length === 0) {
            if (this.onShowDescription) this.onShowDescription(t('collection_empty'));
            if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(3.0);
            return;
        }

        this.isCollectionOpen = true;
        this.updateCollectionButtonLabel();
        if (this.cardInteraction) {
            this.cardInteraction.setGrabbedCardIndex(-1);
            this.cardInteraction.carouselAngleOffset = 0;
        }

        this.ensureCollectionRoot();
        this.positionVirtualClosetRoot();
        if (this.collectionRoot) this.collectionRoot.enabled = true;

        // Enable cards and re-apply stats
        for (let i = 0; i < this.collectionCardObjects.length; i++) {
            const card = this.collectionCardObjects[i];
            if (!card) continue;
            const state = this.cardStates[i] || this.STATE_IN_COLLECTION;
            if (state === this.STATE_PLACED_IN_WORLD) continue;

            card.enabled = true;
            enableAllDescendants(card);

            // Hide card images whose texture hasn't loaded yet (BUG 1 fix)
            if (!this.cardImageReady[i]) {
                const cardImageObj = findChildByName(card, 'Card Image');
                if (cardImageObj) cardImageObj.enabled = false;
            }

            // Re-apply stat bars after enableAllDescendants (stats fix)
            if (i < this.savedVehicles.length) {
                this.reapplyCardStatBars(card, this.savedVehicles[i]);
            }

            this.cardStates[i] = this.STATE_IN_COLLECTION;
        }

        this.layoutCircularCards();
        this.startCollectionUpdateLoop();

        // Hook Frame events for unhooked cards
        if (this.cardInteraction) {
            for (let i = 0; i < this.collectionCardObjects.length; i++) {
                if (!this.cardFrameHooked[i] && this.collectionCardObjects[i]) {
                    this.cardInteraction.hookCardFrameEvents(this.collectionCardObjects[i], i);
                }
            }
        }

        // Hook Review buttons (deferred — RectangleButton needs enabled frames to initialize)
        this.hookPendingReviewButtons();

        if (this.onShowDescription) this.onShowDescription(tf('collection_count', { count: this.collectionCardObjects.length }));
        if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(3.0);

        // Notify Connected Lens that carousel is now visible (with current angle so remote sees correct rotation)
        if (this.onCarouselVisibilityChanged) {
            const angle = this.cardInteraction ? this.cardInteraction.carouselAngleOffset : 0;
            this.onCarouselVisibilityChanged(true, this.getSimplifiedCardData(), angle);
        }
    }

    hideCollection(): void {
        this.isCollectionOpen = false;
        this.updateCollectionButtonLabel();
        if (this.cardInteraction) this.cardInteraction.setGrabbedCardIndex(-1);

        const cs = this.cardInteraction ? this.cardInteraction.collectionCardScale : 0.18;

        for (let i = 0; i < this.collectionCardObjects.length; i++) {
            const card = this.collectionCardObjects[i];
            if (!card) continue;
            const state = this.cardStates[i] || this.STATE_IN_COLLECTION;
            if (state === this.STATE_PLACED_IN_WORLD) continue;

            if (this.collectionRoot && card.getParent() !== this.collectionRoot) {
                const oldParent = card.getParent();
                card.setParent(this.collectionRoot);
                card.getTransform().setLocalPosition(vec3.zero());
                card.getTransform().setLocalScale(new vec3(cs, cs, cs));
                if (oldParent && oldParent.name && oldParent.name.indexOf('WorldCard_') >= 0) {
                    try { oldParent.destroy(); } catch (e) { /* ignore */ }
                }
            } else {
                card.getTransform().setLocalPosition(vec3.zero());
                card.getTransform().setLocalScale(new vec3(cs, cs, cs));
            }
            this.cardStates[i] = this.STATE_IN_COLLECTION;
            card.enabled = false;
        }

        if (this.collectionRoot) this.collectionRoot.enabled = false;
        this.stopCollectionUpdateLoop();
        this.updateDeleteButtonVisibility();

        if (this.onShowDescription) this.onShowDescription(t('collection_closed'));
        if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(1.5);

        // Notify Connected Lens that carousel is now hidden
        if (this.onCarouselVisibilityChanged) {
            this.onCarouselVisibilityChanged(false, []);
        }
    }

    // =====================================================================
    // CONNECTED LENS — Simplified card data for network transit
    // =====================================================================

    /**
     * Extracts simplified card data from the saved collection for network transfer.
     * Omits base64 images and other heavy fields — remote cards display text/stats only.
     */
    getSimplifiedCardData(): SimplifiedCard[] {
        const result: SimplifiedCard[] = [];
        for (let i = 0; i < this.savedVehicles.length; i++) {
            const v = this.savedVehicles[i];
            if (!v) continue;
            result.push({
                brand: v.brand || '',
                brand_model: v.brand_model || '?',
                type: v.type || 'unknown',
                year: v.year || '?',
                collection: v.collection || '',
                collection_year: v.collection_year || '',
                quality: v.quality || '',
                scan_context: v.scan_context || 'unknown',
                rarity: v.rarity || 2,
                rarity_label: v.rarity_label || 'Common',
                serial: v.serial || '',
                top_speed: v.top_speed || 1,
                acceleration: v.acceleration || 1,
                braking: v.braking || 1,
                traction: v.traction || 1,
                comfort: v.comfort || 1,
                color: v.color || '',
                material: v.material || '',
                pattern: v.pattern || '',
                fit: v.fit || '',
                style_tags: v.style_tags || [],
                occasion_tags: v.occasion_tags || [],
                season_tags: v.season_tags || [],
                look_summary: v.look_summary || '',
                suggested_pairings: v.suggested_pairings || [],
                pairing_note: v.pairing_note || '',
                feedback: v.feedback || '',
                ai_note: v.ai_note || '',
                user_note: v.user_note || '',
                confidence: v.confidence || 0,
                savedAt: v.savedAt || 0,
                dateScanned: v.dateScanned || '',
                cityScanned: v.cityScanned || '',
            });
        }
        return result;
    }

    /**
     * Reads a card image base64 from persistent storage by savedAt key.
     * Returns null if no image exists.
     */
    getCardImageBase64(savedAt: number): string | null {
        if (!savedAt) return null;
        try {
            const storageKey = this.IMAGE_KEY_PREFIX + savedAt.toString();
            const b64 = global.persistentStorageSystem.store.getString(storageKey);
            if (!b64 || b64.length === 0) return null;
            return b64;
        } catch (e) {
            return null;
        }
    }

    /**
     * Returns the savedAt timestamp for a card identified by its serial.
     * Returns 0 if not found.
     */
    getSavedAtForSerial(serial: string): number {
        for (let i = 0; i < this.savedVehicles.length; i++) {
            if (this.savedVehicles[i] && this.savedVehicles[i].serial === serial) {
                return this.savedVehicles[i].savedAt || 0;
            }
        }
        return 0;
    }

    /**
     * Adds a card received from another player (Connected Lens trade/give).
     * Creates a SavedVehicleData from the SimplifiedCard, saves it, and instantiates the card.
     */
    addReceivedCard(card: SimplifiedCard, imageB64?: string): void {
        // Check for duplicates by serial
        for (let i = 0; i < this.savedVehicles.length; i++) {
            if (this.savedVehicles[i] && this.savedVehicles[i].serial === card.serial) {
                print('CollectionManager: Duplicate card ' + card.serial + ' — skipping');
                if (this.onShowDescription) this.onShowDescription(t('card_duplicate'));
                return;
            }
        }

        const now = Date.now();

        // Build a SavedVehicleData from the SimplifiedCard
        const savedData: SavedVehicleData = {
            brand: card.brand || '',
            brand_model: card.brand_model,
            item_name: card.brand_model,
            scan_context: normalizeScanContext(card.scan_context),
            type: card.type,
            category: card.type,
            year: card.year,
            collection: card.collection || '',
            collection_year: card.collection_year || '',
            quality: card.quality || '',
            color: card.color || '',
            material: card.material || '',
            pattern: card.pattern || '',
            fit: card.fit || '',
            style_tags: card.style_tags || [],
            occasion_tags: card.occasion_tags || [],
            season_tags: card.season_tags || [],
            look_summary: card.look_summary || '',
            suggested_pairings: card.suggested_pairings || [],
            pairing_note: card.pairing_note || '',
            feedback: card.feedback || '',
            ai_note: card.ai_note || '',
            user_note: card.user_note || '',
            confidence: card.confidence || 0,
            top_speed: card.top_speed,
            acceleration: card.acceleration,
            braking: card.braking,
            traction: card.traction,
            comfort: card.comfort,
            rarity: card.rarity,
            rarity_label: card.rarity_label,
            savedAt: now,
            imageGenerated: !!imageB64,
            serial: card.serial,
            dateScanned: card.dateScanned || formatScanDate(now),
            cityScanned: card.cityScanned || 'Traded',
        };

        this.savedVehicles.push(savedData);

        // Save the traded image to persistent storage if provided
        if (imageB64 && imageB64.length > 0) {
            try {
                const storageKey = this.IMAGE_KEY_PREFIX + now.toString();
                global.persistentStorageSystem.store.putString(storageKey, imageB64);
                print('CollectionManager: Saved traded card image — ' + imageB64.length + ' chars');
            } catch (e) {
                print('CollectionManager: Failed to save traded image: ' + e);
            }
        }

        // Instantiate the card prefab
        if (this.verticalCardPrefab) {
            try {
                this.ensureCollectionRoot();
                const parent = this.collectionRoot || this.cardCollectionContainer || null;
                const cardObj = this.verticalCardPrefab.instantiate(parent);
                if (cardObj) {
                    cardObj.enabled = false;
                    this.collectionCardObjects.push(cardObj);
                    this.cardStates.push(this.STATE_IN_COLLECTION);
                    this.cardImageReady.push(!!imageB64);
                    this.cardFrameHooked.push(false);
                    this.reviewButtonHooked.push(false);
                    this.populateCollectorCard(cardObj, savedData);

                    // If image was provided, decode and apply it
                    if (imageB64 && imageB64.length > 0) {
                        Base64.decodeTextureAsync(
                            imageB64,
                            (texture: Texture) => { this.applyCardImage(cardObj, texture); },
                            () => { print('CollectionManager: Failed to decode traded card image'); }
                        );
                    }
                }
            } catch (e) {
                print('CollectionManager: Error instantiating received card: ' + e);
            }
        }

        this.saveCollectionToStorage();
        print('CollectionManager: Added received card — ' + card.brand_model + ' (serial: ' + card.serial + ')'
            + (imageB64 ? ' with image' : ' without image'));
        if (this.onShowDescription) this.onShowDescription(tf('card_added', { name: card.brand_model }));
        if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(3.0);
    }

    /**
     * Removes a card from the collection by serial number (Connected Lens give-away).
     * Handles both the data array and the instantiated SceneObject.
     */
    removeCardBySerial(serial: string): void {
        let idx = -1;
        for (let i = 0; i < this.savedVehicles.length; i++) {
            if (this.savedVehicles[i] && this.savedVehicles[i].serial === serial) {
                idx = i;
                break;
            }
        }
        if (idx < 0 || idx >= this.savedVehicles.length) {
            print('CollectionManager: Card serial ' + serial + ' not found — cannot remove');
            return;
        }

        const name = this.savedVehicles[idx].brand_model || '?';

        // Cloud delete (fire-and-forget)
        if (this.onCloudDeleteVehicle) this.onCloudDeleteVehicle(serial);

        // Destroy the SceneObject
        if (idx < this.collectionCardObjects.length && this.collectionCardObjects[idx]) {
            try { this.collectionCardObjects[idx].destroy(); } catch (e) { /* ignore */ }
        }

        // Remove from parallel arrays
        this.savedVehicles.splice(idx, 1);
        this.collectionCardObjects.splice(idx, 1);
        this.cardStates.splice(idx, 1);
        this.cardImageReady.splice(idx, 1);
        this.cardFrameHooked.splice(idx, 1);
        this.reviewButtonHooked.splice(idx, 1);

        this.saveCollectionToStorage();
        this.updateCollectionButtonLabel();
        print('CollectionManager: Removed card — ' + name + ' (serial: ' + serial + ')');
        if (this.onShowDescription) this.onShowDescription(tf('card_given_away', { name: name }));
        if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(3.0);
    }

    // =====================================================================
    // TRADE HISTORY — Persistent log of all trades
    // =====================================================================

    /** Records a trade event and persists it. */
    addTradeRecord(entry: TradeHistoryEntry): void {
        this.tradeHistory.push(entry);
        this.saveTradeHistory();
        if (this.onCloudSyncTradeHistory) this.onCloudSyncTradeHistory(entry);
        print('CollectionManager: Trade logged — ' + entry.type + ' ' + entry.brand_model
            + (entry.partnerName ? ' with ' + entry.partnerName : ''));
    }

    /** Returns the full trade history (read-only). */
    getTradeHistory(): TradeHistoryEntry[] {
        return this.tradeHistory;
    }

    private saveTradeHistory(): void {
        try {
            const store = global.persistentStorageSystem.store;
            const json = JSON.stringify(this.tradeHistory);
            store.putString(this.TRADE_HISTORY_KEY, json);
        } catch (e) {
            print('CollectionManager: Error saving trade history: ' + e);
        }
    }

    private loadTradeHistory(): void {
        try {
            const store = global.persistentStorageSystem.store;
            const json = store.getString(this.TRADE_HISTORY_KEY);
            if (json && json.length > 2) {
                this.tradeHistory = JSON.parse(json) as TradeHistoryEntry[];
                print('CollectionManager: Loaded ' + this.tradeHistory.length + ' trade history entries');
            }
        } catch (e) {
            print('CollectionManager: Error loading trade history: ' + e);
            this.tradeHistory = [];
        }
    }

    // =====================================================================
    // CIRCULAR LAYOUT
    // =====================================================================

    private layoutCircularCards(): void {
        const n = this.collectionCardObjects.length;
        if (n === 0) return;

        const carouselRadius = this.cardInteraction ? this.cardInteraction.carouselRadius : 2.5;
        const cs = this.cardInteraction ? this.cardInteraction.collectionCardScale : 0.18;
        const carouselAngle = this.cardInteraction ? this.cardInteraction.carouselAngleOffset : 0;

        let inCollectionCount = 0;
        for (let i = 0; i < n; i++) {
            if ((this.cardStates[i] || this.STATE_IN_COLLECTION) === this.STATE_IN_COLLECTION) inCollectionCount++;
        }
        if (inCollectionCount === 0) return;

        const radius = Math.max(carouselRadius, inCollectionCount * 0.7);
        const angleStep = (2 * Math.PI) / inCollectionCount;
        let circleIdx = 0;

        for (let i = 0; i < n; i++) {
            const card = this.collectionCardObjects[i];
            if (!card) continue;
            if ((this.cardStates[i] || this.STATE_IN_COLLECTION) !== this.STATE_IN_COLLECTION) continue;

            const angle = circleIdx * angleStep + carouselAngle;
            circleIdx++;
            const transform = card.getTransform();
            transform.setLocalPosition(new vec3(radius * Math.cos(angle), 0, radius * Math.sin(angle)));
            transform.setLocalRotation(quat.fromEulerAngles(0, 0, 0));
            transform.setLocalScale(new vec3(cs, cs, cs));
        }
    }

    // =====================================================================
    // UPDATE LOOP
    // =====================================================================

    private startCollectionUpdateLoop(): void {
        this.stopCollectionUpdateLoop();
        if (this.cardInteraction) {
            this.cardInteraction.initialize(
                this.collectionCardObjects, this.savedVehicles,
                this.cardStates, this.cardFrameHooked, this.collectionRoot
            );
        }
        this.collectionUpdateEvent = this.createEvent('UpdateEvent');
        this.collectionUpdateEvent.bind(() => {
            if (!this.isCollectionOpen) return;
            if (this.cardInteraction) this.cardInteraction.updateFrame();
        });
    }

    private stopCollectionUpdateLoop(): void {
        if (this.collectionUpdateEvent) {
            try { this.collectionUpdateEvent.enabled = false; } catch (e) { /* ignore */ }
            this.collectionUpdateEvent = null;
        }
    }

    /** Syncs internal state arrays to CardInteraction after modifications. */
    private syncInteractionState(): void {
        if (this.cardInteraction) {
            this.cardInteraction.initialize(
                this.collectionCardObjects, this.savedVehicles,
                this.cardStates, this.cardFrameHooked, this.collectionRoot
            );
        }
    }

    // =====================================================================
    // COLLECTION ROOT
    // =====================================================================

    private ensureCollectionRoot(): void {
        if (this.collectionRoot) return;
        if (!this.useWorldClosetView && this.cardCollectionContainer) {
            this.collectionRoot = global.scene.createSceneObject('CollectionRoot');
            this.collectionRoot.setParent(this.cardCollectionContainer);
            this.collectionRoot.getTransform().setLocalPosition(vec3.zero());
            this.collectionRoot.getTransform().setLocalScale(new vec3(1, 1, 1));
            this.collectionRoot.enabled = false;
        } else {
            this.collectionRoot = global.scene.createSceneObject('VirtualClosetRoot');
            this.collectionRoot.getTransform().setWorldScale(new vec3(1, 1, 1));
            this.collectionRoot.enabled = false;
        }
        if (this.cardInteraction) this.cardInteraction.setCollectionRoot(this.collectionRoot);
    }

    private positionVirtualClosetRoot(): void {
        if (!this.collectionRoot) return;
        if (!this.useWorldClosetView) {
            if (this.cardCollectionContainer && this.collectionRoot.getParent() === this.cardCollectionContainer) {
                this.collectionRoot.getTransform().setLocalPosition(vec3.zero());
                this.collectionRoot.getTransform().setLocalScale(new vec3(1, 1, 1));
            }
            return;
        }

        const head = this.getUserHeadTransform();
        if (!head) return;
        try {
            const pos = head.position.add(head.forward.uniformScale(this.closetViewDistance));
            pos.y += this.closetViewHeightOffset;
            const transform = this.collectionRoot.getTransform();
            transform.setWorldPosition(pos);
            transform.setWorldRotation(quat.quatIdentity());
            transform.setWorldScale(new vec3(1, 1, 1));
        } catch (e) {
            print('CollectionManager: Could not position virtual closet root: ' + e);
        }
    }

    // =====================================================================
    // CARD INSTANTIATION & POPULATION
    // =====================================================================

    /**
     * Creates debug/test cards for preview testing.
     * Only works when the collection is empty.
     */
    createDebugCards(): void {
        if (this.collectionCardObjects.length > 0) {
            print('CollectionManager: Debug cards not needed — collection already has cards');
            return;
        }
        if (!this.verticalCardPrefab) {
            print('CollectionManager: No card prefab — cannot create debug cards');
            return;
        }

        const debugCars: SavedVehicleData[] = [
            { clothing_found: true, mode: 'single_item', scan_context: 'hanger', brand_model: 'Black oversized blazer', item_name: 'Black oversized blazer', type: 'outerwear', category: 'outerwear', subcategory: 'blazer', color: 'black', material: 'wool blend', fit: 'oversized', rarity: 3, rarity_label: 'Versatile', serial: 'CLUE-DBG1-0001-0001', top_speed: 2, acceleration: 4, braking: 5, traction: 4, comfort: 3, cityScanned: 'Closet', dateScanned: 'May 27, 2026', imageGenerated: false, savedAt: Date.now() },
            { clothing_found: true, mode: 'single_item', scan_context: 'flat_lay', brand_model: 'Light wash straight jeans', item_name: 'Light wash straight jeans', type: 'bottom', category: 'bottom', subcategory: 'jeans', color: 'light blue', material: 'denim', fit: 'straight', rarity: 2, rarity_label: 'Everyday', serial: 'CLUE-DBG2-0002-0002', top_speed: 5, acceleration: 1, braking: 5, traction: 4, comfort: 2, cityScanned: 'Closet', dateScanned: 'May 27, 2026', imageGenerated: false, savedAt: Date.now() + 1 },
            { clothing_found: true, mode: 'full_look', scan_context: 'worn', brand_model: 'Minimal coffee run look', item_name: 'Minimal coffee run look', type: 'look', category: 'look', subcategory: 'casual outfit', color: 'white, denim, black', rarity: 3, rarity_label: 'Versatile', serial: 'CLUE-DBG3-0003-0003', top_speed: 5, acceleration: 2, braking: 4, traction: 4, comfort: 2, cityScanned: 'Closet', dateScanned: 'May 27, 2026', imageGenerated: false, savedAt: Date.now() + 2 },
        ];

        for (let i = 0; i < debugCars.length; i++) {
            const data = debugCars[i];
            const cardObj = this.instantiateCollectorCard(data);
            if (cardObj) {
                cardObj.enabled = false;
                this.savedVehicles.push(data);
                this.collectionCardObjects.push(cardObj);
                this.cardStates.push(this.STATE_IN_COLLECTION);
                this.cardImageReady.push(false);
                this.cardFrameHooked.push(false);
                this.reviewButtonHooked.push(false);
            }
        }

        print('CollectionManager: Created ' + this.collectionCardObjects.length + ' debug cards');
    }

    private instantiateCollectorCard(data: SavedVehicleData): SceneObject | null {
        if (!this.verticalCardPrefab) return null;
        this.ensureCollectionRoot();
        const parent = this.collectionRoot || this.cardCollectionContainer || null;
        try {
            const cardObj = this.verticalCardPrefab.instantiate(parent);
            this.populateCollectorCard(cardObj, data);
            return cardObj;
        } catch (error) {
            print('CollectionManager: Card instantiation error: ' + error);
            return null;
        }
    }

    private populateCollectorCard(cardObj: SceneObject, data: SavedVehicleData): void {
        const set = (childName: string, text: string) => {
            const obj = findChildByName(cardObj, childName);
            if (obj) {
                const tc = obj.getComponent('Component.Text') as Text;
                if (tc) {
                    tc.text = text;
                } else {
                    print('CollectionManager: [WARN] "' + childName + '" found but has no Text component');
                }
            } else {
                print('CollectionManager: [WARN] Child "' + childName + '" NOT FOUND in card');
            }
        };

        const displayName = data.item_name || data.brand_model || 'Unknown item';
        const detailParts: string[] = [];
        if (data.color) detailParts.push(data.color);
        if (data.material) detailParts.push(data.material);
        if (data.fit) detailParts.push(data.fit);

        set('Car Brand and model', displayName);
        set('Car Type', formatCarType(data.category || data.type));
        const metaParts: string[] = [];
        if (data.year || data.collection_year) metaParts.push(data.collection_year || data.year || '');
        if (data.collection) metaParts.push(data.collection);
        if (data.quality) metaParts.push(data.quality);
        set('Car Year', metaParts.length > 0 ? metaParts.join(' / ') : (detailParts.length > 0 ? detailParts.join(' / ') : (data.subcategory || '')));
        set('Card Serial', data.serial || '');

        print('CollectionManager: Setting Date Scanned = "' + (data.dateScanned || '') + '"');
        print('CollectionManager: Setting City Scanned = "' + (data.cityScanned || '') + '"');
        set('Date Scanned', data.dateScanned || '');
        set('City Scanned', data.cityScanned || '');

        // Rarity
        const rarityObj = findChildByName(cardObj, 'Car Rarity');
        if (rarityObj) {
            const tc = rarityObj.getComponent('Component.Text') as Text;
            if (tc) {
                const rarity = data.rarity || 2;
                tc.text = formatRarityText(rarity, data.rarity_label || getRarityLabel(rarity));
            }
        }

        // Stat bars
        this.updateStatBar(findChildByName(cardObj, 'Top Speed Bar'), data.top_speed);
        this.updateStatBar(findChildByName(cardObj, 'Acceleration Bar'), data.acceleration);
        this.updateStatBar(findChildByName(cardObj, 'Braking Bar'), data.braking);
        this.updateStatBar(findChildByName(cardObj, 'Traction Bar'), data.traction);
        this.updateStatBar(findChildByName(cardObj, 'Comfort Bar'), data.comfort);

        // In CLUELESS, this slot is used by the collector-card prefab as the
        // decorative polaroid overlay, so we keep it untouched here.
        const noteText = this.buildDisplayNote(data, data.pairing_note || '');
        this.setOptionalCardText(cardObj, 'Style Notes', noteText);
        this.setOptionalCardText(cardObj, 'Card Notes', noteText);
        this.setOptionalCardText(cardObj, 'User Note', data.user_note || '');
        this.setButtonLabel(cardObj, 'Review Button', t('combine_look_button'));

        // Trust / Scanned-by info
        const trustObj = findChildByName(cardObj, 'Scanned by: Username, rank, trust score');
        if (trustObj) {
            const tc = trustObj.getComponent('Component.Text') as Text;
            if (tc) {
                if (this.onGetTrustDisplayString) {
                    tc.text = this.onGetTrustDisplayString();
                } else {
                    tc.text = t('scanned_by_unknown');
                }
                this.applyTrustColorToText(tc);
            }
        }
    }

    private setOptionalCardText(cardObj: SceneObject, childName: string, text: string): void {
        const obj = findChildByName(cardObj, childName);
        if (!obj) return;
        const tc = obj.getComponent('Component.Text') as Text;
        if (tc) tc.text = text;
    }

    private setButtonLabel(cardObj: SceneObject, buttonName: string, text: string): void {
        const buttonObj = findChildByName(cardObj, buttonName);
        if (!buttonObj) return;
        this.setFirstTextInSubtree(buttonObj, text, 0);
    }

    private setFirstTextInSubtree(obj: SceneObject, text: string, depth: number): boolean {
        if (!obj || depth > 6) return false;
        const tc = obj.getComponent('Component.Text') as Text;
        if (tc) {
            tc.text = text;
            return true;
        }
        const childCount = obj.getChildrenCount();
        for (let i = 0; i < childCount; i++) {
            const child = obj.getChild(i);
            if (child && this.setFirstTextInSubtree(child, text, depth + 1)) {
                return true;
            }
        }
        return false;
    }

    private applyTrustColorToText(textComp: Text): void {
        if (!this.onGetTrustDisplayString) return;
        try {
            const trustStr = this.onGetTrustDisplayString();
            const match = trustStr.match(/Trust:\s*(\d+)%/);
            if (match) {
                const score = parseInt(match[1], 10);
                const hex = getTrustColor(score);
                const r = parseInt(hex.substring(0, 2), 16) / 255;
                const g = parseInt(hex.substring(2, 4), 16) / 255;
                const b = parseInt(hex.substring(4, 6), 16) / 255;
                textComp.textFill.color = new vec4(r, g, b, 1);
            }
        } catch (e) { /* ignore */ }
    }

    private buildPairingNote(data: VehicleData): string {
        const aiNote = data.pairing_note || '';
        const suggestions = data.suggested_pairings || [];
        if (this.savedVehicles.length === 0) return aiNote;

        const currentCategory = (data.category || data.type || '').toLowerCase();
        const currentColor = (data.color || '').toLowerCase();
        const matches: string[] = [];

        for (let i = 0; i < this.savedVehicles.length; i++) {
            const saved = this.savedVehicles[i];
            if (!saved) continue;
            const savedCategory = (saved.category || saved.type || '').toLowerCase();
            const savedName = saved.item_name || saved.brand_model;
            if (!savedName) continue;

            const complementary =
                (currentCategory === 'top' && (savedCategory === 'bottom' || savedCategory === 'outerwear' || savedCategory === 'shoes')) ||
                (currentCategory === 'bottom' && (savedCategory === 'top' || savedCategory === 'outerwear' || savedCategory === 'shoes')) ||
                (currentCategory === 'outerwear' && (savedCategory === 'top' || savedCategory === 'bottom' || savedCategory === 'dress')) ||
                (currentCategory === 'shoes' && (savedCategory === 'top' || savedCategory === 'bottom' || savedCategory === 'look')) ||
                (currentCategory === 'accessory' && savedCategory !== 'accessory');

            let suggested = false;
            for (let j = 0; j < suggestions.length; j++) {
                const s = (suggestions[j] || '').toLowerCase();
                if (s.length > 0 && (savedName.toLowerCase().indexOf(s) >= 0 || savedCategory.indexOf(s) >= 0)) {
                    suggested = true;
                    break;
                }
            }

            const differentColor = currentColor.length === 0 || (saved.color || '').toLowerCase().indexOf(currentColor) < 0;
            if ((complementary && differentColor) || suggested) {
                matches.push(savedName);
                if (matches.length >= 2) break;
            }
        }

        if (matches.length > 0) {
            return 'Pairs with saved closet items: ' + matches.join(', ') + '.';
        }
        return aiNote;
    }

    private buildDisplayNote(data: VehicleData, pairingNote?: string): string {
        if (data.user_note && data.user_note.length > 0) return data.user_note;
        if (data.ai_note && data.ai_note.length > 0) return data.ai_note;

        const parts: string[] = [];
        if (data.feedback && data.feedback.length > 0) parts.push(data.feedback);
        const pair = pairingNote || data.pairing_note || '';
        if (pair.length > 0) {
            parts.push(pair);
        } else if (data.suggested_pairings && data.suggested_pairings.length > 0) {
            parts.push('Pairs with: ' + data.suggested_pairings.join(', ') + '.');
        }
        return parts.length > 0 ? parts.join('\n') : '';
    }

    private reapplyCardStatBars(cardObj: SceneObject, data: SavedVehicleData): void {
        this.updateStatBar(findChildByName(cardObj, 'Top Speed Bar'), data.top_speed);
        this.updateStatBar(findChildByName(cardObj, 'Acceleration Bar'), data.acceleration);
        this.updateStatBar(findChildByName(cardObj, 'Braking Bar'), data.braking);
        this.updateStatBar(findChildByName(cardObj, 'Traction Bar'), data.traction);
        this.updateStatBar(findChildByName(cardObj, 'Comfort Bar'), data.comfort);

        const rarityObj = findChildByName(cardObj, 'Car Rarity');
        if (rarityObj) {
            const tc = rarityObj.getComponent('Component.Text') as Text;
            if (tc) {
                const rarity = data.rarity || 2;
                tc.text = formatRarityText(rarity, data.rarity_label || getRarityLabel(rarity));
            }
        }
    }

    // =====================================================================
    // COMBINE LOOK BUTTON HOOKING — Deferred until collection is opened
    // =====================================================================

    /**
     * Hooks the "Review Button" object on all collector cards that haven't been hooked yet.
     * The object keeps its scene name for prefab compatibility, but the visible
     * user action is now "Combine Look".
     * Called from showCollection() AFTER cards are enabled, with a short delay
     * to let the RectangleButton ScriptComponent initialize.
     *
     * The RectangleButton needs the card to be enabled for several frames
     * before its onTriggerUp event becomes available.
     */
    private hookPendingReviewButtons(): void {
        let waitFrames = 0;
        const pollEvent = this.createEvent('UpdateEvent');
        pollEvent.bind(() => {
            waitFrames++;
            // Wait 10 frames for RectangleButton scripts to initialize
            if (waitFrames < 10) return;
            pollEvent.enabled = false;

            for (let i = 0; i < this.collectionCardObjects.length; i++) {
                if (this.reviewButtonHooked[i]) continue;
                const card = this.collectionCardObjects[i];
                if (!card || !card.enabled) continue;
                if (i >= this.savedVehicles.length) continue;

                this.tryHookReviewButton(card, i);
            }
        });
    }

    /**
     * Combine Look can run from the closet carousel or from a placed card.
     * The button itself is the explicit trigger, so the user does not need to
     * pull the card out first.
     */
    private canTriggerCombineLook(cardIndex: number): boolean {
        const state = this.cardStates[cardIndex] || this.STATE_IN_COLLECTION;
        return state === this.STATE_IN_COLLECTION || state === this.STATE_PLACED_IN_WORLD;
    }

    private triggerCombineLook(cardIndex: number, data: SavedVehicleData, cardReviewText: Text | null, source: string): void {
        if (!this.canTriggerCombineLook(cardIndex)) {
            print('CollectionManager: [COMBINE] Ignored (' + source + ') - card is not available');
            return;
        }

        print('CollectionManager: [COMBINE] Combine Look pressed (' + source + ') for ' + (data.brand_model || '?'));
        const closetItems = this.savedVehicles.slice();
        if (this.onCombineLook) {
            this.onCombineLook(data, closetItems, cardReviewText || undefined);
        } else if (this.onReviewVehicle) {
            this.onReviewVehicle(data, cardReviewText || undefined);
        }
    }

    /**
     * Attempts to connect the Combine Look action on a specific collector card.
     * Finds the existing "Review Button" scene object and the "Car Review" Text
     * child, then wires the button to ask the AI for outfit combinations.
     */
    private tryHookReviewButton(cardObj: SceneObject, cardIndex: number): void {
        const reviewBtnObj = findChildByName(cardObj, 'Review Button');
        if (!reviewBtnObj) {
            print('CollectionManager: [COMBINE] "Review Button" not found in card #' + cardIndex);
            return;
        }

        // Find the "Car Review" Text component on the card (for combination display)
        const carReviewObj = findChildByName(cardObj, 'Car Review');
        let carReviewText: Text | null = null;
        if (carReviewObj) {
            carReviewText = carReviewObj.getComponent('Component.Text') as Text;
        }

        const data = this.savedVehicles[cardIndex];

        // Strategy 1: Try connectButton utility (checks multiple event types)
        if (this.onConnectButton) {
            const connected = this.onConnectButton(reviewBtnObj, () => {
                this.triggerCombineLook(cardIndex, data, carReviewText, 'connectButton');
            }, 'CardCombine_' + cardIndex);
            if (connected) {
                this.reviewButtonHooked[cardIndex] = true;
                print('CollectionManager: [COMBINE] Button connected for ' + (data.brand_model || '?'));
                return;
            }
        }

        // Strategy 2: Direct ScriptComponent event search on button + child
        const objectsToCheck = [reviewBtnObj];
        const childCount = reviewBtnObj.getChildrenCount();
        for (let c = 0; c < childCount; c++) {
            const child = reviewBtnObj.getChild(c);
            if (child) objectsToCheck.push(child);
        }

        for (let o = 0; o < objectsToCheck.length; o++) {
            const obj = objectsToCheck[o];
            const scripts = obj.getComponents('Component.ScriptComponent') as any[];
            for (let s = 0; s < scripts.length; s++) {
                const script = scripts[s];
                if (!script) continue;

                if (script.onTriggerUp && typeof script.onTriggerUp.add === 'function') {
                    script.onTriggerUp.add(() => {
                        this.triggerCombineLook(cardIndex, data, carReviewText, 'direct/onTriggerUp');
                    });
                    this.reviewButtonHooked[cardIndex] = true;
                    print('CollectionManager: [COMBINE] Button connected (direct/onTriggerUp) for ' + (data.brand_model || '?'));
                    return;
                }
                if (script.onButtonPinched && typeof script.onButtonPinched.add === 'function') {
                    script.onButtonPinched.add(() => {
                        this.triggerCombineLook(cardIndex, data, carReviewText, 'direct/onButtonPinched');
                    });
                    this.reviewButtonHooked[cardIndex] = true;
                    print('CollectionManager: [COMBINE] Button connected (direct/onButtonPinched) for ' + (data.brand_model || '?'));
                    return;
                }
            }
        }

        print('CollectionManager: [COMBINE] Could not hook Combine Look button for card #' + cardIndex
            + ' (' + (data.brand_model || '?') + ') — will retry next collection open');
    }

    private updateStatBar(barObject: SceneObject | null, value: number): void {
        if (!barObject) return;
        const clampedValue = Math.max(0, Math.min(5, Math.round(value)));
        const childCount = barObject.getChildrenCount();
        let textComp: Text | null = null;
        for (let i = 0; i < childCount; i++) {
            const child = barObject.getChild(i);
            if (!child) continue;
            if (child.getComponent('Component.RenderMeshVisual')) {
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
            textComp.text = this.formatStatRow(this.getStatLabelFromBar(barObject), clampedValue);
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
    // CARD IMAGE — Apply, save to storage, load from storage
    // =====================================================================

    private applyCardImage(cardObj: SceneObject, texture: Texture): void {
        const cardImageObj = findChildByName(cardObj, 'Card Image');
        if (!cardImageObj) return;

        let applied = false;
        const imgComp = cardImageObj.getComponent('Component.Image') as Image;
        if (imgComp) {
            imgComp.mainMaterial = imgComp.mainMaterial.clone();
            imgComp.mainPass.baseTex = texture;
            cardImageObj.enabled = true;
            applied = true;
        }
        if (!applied) {
            const meshComp = cardImageObj.getComponent('Component.RenderMeshVisual') as RenderMeshVisual;
            if (meshComp) {
                meshComp.mainMaterial = meshComp.mainMaterial.clone();
                meshComp.mainPass.baseTex = texture;
                cardImageObj.enabled = true;
                applied = true;
            }
        }
        if (applied) {
            const idx = this.collectionCardObjects.indexOf(cardObj);
            if (idx >= 0) this.cardImageReady[idx] = true;
        }
    }

    private saveCardImageToStorage(vehicleName: string, savedAt: number, texture: Texture, serial?: string): void {
        try {
            const storageKey = this.IMAGE_KEY_PREFIX + savedAt.toString();
            Base64.encodeTextureAsync(
                texture,
                (b64: string) => {
                    try { global.persistentStorageSystem.store.putString(storageKey, b64); } catch (e) { /* ignore */ }
                    // Cloud upload (fire-and-forget)
                    if (serial && this.onCloudUploadImage) {
                        this.onCloudUploadImage(serial, b64);
                    }
                },
                () => { /* encode failed */ },
                CompressionQuality.LowQuality,
                EncodingType.Jpg
            );
        } catch (e) { /* ignore */ }
    }

    private saveCardImageBase64ToStorage(vehicleName: string, savedAt: number, base64: string): void {
        if (!base64 || base64.length === 0) return;
        try {
            const storageKey = this.IMAGE_KEY_PREFIX + savedAt.toString();
            global.persistentStorageSystem.store.putString(storageKey, base64);
            print('CollectionManager: Saved real scan photo for ' + vehicleName + ' — ' + base64.length + ' chars');
        } catch (e) {
            print('CollectionManager: Failed to save real scan photo: ' + e);
        }
    }

    private decodeBase64Texture(base64: string): Promise<Texture | null> {
        return new Promise<Texture | null>((resolve) => {
            if (!base64 || base64.length === 0) {
                resolve(null);
                return;
            }
            try {
                Base64.decodeTextureAsync(
                    base64,
                    (texture: Texture) => resolve(texture),
                    () => {
                        print('CollectionManager: Failed to decode real scan photo');
                        resolve(null);
                    }
                );
            } catch (e) {
                print('CollectionManager: Decode real scan photo exception: ' + e);
                resolve(null);
            }
        });
    }

    private loadCardImageFromStorage(vehicleName: string, savedAt: number, cardObj: SceneObject): boolean {
        try {
            const storageKey = this.IMAGE_KEY_PREFIX + savedAt.toString();
            const b64 = global.persistentStorageSystem.store.getString(storageKey);
            if (!b64 || b64.length === 0) return false;

            Base64.decodeTextureAsync(
                b64,
                (texture: Texture) => { this.applyCardImage(cardObj, texture); },
                () => { /* decode failed */ }
            );
            return true;
        } catch (e) { return false; }
    }

    // =====================================================================
    // BACKGROUND VARIETY — Polaroid closet card scenes
    // =====================================================================

    private readonly PHOTO_BACKGROUNDS: string[] = [
        'a clean white wardrobe wall with soft daylight, subtle shadows, editorial closet photography',
        'a brushed steel clothing rack in a minimal studio, fashion archive mood, soft flash',
        'a warm bedroom corner with a full-length mirror and natural window light',
        'a neutral paper backdrop with gentle studio lighting, lookbook product photography',
        'a tidy closet shelf with folded knits and matte black hangers, premium wardrobe catalog',
        'a concrete studio floor with a crisp white wall, modern fashion campaign still life',
        'a soft gray fabric backdrop with analog instant-film texture, clean styling',
        'a minimal dressing room with charcoal accents and polished floor reflections',
    ];

    private pickRandomBackground(): string {
        const idx = Math.floor(Math.random() * this.PHOTO_BACKGROUNDS.length);
        return this.PHOTO_BACKGROUNDS[idx];
    }

    // =====================================================================
    // IMAGE GENERATION (gpt-image-1 Image Edit with real photo)
    // =====================================================================

    /**
     * Generates the collector card image using OpenAI Image Edit (gpt-image-1).
     *
     * Sends the REAL photo captured by the Spectacles camera (compressed version).
     * The model keeps the actual garment/look and frames it as a clean
     * editorial polaroid-style closet card.
     *
     * Retry strategy:
     *   - 5 attempts: gpt-image-1 (x3) then dall-e-2 fallback (x2)
     *   - Increasing delay between attempts (2s, 3s, 4s, 5s)
     */
    private async generateVehicleCardImage(data: SavedVehicleData): Promise<Texture> {
        if (!this.lastCapturedBase64 || this.lastCapturedBase64.length === 0) {
            print('CollectionManager: [IMG-EDIT] No captured photo available — cannot create card');
            if (this.onShowDescription) this.onShowDescription(t('no_captured_photo'));
            if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(5.0);
            throw new Error('No captured photo available');
        }

        print('CollectionManager: [IMG-EDIT] START — base64 length = ' + this.lastCapturedBase64.length
            + ' (~' + Math.round((this.lastCapturedBase64.length * 0.75) / 1024) + ' KB)');

        const bgScene = this.pickRandomBackground();
        const editPrompt = 'Create a clean polaroid-style fashion inventory card. '
            + 'Keep the garment or outfit in the foreground exactly as it appears in the photo — '
            + 'preserve color, fabric, texture, silhouette, folds, wear, and imperfections faithfully. '
            + 'Replace ONLY the background with: '
            + bgScene + ' '
            + 'Use a white instant-photo border, subtle paper grain, sharp focus on the clothing, '
            + 'soft editorial lighting, premium closet catalog quality. '
            + 'Do NOT modify the garment or outfit itself in any way.';

        let imageBytes: Uint8Array;
        try {
            imageBytes = Base64.decode(this.lastCapturedBase64);
            print('CollectionManager: [IMG-EDIT] Base64.decode OK — '
                + imageBytes.length + ' bytes (' + Math.round(imageBytes.length / 1024) + ' KB)');
        } catch (decodeErr) {
            print('CollectionManager: [IMG-EDIT] ERROR Base64.decode failed: ' + decodeErr);
            throw new Error('Base64 decode failed: ' + String(decodeErr).substring(0, 100));
        }

        const attempts: Array<{ model: string; size: string }> = [
            { model: 'gpt-image-1', size: '1024x1024' },
            { model: 'gpt-image-1', size: '1024x1024' },
            { model: 'gpt-image-1', size: '1536x1024' },
            { model: 'gpt-image-1', size: '1024x1024' },
            { model: 'gpt-image-1', size: '1024x1024' },
        ];

        let response: any;
        let lastError = '';

        for (let i = 0; i < attempts.length; i++) {
            const { model, size } = attempts[i];
            const attempt = i + 1;

            try {
                print('CollectionManager: [IMG-EDIT] Attempt ' + attempt + '/' + attempts.length
                    + ' — model=' + model + ', size=' + size + ', input=' + Math.round(imageBytes.length / 1024) + 'KB');

                const statusCb = this.onShowCardStatus || this.onShowAnimatedDescription || this.onShowDescription;
                if (statusCb) {
                    statusCb(tf('generating_card_n', { n: attempt, total: attempts.length }) + '...');
                }

                response = await OpenAI.imagesEdit({
                    image: imageBytes,
                    prompt: editPrompt,
                    model: model,
                    n: 1,
                    size: size,
                });

                print('CollectionManager: [IMG-EDIT] Attempt ' + attempt + ' SUCCESS (model=' + model
                    + ') — data count = ' + (response?.data?.length || 0));

                return this.extractTextureFromResponse(response);

            } catch (err) {
                // Capture as much detail as possible from the error
                let errDetail = '';
                if (typeof err === 'string') {
                    errDetail = err.length > 0 ? err : '(empty string error)';
                } else if (err && typeof err === 'object') {
                    errDetail = (err as any).message || (err as any).error || JSON.stringify(err);
                    if (!errDetail || errDetail === '{}') errDetail = '(empty object error — proxy likely rejected payload)';
                } else {
                    errDetail = String(err) || '(unknown error)';
                }
                lastError = errDetail;

                print('CollectionManager: [IMG-EDIT] Attempt ' + attempt + '/' + attempts.length
                    + ' FAILED (model=' + model + '): ' + errDetail.substring(0, 400));

                if (i < attempts.length - 1) {
                    const delaySec = 2 + i;
                    print('CollectionManager: [IMG-EDIT] Waiting ' + delaySec + 's before retry...');
                    await this.delay(delaySec);
                }
            }
        }

        print('CollectionManager: [IMG-EDIT] ALL ' + attempts.length + ' ATTEMPTS FAILED — ' + lastError.substring(0, 400));
        throw new Error('Image edit failed after ' + attempts.length + ' attempts: ' + lastError.substring(0, 200));
    }

    /**
     * Extracts the generated texture from an OpenAI Image Edit response.
     */
    private async extractTextureFromResponse(response: any): Promise<Texture> {
        if (!response?.data?.length) {
            throw new Error('Image Edit returned empty response');
        }

        const imageData = response.data[0];
        print('CollectionManager: [IMG-EDIT] Response keys: ' + Object.keys(imageData).join(', '));

        if (imageData.b64_json) {
            print('CollectionManager: [IMG-EDIT] Got b64_json — length = ' + imageData.b64_json.length);
            return new Promise<Texture>((resolve, reject) => {
                Base64.decodeTextureAsync(
                    imageData.b64_json,
                    (tex: Texture) => {
                        print('CollectionManager: [IMG-EDIT] SUCCESS — texture decoded');
                        resolve(tex);
                    },
                    () => {
                        print('CollectionManager: [IMG-EDIT] ERROR decodeTextureAsync failed');
                        reject(new Error('Image Edit texture decode failed'));
                    }
                );
            });
        } else if (imageData.url) {
            print('CollectionManager: [IMG-EDIT] Got URL, downloading: ' + imageData.url.substring(0, 80) + '...');
            return this.downloadImageAsTexture(imageData.url);
        }

        throw new Error('Image Edit: no b64_json nor url in response');
    }

    /**
     * Promise-based delay for retry spacing.
     */
    private delay(seconds: number): Promise<void> {
        return new Promise<void>((resolve) => {
            const ev = this.createEvent('DelayedCallbackEvent');
            ev.bind(() => resolve());
            ev.reset(seconds);
        });
    }

    /**
     * Queues an image generation request. Returns a Promise that resolves when
     * this item reaches the front of the queue and completes.
     */
    private readonly MAX_IMAGE_QUEUE: number = 5;

    private queueImageGeneration(data: SavedVehicleData): Promise<Texture> {
        if (this._imageQueue.length >= this.MAX_IMAGE_QUEUE) {
            print('CollectionManager: [QUEUE] Image queue full (' + this.MAX_IMAGE_QUEUE + ') — rejecting');
            if (this.onShowDescription) this.onShowDescription(t('image_gen_busy'));
            return Promise.reject(new Error('Image queue full'));
        }
        const capturedBase64 = this.lastCapturedBase64;
        return new Promise<Texture>((resolve, reject) => {
            this._imageQueue.push({ data, capturedBase64, resolve, reject });
            print('CollectionManager: [QUEUE] Added to image queue — depth=' + this._imageQueue.length);
            this.processImageQueue();
        });
    }

    private async processImageQueue(): Promise<void> {
        if (this._imageQueueProcessing || this._imageQueue.length === 0) return;
        this._imageQueueProcessing = true;

        while (this._imageQueue.length > 0) {
            const item = this._imageQueue.shift()!;
            print('CollectionManager: [QUEUE] Processing — ' + item.data.brand_model
                + ' (remaining=' + this._imageQueue.length + ')');
            const prevBase64 = this.lastCapturedBase64;
            this.lastCapturedBase64 = item.capturedBase64;
            try {
                const tex = await this.generateVehicleCardImage(item.data);
                item.resolve(tex);
            } catch (e) {
                item.reject(e);
            }
            this.lastCapturedBase64 = prevBase64;
        }

        this._imageQueueProcessing = false;
    }

    private async downloadImageAsTexture(url: string): Promise<Texture> {
        return new Promise<Texture>((resolve, reject) => {
            if (!this.internetModule) { reject(new Error('No InternetModule')); return; }
            const request = RemoteServiceHttpRequest.create();
            request.url = url;
            request.setHeader('User-Agent', this.HTTP_USER_AGENT);
            this.internetModule.performHttpRequest(request, (response: RemoteServiceHttpResponse) => {
                if (response.statusCode < 200 || response.statusCode >= 400) { reject(new Error('HTTP ' + response.statusCode)); return; }
                try {
                    const resource = response.asResource();
                    if (!resource || !this.remoteMediaModule) { reject(new Error('No resource')); return; }
                    this.remoteMediaModule.loadResourceAsImageTexture(resource,
                        (tex: Texture) => resolve(tex),
                        (err: string) => reject(new Error(err))
                    );
                } catch (e) { reject(e); }
            });
        });
    }

    // =====================================================================
    // PERSISTENT STORAGE
    // =====================================================================

    private saveCollectionToStorage(): void {
        try {
            const store = global.persistentStorageSystem.store;
            const serializable = this.savedVehicles.map(v => ({
                clothing_found: v.clothing_found !== false,
                mode: v.mode || 'single_item',
                scan_context: v.scan_context || 'unknown',
                brand: v.brand || '', brand_model: v.brand_model,
                item_name: v.item_name || v.brand_model,
                type: v.type,
                category: v.category || v.type,
                subcategory: v.subcategory || v.year || '',
                year: v.year || '', top_speed: v.top_speed, acceleration: v.acceleration,
                braking: v.braking, traction: v.traction, comfort: v.comfort,
                rarity: v.rarity || 2, rarity_label: v.rarity_label || getRarityLabel(v.rarity || 2),
                color: v.color || '',
                material: v.material || '',
                pattern: v.pattern || '',
                fit: v.fit || '',
                condition: v.condition || '',
                confidence: v.confidence || 0,
                style_tags: v.style_tags || [],
                occasion_tags: v.occasion_tags || [],
                season_tags: v.season_tags || [],
                items: v.items || [],
                look_summary: v.look_summary || '',
                feedback: v.feedback || '',
                ai_note: v.ai_note || '',
                user_note: v.user_note || '',
                scene: v.scene || '',
                savedAt: v.savedAt, imageGenerated: v.imageGenerated || false,
                serial: v.serial || '',
                dateScanned: v.dateScanned || '',
                cityScanned: v.cityScanned || '',
            }));
            store.putString(this.STORAGE_KEY, JSON.stringify(serializable));
            print('CollectionManager: Saved ' + serializable.length + ' closet items');
        } catch (e) {
            print('CollectionManager: Save error: ' + e);
        }
    }

    private loadCollectionFromStorage(): void {
        try {
            const jsonString = global.persistentStorageSystem.store.getString(this.STORAGE_KEY);
            if (!jsonString || jsonString.length === 0) return;

            const parsed = JSON.parse(jsonString) as SavedVehicleData[];
            if (!Array.isArray(parsed) || parsed.length === 0) return;

            this.savedVehicles = parsed;

            // Retroactive field generation for cards saved before serial/date/city system
            let needsResave = false;
            for (let i = 0; i < this.savedVehicles.length; i++) {
                const v = this.savedVehicles[i];
                if (!v.serial || v.serial.length === 0) {
                    v.serial = generateSerial();
                    needsResave = true;
                    print('CollectionManager: Retroactive serial for ' + v.brand_model + ': ' + v.serial);
                }
                if (!v.dateScanned || v.dateScanned.length === 0) {
                    // Derive date from savedAt timestamp
                    v.dateScanned = v.savedAt ? formatScanDate(v.savedAt) : '';
                    needsResave = true;
                }
                if (v.cityScanned === undefined || v.cityScanned === null) {
                    v.cityScanned = '';
                    needsResave = true;
                }
                if (!v.scan_context || v.scan_context.length === 0) {
                    v.scan_context = 'unknown';
                    needsResave = true;
                } else {
                    v.scan_context = normalizeScanContext(v.scan_context);
                }
                if (v.ai_note === undefined || v.ai_note === null) {
                    v.ai_note = this.buildDisplayNote(v, v.pairing_note || '');
                    needsResave = true;
                }
                if (v.user_note === undefined || v.user_note === null) {
                    v.user_note = '';
                    needsResave = true;
                }
            }
            if (needsResave) this.saveCollectionToStorage();

            this.ensureCollectionRoot();

            for (let i = 0; i < this.savedVehicles.length; i++) {
                const vehicleData = this.savedVehicles[i];
                const cardObj = this.instantiateCollectorCard(vehicleData);
                if (cardObj) {
                    this.collectionCardObjects.push(cardObj);
                    this.cardStates.push(this.STATE_IN_COLLECTION);
                    this.cardImageReady.push(false);
                    this.cardFrameHooked.push(false);
                    this.reviewButtonHooked.push(false);
                    cardObj.enabled = false;

                    if (this.cardInteraction) {
                        this.cardInteraction.hookCardFrameEvents(cardObj, this.collectionCardObjects.length - 1);
                    }
                    if (vehicleData.imageGenerated && vehicleData.brand_model && vehicleData.savedAt) {
                        this.loadCardImageFromStorage(vehicleData.brand_model, vehicleData.savedAt, cardObj);
                    }
                }
            }
            print('CollectionManager: Loaded ' + this.collectionCardObjects.length + ' cards from storage');
            this.updateCollectionButtonLabel();

            // Cloud sync full collection (fire-and-forget, delayed to let auth complete)
            if (this.onCloudSyncFullCollection && this.savedVehicles.length > 0) {
                const vehiclesToSync = this.savedVehicles.slice();
                const delayEvent = this.createEvent('DelayedCallbackEvent') as any;
                delayEvent.bind(() => {
                    if (this.onCloudSyncFullCollection) this.onCloudSyncFullCollection(vehiclesToSync);
                });
                delayEvent.reset(5.0);
            }
        } catch (e) {
            print('CollectionManager: Load error: ' + e);
        }
    }

    /** Returns the saved vehicles array (for cloud sync). */
    getSavedVehicles(): SavedVehicleData[] {
        return this.savedVehicles;
    }

    // =====================================================================
    // REVEAL ANIMATION
    // =====================================================================

    private getOrCreateRevealParent(): SceneObject {
        if (!this.revealParent) {
            this.revealParent = global.scene.createSceneObject('RevealParent');
        }
        return this.revealParent;
    }

    private playCardRevealAnimation(cardObj: SceneObject, vehicleName: string, onComplete: () => void): void {
        this.isRevealAnimating = true;
        if (this.revealAnimEvent) {
            try { this.revealAnimEvent.enabled = false; } catch (e) { /* ignore */ }
            this.revealAnimEvent = null;
        }

        const cardTransform = cardObj.getTransform();
        let revealWorldPos = new vec3(0, 0, -55);
        let revealWorldRot = quat.fromEulerAngles(0, Math.PI, 0);

        const headData = this.getUserHeadTransform();
        if (headData) {
            revealWorldPos = headData.position.add(headData.forward.uniformScale(55));
            revealWorldPos.y -= 3;
            revealWorldRot = headData.rotation;
        }

        const targetScale = 0.7;
        cardTransform.setWorldPosition(revealWorldPos);
        cardTransform.setWorldRotation(revealWorldRot);
        cardTransform.setWorldScale(new vec3(0.001, 0.001, 0.001));
        cardObj.enabled = true;

        const PHASE1_DUR = 0.6;
        const PHASE2_DUR = 3.5;
        const baseRot = revealWorldRot;

        let phase: string = 'scale_in';
        let phaseStartTime = getTime();
        let isGrabbed = false;
        let frameHooked = false;
        // Gate flag: once reveal finishes, these callbacks become inert
        let revealActive = true;

        if (this.onShowDescription) this.onShowDescription(tf('card_sparkle', { name: vehicleName }));

        const hookFrameForReveal = (): void => {
            if (frameHooked) return;
            try {
                const scripts = cardObj.getComponents('Component.ScriptComponent') as any[];
                for (let si = 0; si < scripts.length; si++) {
                    const script = scripts[si];
                    if (!script) continue;
                    if (script.onTranslationStart && typeof script.onTranslationStart.add === 'function'
                        && script.onTranslationEnd && typeof script.onTranslationEnd.add === 'function') {

                        script.onTranslationStart.add(() => {
                            if (!revealActive) return;
                            if (phase === 'wobble' || phase === 'scale_in') {
                                isGrabbed = true;
                                phase = 'held';
                                print('CollectionManager: [REVEAL] Card grabbed by user');
                                if (this.onShowDescription) this.onShowDescription(tf('release_to_collect', { name: vehicleName }));
                            }
                        });

                        script.onTranslationEnd.add(() => {
                            if (!revealActive) return;
                            if (phase === 'held' && isGrabbed) {
                                isGrabbed = false;
                                revealActive = false;
                                this.startFlyToCollection(cardObj, cardTransform, onComplete);
                            }
                        });

                        frameHooked = true;
                        print('CollectionManager: [REVEAL] Frame events hooked for grab detection');
                        return;
                    }
                }
            } catch (e) { /* not ready yet */ }
        };

        this.revealAnimEvent = this.createEvent('UpdateEvent');
        this.revealAnimEvent.bind(() => {
            const elapsed = getTime() - phaseStartTime;

            if (!frameHooked) hookFrameForReveal();

            if (phase === 'scale_in') {
                if (elapsed < PHASE1_DUR) {
                    const t = elapsed / PHASE1_DUR;
                    const eased = 1.0 - Math.pow(1.0 - t, 3.0);
                    const s = eased * targetScale;
                    cardTransform.setWorldScale(new vec3(s, s, s));
                    cardTransform.setWorldPosition(revealWorldPos);
                    cardTransform.setWorldRotation(baseRot);
                } else {
                    phase = 'wobble';
                    phaseStartTime = getTime();
                    cardTransform.setWorldScale(new vec3(targetScale, targetScale, targetScale));
                }
            } else if (phase === 'wobble') {
                if (elapsed < PHASE2_DUR) {
                    const wobbleRad = Math.sin((elapsed / PHASE2_DUR) * Math.PI * 3.0) * 25.0 * (Math.PI / 180.0);
                    cardTransform.setWorldScale(new vec3(targetScale, targetScale, targetScale));
                    cardTransform.setWorldPosition(revealWorldPos);
                    cardTransform.setWorldRotation(baseRot.multiply(quat.fromEulerAngles(0, wobbleRad, 0)));
                } else {
                    revealActive = false;
                    this.startFlyToCollection(cardObj, cardTransform, onComplete);
                }
            } else if (phase === 'held') {
                // Frame.ts handles positioning — waiting for onTranslationEnd
            }
        });
    }

    private startFlyToCollection(
        cardObj: SceneObject,
        cardTransform: Transform,
        onComplete: () => void
    ): void {
        if (this.revealAnimEvent) {
            try { this.revealAnimEvent.enabled = false; } catch (e) { /* ignore */ }
            this.revealAnimEvent = null;
        }

        this.ensureCollectionRoot();
        this.positionVirtualClosetRoot();
        let targetPos = vec3.zero();
        let targetRot = quat.quatIdentity();
        if (this.collectionRoot) {
            targetPos = this.collectionRoot.getTransform().getWorldPosition();
            targetRot = this.collectionRoot.getTransform().getWorldRotation();
        } else if (this.cardCollectionContainer) {
            targetPos = this.cardCollectionContainer.getTransform().getWorldPosition();
            targetRot = this.cardCollectionContainer.getTransform().getWorldRotation();
        }

        const startPos = cardTransform.getWorldPosition();
        const startRot = cardTransform.getWorldRotation();
        const startScale = cardTransform.getWorldScale().x;
        const endScale = this.cardInteraction ? this.cardInteraction.collectionCardScale : 0.18;

        const FLY_DUR = 0.8;
        const flyStartTime = getTime();

        if (this.onShowDescription) this.onShowDescription(t('card_collected'));
        if (this.onCardFlyToInventory) this.onCardFlyToInventory();

        this.revealAnimEvent = this.createEvent('UpdateEvent');
        this.revealAnimEvent.bind(() => {
            const elapsed = getTime() - flyStartTime;
            const t = Math.min(elapsed / FLY_DUR, 1.0);
            const eased = 1.0 - Math.pow(1.0 - t, 3.0);

            const pos = vec3.lerp(startPos, targetPos, eased);
            const rot = quat.slerp(startRot, targetRot, eased);
            const s = startScale + (endScale - startScale) * eased;

            cardTransform.setWorldPosition(pos);
            cardTransform.setWorldRotation(rot);
            cardTransform.setWorldScale(new vec3(s, s, s));

            if (t >= 1.0) {
                cardObj.enabled = false;
                this.isRevealAnimating = false;
                if (this.revealAnimEvent) {
                    try { this.revealAnimEvent.enabled = false; } catch (e) { /* ignore */ }
                    this.revealAnimEvent = null;
                }
                if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(2.0);
                onComplete();
            }
        });
    }
}
