/**
 * CollectionManager.ts — Closet card collection for Closet Club
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
    VehicleData, SavedVehicleData,
    findChildByName, enableAllDescendants, formatCarType,
    getRarityLabel, formatRarityText, clampStat, generateSerial,
    formatScanDate, normalizeScanContext,
} from './ClosetTypes';
import { BrandLogoLoader } from './BrandLogoLoader';
import { t, tf, translateStaticTextForObject } from './Localization';
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

    @input
    @allowUndefined
    @hint('Optional parent with Image/RenderMeshVisual children named Garment 1, Garment 2, etc.')
    garmentPlaceholderContainer: SceneObject;

    @input
    @hint('Run GPT Image Edit on Save to remove the background and fill garment placeholders')
    generateGarmentCutoutOnSave: boolean = true;

    @input
    @hint('Maximum seconds to wait for the AI closet image before keeping the scan photo')
    garmentCutoutTimeoutSeconds: number = 60;

    @input
    @hint('Maximum AI attempts for the closet cutout. Keep this at 1 for faster saves.')
    garmentCutoutMaxAttempts: number = 1;

    @input
    @hint('Number of visible garment placeholder slots for the look builder')
    maxGarmentPlaceholders: number = 2;

    @input
    @hint('How many garment cards to place per row inside the closet list')
    garmentPlaceholderColumns: number = 3;

    @input
    @hint('Spacing in cm between runtime garment placeholders')
    garmentPlaceholderSpacing: number = 6;

    @input
    @hint('Drop radius in cm for dragging a bracelet card onto an outfit slot')
    outfitSlotDropRadiusCm: number = 24;

    // =====================================================================
    // INPUTS — Delete Card UI
    // =====================================================================
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
    @hint('Maximum number of cards in collection. Default: 100. Increase for premium users.')
    maxCollectionSize: number = 100;

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
    /** Called to connect a button (utility from ClosetCardUI). */
    onConnectButton: ((obj: SceneObject, cb: () => void, name: string) => boolean) | null = null;
    /** Called when a collector card asks for more info about its garment. */
    onReviewVehicle: ((data: SavedVehicleData, cardReviewText?: Text) => void) | null = null;
    /** Legacy automatic outfit-combination callback, kept for compatibility. */
    onCombineLook: ((data: SavedVehicleData, closetItems: SavedVehicleData[], cardReviewText?: Text) => void) | null = null;
    /** Called when AskAI is pressed for the currently composed outfit slots. */
    onAskOutfitFeedback: ((outfitItems: SavedVehicleData[], slotLabels?: string[], outfitText?: Text | null, percentText?: Text | null, matchPercent?: number) => void) | null = null;
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
    /** Called to sync a single vehicle to cloud after save. */
    onCloudSyncVehicle: ((vehicle: SavedVehicleData) => void) | null = null;
    /** Called to upload a card image to cloud storage. */
    onCloudUploadImage: ((serial: string, base64: string) => void) | null = null;
    /** Called to delete a vehicle from cloud. */
    onCloudDeleteVehicle: ((serial: string) => void) | null = null;
    /** Called to sync full collection to cloud (on startup). */
    onCloudSyncFullCollection: ((vehicles: SavedVehicleData[]) => void) | null = null;
    /** Called to reset (delete all) vehicles from cloud. */
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
    private readonly GARMENT_CUTOUT_KEY_PREFIX: string = 'clueless_cutout_';
    private readonly OUTFIT_SLOTS_KEY: string = 'clueless_outfit_slots';
    private readonly DELETED_SERIALS_KEY: string = 'clueless_deleted_serials';
    private readonly HTTP_USER_AGENT: string = 'LensStudio/5.15 SnapSpectacles ClosetClub/1.0';

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
    private garmentPlaceholderObjects: SceneObject[] = [];
    private garmentPlaceholderRuntimeCreated: boolean[] = [];
    private garmentPlaceholderButtonConnected: boolean[] = [];
    private garmentSlotToSavedIndex: number[] = [];
    private garmentPageIndex: number = 0;
    private garmentViewMode: 'inventory' | 'combination' | 'outfit' = 'inventory';
    private garmentCombinationIndexes: number[] = [];
    private garmentCombinationTargetIndex: number = -1;
    private garmentCombinationPercents: number[] = [];
    private outfitTesterContainer: SceneObject | null = null;
    private outfitSlotObjects: SceneObject[] = [];
    private outfitSlotDefaultTextures: Array<Texture | null> = [];
    private outfitSlotToSavedIndex: number[] = [-1, -1, -1, -1, -1];
    private outfitSlotButtonConnected: boolean[] = [];
    private askOutfitButtonConnected: boolean = false;
    private composeOutfitButtonConnected: boolean = false;
    private outfitCombineButtonObj: SceneObject | null = null;
    private combineButtonSuppressDropIndex: number = -1;
    private combineButtonSuppressDropUntil: number = 0;
    private infoButtonPinchWasDown: boolean = false;
    private infoButtonPinchCooldownUntil: number = 0;
    private infoButtonTapCooldownUntil: number = 0;
    private outfitButtonTapCooldownUntil: number = 0;
    private garmentPrevPageButtonConnected: boolean = false;
    private garmentNextPageButtonConnected: boolean = false;
    private saveButtonConnected: boolean = false;
    private deletedSerials: string[] = [];

    isCollectionOpen: boolean = false;
    private isSavingCard: boolean = false;
    private lastVehicleData: VehicleData | null = null;

    // Last captured photo (Base64, compressed) — used for OpenAI Image Edit (gpt-image-1)
    private lastCapturedBase64: string = '';

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
        if (this.confirmResetProfileContainer) this.confirmResetProfileContainer.enabled = false;
        this.hideGarmentPlaceholderContainer();
        print('CollectionManager: [GARMENT-CUTOUT] Config — enabled=' + this.generateGarmentCutoutOnSave
            + ', timeout=' + this.garmentCutoutTimeoutSeconds + 's'
            + ', attempts=' + this.garmentCutoutMaxAttempts);

        // Pre-fetch city as early as possible (async callback API)
        this.prefetchCity();

        this.createEvent('OnStartEvent').bind(() => {
            this.setupDepthTracking();
            this.setupOpenCollectionButton();
            this.setupSaveButton();
            this.setupDeleteCardButton();
            this.setupResetButton();
            this.loadDeletedSerials();
            this.loadCollectionFromStorage();
            this.hookFrameCloseButtons();
            this.setupCardInfoTapFallback();
            this.setupOutfitTesterTapFallback();
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
        if (data) {
            print('CollectionManager: Last scan data set — ' + (data.brand_model || data.item_name || data.type || 'item'));
        } else {
            print('CollectionManager: Last scan data cleared');
        }
    }

    /**
     * Stores the compressed Base64 photo captured by ClothingScanner.
     * This image will be sent to OpenAI Image Edit (gpt-image-1) to create
     * a collector card using the actual vehicle photo.
     */
    setLastCapturedImage(base64: string): void {
        this.lastCapturedBase64 = base64;
        print('CollectionManager: Last captured image set — '
            + (base64 ? Math.round((base64.length * 0.75) / 1024) : 0) + ' KB');
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
        if (this.isCollectionOpen && this.isCarouselVisuallyOpen()) {
            this.hideCollection();
        } else {
            this.showCollection();
        }
    }

    /** Reconnects runtime button callbacks after the orchestrator has wired helpers. */
    refreshButtonConnections(): void {
        this.setupSaveButton();
        this.hookOutfitBuilderButtons();
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
            if (script.enabled === false) continue;
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
        for (let i = 0; i < this.savedVehicles.length; i++) {
            const serial = this.savedVehicles[i]?.serial || '';
            if (serial.length > 0) this.rememberDeletedSerial(serial);
        }

        // Cloud reset: deletes vehicles and storage images
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
                    global.persistentStorageSystem.store.putString(this.GARMENT_CUTOUT_KEY_PREFIX + savedAt.toString(), '');
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
        this.garmentPlaceholderButtonConnected = [];
        this.garmentSlotToSavedIndex = [];
        this.outfitSlotToSavedIndex = this.createEmptyOutfitSlots();
        this.garmentPageIndex = 0;
        this.clearRuntimeGarmentPlaceholders();

        if (this.cardInteraction) this.cardInteraction.setGrabbedCardIndex(-1);

        this.saveCollectionToStorage();
        this.clearOutfitSlotsFromStorage();
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
        if (serial && serial.length > 0) this.rememberDeletedSerial(serial);

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
                global.persistentStorageSystem.store.putString(this.GARMENT_CUTOUT_KEY_PREFIX + savedAt.toString(), '');
            } catch (e) { /* ignore */ }
        }

        // Remove from parallel arrays
        this.savedVehicles.splice(idx, 1);
        this.collectionCardObjects.splice(idx, 1);
        this.cardStates.splice(idx, 1);
        this.cardImageReady.splice(idx, 1);
        this.cardFrameHooked.splice(idx, 1);
        this.reviewButtonHooked.splice(idx, 1);
        this.adjustOutfitSlotsAfterCardDelete(idx);
        this.clampGarmentPageIndex();

        // Adjust grabbed index
        if (this.cardInteraction) {
            const grabbed = this.cardInteraction.getGrabbedCardIndex();
            if (grabbed === idx) this.cardInteraction.setGrabbedCardIndex(-1);
            else if (grabbed > idx) this.cardInteraction.setGrabbedCardIndex(grabbed - 1);
        }

        this.saveCollectionToStorage();
        this.rebuildGarmentPlaceholdersFromStorage();
        this.updateGarmentPlaceholderVisibility();
        if (this.isCollectionOpen) {
            this.layoutCircularCards();
            this.showOutfitBuilderContainer();
        }
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
        if (this.confirmResetProfileContainer) this.walkAndTranslate(this.confirmResetProfileContainer);
        for (let i = 0; i < this.collectionCardObjects.length; i++) {
            const card = this.collectionCardObjects[i];
            if (card) this.translateCardStaticTexts(card);
        }
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
                } else if (name.indexOf('Reset your closet') >= 0 || name.indexOf('reset your closet') >= 0) {
                    textComp.text = t('reset_question');
                } else {
                    const translated = translateStaticTextForObject(name, textComp.text);
                    if (translated !== textComp.text) textComp.text = translated;
                }
            }
        } catch (e) { /* no text component */ }
        const count = obj.getChildrenCount();
        for (let i = 0; i < count; i++) {
            const child = obj.getChild(i);
            if (child) this.walkAndTranslate(child);
        }
    }

    /** Close all popup containers (confirm delete, confirm reset). */
    closeAllPopups(): void {
        if (this.confirmDeleteContainer) {
            this.confirmDeleteContainer.enabled = false;
            this.deleteTargetCardIndex = -1;
        }
        if (this.confirmResetProfileContainer) {
            this.confirmResetProfileContainer.enabled = false;
        }
    }

    // =====================================================================
    // SAVE VEHICLE TO COLLECTION
    // =====================================================================

    private buildUniqueSavedItemName(rawName: string): string {
        const baseName = (rawName || 'Unknown item').trim() || 'Unknown item';
        const baseKey = this.normalizeDuplicateItemName(baseName);
        let existingCount = 0;

        for (let i = 0; i < this.savedVehicles.length; i++) {
            const item = this.savedVehicles[i];
            if (!item) continue;
            const savedName = item.item_name || item.brand_model || '';
            if (this.normalizeDuplicateItemName(savedName) === baseKey) {
                existingCount++;
            }
        }

        return existingCount > 0 ? baseName + ' #' + (existingCount + 1) : baseName;
    }

    private normalizeDuplicateItemName(name: string): string {
        return String(name || '')
            .toLowerCase()
            .replace(/\s+#\d+$/g, '')
            .replace(/\s+/g, ' ')
            .trim();
    }

    private async onSaveButtonPressed(): Promise<void> {
        if (this.isSavingCard || this.isRevealAnimating) {
            if (this.onShowDescription) this.onShowDescription(t('save_in_progress'));
            return;
        }
        this.isSavingCard = true;
        if (!this.lastVehicleData) {
            print('CollectionManager: Save ignored — no lastVehicleData. Scan a garment first.');
            if (this.onShowDescription) this.onShowDescription(t('scan_first_save'));
            this.isSavingCard = false;
            return;
        }
        if (!this.verticalCardPrefab) {
            if (this.onShowDescription) this.onShowDescription(t('error_prefab'));
            this.isSavingCard = false;
            return;
        }
        const maxSize = this.maxCollectionSize || 100;
        if (this.savedVehicles.length >= maxSize) {
            if (this.onShowAnimatedDescription) {
                this.onShowAnimatedDescription(tf('max_cards', { max: maxSize }));
            } else if (this.onShowDescription) {
                this.onShowDescription(tf('max_cards', { max: maxSize }));
            }
            this.isSavingCard = false;
            return;
        }

        // Mirror / full outfit: generate one collector card per worn garment
        if (this.lastVehicleData.mode === 'full_look'
            && this.lastVehicleData.items && this.lastVehicleData.items.length >= 2) {
            this.saveFullLookAsCards();   // takes over; manages isSavingCard
            return;
        }

        try {
            const rawVehicleName = this.lastVehicleData.item_name || this.lastVehicleData.brand_model || 'Unknown item';
            const vehicleName = this.buildUniqueSavedItemName(rawVehicleName);
            if (this.onShowDescription) this.onShowDescription(tf('saving', { name: vehicleName }));

            const scanTimestamp = Date.now();
            const visibleNote = this.onGetCurrentNote ? (this.onGetCurrentNote() || '') : (this.lastVehicleData.user_note || '');
            const previousUserNote = this.lastVehicleData.user_note || '';
            this.lastVehicleData.user_note = '';
            const pairingNote = this.buildPairingNote(this.lastVehicleData);
            const aiNote = this.buildDisplayNote(this.lastVehicleData, pairingNote);
            const userNote = visibleNote.length > 0 && visibleNote !== aiNote ? visibleNote : previousUserNote;
            this.lastVehicleData.user_note = userNote;
            const capturedPhotoBase64 = this.lastCapturedBase64 || '';
            if (capturedPhotoBase64.length === 0) {
                print('CollectionManager: Save warning — scan data exists but captured image base64 is empty');
            }
            const savedData: SavedVehicleData = {
                vehicle_found: this.lastVehicleData.vehicle_found,
                clothing_found: this.lastVehicleData.clothing_found,
                mode: this.lastVehicleData.mode || 'single_item',
                scan_context: this.lastVehicleData.scan_context || 'unknown',
                brand: this.lastVehicleData.brand,
                brand_model: vehicleName,
                item_name: vehicleName,
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
                imageGenerated: false,
                serial: generateSerial(),
                dateScanned: formatScanDate(scanTimestamp),
                cityScanned: this.cachedCity,
            };

            print('CollectionManager: Card saved — serial=' + savedData.serial
                + ' date="' + savedData.dateScanned + '" city="' + savedData.cityScanned + '"');
            this.savedVehicles.push(savedData);
            this.enterGarmentInventoryMode();
            this.hideGarmentPlaceholderContainer();
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
            const savedSlotIndex = this.savedVehicles.length - 1;
            this.updateGarmentPlaceholderForSavedItem(savedData, savedSlotIndex, capturedPhotoBase64, texture, cardObj);

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

        this.enterGarmentOutfitMode();
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
        this.resetOutfitTesterSlots();
        this.showOutfitBuilderContainer();
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
        this.hideGarmentPlaceholderContainer();
        this.stopCollectionUpdateLoop();
        this.updateDeleteButtonVisibility();

        if (this.onShowDescription) this.onShowDescription(t('collection_closed'));
        if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(1.5);
    }

    // =====================================================================
    // CARD IMAGE PERSISTENCE
    // =====================================================================

    /**
     * Reads a card image base64 from persistent storage by savedAt key.
     * Returns null if no image exists.
     */
    getCardImageBase64(savedAt: number): string | null {
        if (!savedAt) return null;
        try {
            const cutoutKey = this.GARMENT_CUTOUT_KEY_PREFIX + savedAt.toString();
            const cutoutB64 = global.persistentStorageSystem.store.getString(cutoutKey);
            if (cutoutB64 && cutoutB64.length > 0) return cutoutB64;

            const storageKey = this.IMAGE_KEY_PREFIX + savedAt.toString();
            const b64 = global.persistentStorageSystem.store.getString(storageKey);
            if (!b64 || b64.length === 0) return null;
            return b64;
        } catch (e) {
            return null;
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
            this.cardInteraction.onCardDroppedOnOutfitSlot = (cardIndex: number, cardObj: SceneObject) => {
                return this.tryAssignDraggedCardToOutfitSlot(cardIndex, cardObj);
            };
        }
        this.collectionUpdateEvent = this.createEvent('UpdateEvent');
        this.collectionUpdateEvent.bind(() => {
            if (!this.isCollectionOpen) return;
            this.tryTriggerCardMoreInfoFromPinch();
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
            this.cardInteraction.onCardDroppedOnOutfitSlot = (cardIndex: number, cardObj: SceneObject) => {
                return this.tryAssignDraggedCardToOutfitSlot(cardIndex, cardObj);
            };
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
                    this.forceTextBlack(tc);
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
                this.forceTextBlack(tc);
            }
        }

        // Stat bars
        this.updateStatBar(findChildByName(cardObj, 'Top Speed Bar'), data.top_speed);
        this.updateStatBar(findChildByName(cardObj, 'Acceleration Bar'), data.acceleration);
        this.updateStatBar(findChildByName(cardObj, 'Braking Bar'), data.braking);
        this.updateStatBar(findChildByName(cardObj, 'Traction Bar'), data.traction);
        this.updateStatBar(findChildByName(cardObj, 'Comfort Bar'), data.comfort);

        // In Closet Club, this slot is used by the collector-card prefab as the
        // decorative polaroid overlay, so we keep it untouched here.
        const noteText = this.buildDisplayNote(data, data.pairing_note || '');
        this.setOptionalCardText(cardObj, 'Style Notes', noteText);
        this.setOptionalCardText(cardObj, 'Card Notes', noteText);
        this.setOptionalCardText(cardObj, 'User Note', data.user_note || '');
        this.setOptionalCardText(cardObj, 'Car Review', tf('card_review_placeholder', { item: displayName }));
        this.setButtonLabel(cardObj, 'Review Button', t('get_more_info_button'));

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

        this.translateCardStaticTexts(cardObj);
    }

    private setOptionalCardText(cardObj: SceneObject, childName: string, text: string): void {
        const obj = findChildByName(cardObj, childName);
        if (!obj) return;
        const tc = obj.getComponent('Component.Text') as Text;
        if (tc) {
            tc.text = text;
            this.forceTextBlack(tc);
        }
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
            this.forceTextBlack(tc);
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

    private translateCardStaticTexts(cardObj: SceneObject): void {
        this.walkAndTranslateCardText(cardObj, 0);
    }

    private walkAndTranslateCardText(obj: SceneObject, depth: number): void {
        if (!obj || depth > 40) return;
        const tc = obj.getComponent('Component.Text') as Text;
        if (tc) {
            const translated = translateStaticTextForObject(obj.name, tc.text);
            if (translated !== tc.text) {
                tc.text = translated;
            }
        }

        const childCount = obj.getChildrenCount();
        for (let i = 0; i < childCount; i++) {
            const child = obj.getChild(i);
            if (child) this.walkAndTranslateCardText(child, depth + 1);
        }
    }

    private applyTrustColorToText(textComp: Text): void {
        this.forceTextBlack(textComp);
    }

    private forceTextBlack(textComp: Text | null): void {
        if (!textComp) return;
        try {
            textComp.textFill.color = new vec4(0, 0, 0, 1);
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
                this.forceTextBlack(tc);
            }
        }
    }

    // =====================================================================
    // CARD INFO BUTTON HOOKING — Deferred until collection is opened
    // =====================================================================

    /**
     * Hooks the "Review Button" object on all collector cards that haven't been hooked yet.
     * The object keeps its scene name for prefab compatibility, but the visible
     * user action is now "Get More Info".
     * Called from showCollection() AFTER cards are enabled, with a short delay
     * to let the RectangleButton ScriptComponent initialize.
     *
     * The RectangleButton needs the card to be enabled for several frames
     * before its onTriggerUp event becomes available.
     */
    private hookPendingReviewButtons(): void {
        const maxAttempts = 120;
        let waitFrames = 0;
        const pollEvent = this.createEvent('UpdateEvent');
        pollEvent.bind(() => {
            waitFrames++;
            // Wait a few frames for UIKit/SIK button scripts to initialize, then keep
            // retrying because freshly-instantiated prefab buttons can come online late.
            if (waitFrames < 3) return;

            let pending = 0;
            for (let i = 0; i < this.collectionCardObjects.length; i++) {
                if (this.reviewButtonHooked[i]) continue;
                const card = this.collectionCardObjects[i];
                if (!card || !card.enabled) continue;
                if (i >= this.savedVehicles.length) continue;

                if (!this.tryHookReviewButton(card, i)) pending++;
            }

            if (pending === 0 || waitFrames >= maxAttempts) {
                pollEvent.enabled = false;
            }
        });
    }

    /**
     * A real button press can briefly mark the card as PICKED before this callback
     * arrives, so both collection and transient picked states are allowed here.
     */
    private canTriggerCardInfo(cardIndex: number): boolean {
        const state = this.cardStates[cardIndex] || this.STATE_IN_COLLECTION;
        return state === this.STATE_IN_COLLECTION || state === this.STATE_PICKED;
    }

    private triggerCardMoreInfo(cardIndex: number, data: SavedVehicleData, cardReviewText: Text | null, source: string): void {
        if (!this.canTriggerCardInfo(cardIndex)) {
            print('CollectionManager: [INFO] Ignored (' + source + ') - card is not available');
            return;
        }

        print('CollectionManager: [INFO] Get More Info pressed (' + source + ') for ' + (data.brand_model || '?'));
        if (!cardReviewText) {
            print('CollectionManager: [INFO] Ignored (' + source + ') - Car Review text missing on this vertical card');
            return;
        }

        this.setVerticalCardReviewText(cardReviewText, t('loading_info'));
        this.cancelCardGrabForButtonCombine(cardIndex);

        if (this.onReviewVehicle) {
            this.onReviewVehicle(data, cardReviewText);
        } else {
            const fallback = this.buildDisplayNote(data, data.pairing_note || '') || t('no_info_available');
            this.setVerticalCardReviewText(cardReviewText, fallback);
        }
    }

    private triggerCombineLook(cardIndex: number, data: SavedVehicleData, cardReviewText: Text | null, source: string): void {
        if (!this.canTriggerCardInfo(cardIndex)) {
            print('CollectionManager: [COMBINE] Ignored (' + source + ') - card is not available');
            return;
        }

        print('CollectionManager: [COMBINE] Legacy outfit combine pressed (' + source + ') for ' + (data.brand_model || '?'));
        if (cardReviewText) this.setVerticalCardReviewText(cardReviewText, t('composing_outfit_ai'));
        this.cancelCardGrabForButtonCombine(cardIndex);
        this.enterGarmentOutfitMode();
        this.showOutfitBuilderContainer();
        this.composeOutfitWithAI(cardIndex, cardReviewText);
    }

    private cancelCardGrabForButtonCombine(cardIndex: number): void {
        if (cardIndex < 0 || cardIndex >= this.collectionCardObjects.length) return;
        this.cardStates[cardIndex] = this.STATE_IN_COLLECTION;
        this.combineButtonSuppressDropIndex = cardIndex;
        this.combineButtonSuppressDropUntil = getTime() + 1.0;
        if (this.cardInteraction && this.cardInteraction.getGrabbedCardIndex() === cardIndex) {
            this.cardInteraction.setGrabbedCardIndex(-1);
        }

        const card = this.collectionCardObjects[cardIndex];
        if (!card) return;
        try {
            if (this.collectionRoot && card.getParent() !== this.collectionRoot) {
                card.setParent(this.collectionRoot);
            }
            card.enabled = true;
            if (this.cardInteraction) {
                const scale = this.cardInteraction.collectionCardScale;
                card.getTransform().setLocalScale(new vec3(scale, scale, scale));
            }
        } catch (e) { /* best-effort reset after button press */ }
    }

    private showLookCombinationInGarmentPlaceholder(targetIndex: number, matchIndexes: number[]): void {
        this.showLookCombinationInOutfitTester(targetIndex, matchIndexes);
    }

    private showLookCombinationInOutfitTester(targetIndex: number, matchIndexes: number[]): void {
        const displayIndexes = this.buildClosetCombinationIndexes(targetIndex, matchIndexes);
        if (displayIndexes.length < 2) {
            if (this.onShowDescription) this.onShowDescription(t('combine_need_more_items'));
            if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(2.5);
            return;
        }

        this.enterGarmentOutfitMode();
        this.resetOutfitTesterSlots();
        this.assignIndexesToOutfitSlots(displayIndexes);
        this.showOutfitBuilderContainer();

        if (this.onShowDescription) {
            this.onShowDescription(tf('look_options_ready', { count: displayIndexes.length - 1 }));
        }
        if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(2.0);
    }

    private assignIndexesToOutfitSlots(savedIndexes: number[]): void {
        const usedSlots: number[] = [];
        for (let i = 0; i < savedIndexes.length; i++) {
            const savedIndex = savedIndexes[i];
            if (savedIndex < 0 || savedIndex >= this.savedVehicles.length) continue;
            const slotIndex = this.getPreferredOutfitSlotForItem(this.savedVehicles[savedIndex]);
            if (slotIndex < 0) continue;
            if (usedSlots.indexOf(slotIndex) >= 0) continue;
            usedSlots.push(slotIndex);
            this.assignSavedItemToOutfitSlot(slotIndex, savedIndex, false);
        }
    }

    private findFirstOpenOutfitSlot(usedSlots: number[]): number {
        for (let i = 0; i < this.getOutfitSlotCount(); i++) {
            if (usedSlots.indexOf(i) < 0) return i;
        }
        return -1;
    }

    private buildClosetCombinationIndexes(targetIndex: number, matchIndexes: number[]): number[] {
        if (targetIndex < 0 || targetIndex >= this.savedVehicles.length) return [];

        let bestMatchIndex = -1;
        for (let i = 0; i < matchIndexes.length; i++) {
            const idx = matchIndexes[i];
            if (idx >= 0 && idx < this.savedVehicles.length && idx !== targetIndex) {
                bestMatchIndex = idx;
                break;
            }
        }
        if (bestMatchIndex < 0) return [targetIndex];

        return this.orderLookPairForTopBottom(targetIndex, bestMatchIndex);
    }

    private orderLookPairForTopBottom(firstIndex: number, secondIndex: number): number[] {
        const first = this.savedVehicles[firstIndex];
        const second = this.savedVehicles[secondIndex];
        if (!first || !second) return [firstIndex, secondIndex];

        const firstType = this.getLookCategoryText(first);
        const secondType = this.getLookCategoryText(second);
        const firstBottom = this.isLookBottomLike(firstType);
        const secondBottom = this.isLookBottomLike(secondType);

        if (firstBottom && !secondBottom) return [secondIndex, firstIndex];
        if (secondBottom && !firstBottom) return [firstIndex, secondIndex];

        return [firstIndex, secondIndex];
    }

    private buildClosetCombinationPercents(targetIndex: number, displayIndexes: number[]): number[] {
        const result: number[] = [];
        const target = this.savedVehicles[targetIndex];
        for (let i = 0; i < displayIndexes.length; i++) {
            const idx = displayIndexes[i];
            if (idx === targetIndex || !target || !this.savedVehicles[idx]) {
                result.push(0);
            } else {
                result.push(this.getLookCombinationPercent(target, this.savedVehicles[idx]));
            }
        }
        return result;
    }

    private getLookCombinationPercent(target: SavedVehicleData, candidate: SavedVehicleData): number {
        const score = this.scoreLookCombination(target, candidate);
        return Math.max(55, Math.min(98, Math.round(58 + score * 5)));
    }

    private getBestLookCombinationIndexes(targetIndex: number, maxMatches: number): number[] {
        if (targetIndex < 0 || targetIndex >= this.savedVehicles.length) return [];
        const target = this.savedVehicles[targetIndex];
        if (!target) return [];

        const scored: Array<{ index: number; score: number }> = [];
        for (let i = 0; i < this.savedVehicles.length; i++) {
            if (i === targetIndex) continue;
            const candidate = this.savedVehicles[i];
            if (!candidate) continue;
            scored.push({
                index: i,
                score: this.scoreLookCombination(target, candidate),
            });
        }

        scored.sort((a, b) => {
            if (b.score !== a.score) return b.score - a.score;
            return a.index - b.index;
        });

        const result: number[] = [];
        const limit = Math.max(1, maxMatches || 1);
        for (let i = 0; i < scored.length && result.length < limit; i++) {
            result.push(scored[i].index);
        }
        return result;
    }

    private scoreLookCombination(target: SavedVehicleData, candidate: SavedVehicleData): number {
        const targetType = this.getLookCategoryText(target);
        const candidateType = this.getLookCategoryText(candidate);
        const targetFamily = this.getLookFamily(targetType);
        const candidateFamily = this.getLookFamily(candidateType);
        let score = 0;

        score += this.getLookFamilyPairScore(targetFamily, candidateFamily);
        if (targetFamily === candidateFamily) {
            if (targetFamily === 'top' || targetFamily === 'bottom' || targetFamily === 'shoe') score -= 8;
            else if (targetFamily === 'outerwear') score -= 5;
            else if (targetFamily === 'accessory') score -= 3;
        }

        score += this.getLookColorHarmonyScore(target.color || '', candidate.color || '');
        if (target.style_tags && candidate.style_tags && this.hasSharedLookTag(target.style_tags, candidate.style_tags)) score += 4;
        if (target.occasion_tags && candidate.occasion_tags && this.hasSharedLookTag(target.occasion_tags, candidate.occasion_tags)) score += 3;
        if (target.season_tags && candidate.season_tags && this.hasSharedLookTag(target.season_tags, candidate.season_tags)) score += 1;
        if (target.material && candidate.material && String(target.material).toLowerCase() !== String(candidate.material).toLowerCase()) score += 1;
        if (target.pattern && candidate.pattern && String(target.pattern).toLowerCase() !== String(candidate.pattern).toLowerCase()) score += 1;

        return score;
    }

    private showLookCombinationCards(targetIndex: number, matchIndexes: number[]): void {
        const displayIndexes = this.buildLookDisplayIndexes(targetIndex, matchIndexes);
        if (displayIndexes.length === 0) return;

        if (!this.isCollectionOpen || !this.isCarouselVisuallyOpen()) {
            this.showCollection();
        }
        this.ensureCollectionRoot();
        if (this.collectionRoot) this.collectionRoot.enabled = true;
        if (this.cardInteraction) this.cardInteraction.setGrabbedCardIndex(-1);
        this.stopCollectionUpdateLoop();

        const collectionScale = this.cardInteraction ? this.cardInteraction.collectionCardScale : 0.18;
        const positions = this.getLookMixPositions(displayIndexes.length);

        for (let i = 0; i < this.collectionCardObjects.length; i++) {
            const card = this.collectionCardObjects[i];
            if (!card) continue;

            const selectedOrder = displayIndexes.indexOf(i);
            if (selectedOrder < 0) {
                if ((this.cardStates[i] || this.STATE_IN_COLLECTION) !== this.STATE_PLACED_IN_WORLD) {
                    card.enabled = false;
                }
                continue;
            }

            this.cardStates[i] = this.STATE_IN_COLLECTION;
            if (this.collectionRoot && card.getParent() !== this.collectionRoot) {
                card.setParent(this.collectionRoot);
            }
            card.enabled = true;
            enableAllDescendants(card);
            if (i < this.savedVehicles.length) this.reapplyCardStatBars(card, this.savedVehicles[i]);

            const isTarget = i === targetIndex;
            const pos = positions[selectedOrder];
            const scale = isTarget ? collectionScale * 1.18 : collectionScale * 0.86;
            const transform = card.getTransform();
            transform.setLocalPosition(pos);
            transform.setLocalRotation(quat.fromEulerAngles(0, 0, 0));
            transform.setLocalScale(new vec3(scale, scale, scale));
        }

        this.isCollectionOpen = true;
        this.updateCollectionButtonLabel();
        this.hookPendingReviewButtons();
        if (this.onShowDescription) this.onShowDescription(tf('look_mix_ready', { count: displayIndexes.length }));
        if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(2.0);
        print('CollectionManager: [COMBINE] Visual look mix indexes=' + displayIndexes.join(','));
    }

    private buildLookDisplayIndexes(targetIndex: number, matchIndexes: number[]): number[] {
        const result: number[] = [];
        if (matchIndexes.length > 0) result.push(matchIndexes[0]);
        result.push(targetIndex);
        if (matchIndexes.length > 1) result.push(matchIndexes[1]);

        const deduped: number[] = [];
        for (let i = 0; i < result.length; i++) {
            const idx = result[i];
            if (idx < 0 || idx >= this.collectionCardObjects.length) continue;
            if (deduped.indexOf(idx) < 0) deduped.push(idx);
        }
        return deduped;
    }

    private getLookMixPositions(count: number): vec3[] {
        if (count <= 1) return [new vec3(0, 0, 2.2)];
        if (count === 2) return [new vec3(-1.45, 0, 2.25), new vec3(1.45, 0, 2.25)];
        return [new vec3(-2.35, 0, 2.45), new vec3(0, 0, 2.05), new vec3(2.35, 0, 2.45)];
    }

    private getLookCategoryText(item: SavedVehicleData): string {
        return [
            item.category || '',
            item.type || '',
            item.subcategory || '',
            item.mode || '',
            item.item_name || '',
            item.brand_model || '',
        ].join(' ').toLowerCase();
    }

    private getLookFamily(text: string): string {
        if (this.isLookBottomLike(text)) return 'bottom';
        if (this.isLookTopLike(text)) return 'top';
        if (this.isLookShoeLike(text)) return 'shoe';
        if (this.isLookOuterwearLike(text)) return 'outerwear';
        if (this.isLookAccessoryLike(text)) return 'accessory';
        if (this.isLookDressLike(text)) return 'dress';
        if (this.isLookFullOutfit(text)) return 'full';
        return 'unknown';
    }

    private getLookFamilyPairScore(a: string, b: string): number {
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
        if (a === 'full' || b === 'full') return 1;
        return 0;
    }

    private getLookColorHarmonyScore(a: string, b: string): number {
        const aColors = this.getLookColorKeywords(a);
        const bColors = this.getLookColorKeywords(b);
        if (aColors.length === 0 || bColors.length === 0) return 0;

        if (this.hasSharedLookTag(aColors, bColors)) {
            return (this.hasNeutralLookColor(aColors) || this.hasNeutralLookColor(bColors)) ? 2 : 1;
        }
        if (this.hasNeutralLookColor(aColors) || this.hasNeutralLookColor(bColors)) return 3;
        if (this.hasComplementaryLookColors(aColors, bColors)) return 3;
        if (this.hasAnalogousLookColors(aColors, bColors)) return 2;
        return -4;
    }

    private getLookColorKeywords(text: string): string[] {
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

    private hasNeutralLookColor(colors: string[]): boolean {
        const neutrals = ['black', 'white', 'cream', 'beige', 'tan', 'brown', 'gray', 'grey', 'navy', 'denim'];
        return this.hasSharedLookTag(colors, neutrals);
    }

    private hasComplementaryLookColors(a: string[], b: string[]): boolean {
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

    private hasAnalogousLookColors(a: string[], b: string[]): boolean {
        return this.hasColorPair(a, b, 'blue', 'green')
            || this.hasColorPair(a, b, 'blue', 'purple')
            || this.hasColorPair(a, b, 'red', 'pink')
            || this.hasColorPair(a, b, 'orange', 'brown')
            || this.hasColorPair(a, b, 'yellow', 'green')
            || this.hasColorPair(a, b, 'olive', 'green')
            || this.hasColorPair(a, b, 'tan', 'brown')
            || this.hasColorPair(a, b, 'cream', 'beige');
    }

    private hasColorPair(a: string[], b: string[], first: string, second: string): boolean {
        return (a.indexOf(first) >= 0 && b.indexOf(second) >= 0)
            || (a.indexOf(second) >= 0 && b.indexOf(first) >= 0);
    }

    private hasSharedLookTag(a: string[], b: string[]): boolean {
        for (let i = 0; i < a.length; i++) {
            const av = String(a[i]).toLowerCase();
            for (let j = 0; j < b.length; j++) {
                if (av === String(b[j]).toLowerCase()) return true;
            }
        }
        return false;
    }

    private hasLookWord(text: string, words: string[]): boolean {
        for (let i = 0; i < words.length; i++) {
            if (text.indexOf(words[i]) >= 0) return true;
        }
        return false;
    }

    private isLookTopLike(text: string): boolean {
        return this.hasLookWord(text, ['top', 'shirt', 't-shirt', 'tee', 'sweater', 'sweatshirt', 'blouse', 'hoodie', 'knit', 'camisa', 'remera', 'pullover']);
    }

    private isLookBottomLike(text: string): boolean {
        return this.hasLookWord(text, ['bottom', 'pants', 'jeans', 'trouser', 'skirt', 'shorts', 'denim', 'pantal', 'falda']);
    }

    private isLookShoeLike(text: string): boolean {
        return this.hasLookWord(text, ['shoe', 'sneaker', 'boot', 'loafer', 'heel', 'zapato', 'zapatilla', 'bota']);
    }

    private isLookOuterwearLike(text: string): boolean {
        return this.hasLookWord(text, ['outerwear', 'jacket', 'coat', 'blazer', 'cardigan', 'chaqueta', 'abrigo']);
    }

    private isLookAccessoryLike(text: string): boolean {
        return this.hasLookWord(text, ['accessory', 'accessories', 'bag', 'belt', 'hat', 'cap', 'glasses', 'sunglasses', 'scarf', 'jewelry', 'accesorio', 'accesorios', 'bolso', 'cinturon']);
    }

    private isLookDressLike(text: string): boolean {
        return this.hasLookWord(text, ['dress', 'vestido']);
    }

    private isLookFullOutfit(text: string): boolean {
        return this.hasLookWord(text, ['look', 'outfit', 'full_look']);
    }

    /**
     * Attempts to connect the Get More Info action on a specific collector card.
     * Finds the existing "Review Button" scene object and the "Car Review" Text
     * child, then wires the button to ask the AI for this garment's note.
     */
    private tryHookReviewButton(cardObj: SceneObject, cardIndex: number): boolean {
        const reviewBtnObj = this.findCollectorCombineButton(cardObj);
        if (!reviewBtnObj) {
            print('CollectionManager: [INFO] Get More Info button not found in card #' + cardIndex);
            return false;
        }

        const resolveCarReviewText = (): Text | null => {
            const carReviewObj = findChildByName(cardObj, 'Car Review');
            if (!carReviewObj) return null;
            return this.findFirstTextInSubtree(carReviewObj, 0);
        };

        const data = this.savedVehicles[cardIndex];
        const callback = (source: string) => {
            const currentIndex = this.collectionCardObjects.indexOf(cardObj);
            const idx = currentIndex >= 0 ? currentIndex : cardIndex;
            const currentData = this.savedVehicles[idx] || data;
            if (!currentData) {
                print('CollectionManager: [INFO] Ignored (' + source + ') - card data missing');
                return;
            }
            this.triggerCardMoreInfo(idx, currentData, resolveCarReviewText(), source);
        };

        let lastInvokeTime = -1000;
        const debouncedCallback = (source: string) => {
            const now = getTime();
            if (now - lastInvokeTime < 0.35) return;
            lastInvokeTime = now;
            callback(source);
        };

        // Collector-card buttons can be UIKit CapsuleButtons, SIK interactables,
        // or nested prefabs. Hook all compatible events and debounce the result.
        const connected = this.connectCollectorInfoButton(reviewBtnObj, debouncedCallback, 'CardInfo_' + cardIndex);
        if (connected) {
            this.reviewButtonHooked[cardIndex] = true;
            print('CollectionManager: [INFO] Get More Info connected for ' + (data.brand_model || '?'));
            return true;
        }

        // Last resort: use the shared connector utility.
        const fallbackConnected = this.connectButtonFallbackRecursive(reviewBtnObj, () => {
            debouncedCallback('fallback');
        }, 'CardInfoFallback_' + cardIndex, 0);
        if (fallbackConnected) {
            this.reviewButtonHooked[cardIndex] = true;
            print('CollectionManager: [INFO] Button connected (fallback) for ' + (data.brand_model || '?'));
            return true;
        }

        print('CollectionManager: [INFO] Could not hook Get More Info button for card #' + cardIndex
            + ' (' + (data.brand_model || '?') + ') — will retry next collection open');
        return false;
    }

    private findCollectorCombineButton(cardObj: SceneObject): SceneObject | null {
        const names = ['Review Button', 'Get More Info', 'Info Button', 'Combine Button', 'Combine Look Button', 'Look Button'];
        for (let i = 0; i < names.length; i++) {
            const found = findChildByName(cardObj, names[i]);
            if (found) return found;
        }
        return this.findButtonByVisibleText(cardObj, ['info', 'more', 'mas', 'plus', 'combine', 'combinar', 'combiner'], 0);
    }

    private tryTriggerCardMoreInfoFromPinch(): boolean {
        if (!this.cardInteraction) return false;
        const pinch = this.cardInteraction.getRightPinchInfo();
        if (!pinch) {
            this.infoButtonPinchWasDown = false;
            return false;
        }

        if (!pinch.isPinching) {
            this.infoButtonPinchWasDown = false;
            return false;
        }
        if (this.infoButtonPinchWasDown) return false;
        this.infoButtonPinchWasDown = true;

        const now = getTime();
        if (now < this.infoButtonPinchCooldownUntil) return false;

        const hit = this.findCardInfoButtonAtPoint(pinch.center);
        if (!hit) return false;

        this.infoButtonPinchCooldownUntil = now + 0.9;
        this.cardInteraction.suppressPinchGrabAssist(0.8);
        this.triggerCardMoreInfo(hit.cardIndex, hit.data, hit.cardReviewText, 'pinchHitArea');
        return true;
    }

    private setupCardInfoTapFallback(): void {
        const handleTap = (screenPoint: vec2, source: string) => {
            if (!this.isCollectionOpen) return;

            const now = getTime();
            if (now < this.infoButtonTapCooldownUntil) return;

            const hit = this.findCardInfoButtonAtScreenPoint(screenPoint);
            if (!hit) return;

            this.infoButtonTapCooldownUntil = now + 0.6;
            if (this.cardInteraction) this.cardInteraction.suppressPinchGrabAssist(0.4);
            this.triggerCardMoreInfo(hit.cardIndex, hit.data, hit.cardReviewText, source);
        };

        const tapEvent = this.createEvent('TapEvent');
        tapEvent.bind((eventData: any) => {
            try {
                if (eventData && typeof eventData.getTapPosition === 'function') {
                    handleTap(eventData.getTapPosition(), 'tapFallback');
                }
            } catch (e) {
                print('CollectionManager: [INFO] tap fallback error: ' + e);
            }
        });

        const touchEndEvent = this.createEvent('TouchEndEvent');
        touchEndEvent.bind((eventData: any) => {
            try {
                if (eventData && typeof eventData.getTouchPosition === 'function') {
                    handleTap(eventData.getTouchPosition(), 'touchEndFallback');
                }
            } catch (e) {
                print('CollectionManager: [INFO] touch fallback error: ' + e);
            }
        });
    }

    private setupOutfitTesterTapFallback(): void {
        const handleTap = (screenPoint: vec2, source: string) => {
            if (!this.isCollectionOpen) return;
            const outfitRoot = this.getOutfitTesterContainer(false);
            if (!outfitRoot || !outfitRoot.enabled) return;

            const now = getTime();
            if (now < this.outfitButtonTapCooldownUntil) return;

            const button = this.findOutfitCombineButton(outfitRoot);
            if (!button) return;
            if (!this.isSceneObjectNearScreenPoint(button, screenPoint, 0.11)) return;

            this.outfitButtonTapCooldownUntil = now + 0.7;
            this.onAskOutfitPressed();
            print('CollectionManager: [OUTFIT] Combine Looks pressed (' + source + ')');
        };

        const tapEvent = this.createEvent('TapEvent');
        tapEvent.bind((eventData: any) => {
            try {
                if (eventData && typeof eventData.getTapPosition === 'function') {
                    handleTap(eventData.getTapPosition(), 'tapFallback');
                }
            } catch (e) {
                print('CollectionManager: [OUTFIT] tap fallback error: ' + e);
            }
        });

        const touchEndEvent = this.createEvent('TouchEndEvent');
        touchEndEvent.bind((eventData: any) => {
            try {
                if (eventData && typeof eventData.getTouchPosition === 'function') {
                    handleTap(eventData.getTouchPosition(), 'touchEndFallback');
                }
            } catch (e) {
                print('CollectionManager: [OUTFIT] touch fallback error: ' + e);
            }
        });
    }

    private findOutfitCombineButton(outfitRoot: SceneObject): SceneObject | null {
        if (this.outfitCombineButtonObj && this.outfitCombineButtonObj.enabled) return this.outfitCombineButtonObj;
        const found = this.findFirstSceneObjectByNames(outfitRoot, [
            'Combine Looks',
            'Combine Looks Button',
            'Combine',
            'Combine Button',
            'Compose',
            'Compose Button',
            'Analyze Outfit',
            'Analyze Outfit Button',
        ]) || this.findButtonByVisibleText(outfitRoot, ['combine looks', 'combine', 'combinar', 'combiner', 'compose', 'analyze'], 0);
        this.outfitCombineButtonObj = found;
        return found;
    }

    private isSceneObjectNearScreenPoint(obj: SceneObject, screenPoint: vec2, hitRadius: number): boolean {
        const cameras = this.findEnabledCameras();
        if (cameras.length === 0) return false;

        let objPos: vec3;
        try {
            objPos = obj.getTransform().getWorldPosition();
        } catch (e) {
            return false;
        }

        const hitRadiusSq = hitRadius * hitRadius;
        for (let i = 0; i < cameras.length; i++) {
            try {
                const projected = cameras[i].worldSpaceToScreenSpace(objPos);
                if (!projected || projected.x < -0.1 || projected.x > 1.1 || projected.y < -0.1 || projected.y > 1.1) continue;
                const dx = projected.x - screenPoint.x;
                const dy = projected.y - screenPoint.y;
                if (dx * dx + dy * dy <= hitRadiusSq) return true;
            } catch (e) { /* ignore this camera */ }
        }
        return false;
    }

    private findCardInfoButtonAtPoint(worldPoint: vec3): { cardIndex: number; data: SavedVehicleData; cardReviewText: Text | null } | null {
        const hitRadiusCm = 5.5;
        let bestIndex = -1;
        let bestDistance = hitRadiusCm;

        for (let i = 0; i < this.collectionCardObjects.length; i++) {
            const card = this.collectionCardObjects[i];
            if (!card || !card.enabled) continue;
            if (i >= this.savedVehicles.length) continue;
            if (!this.canTriggerCardInfo(i)) continue;

            const button = this.findCollectorCombineButton(card);
            if (!button || !button.enabled) continue;

            try {
                const buttonPos = button.getTransform().getWorldPosition();
                const dist = buttonPos.sub(worldPoint).length;
                if (dist <= bestDistance) {
                    bestDistance = dist;
                    bestIndex = i;
                }
            } catch (e) { /* ignore this card */ }
        }

        if (bestIndex < 0) return null;
        const card = this.collectionCardObjects[bestIndex];
        const carReviewObj = card ? findChildByName(card, 'Car Review') : null;
        return {
            cardIndex: bestIndex,
            data: this.savedVehicles[bestIndex],
            cardReviewText: carReviewObj ? this.findFirstTextInSubtree(carReviewObj, 0) : null,
        };
    }

    private findCardInfoButtonAtScreenPoint(screenPoint: vec2): { cardIndex: number; data: SavedVehicleData; cardReviewText: Text | null } | null {
        const cameras = this.findEnabledCameras();
        if (cameras.length === 0) return null;

        const hitRadius = 0.085;
        let bestIndex = -1;
        let bestDistanceSq = hitRadius * hitRadius;

        for (let i = 0; i < this.collectionCardObjects.length; i++) {
            const card = this.collectionCardObjects[i];
            if (!card || !card.enabled) continue;
            if (i >= this.savedVehicles.length) continue;
            if (!this.canTriggerCardInfo(i)) continue;

            const button = this.findCollectorCombineButton(card);
            if (!button || !button.enabled) continue;

            let buttonPos: vec3;
            try {
                buttonPos = button.getTransform().getWorldPosition();
            } catch (e) {
                continue;
            }

            for (let c = 0; c < cameras.length; c++) {
                try {
                    const projected = cameras[c].worldSpaceToScreenSpace(buttonPos);
                    if (!projected || projected.x < -0.1 || projected.x > 1.1 || projected.y < -0.1 || projected.y > 1.1) continue;
                    const dx = projected.x - screenPoint.x;
                    const dy = projected.y - screenPoint.y;
                    const distanceSq = dx * dx + dy * dy;
                    if (distanceSq <= bestDistanceSq) {
                        bestDistanceSq = distanceSq;
                        bestIndex = i;
                    }
                } catch (e) { /* ignore this camera */ }
            }
        }

        if (bestIndex < 0) return null;
        const card = this.collectionCardObjects[bestIndex];
        const carReviewObj = card ? findChildByName(card, 'Car Review') : null;
        return {
            cardIndex: bestIndex,
            data: this.savedVehicles[bestIndex],
            cardReviewText: carReviewObj ? this.findFirstTextInSubtree(carReviewObj, 0) : null,
        };
    }

    private findEnabledCameras(): Camera[] {
        const cameras: Camera[] = [];
        const rootCount = global.scene.getRootObjectsCount();
        for (let i = 0; i < rootCount; i++) {
            this.collectEnabledCameras(global.scene.getRootObject(i), cameras);
        }
        return cameras;
    }

    private collectEnabledCameras(obj: SceneObject, cameras: Camera[]): void {
        if (!obj || !obj.enabled) return;
        try {
            const camera = obj.getComponent('Component.Camera') as Camera;
            if (camera && camera.enabled !== false) cameras.push(camera);
        } catch (e) { /* no camera */ }

        const childCount = obj.getChildrenCount();
        for (let i = 0; i < childCount; i++) {
            this.collectEnabledCameras(obj.getChild(i), cameras);
        }
    }

    private connectCollectorInfoButton(buttonObj: SceneObject, callback: (source: string) => void, debugName: string): boolean {
        return this.connectCollectorInfoButtonRecursive(buttonObj, callback, debugName, 0);
    }

    private connectCollectorInfoButtonRecursive(buttonObj: SceneObject, callback: (source: string) => void, debugName: string, depth: number): boolean {
        if (!buttonObj || depth > 10) return false;
        let connected = false;

        try {
            const scripts = buttonObj.getComponents('Component.ScriptComponent') as any[];
            for (let i = 0; i < scripts.length; i++) {
                const script = scripts[i];
                if (!script || script.enabled === false) continue;
                connected = this.addCollectorInfoListener(script.onButtonPinched, () => callback('onButtonPinched'), debugName, 'onButtonPinched', buttonObj.name) || connected;
                connected = this.addCollectorInfoListener(script.onTriggerUp, () => callback('onTriggerUp'), debugName, 'onTriggerUp', buttonObj.name) || connected;
                connected = this.addCollectorInfoListener(script.onTriggerEnd, () => callback('onTriggerEnd'), debugName, 'onTriggerEnd', buttonObj.name) || connected;
                connected = this.addCollectorInfoListener(script.onInteractorTriggerEnd, () => callback('onInteractorTriggerEnd'), debugName, 'onInteractorTriggerEnd', buttonObj.name) || connected;
                connected = this.addCollectorInfoListener(script.onSelectEnd, () => callback('onSelectEnd'), debugName, 'onSelectEnd', buttonObj.name) || connected;
                connected = this.addCollectorInfoListener(script.onTap, () => callback('onTap'), debugName, 'onTap', buttonObj.name) || connected;
                connected = this.addCollectorInfoListener(script.onTriggerPrimary, () => callback('onTriggerPrimary'), debugName, 'onTriggerPrimary', buttonObj.name) || connected;
                connected = this.addCollectorInfoListener(script.onTriggerStart, () => callback('onTriggerStart'), debugName, 'onTriggerStart', buttonObj.name) || connected;
                connected = this.addCollectorInfoListener(script.onTriggerDown, () => callback('onTriggerDown'), debugName, 'onTriggerDown', buttonObj.name) || connected;
            }
        } catch (e) { /* no scripts */ }

        const interaction = this.getInteractionComponent(buttonObj);
        if (interaction) {
            connected = this.addCollectorInfoListener(interaction.onTap, () => callback('interaction.onTap'), debugName, 'interaction.onTap', buttonObj.name) || connected;
            connected = this.addCollectorInfoListener(interaction.onSelectEnd, () => callback('interaction.onSelectEnd'), debugName, 'interaction.onSelectEnd', buttonObj.name) || connected;
            connected = this.addCollectorInfoListener(interaction.onTriggerPrimary, () => callback('interaction.onTriggerPrimary'), debugName, 'interaction.onTriggerPrimary', buttonObj.name) || connected;
        }

        const childCount = buttonObj.getChildrenCount();
        for (let c = 0; c < childCount; c++) {
            const child = buttonObj.getChild(c);
            if (child && this.connectCollectorInfoButtonRecursive(child, callback, debugName, depth + 1)) {
                connected = true;
            }
        }
        return connected;
    }

    private addCollectorInfoListener(eventLike: any, callback: () => void, debugName: string, eventName: string, objName: string): boolean {
        try {
            if (eventLike && typeof eventLike.add === 'function') {
                eventLike.add(callback);
                print('CollectionManager: [' + debugName + '] connected via ' + eventName + ' on ' + objName);
                return true;
            }
            if (eventLike && typeof eventLike === 'function') {
                eventLike(callback);
                print('CollectionManager: [' + debugName + '] connected via callable ' + eventName + ' on ' + objName);
                return true;
            }
        } catch (e) {
            print('CollectionManager: [' + debugName + '] failed to connect ' + eventName + ' on ' + objName + ': ' + e);
        }
        return false;
    }

    private getInteractionComponent(obj: SceneObject): any {
        const componentNames = ['Component.InteractionComponent', 'Component.TouchComponent', 'Component.Touch'];
        for (let i = 0; i < componentNames.length; i++) {
            try {
                const comp = (obj as any).getComponent(componentNames[i]) as any;
                if (comp) return comp;
            } catch (e) { /* try next */ }
        }
        return null;
    }

    private findFirstTextInSubtree(obj: SceneObject, depth: number): Text | null {
        if (!obj || depth > 10) return null;
        try {
            const text = obj.getComponent('Component.Text') as Text;
            if (text) return text;
        } catch (e) { /* no text */ }

        const childCount = obj.getChildrenCount();
        for (let i = 0; i < childCount; i++) {
            const child = obj.getChild(i);
            const found = child ? this.findFirstTextInSubtree(child, depth + 1) : null;
            if (found) return found;
        }
        return null;
    }

    private findButtonByVisibleText(obj: SceneObject, words: string[], depth: number): SceneObject | null {
        if (!obj || depth > 10) return null;
        try {
            const text = obj.getComponent('Component.Text') as Text;
            if (text && this.textContainsAny(text.text || '', words)) {
                return this.findNearestButtonAncestor(obj) || obj;
            }
        } catch (e) { /* no text */ }

        const childCount = obj.getChildrenCount();
        for (let i = 0; i < childCount; i++) {
            const child = obj.getChild(i);
            const found = child ? this.findButtonByVisibleText(child, words, depth + 1) : null;
            if (found) return found;
        }
        return null;
    }

    private textContainsAny(text: string, words: string[]): boolean {
        const normalized = String(text || '').toLowerCase();
        for (let i = 0; i < words.length; i++) {
            if (normalized.indexOf(words[i]) >= 0) return true;
        }
        return false;
    }

    private findNearestButtonAncestor(obj: SceneObject): SceneObject | null {
        let current: SceneObject | null = obj;
        for (let i = 0; i < 6 && current; i++) {
            if (this.hasEnabledButtonEvent(current)) return current;
            try {
                current = current.getParent();
            } catch (e) {
                current = null;
            }
        }
        return null;
    }

    private hasEnabledButtonEvent(obj: SceneObject): boolean {
        try {
            const scripts = obj.getComponents('Component.ScriptComponent') as any[];
            for (let i = 0; i < scripts.length; i++) {
                const script = scripts[i];
                if (!script || script.enabled === false) continue;
                if (script.onButtonPinched && typeof script.onButtonPinched.add === 'function') return true;
                if (script.onTriggerUp && typeof script.onTriggerUp.add === 'function') return true;
                if (script.onTriggerEnd && typeof script.onTriggerEnd.add === 'function') return true;
                if (script.onTriggerStart && typeof script.onTriggerStart.add === 'function') return true;
                if (script.onInteractorTriggerEnd && typeof script.onInteractorTriggerEnd.add === 'function') return true;
            }
        } catch (e) { /* no scripts */ }
        return false;
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
    // GARMENT PLACEHOLDERS — AI cutouts for the closet slots
    // =====================================================================

    private updateGarmentPlaceholderForSavedItem(
        data: SavedVehicleData,
        savedIndex: number,
        capturedBase64: string,
        fallbackTexture: Texture | null,
        sourceCardObj?: SceneObject
    ): void {
        if (savedIndex < 0 || savedIndex >= this.savedVehicles.length) return;

        const closetVisible = !!(this.garmentPlaceholderContainer
            && this.garmentPlaceholderContainer.enabled
            && this.garmentViewMode === 'combination');
        const slotIndex = closetVisible ? this.getVisualSlotIndexForSavedIndex(savedIndex) : -1;
        const templateImageObj = sourceCardObj ? findChildByName(sourceCardObj, 'Card Image') : null;
        const placeholder = slotIndex >= 0 ? this.ensureGarmentPlaceholder(slotIndex, templateImageObj) : null;
        if (placeholder) this.setGarmentPlaceholderText(placeholder, data, savedIndex);

        if (placeholder && fallbackTexture) {
            const applied = this.applyTextureToSceneObject(placeholder, fallbackTexture);
            if (applied) {
                print('CollectionManager: [GARMENT-CLOSET] Preview scan applied to '
                    + this.getGarmentPlaceholderName(slotIndex) + ' for card #' + (savedIndex + 1));
            }
        }

        print('CollectionManager: [GARMENT-CUTOUT] Save hook — enabled=' + this.generateGarmentCutoutOnSave
            + ', captured=' + (capturedBase64 ? Math.round((capturedBase64.length * 0.75) / 1024) : 0) + 'KB'
            + ', savedIndex=' + savedIndex + ', slotIndex=' + slotIndex);

        if (!this.generateGarmentCutoutOnSave) {
            print('CollectionManager: [GARMENT-CUTOUT] Skipped because generateGarmentCutoutOnSave is false');
            return;
        }
        if (!capturedBase64 || capturedBase64.length === 0) {
            print('CollectionManager: [GARMENT-CUTOUT] Skipped because capturedBase64 is empty');
            return;
        }

        const statusCb = this.onShowCardStatus || this.onShowAnimatedDescription || this.onShowDescription;
        const hideStatus = this.onHideCardStatus || null;
        if (statusCb) statusCb(t('generating_garment_cutout'));

        this.generateGarmentCutoutTexture(data, capturedBase64)
            .then((cutoutTexture: Texture) => {
                const currentIndex = this.findSavedVehicleIndexBySerial(data.serial);
                if (currentIndex < 0) return;

                const currentSlotIndex = (this.garmentPlaceholderContainer
                    && this.garmentPlaceholderContainer.enabled
                    && this.garmentViewMode === 'combination')
                    ? this.getVisualSlotIndexForSavedIndex(currentIndex)
                    : -1;
                if (currentSlotIndex >= 0) {
                    const currentPlaceholder = this.ensureGarmentPlaceholder(currentSlotIndex, templateImageObj) || placeholder;
                    if (currentPlaceholder) {
                        this.setGarmentPlaceholderText(currentPlaceholder, data, currentIndex);
                        const appliedToPlaceholder = this.applyTextureToSceneObject(currentPlaceholder, cutoutTexture);
                        print('CollectionManager: [GARMENT-CUTOUT] Apply to visible placeholder=' + appliedToPlaceholder
                            + ', slot=' + currentSlotIndex + ', savedIndex=' + currentIndex);
                    }
                } else {
                    print('CollectionManager: [GARMENT-CUTOUT] Closet look builder is closed; generated image saved for future looks');
                }
                if (sourceCardObj) {
                    this.applyCardImage(sourceCardObj, cutoutTexture);
                    print('CollectionManager: [GARMENT-CUTOUT] Applied generated image to bracelet/card object');
                }
                this.saveGarmentCutoutTextureToStorage(data.savedAt, cutoutTexture, (saved: boolean, b64?: string) => {
                    const stillSavedIndex = this.findSavedVehicleIndexBySerial(data.serial);
                    if (stillSavedIndex < 0) return;
                    data.imageGenerated = saved;
                    this.savedVehicles[stillSavedIndex].imageGenerated = saved;
                    this.saveCollectionToStorage();
                    if (saved) {
                        if (data.serial && b64 && this.onCloudUploadImage) {
                            this.onCloudUploadImage(data.serial, b64);
                        }
                        print('CollectionManager: [GARMENT-CUTOUT] Persisted generated image metadata for card #' + (stillSavedIndex + 1));
                    } else {
                        print('CollectionManager: [GARMENT-CUTOUT] Generated image is visible now, but storage did not persist it');
                    }
                });
                if (statusCb) statusCb(tf('garment_cutout_ready', { name: data.brand_model || data.item_name || 'Item' }));
                if (hideStatus) hideStatus(2.5);
                print('CollectionManager: [GARMENT-CUTOUT] Applied cutout to saved card #' + (currentIndex + 1)
                    + ' — ' + (data.brand_model || data.item_name || 'item'));
            })
            .catch((e) => {
                print('CollectionManager: [GARMENT-CUTOUT] Failed, keeping original scan image in placeholder: ' + e);
                if (statusCb) statusCb(t('garment_cutout_failed'));
                if (hideStatus) hideStatus(3.0);
            });
    }

    private async generateGarmentCutoutTexture(data: SavedVehicleData, capturedBase64: string, isolateSingle: boolean = false): Promise<Texture> {
        let imageBytes: Uint8Array;
        try {
            imageBytes = Base64.decode(capturedBase64);
        } catch (decodeErr) {
            throw new Error('Garment cutout base64 decode failed: ' + String(decodeErr).substring(0, 120));
        }

        const itemLabel = data.item_name || data.brand_model || data.type || 'clothing item';
        let editPrompt: string;
        if (isolateSingle) {
            // Mirror/full-look mode: the photo shows a person wearing several garments.
            // Isolate ONE specific garment and drop everything else (person + other clothes).
            const desc = [data.color, data.material, data.subcategory || data.category]
                .filter((p) => !!p && p !== 'unknown').join(' ');
            editPrompt = 'Edit this photo into a clean single-item inventory image for a virtual closet. '
                + 'The person in the image is wearing several garments. Keep ONLY this one item: "' + itemLabel + '"'
                + (desc ? ' (the ' + desc + ')' : '') + '. '
                + 'Completely remove the person, the background, the room, mirror, floor, walls, shadows, and EVERY other garment or accessory that is not this exact item. '
                + 'Preserve the exact colors, fabric texture, logos, seams, folds, wear, condition, pattern and silhouette of this single item only. '
                + 'Place the isolated item centered on a flat neutral light gray background with soft product-photography lighting and a subtle natural contact shadow. '
                + 'The final image must show ONLY this one garment; do not include other clothing, do not invent items, do not add text, borders, labels, hangers, mannequins, or props.';
        } else {
            editPrompt = 'Edit this image into a clean clothing inventory image for a virtual closet. '
                + 'Remove the entire background, room, furniture, mirror, floor, wall, shadows that belong to the room, and any non-clothing objects. '
                + 'Keep only the garment or outfit named "' + itemLabel + '". '
                + 'If the clothing is worn by a person, keep all visible clothing together as a complete outfit and remove the person/background only where it is safe; never erase the visible garments. '
                + 'If isolation is ambiguous, keep the full visible clothing silhouette and simply replace the surrounding scene with gray. '
                + 'Preserve exact colors, fabric texture, logos, seams, folds, wear, condition, pattern, and silhouette. '
                + 'Place the isolated garment centered on a flat neutral light gray background. '
                + 'Use soft product-photography lighting and a subtle natural contact shadow only under the garment. '
                + 'The final image must visibly contain the garment or outfit; do not return an empty background. '
                + 'Do not invent a new item, do not restyle it, do not add text, borders, labels, hangers, mannequins, or decorative props.';
        }

        const maxAttempts = Math.max(1, Math.floor(this.garmentCutoutMaxAttempts || 1));
        const attempts: Array<{ model: string; size: string }> = [];
        for (let i = 0; i < maxAttempts; i++) {
            attempts.push({ model: 'gpt-image-1', size: '1024x1024' });
        }

        let lastError = '';
        for (let i = 0; i < attempts.length; i++) {
            const attempt = i + 1;
            const { model, size } = attempts[i];
            const startedAt = Date.now();
            try {
                print('CollectionManager: [GARMENT-CUTOUT] Attempt ' + attempt + '/' + attempts.length
                    + ' — ' + itemLabel + ', input=' + Math.round(imageBytes.length / 1024) + 'KB'
                    + ', timeout=' + Math.max(1, this.garmentCutoutTimeoutSeconds || 60) + 's');

                const response = await this.withTimeout(OpenAI.imagesEdit({
                    image: imageBytes,
                    prompt: editPrompt,
                    model: model,
                    n: 1,
                    size: size,
                }), Math.max(1, this.garmentCutoutTimeoutSeconds || 60), 'Garment cutout timed out');

                print('CollectionManager: [GARMENT-CUTOUT] Attempt ' + attempt + ' success in '
                    + ((Date.now() - startedAt) / 1000).toFixed(1) + 's');
                return this.extractTextureFromResponse(response);
            } catch (err) {
                if (typeof err === 'string') {
                    lastError = err;
                } else if (err && typeof err === 'object') {
                    lastError = (err as any).message || (err as any).error || JSON.stringify(err);
                } else {
                    lastError = String(err);
                }
                print('CollectionManager: [GARMENT-CUTOUT] Attempt ' + attempt + ' failed after '
                    + ((Date.now() - startedAt) / 1000).toFixed(1) + 's: ' + lastError.substring(0, 300));
                if (i < attempts.length - 1) await this.delay(2.0);
            }
        }

        throw new Error('Garment cutout failed: ' + lastError.substring(0, 200));
    }

    private saveGarmentCutoutTextureToStorage(savedAt: number, texture: Texture, onComplete?: (saved: boolean, b64?: string) => void): void {
        if (!savedAt || !texture) {
            if (onComplete) onComplete(false);
            return;
        }
        try {
            const storageKey = this.GARMENT_CUTOUT_KEY_PREFIX + savedAt.toString();
            Base64.encodeTextureAsync(
                texture,
                (b64: string) => {
                    try {
                        const store = global.persistentStorageSystem.store;
                        store.putString(storageKey, b64);
                        const storedB64 = store.getString(storageKey);
                        const persisted = !!storedB64 && storedB64.length > 0;
                        if (persisted) {
                            print('CollectionManager: [GARMENT-CUTOUT] Saved cutout image — '
                                + storedB64.length + ' chars, verified=' + (storedB64.length === b64.length));
                        } else {
                            print('CollectionManager: [GARMENT-CUTOUT] Storage verification failed after write');
                        }
                        if (onComplete) onComplete(persisted, persisted ? storedB64 : undefined);
                    } catch (e) {
                        print('CollectionManager: [GARMENT-CUTOUT] Storage write failed: ' + e);
                        if (onComplete) onComplete(false);
                    }
                },
                () => {
                    print('CollectionManager: [GARMENT-CUTOUT] JPG encode failed');
                    if (onComplete) onComplete(false);
                },
                CompressionQuality.LowQuality,
                EncodingType.Jpg
            );
        } catch (e) {
            print('CollectionManager: [GARMENT-CUTOUT] Save exception: ' + e);
            if (onComplete) onComplete(false);
        }
    }

    private loadGarmentCutoutForCard(savedIndex: number, savedAt: number, cardObj: SceneObject): boolean {
        if (!savedAt || !cardObj) return false;
        try {
            const storageKey = this.GARMENT_CUTOUT_KEY_PREFIX + savedAt.toString();
            const b64 = global.persistentStorageSystem.store.getString(storageKey);
            if (!b64 || b64.length === 0) {
                print('CollectionManager: [GARMENT-CUTOUT] No generated card image in storage for card #' + (savedIndex + 1));
                return false;
            }

            Base64.decodeTextureAsync(
                b64,
                (texture: Texture) => {
                    this.applyCardImage(cardObj, texture);
                    print('CollectionManager: [GARMENT-CUTOUT] Loaded generated image into bracelet card #' + (savedIndex + 1));
                },
                () => {
                    print('CollectionManager: [GARMENT-CUTOUT] Failed to decode generated image for bracelet card #' + (savedIndex + 1));
                    const data = this.savedVehicles[savedIndex];
                    if (data && data.savedAt) {
                        this.loadCardImageFromStorage(data.brand_model || data.item_name || 'Item', data.savedAt, cardObj);
                    }
                }
            );
            return true;
        } catch (e) {
            print('CollectionManager: [GARMENT-CUTOUT] Card load exception: ' + e);
            return false;
        }
    }

    private loadGarmentCutoutForPlaceholder(
        savedIndex: number,
        savedAt: number,
        sourceCardObj?: SceneObject,
        data?: SavedVehicleData
    ): boolean {
        if (!savedAt) return false;
        try {
            const slotIndex = this.getVisualSlotIndexForSavedIndex(savedIndex);
            if (slotIndex < 0) return false;
            const storageKey = this.GARMENT_CUTOUT_KEY_PREFIX + savedAt.toString();
            const b64 = global.persistentStorageSystem.store.getString(storageKey);
            if (!b64 || b64.length === 0) return false;

            const templateImageObj = sourceCardObj ? findChildByName(sourceCardObj, 'Card Image') : null;
            const placeholder = this.ensureGarmentPlaceholder(slotIndex, templateImageObj);
            if (!placeholder) return false;
            if (data) this.setGarmentPlaceholderText(placeholder, data, savedIndex);

            Base64.decodeTextureAsync(
                b64,
                (texture: Texture) => {
                    if (this.getSavedIndexForGarmentSlot(slotIndex) === savedIndex) {
                        this.applyTextureToSceneObject(placeholder, texture);
                        print('CollectionManager: [GARMENT-CUTOUT] Loaded generated image into placeholder for card #' + (savedIndex + 1));
                    }
                },
                () => {
                    print('CollectionManager: [GARMENT-CUTOUT] Failed to decode saved cutout for saved card ' + (savedIndex + 1));
                    this.loadCardImageForGarmentPlaceholder(savedIndex, savedAt, sourceCardObj, data);
                }
            );
            return true;
        } catch (e) {
            print('CollectionManager: [GARMENT-CUTOUT] Load exception: ' + e);
            return false;
        }
    }

    private rebuildGarmentPlaceholdersFromStorage(): void {
        this.enterGarmentInventoryMode();
        this.clearRuntimeGarmentPlaceholders();
        this.clampGarmentPageIndex();
        this.hideGarmentPlaceholderContainer();
    }

    private clearRuntimeGarmentPlaceholders(): void {
        for (let i = 0; i < this.garmentPlaceholderObjects.length; i++) {
            const obj = this.garmentPlaceholderObjects[i];
            if (obj && this.garmentPlaceholderRuntimeCreated[i]) {
                try { obj.destroy(); } catch (e) { /* ignore */ }
            }
        }
        this.garmentPlaceholderObjects = [];
        this.garmentPlaceholderRuntimeCreated = [];
        this.garmentSlotToSavedIndex = [];
    }

    private ensureGarmentPlaceholder(slotIndex: number, templateImageObj?: SceneObject | null): SceneObject | null {
        if (slotIndex < 0 || slotIndex >= this.getVisibleGarmentSlotCount()) return null;

        const cached = this.garmentPlaceholderObjects[slotIndex];
        if (cached) {
            this.connectGarmentPlaceholderButton(cached, slotIndex);
            return cached;
        }

        const existing = this.findExistingGarmentPlaceholder(slotIndex);
        if (existing) {
            this.garmentPlaceholderObjects[slotIndex] = existing;
            this.garmentPlaceholderRuntimeCreated[slotIndex] = false;
            this.connectGarmentPlaceholderButton(existing, slotIndex);
            return existing;
        }

        this.ensureCollectionRoot();
        const parent = this.garmentPlaceholderContainer || this.collectionRoot || this.cardCollectionContainer || null;
        if (!parent) return null;

        let placeholder: SceneObject | null = null;
        try {
            const cardTemplateObj = this.resolveGarmentCardTemplate(templateImageObj);
            if (cardTemplateObj) {
                placeholder = parent.copyWholeHierarchy(cardTemplateObj);
            } else {
                placeholder = global.scene.createSceneObject(this.getGarmentPlaceholderName(slotIndex));
                placeholder.setParent(parent);
                placeholder.createComponent('Component.Image');
            }
            placeholder.name = this.getGarmentPlaceholderName(slotIndex);
            placeholder.enabled = slotIndex < this.savedVehicles.length;
            this.positionRuntimeGarmentPlaceholder(placeholder, slotIndex, cardTemplateObj);
            this.garmentPlaceholderObjects[slotIndex] = placeholder;
            this.garmentPlaceholderRuntimeCreated[slotIndex] = true;
            this.connectGarmentPlaceholderButton(placeholder, slotIndex);
            return placeholder;
        } catch (e) {
            print('CollectionManager: [GARMENT-CUTOUT] Could not create ' + this.getGarmentPlaceholderName(slotIndex) + ': ' + e);
            return null;
        }
    }

    private showGarmentPlaceholderContainer(): void {
        if (!this.garmentPlaceholderContainer) return;
        if (this.garmentViewMode !== 'combination' || this.getGarmentDisplayCount() < 2) {
            this.hideGarmentPlaceholderContainer();
            return;
        }
        if (!this.garmentPlaceholderContainer.enabled) {
            this.garmentPlaceholderContainer.enabled = true;
            print('CollectionManager: [GARMENT-CLOSET] Garment Placeholder enabled');
        }
        this.hookGarmentPlaceholderCloseButton();
        this.hookGarmentPageButtons();
        this.updateGarmentPlaceholderVisibility();
        this.refreshGarmentPlaceholderButtonConnections();
    }

    private hideGarmentPlaceholderContainer(): void {
        if (this.garmentPlaceholderContainer) {
            this.garmentPlaceholderContainer.enabled = false;
        }
        const outfitRoot = this.getOutfitTesterContainer(false);
        if (outfitRoot && outfitRoot !== this.garmentPlaceholderContainer) {
            outfitRoot.enabled = false;
        }
    }

    private showOutfitBuilderContainer(): void {
        const outfitRoot = this.getOutfitTesterContainer(true);
        if (!outfitRoot) return;
        this.enterGarmentOutfitMode();

        if (this.garmentPlaceholderContainer && this.garmentPlaceholderContainer !== outfitRoot) {
            this.garmentPlaceholderContainer.enabled = false;
        }

        if (!outfitRoot.enabled) {
            outfitRoot.enabled = true;
        }

        const closetObj = this.findDirectChildByName(outfitRoot, 'Closet');
        if (closetObj) closetObj.enabled = true;

        this.resolveOutfitSlotObjects();
        this.hookGarmentPlaceholderCloseButton();
        this.hookOutfitBuilderButtons();
        this.applyOutfitSlotsToVisuals();
    }

    private resetOutfitTesterSlots(): void {
        this.outfitSlotToSavedIndex = this.createEmptyOutfitSlots();
        this.clearOutfitSlotsFromStorage();
        this.applyOutfitSlotsToVisuals();
        this.clearOutfitSessionFeedback();
    }

    private createEmptyOutfitSlots(): number[] {
        const slots: number[] = [];
        for (let i = 0; i < this.getOutfitSlotCount(); i++) {
            slots.push(-1);
        }
        return slots;
    }

    private resolveOutfitSlotObjects(): void {
        const outfitRoot = this.getOutfitTesterContainer(true);
        if (!outfitRoot) return;
        for (let i = 0; i < this.getOutfitSlotCount(); i++) {
            const slotObj = this.findExistingOutfitSlot(i);
            if (!slotObj) continue;
            this.outfitSlotObjects[i] = slotObj;
            this.captureOutfitSlotDefaultTexture(slotObj, i);
            slotObj.enabled = true;
            this.connectOutfitSlotButton(slotObj, i);
        }
    }

    private captureOutfitSlotDefaultTexture(slotObj: SceneObject, slotIndex: number): void {
        if (this.outfitSlotDefaultTextures[slotIndex] !== undefined) return;
        const target = this.findFirstVisualTarget(slotObj);
        this.outfitSlotDefaultTextures[slotIndex] = target ? this.extractTextureFromSceneObject(target) : null;
    }

    private connectOutfitSlotButton(slotObj: SceneObject, slotIndex: number): void {
        if (!slotObj || this.outfitSlotButtonConnected[slotIndex]) return;
        const connected = this.connectButtonFallback(slotObj, () => {
            const savedIndex = this.outfitSlotToSavedIndex[slotIndex];
            if (savedIndex >= 0) this.openCardFromOutfitSlot(slotIndex);
        }, 'OutfitSlot' + this.getOutfitSlotLabel(slotIndex));
        if (connected) {
            this.expandGarmentPlaceholderHitArea(slotObj);
            this.outfitSlotButtonConnected[slotIndex] = true;
        }
    }

    private hookOutfitBuilderButtons(): void {
        const outfitRoot = this.getOutfitTesterContainer(true);
        if (!outfitRoot) return;

        if (!this.askOutfitButtonConnected) {
            const askButton = this.findFirstSceneObjectByNames(outfitRoot, [
                'AskAI',
                'AskAI ',
                'askai',
                'Ask AI',
                'ask ai',
                'AskAI Button',
                'Ask AI Button',
                'Ask Outfit',
                'Ask Outfit Button',
            ]) || this.findButtonByVisibleText(outfitRoot, ['askai', 'ask ai'], 0);

            if (askButton && this.connectButtonFallback(askButton, () => this.onAskOutfitPressed(), 'AskAIOutfit')) {
                this.askOutfitButtonConnected = true;
                print('CollectionManager: [OUTFIT] AskAI button connected');
            }
        }

        if (!this.composeOutfitButtonConnected) {
            const composeButton = this.findFirstSceneObjectByNames(outfitRoot, [
                'Compose',
                'Compose ',
                'compose',
                'COMPOSE',
                'Compose Button',
                'AI Compose',
                'AI Compose Button',
                'Compose Outfit',
                'Compose Outfit Button',
                'Combine',
                'Combine Button',
                'Combine Looks',
                'Combine Looks Button',
                'Combinar',
                'Combinar Button',
                'Combiner',
                'Combiner Button',
            ]) || this.findButtonByVisibleText(outfitRoot, ['combine looks', 'compose', 'componer', 'armar', 'combine', 'combinar', 'combiner'], 0);

            if (composeButton) {
                this.outfitCombineButtonObj = composeButton;
                if (this.connectButtonFallback(composeButton, () => this.onAskOutfitPressed(), 'AnalyzeOutfit')) {
                    this.composeOutfitButtonConnected = true;
                    print('CollectionManager: [OUTFIT] Combine/Analyze button connected');
                }
            }
        }
    }

    private tryAssignDraggedCardToOutfitSlot(cardIndex: number, cardObj: SceneObject): boolean {
        const outfitRoot = this.getOutfitTesterContainer(false);
        if (!outfitRoot || !outfitRoot.enabled) return false;
        if (cardIndex < 0 || cardIndex >= this.savedVehicles.length || !cardObj) return false;
        if (this.shouldConsumeButtonCombineDrop(cardIndex)) return true;

        this.resolveOutfitSlotObjects();
        const slotIndex = this.findNearestOutfitSlotIndex(cardObj.getTransform().getWorldPosition());
        if (slotIndex < 0) return false;

        const validation = this.getOutfitSlotValidation(cardIndex, slotIndex);
        if (!validation.ok) {
            if (this.onShowDescription) this.onShowDescription(validation.message);
            if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(2.2);
            print('CollectionManager: [OUTFIT] Rejected card #' + (cardIndex + 1)
                + ' for ' + this.getOutfitSlotLabel(slotIndex) + ': ' + validation.message);
            return true;
        }

        return this.assignSavedItemToOutfitSlot(slotIndex, cardIndex, true);
    }

    private shouldConsumeButtonCombineDrop(cardIndex: number): boolean {
        if (cardIndex !== this.combineButtonSuppressDropIndex) return false;
        if (getTime() > this.combineButtonSuppressDropUntil) {
            this.combineButtonSuppressDropIndex = -1;
            this.combineButtonSuppressDropUntil = 0;
            return false;
        }
        this.cardStates[cardIndex] = this.STATE_IN_COLLECTION;
        this.combineButtonSuppressDropIndex = -1;
        this.combineButtonSuppressDropUntil = 0;
        print('CollectionManager: [COMBINE] Consumed card drop caused by Combine button press');
        return true;
    }

    private findNearestOutfitSlotIndex(worldPos: vec3): number {
        let bestSlot = -1;
        let bestDistance = Math.max(1, this.outfitSlotDropRadiusCm || 24);

        for (let i = 0; i < this.getOutfitSlotCount(); i++) {
            const slotObj = this.getOutfitSlotObject(i);
            if (!slotObj) continue;
            try {
                const slotPos = slotObj.getTransform().getWorldPosition();
                const dist = worldPos.sub(slotPos).length;
                if (dist <= bestDistance) {
                    bestDistance = dist;
                    bestSlot = i;
                }
            } catch (e) { /* slot transform unavailable */ }
        }

        return bestSlot;
    }

    private assignSavedItemToOutfitSlot(slotIndex: number, savedIndex: number, announce: boolean): boolean {
        if (slotIndex < 0 || slotIndex >= this.getOutfitSlotCount()) return false;
        if (savedIndex < 0 || savedIndex >= this.savedVehicles.length) return false;
        const validation = this.getOutfitSlotValidation(savedIndex, slotIndex);
        if (!validation.ok) {
            if (announce && this.onShowDescription) this.onShowDescription(validation.message);
            if (announce && this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(2.2);
            return false;
        }

        this.outfitSlotToSavedIndex[slotIndex] = savedIndex;
        const slotObj = this.getOutfitSlotObject(slotIndex);
        const data = this.savedVehicles[savedIndex];
        if (slotObj && data) {
            slotObj.enabled = true;
            this.setOutfitSlotText(slotObj, data, slotIndex);
            this.applySavedItemImageToOutfitSlot(slotIndex, savedIndex);
        }

        if (announce && data && this.onShowDescription) {
            this.onShowDescription(tf('outfit_slot_assigned', {
                item: data.item_name || data.brand_model || 'Item',
                slot: this.getOutfitSlotLabel(slotIndex),
            }));
        }
        if (announce && this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(1.8);
        print('CollectionManager: [OUTFIT] Assigned saved card #' + (savedIndex + 1)
            + ' to ' + this.getOutfitSlotLabel(slotIndex));
        this.clearOutfitSessionFeedback();
        return true;
    }

    private applyOutfitSlotsToVisuals(): void {
        this.resolveOutfitSlotObjects();
        for (let i = 0; i < this.getOutfitSlotCount(); i++) {
            const savedIndex = this.outfitSlotToSavedIndex[i];
            const slotObj = this.getOutfitSlotObject(i);
            if (!slotObj) continue;
            slotObj.enabled = true;
            if (savedIndex >= 0 && savedIndex < this.savedVehicles.length) {
                this.setOutfitSlotText(slotObj, this.savedVehicles[savedIndex], i);
                this.applySavedItemImageToOutfitSlot(i, savedIndex);
            } else {
                this.restoreOutfitSlotDefault(i);
            }
        }
    }

    private restoreOutfitSlotDefault(slotIndex: number): void {
        const slotObj = this.getOutfitSlotObject(slotIndex);
        if (!slotObj) return;
        this.hideOutfitSlotImage(slotObj);

        const textObj = this.findSceneObjectByName(slotObj, 'Item Name')
            || this.findSceneObjectByName(slotObj, 'Item Name ' + this.getOutfitSlotLabel(slotIndex))
            || this.findSceneObjectByName(slotObj, this.getOutfitSlotLabel(slotIndex) + ' Name');
        if (!textObj) return;
        try {
            const textComp = textObj.getComponent('Component.Text') as Text;
            if (textComp) textComp.text = this.getOutfitSlotLabel(slotIndex);
        } catch (e) { /* optional slot label */ }
    }

    private hideOutfitSlotImage(slotObj: SceneObject): void {
        const target = this.findFirstVisualTarget(slotObj);
        if (!target) return;
        target.enabled = false;
    }

    private applySavedItemImageToOutfitSlot(slotIndex: number, savedIndex: number): void {
        const slotObj = this.getOutfitSlotObject(slotIndex);
        const data = this.savedVehicles[savedIndex];
        if (!slotObj || !data) return;

        const sourceCard = this.collectionCardObjects[savedIndex];
        if (sourceCard) this.copyCardImageTextureToSlot(sourceCard, slotObj);

        if (!data.savedAt) return;
        const generatedKey = this.GARMENT_CUTOUT_KEY_PREFIX + data.savedAt.toString();
        if (this.loadTextureKeyIntoSceneObject(generatedKey, slotObj, 'generated outfit slot ' + slotIndex)) return;

        const scanKey = this.IMAGE_KEY_PREFIX + data.savedAt.toString();
        this.loadTextureKeyIntoSceneObject(scanKey, slotObj, 'scan outfit slot ' + slotIndex);
    }

    private loadTextureKeyIntoSceneObject(storageKey: string, targetObj: SceneObject, debugName: string): boolean {
        try {
            const b64 = global.persistentStorageSystem.store.getString(storageKey);
            if (!b64 || b64.length === 0) return false;
            Base64.decodeTextureAsync(
                b64,
                (texture: Texture) => {
                    this.applyTextureToSceneObject(targetObj, texture);
                    print('CollectionManager: [OUTFIT] Loaded ' + debugName);
                },
                () => { print('CollectionManager: [OUTFIT] Could not decode ' + debugName); }
            );
            return true;
        } catch (e) {
            print('CollectionManager: [OUTFIT] Storage load failed for ' + debugName + ': ' + e);
            return false;
        }
    }

    private copyCardImageTextureToSlot(cardObj: SceneObject, slotObj: SceneObject): boolean {
        const cardImageObj = cardObj ? findChildByName(cardObj, 'Card Image') : null;
        const texture = cardImageObj ? this.extractTextureFromSceneObject(cardImageObj) : null;
        if (!texture) return false;
        return this.applyTextureToSceneObject(slotObj, texture);
    }

    private extractTextureFromSceneObject(obj: SceneObject): Texture | null {
        if (!obj) return null;
        try {
            const img = obj.getComponent('Component.Image') as Image;
            if (img && img.mainPass && img.mainPass.baseTex) return img.mainPass.baseTex as Texture;
        } catch (e) { /* try mesh */ }
        try {
            const mesh = obj.getComponent('Component.RenderMeshVisual') as RenderMeshVisual;
            if (mesh && mesh.mainPass && mesh.mainPass.baseTex) return mesh.mainPass.baseTex as Texture;
        } catch (e) { /* ignore */ }
        return null;
    }

    private onAskOutfitPressed(): void {
        const outfit = this.getCurrentOutfitSelection();
        const items = outfit.items;
        if (items.length < 2) {
            if (this.onShowDescription) this.onShowDescription(t('outfit_need_items'));
            if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(2.5);
            return;
        }

        const matchPercent = this.getOutfitMatchPercent(outfit.items, outfit.slotLabels);
        const outfitText = this.getOutfitFeedbackText();
        const percentText = this.getOutfitPercentText();
        this.setOutfitText(outfitText, t('outfit_feedback_loading'));
        this.setOutfitText(percentText, matchPercent + '%');

        if (this.onAskOutfitFeedback) {
            this.onAskOutfitFeedback(items, outfit.slotLabels, outfitText, percentText, matchPercent);
        } else {
            const fallback = this.buildLocalOutfitFeedback(items, outfit.slotLabels, matchPercent);
            this.setOutfitText(outfitText, fallback);
            if (this.onShowDescription) this.onShowDescription(fallback);
        }
    }

    private buildLocalOutfitFeedback(items: SavedVehicleData[], slotLabels: string[], matchPercent: number): string {
        const names: string[] = [];
        for (let i = 0; i < items.length; i++) {
            const slot = slotLabels && slotLabels[i] ? slotLabels[i] : 'Slot ' + (i + 1);
            const item = items[i];
            names.push(slot + ': ' + (item.item_name || item.brand_model || item.category || 'item'));
        }
        const verdict = matchPercent >= 70 ? 'MATCH' : 'LOW MATCH';
        return verdict + ' ' + Math.round(matchPercent) + '%: ' + names.join(', ')
            + '. AI analysis is unavailable, so this is the local outfit check.';
    }

    private onComposeOutfitPressed(): void {
        this.onAskOutfitPressed();
    }

    /** Local deterministic outfit composition — best-scoring item per slot. */
    private composeOutfitDeterministic(preferredIndex: number = -1, cardReviewText: Text | null = null): void {
        this.resetOutfitTesterSlots();
        const selected = this.buildAutomaticOutfitSlots(preferredIndex);
        let count = 0;
        for (let i = 0; i < selected.length; i++) {
            if (selected[i] >= 0) {
                if (this.assignSavedItemToOutfitSlot(i, selected[i], false)) count++;
            }
        }

        this.showOutfitBuilderContainer();
        this.showVerticalCardOutfitSummary(cardReviewText, count);
        if (!cardReviewText && this.onShowDescription) this.onShowDescription(tf('outfit_composed', { count: count }));
        if (!cardReviewText && this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(2.0);
    }

    /**
     * Asks the AI to compose the single best cohesive outfit from the user's closet,
     * fills the slots with its picks, and shows its one-line reasoning. Falls back to
     * the local deterministic scorer if the AI is unavailable or returns nothing usable.
     */
    private async composeOutfitWithAI(preferredIndex: number = -1, cardReviewText: Text | null = null): Promise<void> {
        const items = this.savedVehicles;
        const showStatus = this.onShowAnimatedDescription || this.onShowDescription;
        if (cardReviewText) {
            this.setVerticalCardReviewText(cardReviewText, t('composing_outfit_ai'));
        } else if (showStatus) {
            showStatus(t('composing_outfit_ai'));
        }

        // Compact wardrobe catalog (capped to keep the prompt small)
        const MAX = 40;
        const lines: string[] = [];
        for (let i = 0; i < Math.min(items.length, MAX); i++) {
            const d = items[i];
            if (!d) continue;
            const tags = (d.style_tags || []).concat(d.occasion_tags || []).slice(0, 4).join(', ');
            lines.push(i + ': ' + (d.item_name || d.brand_model || 'Item')
                + ' — ' + (d.category || d.type || 'unknown')
                + (d.color ? ', ' + d.color : '')
                + (tags ? ' [' + tags + ']' : ''));
        }

        const sys = 'You are Closet Club, a fashion stylist. From the user\'s wardrobe below, compose the single best cohesive outfit. '
            + 'Pick at most ONE item per role, by its numeric index: top (tops and dresses), layer (outerwear/jacket — optional), bottom, shoes, accessory (optional). '
            + 'Favor color harmony, matching style and occasion, and a complete look (top plus bottom, or a dress without a bottom, plus shoes when available). '
            + 'Avoid color combinations that visibly clash; prefer neutrals or a coherent palette when the closet has them. '
            + 'If a requested card index is provided, try to include it only when it still makes a cohesive outfit. '
            + 'Only use indices that exist in the list, and respect each item\'s category. '
            + 'Respond ONLY with JSON: {"top": <index or -1>, "layer": <index or -1>, "bottom": <index or -1>, "shoes": <index or -1>, "accessory": <index or -1>, "reasoning": "<one short sentence>"}.';
        const requested = preferredIndex >= 0 && preferredIndex < items.length
            ? '\n\nRequested card index: ' + preferredIndex
            : '';
        const user = 'Wardrobe:\n' + lines.join('\n') + requested;

        try {
            const response = await OpenAI.chatCompletions({
                model: 'gpt-4o',
                messages: [
                    { role: 'system', content: sys },
                    { role: 'user', content: user },
                ],
                temperature: 0.4,
                max_tokens: 300,
            });

            const content = response.choices[0].message.content;
            const match = content.match(/\{[\s\S]*\}/);
            if (!match) throw new Error('No JSON in AI compose response');
            const pick = JSON.parse(match[0]);

            this.resetOutfitTesterSlots();
            let count = 0;
            const place = (idx: any, slot: number) => {
                const n = typeof idx === 'number' ? idx : parseInt(idx, 10);
                if (!isNaN(n) && n >= 0 && n < items.length) {
                    if (this.assignSavedItemToOutfitSlot(slot, n, false)) count++;
                }
            };
            place(pick.accessory, 0);
            place(pick.top, 1);
            place(pick.bottom, 2);
            place(pick.shoes, 3);
            place(pick.layer, 4);

            if (count === 0 || (count < 2 && items.length > 1)) {
                print('CollectionManager: [OUTFIT-AI] AI returned too few usable picks — using deterministic');
                this.composeOutfitDeterministic(preferredIndex, cardReviewText);
                return;
            }

            this.showOutfitBuilderContainer();
            const reasoning = pick.reasoning && String(pick.reasoning).length > 0
                ? String(pick.reasoning)
                : tf('outfit_composed', { count: count });
            this.showVerticalCardOutfitSummary(cardReviewText, count, reasoning);
            if (!cardReviewText) {
                if (this.onShowAnimatedDescription) this.onShowAnimatedDescription(reasoning);
                else if (this.onShowDescription) this.onShowDescription(reasoning);
                if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(6.0);
            }
            print('CollectionManager: [OUTFIT-AI] Composed ' + count + ' slots by AI');
        } catch (e) {
            print('CollectionManager: [OUTFIT-AI] Compose failed, using deterministic: ' + e);
            this.composeOutfitDeterministic(preferredIndex, cardReviewText);
        }
    }

    private showVerticalCardOutfitSummary(cardReviewText: Text | null, count: number, reasoning: string = ''): void {
        if (!cardReviewText) return;
        if (count <= 0) {
            this.setVerticalCardReviewText(cardReviewText, t('combine_need_more_items'));
            return;
        }
        this.setVerticalCardReviewText(cardReviewText, this.buildVerticalCardOutfitSummary(reasoning));
    }

    private buildVerticalCardOutfitSummary(reasoning: string = ''): string {
        const lines: string[] = ['Selected look:'];
        for (let i = 0; i < this.getOutfitSlotCount(); i++) {
            const savedIndex = this.outfitSlotToSavedIndex[i];
            if (savedIndex < 0 || savedIndex >= this.savedVehicles.length) continue;
            const item = this.savedVehicles[savedIndex];
            if (!item) continue;
            lines.push(this.getOutfitSlotLabel(i) + ': ' + this.getVerticalCardOutfitItemName(item));
        }

        if (lines.length === 1) return 'No outfit pieces selected.';
        if (reasoning && reasoning.length > 0 && lines.length < 5) {
            lines.push('Why: ' + this.shortenOutfitReviewLine(reasoning, 72));
        }
        return lines.join('\n');
    }

    private getVerticalCardOutfitItemName(data: SavedVehicleData): string {
        let name = (data.item_name || data.brand_model || data.brand || data.type || 'Item').trim();
        const color = String(data.color || '').trim();
        const category = String(data.category || data.type || '').trim();
        const lowerName = name.toLowerCase();

        if (color.length > 0 && lowerName.indexOf(color.toLowerCase()) < 0) {
            name = color + ' ' + name;
        }
        if (category.length > 0 && lowerName.indexOf(category.toLowerCase()) < 0 && name.length < 34) {
            name += ' (' + category + ')';
        }
        return this.shortenOutfitReviewLine(name, 42);
    }

    private shortenOutfitReviewLine(value: string, maxLength: number): string {
        const clean = String(value || '').replace(/\s+/g, ' ').trim();
        if (clean.length <= maxLength) return clean;
        return clean.substring(0, Math.max(0, maxLength - 3)) + '...';
    }

    private setVerticalCardReviewText(cardReviewText: Text, value: string): void {
        try {
            const obj = cardReviewText.getSceneObject();
            if (obj) obj.enabled = true;
            this.prepareVerticalCardReviewText(cardReviewText);
            cardReviewText.text = value;
            this.forceTextBlack(cardReviewText);
        } catch (e) {
            try { cardReviewText.text = value; } catch (_ignored) { /* ignore */ }
        }
    }

    private prepareVerticalCardReviewText(cardReviewText: Text): void {
        try {
            cardReviewText.sizeToFit = false;
            if (!cardReviewText.size || cardReviewText.size > 30) cardReviewText.size = 26;
            cardReviewText.lineSpacing = 0.82;
            cardReviewText.horizontalOverflow = HorizontalOverflow.Wrap;
            cardReviewText.verticalOverflow = VerticalOverflow.Overflow;
        } catch (e) { /* visual polish only */ }
    }

    private buildAutomaticOutfitSlots(preferredIndex: number = -1): number[] {
        const selected = this.createEmptyOutfitSlots();
        const scores: number[] = [];
        for (let i = 0; i < this.getOutfitSlotCount(); i++) {
            scores.push(-9999);
        }

        const preferred = preferredIndex >= 0 && preferredIndex < this.savedVehicles.length
            ? this.savedVehicles[preferredIndex]
            : null;
        const preferredSlot = preferred ? this.getPreferredOutfitSlotForItem(preferred) : -1;
        if (preferred && preferredSlot >= 0 && preferredSlot < selected.length) {
            selected[preferredSlot] = preferredIndex;
            scores[preferredSlot] = 9999;
        }

        for (let i = 0; i < this.savedVehicles.length; i++) {
            const data = this.savedVehicles[i];
            if (!data) continue;
            if (i === preferredIndex) continue;
            const slotIndex = this.getPreferredOutfitSlotForItem(data);
            if (slotIndex < 0 || slotIndex >= selected.length) continue;
            const score = this.getOutfitCandidateScore(data, slotIndex)
                + (preferred ? this.scoreLookCombination(preferred, data) : 0);
            if (score > scores[slotIndex]) {
                scores[slotIndex] = score;
                selected[slotIndex] = i;
            }
        }

        const topIndex = selected[1];
        const topItem = topIndex >= 0 && topIndex < this.savedVehicles.length ? this.savedVehicles[topIndex] : null;
        if (topItem) {
            const topFamily = this.getLookFamily(this.getLookCategoryText(topItem));
            if (topFamily === 'dress' || topFamily === 'full') {
                selected[2] = -1;
            }
        }

        return selected;
    }

    private getOutfitSlotValidation(savedIndex: number, slotIndex: number): { ok: boolean; message: string } {
        const data = savedIndex >= 0 && savedIndex < this.savedVehicles.length ? this.savedVehicles[savedIndex] : null;
        const itemName = data ? (data.item_name || data.brand_model || 'Item') : 'Item';
        const preferredSlot = data ? this.getPreferredOutfitSlotForItem(data) : -1;
        if (preferredSlot < 0) {
            return {
                ok: false,
                message: tf('outfit_category_unknown', { item: itemName }),
            };
        }
        if (preferredSlot !== slotIndex) {
            return {
                ok: false,
                message: tf('outfit_wrong_slot', {
                    item: itemName,
                    slot: this.getOutfitSlotLabel(slotIndex),
                    correctSlot: this.getOutfitSlotLabel(preferredSlot),
                }),
            };
        }
        return { ok: true, message: '' };
    }

    private getCurrentOutfitItems(): SavedVehicleData[] {
        return this.getCurrentOutfitSelection().items;
    }

    private getCurrentOutfitSelection(): { items: SavedVehicleData[]; slotLabels: string[] } {
        const items: SavedVehicleData[] = [];
        const slotLabels: string[] = [];
        const usedSerials: string[] = [];
        for (let i = 0; i < this.getOutfitSlotCount(); i++) {
            const savedIndex = this.outfitSlotToSavedIndex[i];
            if (savedIndex < 0 || savedIndex >= this.savedVehicles.length) continue;
            const item = this.savedVehicles[savedIndex];
            if (!item) continue;
            const serial = item.serial || String(savedIndex);
            if (usedSerials.indexOf(serial) >= 0) continue;
            usedSerials.push(serial);
            items.push(item);
            slotLabels.push(this.getOutfitSlotLabel(i));
        }
        return { items, slotLabels };
    }

    private getOutfitMatchPercent(items: SavedVehicleData[], slotLabels: string[]): number {
        if (!items || items.length < 2) return 0;

        let score = 48;
        let hasTop = false;
        let hasBottom = false;
        let hasShoes = false;
        let hasDress = false;
        let hasAccessories = false;

        for (let i = 0; i < items.length; i++) {
            const slot = slotLabels && slotLabels[i] ? slotLabels[i].toLowerCase() : '';
            const family = this.getLookFamily(this.getLookCategoryText(items[i]));
            if (slot.indexOf('top') >= 0 || family === 'top' || family === 'outerwear') hasTop = true;
            if (slot.indexOf('bottom') >= 0 || family === 'bottom') hasBottom = true;
            if (slot.indexOf('shoe') >= 0 || family === 'shoe') hasShoes = true;
            if (family === 'dress' || family === 'full') hasDress = true;
            if (slot.indexOf('accessor') >= 0 || family === 'accessory') hasAccessories = true;
        }

        if ((hasTop && hasBottom) || hasDress) score += 18;
        if (((hasTop && hasBottom) || hasDress) && hasShoes) score += 10;
        if (hasAccessories) score += 4;
        if (!hasShoes && items.length >= 3) score -= 5;
        if (!hasBottom && !hasDress && items.length >= 2) score -= 8;

        let pairScore = 0;
        let pairCount = 0;
        for (let a = 0; a < items.length; a++) {
            for (let b = a + 1; b < items.length; b++) {
                pairScore += this.scoreLookCombination(items[a], items[b]);
                pairCount++;
            }
        }
        if (pairCount > 0) {
            const averagePairScore = pairScore / pairCount;
            score += Math.max(-12, Math.min(26, Math.round(averagePairScore * 1.25)));
        }

        if (this.hasSharedOutfitTags(items, 'style_tags')) score += 4;
        if (this.hasSharedOutfitTags(items, 'occasion_tags')) score += 3;
        if (this.hasSharedOutfitTags(items, 'season_tags')) score += 2;

        const colorPenalty = this.getOutfitColorConflictPenalty(items);
        score -= colorPenalty.penalty;

        let maxScore = ((hasTop && hasBottom) || hasDress) ? 98 : 78;
        if (colorPenalty.conflictCount > 0) {
            maxScore = Math.min(maxScore, colorPenalty.harmonyCount > 0 ? 68 : 58);
        }
        const minScore = colorPenalty.conflictCount > 0 ? 18 : 35;
        return Math.max(minScore, Math.min(maxScore, Math.round(score)));
    }

    private getOutfitColorConflictPenalty(items: SavedVehicleData[]): { penalty: number; conflictCount: number; harmonyCount: number } {
        let conflictCount = 0;
        let harmonyCount = 0;
        let colorPairCount = 0;

        for (let a = 0; a < items.length; a++) {
            for (let b = a + 1; b < items.length; b++) {
                const aColors = this.getLookColorKeywords(items[a].color || '');
                const bColors = this.getLookColorKeywords(items[b].color || '');
                if (aColors.length === 0 || bColors.length === 0) continue;
                colorPairCount++;
                const colorScore = this.getLookColorHarmonyScore(items[a].color || '', items[b].color || '');
                if (colorScore < 0) conflictCount++;
                else if (colorScore > 0) harmonyCount++;
            }
        }

        if (colorPairCount === 0 || conflictCount === 0) {
            return { penalty: 0, conflictCount: 0, harmonyCount: harmonyCount };
        }

        let penalty = conflictCount * 9;
        if (harmonyCount === 0) penalty += 10;
        if (conflictCount >= 2) penalty += 8;
        return {
            penalty: Math.min(34, penalty),
            conflictCount: conflictCount,
            harmonyCount: harmonyCount,
        };
    }

    private hasSharedOutfitTags(items: SavedVehicleData[], key: string): boolean {
        const seen: string[] = [];
        for (let i = 0; i < items.length; i++) {
            const tags = (items[i] as any)[key] as string[];
            if (!tags || tags.length === 0) continue;
            for (let t = 0; t < tags.length; t++) {
                const tag = String(tags[t] || '').toLowerCase();
                if (!tag) continue;
                if (seen.indexOf(tag) >= 0) return true;
                seen.push(tag);
            }
        }
        return false;
    }

    private getOutfitFeedbackText(): Text | null {
        return this.getTextFromNamedSceneObject(['Style Notes 1', 'Style Notes', 'StyleNotes1', 'Outfit Notes']);
    }

    private getOutfitPercentText(): Text | null {
        return this.getTextFromNamedSceneObject(['Percent', 'Match Percent', 'MatchPercent', 'Outfit Percent']);
    }

    private clearOutfitSessionFeedback(): void {
        this.setOutfitText(this.getOutfitFeedbackText(), '');
        this.setOutfitText(this.getOutfitPercentText(), '--%');
    }

    private getTextFromNamedSceneObject(names: string[]): Text | null {
        const outfitRoot = this.getOutfitTesterContainer(true);
        if (outfitRoot) {
            for (let i = 0; i < names.length; i++) {
                const found = this.findSceneObjectByName(outfitRoot, names[i]);
                const text = this.getTextComponent(found);
                if (text) return text;
            }
        }

        return null;
    }

    private getTextComponent(obj: SceneObject | null): Text | null {
        if (!obj) return null;
        try {
            const text = obj.getComponent('Component.Text') as Text;
            if (text) return text;
        } catch (e) { /* no text */ }
        return this.findFirstTextInSubtree(obj, 0);
    }

    private setOutfitText(textComp: Text | null, value: string): void {
        if (!textComp) return;
        try {
            const obj = textComp.getSceneObject();
            if (obj) obj.enabled = true;
            textComp.text = value;
        } catch (e) { /* optional text */ }
    }

    private openCardFromOutfitSlot(slotIndex: number): void {
        const cardIndex = this.outfitSlotToSavedIndex[slotIndex];
        if (cardIndex < 0 || cardIndex >= this.collectionCardObjects.length || cardIndex >= this.savedVehicles.length) return;
        const data = this.savedVehicles[cardIndex];
        const name = data ? (data.brand_model || data.item_name || this.getOutfitSlotLabel(slotIndex)) : this.getOutfitSlotLabel(slotIndex);
        this.restoreCarouselForClosetFocus();
        this.focusCollectionCard(cardIndex);
        if (this.onShowDescription) this.onShowDescription(tf('closet_slot_opened', { name: name }));
        if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(2.0);
    }

    private saveOutfitSlotsToStorage(): void {
        try {
            const serials: string[] = [];
            for (let i = 0; i < this.getOutfitSlotCount(); i++) {
                const savedIndex = this.outfitSlotToSavedIndex[i];
                const item = savedIndex >= 0 && savedIndex < this.savedVehicles.length ? this.savedVehicles[savedIndex] : null;
                serials.push(item && item.serial ? item.serial : '');
            }
            global.persistentStorageSystem.store.putString(this.OUTFIT_SLOTS_KEY, JSON.stringify(serials));
        } catch (e) {
            print('CollectionManager: [OUTFIT] Could not save outfit slots: ' + e);
        }
    }

    private loadOutfitSlotsFromStorage(): void {
        this.outfitSlotToSavedIndex = this.createEmptyOutfitSlots();
        try {
            const raw = global.persistentStorageSystem.store.getString(this.OUTFIT_SLOTS_KEY);
            if (!raw || raw.length === 0) return;
            const serials = JSON.parse(raw) as string[];
            if (!Array.isArray(serials)) return;
            for (let i = 0; i < Math.min(serials.length, this.getOutfitSlotCount()); i++) {
                const idx = this.findSavedVehicleIndexBySerial(serials[i] || '');
                this.outfitSlotToSavedIndex[i] = idx >= 0 ? idx : -1;
            }
        } catch (e) {
            print('CollectionManager: [OUTFIT] Could not load outfit slots: ' + e);
        }
    }

    private adjustOutfitSlotsAfterCardDelete(deletedIndex: number): void {
        for (let i = 0; i < this.outfitSlotToSavedIndex.length; i++) {
            const idx = this.outfitSlotToSavedIndex[i];
            if (idx === deletedIndex) this.outfitSlotToSavedIndex[i] = -1;
            else if (idx > deletedIndex) this.outfitSlotToSavedIndex[i] = idx - 1;
        }
        this.applyOutfitSlotsToVisuals();
    }

    private clearOutfitSlotsFromStorage(): void {
        try {
            global.persistentStorageSystem.store.putString(this.OUTFIT_SLOTS_KEY, '');
        } catch (e) {
            print('CollectionManager: [OUTFIT] Could not clear outfit slots: ' + e);
        }
    }

    private getOutfitCandidateScore(data: SavedVehicleData, slotIndex: number): number {
        let score = 0;
        score += (data.rarity || 2) * 3;
        score += clampStat(data.top_speed || 3);
        score += clampStat(data.acceleration || 3);
        score += clampStat(data.braking || 3);
        score += clampStat(data.traction || 3);
        score += clampStat(data.comfort || 3);
        if (this.getPreferredOutfitSlotForItem(data) === slotIndex) score += 20;
        if (data.style_tags && data.style_tags.length > 0) score += 2;
        if (data.color && data.color.length > 0) score += 1;
        return score;
    }

    private getPreferredOutfitSlotForItem(data: SavedVehicleData): number {
        const text = [
            data.category || '',
            data.type || '',
            data.subcategory || '',
            data.item_name || '',
            data.brand_model || '',
        ].join(' ').toLowerCase();

        if (this.hasLookWord(text, ['hat', 'cap', 'beanie', 'bucket', 'headwear', 'head', 'gorra', 'sombrero'])) return 0;
        if (this.isLookAccessoryLike(text) || this.hasLookWord(text, ['glasses', 'sunglasses', 'bag', 'belt', 'scarf', 'jewelry', 'accessories', 'accesorio', 'accesorios'])) return 0;
        if (this.isLookShoeLike(text)) return 3;
        if (this.isLookBottomLike(text)) return 2;
        // Outerwear (jacket/coat/blazer/cardigan) gets its own layer slot so a top + a
        // jacket can be worn together, instead of competing for the single Top slot.
        if (this.isLookOuterwearLike(text)) return 4;
        if (this.isLookTopLike(text) || this.isLookDressLike(text) || this.isLookFullOutfit(text)) return 1;
        return -1;
    }

    private getOutfitSlotObject(slotIndex: number): SceneObject | null {
        const cached = this.outfitSlotObjects[slotIndex];
        if (cached) return cached;
        const found = this.findExistingOutfitSlot(slotIndex);
        if (found) this.outfitSlotObjects[slotIndex] = found;
        return found;
    }

    private findExistingOutfitSlot(slotIndex: number): SceneObject | null {
        const names = this.getOutfitSlotAliases(slotIndex);
        const outfitRoot = this.getOutfitTesterContainer(true);
        if (outfitRoot) {
            for (let i = 0; i < names.length; i++) {
                const found = this.findSceneObjectByName(outfitRoot, names[i]);
                if (found) return found;
            }
        }

        try {
            const rootCount = global.scene.getRootObjectsCount();
            for (let r = 0; r < rootCount; r++) {
                const root = global.scene.getRootObject(r);
                for (let i = 0; i < names.length; i++) {
                    const found = this.findSceneObjectByName(root, names[i]);
                    if (found) return found;
                }
            }
        } catch (e) { /* ignore */ }
        return null;
    }

    private getOutfitTesterContainer(searchIfNeeded: boolean): SceneObject | null {
        if (this.outfitTesterContainer) return this.outfitTesterContainer;

        if (searchIfNeeded) {
            if (this.garmentPlaceholderContainer) {
                const nested = this.findSceneObjectByName(this.garmentPlaceholderContainer, 'Outfit tester')
                    || this.findSceneObjectByName(this.garmentPlaceholderContainer, 'Outfit Tester');
                if (nested) {
                    this.outfitTesterContainer = nested;
                    return nested;
                }
            }

            try {
                const rootCount = global.scene.getRootObjectsCount();
                for (let i = 0; i < rootCount; i++) {
                    const root = global.scene.getRootObject(i);
                    const found = this.findSceneObjectByName(root, 'Outfit tester')
                        || this.findSceneObjectByName(root, 'Outfit Tester');
                    if (found) {
                        this.outfitTesterContainer = found;
                        return found;
                    }
                }
            } catch (e) { /* ignore */ }
        }

        return this.garmentPlaceholderContainer || null;
    }

    private getOutfitSlotCount(): number {
        return 5;
    }

    private getOutfitSlotLabel(slotIndex: number): string {
        if (slotIndex === 0) return 'Accessories';
        if (slotIndex === 1) return 'Top';
        if (slotIndex === 2) return 'Bottom';
        if (slotIndex === 3) return 'Shoes';
        if (slotIndex === 4) return 'Layer';
        return 'Slot';
    }

    private getOutfitSlotAliases(slotIndex: number): string[] {
        if (slotIndex === 0) return ['photocard ACCESSORIES', 'photocard ACCESSORY', 'PhotoCard ACCESSORIES', 'PhotoCard ACCESSORY', 'Accessories', 'ACCESSORIES', 'Accessory', 'ACCESSORY', 'photocard HAT', 'PhotoCard HAT', 'Photocard HAT', 'Photo Card HAT', 'photocard HEAD', 'Garment HAT', 'HAT', 'Head'];
        if (slotIndex === 1) return ['photocard TOP', 'PhotoCard TOP', 'Photocard TOP', 'Photo Card TOP', 'photocard TORSO', 'photocard DRESS', 'PhotoCard DRESS', 'Photocard DRESS', 'Photo Card DRESS', 'Garment TOP', 'Garment DRESS', 'TOP', 'Torso', 'Dress', 'DRESS', 'Vestido', 'VESTIDO'];
        if (slotIndex === 2) return ['photocard BOTTOM', 'PhotoCard BOTTOM', 'Photocard BOTTOM', 'Photo Card BOTTOM', 'photocard LEGS', 'Garment BOTTOM', 'BOTTOM', 'Legs'];
        if (slotIndex === 3) return ['photocard SHOES', 'PhotoCard SHOES', 'Photocard SHOES', 'Photo Card SHOES', 'Garment SHOES', 'SHOES', 'Shoes'];
        if (slotIndex === 4) return ['photocard TOP 1', 'PhotoCard TOP 1', 'Photocard TOP 1', 'Photo Card TOP 1', 'photocard TOP1', 'photocard TOP 2', 'PhotoCard TOP 2', 'Photocard TOP 2', 'Photo Card TOP 2', 'photocard TOP2', 'photocard LAYER', 'photocard OUTERWEAR', 'Garment LAYER', 'TOP 1', 'TOP1', 'TOP 2', 'TOP2', 'Layer', 'Outerwear', 'Jacket'];
        return [];
    }

    private setOutfitSlotText(slotObj: SceneObject, data: SavedVehicleData, slotIndex: number): void {
        const textObj = this.findSceneObjectByName(slotObj, 'Item Name')
            || this.findSceneObjectByName(slotObj, 'Item Name ' + this.getOutfitSlotLabel(slotIndex))
            || this.findSceneObjectByName(slotObj, this.getOutfitSlotLabel(slotIndex) + ' Name');
        if (!textObj) return;
        try {
            const textComp = textObj.getComponent('Component.Text') as Text;
            if (!textComp) return;
            textComp.text = this.getGarmentDisplayName(data, slotIndex);
            textObj.enabled = true;
        } catch (e) { /* optional slot label */ }
    }

    private enterGarmentInventoryMode(): void {
        if (this.garmentViewMode !== 'inventory') {
            print('CollectionManager: [GARMENT-CLOSET] Returning closet view to saved inventory');
        }
        this.garmentViewMode = 'inventory';
        this.garmentCombinationIndexes = [];
        this.garmentCombinationTargetIndex = -1;
        this.garmentCombinationPercents = [];
    }

    private enterGarmentOutfitMode(): void {
        if (this.garmentViewMode !== 'outfit') {
            print('CollectionManager: [OUTFIT] Opening outfit builder slots');
        }
        this.garmentViewMode = 'outfit';
        this.garmentCombinationIndexes = [];
        this.garmentCombinationTargetIndex = -1;
        this.garmentCombinationPercents = [];
        this.garmentPageIndex = 0;
    }

    private enterGarmentCombinationMode(displayIndexes: number[], targetIndex: number, percents: number[]): void {
        this.garmentViewMode = 'combination';
        this.garmentCombinationIndexes = displayIndexes.slice(0, 2);
        this.garmentCombinationTargetIndex = targetIndex;
        this.garmentCombinationPercents = percents.slice(0, 2);
        this.garmentPageIndex = 0;
        print('CollectionManager: [COMBINE] Closet combination mode indexes=' + this.garmentCombinationIndexes.join(','));
    }

    private isCarouselVisuallyOpen(): boolean {
        return !!(this.collectionRoot && this.collectionRoot.enabled);
    }

    private hookGarmentPlaceholderCloseButton(): void {
        const root = this.garmentViewMode === 'outfit'
            ? this.getOutfitTesterContainer(true)
            : this.garmentPlaceholderContainer;
        if (!root || this._closeHooked.has(root)) return;

        let attempts = 0;
        const poll = this.createEvent('UpdateEvent');
        poll.bind(() => {
            attempts++;
            if (!root || this._closeHooked.has(root) || attempts > 120) {
                poll.enabled = false;
                return;
            }
            if (this.deepSearchAndHookClose(root, () => {
                print('CollectionManager: Outfit tester close pressed');
                this.hideGarmentPlaceholderContainer();
            }, this.garmentViewMode === 'outfit' ? 'OutfitTester' : 'GarmentPlaceholder')) {
                this._closeHooked.add(root);
                poll.enabled = false;
            }
        });
    }

    private updateGarmentPlaceholderVisibility(): void {
        if (!this.garmentPlaceholderContainer) return;
        if (this.garmentViewMode !== 'combination' || this.getGarmentDisplayCount() < 2) {
            this.hideGarmentPlaceholderContainer();
            return;
        }

        const closetObj = this.findDirectChildByName(this.garmentPlaceholderContainer, 'Closet');
        if (closetObj) closetObj.enabled = true;
        this.renderGarmentPage(this.garmentPageIndex);
    }

    private refreshGarmentPlaceholderButtonConnections(): void {
        if (!this.garmentPlaceholderContainer) return;
        const visibleSlots = this.getVisibleGarmentSlotCount();
        for (let i = 0; i < visibleSlots; i++) {
            const placeholder = this.ensureGarmentPlaceholder(i);
            if (placeholder) this.connectGarmentPlaceholderButton(placeholder, i);
        }
    }

    private connectGarmentPlaceholderButton(placeholder: SceneObject, slotIndex: number): void {
        if (!placeholder || slotIndex < 0) return;
        if (this.garmentPlaceholderButtonConnected[slotIndex]) return;

        const connected = this.connectButtonFallback(placeholder, () => {
            this.openCardFromGarmentPlaceholder(slotIndex);
        }, 'GarmentSlot' + (slotIndex + 1));

        if (connected) {
            this.expandGarmentPlaceholderHitArea(placeholder);
            this.garmentPlaceholderButtonConnected[slotIndex] = true;
            print('CollectionManager: [GARMENT-CLOSET] Linked '
                + this.getGarmentPlaceholderName(slotIndex) + ' to visible closet slot #' + (slotIndex + 1));
        } else {
            print('CollectionManager: [GARMENT-CLOSET] '
                + this.getGarmentPlaceholderName(slotIndex) + ' has no button component to open its card');
        }
    }

    private expandGarmentPlaceholderHitArea(root: SceneObject): void {
        if (!root) return;
        try {
            const scripts = root.getComponents('Component.ScriptComponent') as any[];
            for (let i = 0; i < scripts.length; i++) {
                const script = scripts[i];
                if (!script) continue;
                if (script._inactive !== undefined) script._inactive = false;
                if (typeof script._width === 'number') script._width = Math.max(script._width, 6.0);
                if (script._size && script._size.x !== undefined) {
                    script._size = new vec3(
                        Math.max(script._size.x, 6.0),
                        Math.max(script._size.y, 6.0),
                        script._size.z || 1.0
                    );
                }
            }
        } catch (e) { /* button hit area is best-effort */ }

        const childCount = root.getChildrenCount();
        for (let i = 0; i < childCount; i++) {
            const child = root.getChild(i);
            if (child) this.expandGarmentPlaceholderHitArea(child);
        }
    }

    private openCardFromGarmentPlaceholder(slotIndex: number): void {
        const cardIndex = this.getSavedIndexForGarmentSlot(slotIndex);
        if (cardIndex < 0 || cardIndex >= this.collectionCardObjects.length || cardIndex >= this.savedVehicles.length) {
            print('CollectionManager: [GARMENT-CLOSET] Cannot open slot #' + (slotIndex + 1)
                + ' — mapped card index is ' + cardIndex);
            return;
        }
        const data = this.savedVehicles[cardIndex];
        const name = data ? (data.brand_model || data.item_name || this.getGarmentPlaceholderName(slotIndex)) : this.getGarmentPlaceholderName(slotIndex);
        this.restoreCarouselForClosetFocus();
        this.focusCollectionCard(cardIndex);
        if (this.onShowDescription) this.onShowDescription(tf('closet_slot_opened', { name: name }));
        if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(2.0);
        print('CollectionManager: [GARMENT-CLOSET] Opened saved card #' + (cardIndex + 1)
            + ' from ' + this.getGarmentPlaceholderName(slotIndex));
    }

    private restoreCarouselForClosetFocus(): void {
        this.isCollectionOpen = true;
        this.ensureCollectionRoot();
        this.positionVirtualClosetRoot();
        if (this.collectionRoot) this.collectionRoot.enabled = true;

        for (let i = 0; i < this.collectionCardObjects.length; i++) {
            const card = this.collectionCardObjects[i];
            if (!card) continue;
            if ((this.cardStates[i] || this.STATE_IN_COLLECTION) === this.STATE_PLACED_IN_WORLD) continue;
            this.cardStates[i] = this.STATE_IN_COLLECTION;
            if (this.collectionRoot && card.getParent() !== this.collectionRoot) {
                card.setParent(this.collectionRoot);
            }
            card.enabled = true;
            enableAllDescendants(card);
            if (!this.cardImageReady[i]) {
                const cardImageObj = findChildByName(card, 'Card Image');
                if (cardImageObj) cardImageObj.enabled = false;
            }
            if (i < this.savedVehicles.length) this.reapplyCardStatBars(card, this.savedVehicles[i]);
        }

        this.updateCollectionButtonLabel();
        this.syncInteractionState();
    }

    private focusCollectionCard(cardIndex: number): void {
        if (cardIndex < 0 || cardIndex >= this.collectionCardObjects.length) return;
        if (!this.isCollectionOpen || !this.isCarouselVisuallyOpen()) {
            this.showCollection();
        }
        if (!this.collectionCardObjects[cardIndex]) return;

        if (this.cardStates[cardIndex] === this.STATE_PLACED_IN_WORLD || this.cardStates[cardIndex] === this.STATE_PICKED) {
            this.cardStates[cardIndex] = this.STATE_IN_COLLECTION;
        }

        let inCollectionCount = 0;
        let targetCircleIndex = 0;
        for (let i = 0; i < this.collectionCardObjects.length; i++) {
            if ((this.cardStates[i] || this.STATE_IN_COLLECTION) !== this.STATE_IN_COLLECTION) continue;
            if (i === cardIndex) targetCircleIndex = inCollectionCount;
            inCollectionCount++;
        }

        if (this.cardInteraction && inCollectionCount > 0) {
            const angleStep = (2 * Math.PI) / inCollectionCount;
            this.cardInteraction.carouselAngleOffset = (Math.PI / 2) - targetCircleIndex * angleStep;
        }

        const card = this.collectionCardObjects[cardIndex];
        card.enabled = true;
        enableAllDescendants(card);
        this.layoutCircularCards();
        this.startCollectionUpdateLoop();
    }

    private getVisibleGarmentSlotCount(): number {
        if (this.garmentViewMode === 'outfit') return this.getOutfitSlotCount();
        return 2;
    }

    private getGarmentDisplayCount(): number {
        if (this.garmentViewMode === 'combination' && this.garmentCombinationIndexes.length > 0) {
            return this.garmentCombinationIndexes.length;
        }
        return this.savedVehicles.length;
    }

    private getSavedIndexForGarmentDisplayIndex(displayIndex: number): number {
        if (displayIndex < 0) return -1;
        if (this.garmentViewMode === 'combination') {
            const mapped = this.garmentCombinationIndexes[displayIndex];
            return typeof mapped === 'number' && isFinite(mapped) ? mapped : -1;
        }
        return displayIndex;
    }

    private getGarmentPageCount(): number {
        const visibleSlots = this.getVisibleGarmentSlotCount();
        return Math.max(1, Math.ceil(this.getGarmentDisplayCount() / visibleSlots));
    }

    private clampGarmentPageIndex(): void {
        const maxPage = this.getGarmentPageCount() - 1;
        if (this.garmentPageIndex < 0) this.garmentPageIndex = 0;
        if (this.garmentPageIndex > maxPage) this.garmentPageIndex = maxPage;
    }

    private setGarmentPageForSavedIndex(savedIndex: number): void {
        this.enterGarmentInventoryMode();
        const visibleSlots = this.getVisibleGarmentSlotCount();
        this.garmentPageIndex = Math.max(0, Math.floor(savedIndex / visibleSlots));
        this.clampGarmentPageIndex();
    }

    private getVisualSlotIndexForSavedIndex(savedIndex: number): number {
        if (savedIndex < 0) return -1;
        const visibleSlots = this.getVisibleGarmentSlotCount();
        const displayIndex = this.garmentViewMode === 'combination'
            ? this.garmentCombinationIndexes.indexOf(savedIndex)
            : savedIndex;
        if (displayIndex < 0) return -1;
        const pageStart = this.garmentPageIndex * visibleSlots;
        const slotIndex = displayIndex - pageStart;
        if (slotIndex < 0 || slotIndex >= visibleSlots) return -1;
        return slotIndex;
    }

    private getSavedIndexForGarmentSlot(slotIndex: number): number {
        if (slotIndex < 0) return -1;
        const mapped = this.garmentSlotToSavedIndex[slotIndex];
        if (typeof mapped === 'number' && isFinite(mapped)) return mapped;
        return this.garmentPageIndex * this.getVisibleGarmentSlotCount() + slotIndex;
    }

    private showNextGarmentPage(): void {
        const pageCount = this.getGarmentPageCount();
        if (pageCount <= 1) return;
        this.garmentPageIndex = (this.garmentPageIndex + 1) % pageCount;
        this.renderGarmentPage(this.garmentPageIndex);
        this.showGarmentPageStatus();
    }

    private showPreviousGarmentPage(): void {
        const pageCount = this.getGarmentPageCount();
        if (pageCount <= 1) return;
        this.garmentPageIndex = (this.garmentPageIndex + pageCount - 1) % pageCount;
        this.renderGarmentPage(this.garmentPageIndex);
        this.showGarmentPageStatus();
    }

    private showGarmentPageStatus(): void {
        const pageCount = this.getGarmentPageCount();
        if (this.onShowDescription) {
            this.onShowDescription(tf('closet_page_status', {
                page: this.garmentPageIndex + 1,
                pages: pageCount,
            }));
        }
        if (this.onHideDescriptionAfterDelay) this.onHideDescriptionAfterDelay(1.5);
    }

    private renderGarmentPage(pageIndex: number): void {
        if (!this.garmentPlaceholderContainer) return;
        if (this.getGarmentDisplayCount() === 0) {
            this.garmentSlotToSavedIndex = [];
            this.hideGarmentPlaceholderContainer();
            return;
        }

        const visibleSlots = this.getVisibleGarmentSlotCount();
        const maxPage = this.getGarmentPageCount() - 1;
        this.garmentPageIndex = Math.max(0, Math.min(pageIndex, maxPage));
        const pageStart = this.garmentPageIndex * visibleSlots;

        for (let slotIndex = 0; slotIndex < visibleSlots; slotIndex++) {
            const displayIndex = pageStart + slotIndex;
            const savedIndex = this.getSavedIndexForGarmentDisplayIndex(displayIndex);
            const hasItem = savedIndex >= 0 && savedIndex < this.savedVehicles.length;
            this.garmentSlotToSavedIndex[slotIndex] = hasItem ? savedIndex : -1;

            const sourceCardObj = hasItem ? this.collectionCardObjects[savedIndex] : null;
            const templateImageObj = sourceCardObj ? findChildByName(sourceCardObj, 'Card Image') : null;
            const placeholder = this.ensureGarmentPlaceholder(slotIndex, templateImageObj);
            if (!placeholder) continue;

            placeholder.enabled = hasItem;
            if (!hasItem) continue;

            const data = this.savedVehicles[savedIndex];
            if (!data) {
                placeholder.enabled = false;
                continue;
            }

            this.setGarmentPlaceholderText(placeholder, data, savedIndex);
            const loadedCutout = this.loadGarmentCutoutForPlaceholder(savedIndex, data.savedAt, sourceCardObj || undefined, data);
            if (!loadedCutout) {
                this.loadCardImageForGarmentPlaceholder(savedIndex, data.savedAt, sourceCardObj || undefined, data);
            }
        }

        this.updateGarmentPageIndicator();
    }

    private loadCardImageForGarmentPlaceholder(
        savedIndex: number,
        savedAt: number,
        sourceCardObj?: SceneObject,
        data?: SavedVehicleData
    ): boolean {
        if (!savedAt) return false;
        try {
            const slotIndex = this.getVisualSlotIndexForSavedIndex(savedIndex);
            if (slotIndex < 0) return false;
            const storageKey = this.IMAGE_KEY_PREFIX + savedAt.toString();
            const b64 = global.persistentStorageSystem.store.getString(storageKey);
            if (!b64 || b64.length === 0) return false;

            const templateImageObj = sourceCardObj ? findChildByName(sourceCardObj, 'Card Image') : null;
            const placeholder = this.ensureGarmentPlaceholder(slotIndex, templateImageObj);
            if (!placeholder) return false;
            if (data) this.setGarmentPlaceholderText(placeholder, data, savedIndex);

            Base64.decodeTextureAsync(
                b64,
                (texture: Texture) => {
                    if (this.getSavedIndexForGarmentSlot(slotIndex) === savedIndex) {
                        this.applyTextureToSceneObject(placeholder, texture);
                    }
                },
                () => { print('CollectionManager: [GARMENT-CLOSET] Failed to decode saved scan image for card ' + (savedIndex + 1)); }
            );
            return true;
        } catch (e) {
            print('CollectionManager: [GARMENT-CLOSET] Scan image load exception: ' + e);
            return false;
        }
    }

    private updateGarmentPageIndicator(): void {
        if (!this.garmentPlaceholderContainer) return;
        const names = ['Page Indicator', 'Closet Page', 'Garment Page', 'Page Text'];
        let indicator: SceneObject | null = null;
        for (let i = 0; i < names.length; i++) {
            indicator = this.findSceneObjectByName(this.garmentPlaceholderContainer, names[i]);
            if (indicator) break;
        }
        if (!indicator) return;

        try {
            const textComp = indicator.getComponent('Component.Text') as Text;
            if (!textComp) return;
            textComp.text = (this.garmentPageIndex + 1) + ' / ' + this.getGarmentPageCount();
            indicator.enabled = this.getGarmentPageCount() > 1;
        } catch (e) { /* optional UI */ }
    }

    private hookGarmentPageButtons(): void {
        if (!this.garmentPlaceholderContainer) return;
        if (!this.garmentPrevPageButtonConnected) {
            const prevButton = this.findFirstSceneObjectByNames(this.garmentPlaceholderContainer, [
                'Previous Garment Page',
                'Prev Garment Page',
                'Previous Page',
                'Prev Page',
                'Closet Prev',
            ]);
            if (prevButton && this.connectButtonFallback(prevButton, () => this.showPreviousGarmentPage(), 'GarmentPrevPage')) {
                this.garmentPrevPageButtonConnected = true;
            }
        }

        if (!this.garmentNextPageButtonConnected) {
            const nextButton = this.findFirstSceneObjectByNames(this.garmentPlaceholderContainer, [
                'Next Garment Page',
                'Next Page',
                'Closet Next',
            ]);
            if (nextButton && this.connectButtonFallback(nextButton, () => this.showNextGarmentPage(), 'GarmentNextPage')) {
                this.garmentNextPageButtonConnected = true;
            }
        }
    }

    private findFirstSceneObjectByNames(root: SceneObject, names: string[]): SceneObject | null {
        for (let i = 0; i < names.length; i++) {
            const found = this.findSceneObjectByName(root, names[i]);
            if (found) return found;
        }
        return null;
    }

    private getGarmentSlotIndexFromName(name: string): number {
        if (!name) return -1;
        const normalized = name.toLowerCase().replace(/\s+/g, ' ').trim();
        if (normalized === 'photocard top' || normalized === 'photo card top' || normalized === 'garment top' || normalized === 'top') return 0;
        if (normalized === 'photocard bottom' || normalized === 'photo card bottom' || normalized === 'garment bottom' || normalized === 'bottom') return 1;
        const match = normalized.match(/^(garment|photocard|photo card)\s+(\d+)$/);
        if (!match) return -1;
        const n = parseInt(match[2], 10);
        if (!isFinite(n) || n <= 0) return -1;
        return n - 1;
    }

    private resolveGarmentCardTemplate(fallbackTemplateObj?: SceneObject | null): SceneObject | null {
        if (this.garmentPlaceholderContainer) {
            const namedTemplate = this.findDirectChildByName(this.garmentPlaceholderContainer, 'Garment Template')
                || this.findDirectChildByName(this.garmentPlaceholderContainer, 'photocard')
                || this.findDirectChildByName(this.garmentPlaceholderContainer, 'PhotoCard')
                || this.findDirectChildByName(this.garmentPlaceholderContainer, 'Template')
                || this.findDirectChildByName(this.garmentPlaceholderContainer, 'photocard TOP')
                || this.findDirectChildByName(this.garmentPlaceholderContainer, 'photocard BOTTOM')
                || this.findDirectChildByName(this.garmentPlaceholderContainer, 'photocard 1')
                || this.findDirectChildByName(this.garmentPlaceholderContainer, 'PhotoCard 1')
                || this.findDirectChildByName(this.garmentPlaceholderContainer, 'Photocard 1');
            if (namedTemplate) {
                namedTemplate.enabled = false;
                return namedTemplate;
            }

            const childCount = this.garmentPlaceholderContainer.getChildrenCount();
            for (let i = 0; i < childCount; i++) {
                const child = this.garmentPlaceholderContainer.getChild(i);
                if (!child) continue;
                if (!this.isGarmentCardCandidate(child)) continue;
                child.enabled = false;
                return child;
            }
        }

        return fallbackTemplateObj || null;
    }

    private findDirectChildByName(parent: SceneObject, name: string): SceneObject | null {
        if (!parent) return null;
        const childCount = parent.getChildrenCount();
        for (let i = 0; i < childCount; i++) {
            const child = parent.getChild(i);
            if (child && child.name === name) return child;
        }
        return null;
    }

    private isGeneratedGarmentSlotName(name: string): boolean {
        return !!name && (
            name.indexOf('Garment ') === 0
            || name.indexOf('photocard ') === 0
            || name.indexOf('PhotoCard ') === 0
            || name.indexOf('Photocard ') === 0
        );
    }

    private isGarmentCardCandidate(obj: SceneObject): boolean {
        if (!obj) return false;
        if (obj.name === 'Closet') return false;
        if (this.isGeneratedGarmentSlotName(obj.name)) return true;
        return !!this.findSceneObjectByName(obj, 'Garment Image') || !!this.findSceneObjectByName(obj, 'Item Name');
    }

    private findExistingGarmentPlaceholder(slotIndex: number): SceneObject | null {
        const names = this.getGarmentPlaceholderAliases(slotIndex);
        const roots: SceneObject[] = [];
        if (this.garmentPlaceholderContainer) roots.push(this.garmentPlaceholderContainer);
        if (this.collectionRoot) roots.push(this.collectionRoot);
        if (this.cardCollectionContainer) roots.push(this.cardCollectionContainer);

        for (let i = 0; i < roots.length; i++) {
            for (let n = 0; n < names.length; n++) {
                const found = this.findSceneObjectByName(roots[i], names[n]);
                if (found) return found;
            }
        }

        try {
            const rootCount = global.scene.getRootObjectsCount();
            for (let i = 0; i < rootCount; i++) {
                const root = global.scene.getRootObject(i);
                for (let n = 0; n < names.length; n++) {
                    const found = this.findSceneObjectByName(root, names[n]);
                    if (found) return found;
                }
            }
        } catch (e) { /* ignore */ }

        return null;
    }

    private findSceneObjectByName(root: SceneObject, name: string): SceneObject | null {
        if (!root) return null;
        if (root.name === name) return root;
        const childCount = root.getChildrenCount();
        for (let i = 0; i < childCount; i++) {
            const child = root.getChild(i);
            if (!child) continue;
            const found = this.findSceneObjectByName(child, name);
            if (found) return found;
        }
        return null;
    }

    private setGarmentPlaceholderText(placeholder: SceneObject, data: SavedVehicleData, slotIndex: number): void {
        if (!placeholder) return;
        const itemNameObj = this.findSceneObjectByName(placeholder, 'Item Name');
        if (!itemNameObj) return;

        try {
            const textComp = itemNameObj.getComponent('Component.Text') as Text;
            if (!textComp) return;
            textComp.text = this.getGarmentDisplayName(data, slotIndex);
            itemNameObj.enabled = true;
        } catch (e) {
            print('CollectionManager: [GARMENT-CUTOUT] Could not set Item Name text: ' + e);
        }
    }

    private getGarmentDisplayName(data: SavedVehicleData, slotIndex: number): string {
        let rawName = (data.item_name || data.brand_model || data.brand || data.type || this.getGarmentPlaceholderName(slotIndex)).trim();
        if (this.garmentViewMode === 'combination') {
            const savedIndex = slotIndex;
            const combinationOrder = this.garmentCombinationIndexes.indexOf(savedIndex);
            if (savedIndex === this.garmentCombinationTargetIndex) {
                rawName = tf('look_option_base', { name: rawName });
            } else if (combinationOrder > 0) {
                rawName = tf('look_option_match_pct', {
                    name: rawName,
                    percent: this.garmentCombinationPercents[combinationOrder] || 0,
                });
            } else if (combinationOrder === 0) {
                rawName = tf('look_option_match_pct', {
                    name: rawName,
                    percent: this.garmentCombinationPercents[combinationOrder] || 0,
                });
            }
        }
        if (rawName.length <= 34) return rawName;
        return rawName.substring(0, 31) + '...';
    }

    private applyTextureToSceneObject(obj: SceneObject, texture: Texture): boolean {
        if (!obj || !texture) return false;
        const target = this.findFirstVisualTarget(obj);
        if (!target) return false;

        try {
            const imgComp = target.getComponent('Component.Image') as Image;
            if (imgComp) {
                if (imgComp.mainMaterial) imgComp.mainMaterial = imgComp.mainMaterial.clone();
                imgComp.mainPass.baseTex = texture;
                obj.enabled = true;
                target.enabled = true;
                return true;
            }
        } catch (e) { /* try mesh */ }

        try {
            const meshComp = target.getComponent('Component.RenderMeshVisual') as RenderMeshVisual;
            if (meshComp) {
                if (meshComp.mainMaterial) meshComp.mainMaterial = meshComp.mainMaterial.clone();
                meshComp.mainPass.baseTex = texture;
                obj.enabled = true;
                target.enabled = true;
                return true;
            }
        } catch (e) { /* ignore */ }

        return false;
    }

    private findFirstVisualTarget(root: SceneObject): SceneObject | null {
        if (!root) return null;
        const preferredNames = ['Garment Image', 'Card Image', 'Item Image', 'Photo'];
        for (let i = 0; i < preferredNames.length; i++) {
            const namedTarget = this.findSceneObjectByName(root, preferredNames[i]);
            if (namedTarget && this.hasTextureVisual(namedTarget)) return namedTarget;
        }

        if (this.hasTextureVisual(root)) return root;

        const childCount = root.getChildrenCount();
        for (let i = 0; i < childCount; i++) {
            const child = root.getChild(i);
            if (!child) continue;
            const found = this.findFirstVisualTarget(child);
            if (found) return found;
        }
        return null;
    }

    private hasTextureVisual(obj: SceneObject): boolean {
        if (!obj) return false;
        try {
            if (obj.getComponent('Component.Image') as Image) return true;
        } catch (e) { /* ignore */ }
        try {
            if (obj.getComponent('Component.RenderMeshVisual') as RenderMeshVisual) return true;
        } catch (e) { /* ignore */ }
        return false;
    }

    private positionRuntimeGarmentPlaceholder(obj: SceneObject, slotIndex: number, templateObj?: SceneObject | null): void {
        try {
            const spacing = this.garmentPlaceholderSpacing || 6;
            const columns = Math.max(1, Math.floor(this.garmentPlaceholderColumns || 3));
            const col = slotIndex % columns;
            const row = Math.floor(slotIndex / columns);
            const transform = obj.getTransform();
            if (templateObj) {
                const templateTransform = templateObj.getTransform();
                const basePosition = templateTransform.getLocalPosition();
                transform.setLocalPosition(new vec3(
                    basePosition.x + col * spacing,
                    basePosition.y - row * spacing * 1.15,
                    basePosition.z
                ));
                transform.setLocalRotation(templateTransform.getLocalRotation());
                transform.setLocalScale(templateTransform.getLocalScale());
                return;
            }

            transform.setLocalPosition(new vec3(-9 + col * spacing, -11 - row * spacing * 0.8, -0.25));
            transform.setLocalRotation(quat.fromEulerAngles(0, 0, 0));
            const scale = this.cardInteraction ? this.cardInteraction.collectionCardScale * 0.55 : 0.10;
            transform.setLocalScale(new vec3(scale, scale, scale));
        } catch (e) { /* ignore */ }
    }

    private getGarmentPlaceholderName(slotIndex: number): string {
        if (slotIndex === 0) return 'photocard TOP';
        if (slotIndex === 1) return 'photocard BOTTOM';
        return 'Garment ' + (slotIndex + 1);
    }

    private getGarmentPlaceholderAliases(slotIndex: number): string[] {
        const n = slotIndex + 1;
        const aliases = [
            'Garment ' + n,
            'photocard ' + n,
            'PhotoCard ' + n,
            'Photocard ' + n,
            'Photo Card ' + n,
        ];
        if (slotIndex === 0) {
            aliases.unshift('photocard TOP', 'PhotoCard TOP', 'Photocard TOP', 'Photo Card TOP', 'Garment TOP', 'TOP');
        } else if (slotIndex === 1) {
            aliases.unshift('photocard BOTTOM', 'PhotoCard BOTTOM', 'Photocard BOTTOM', 'Photo Card BOTTOM', 'Garment BOTTOM', 'BOTTOM');
        }
        return aliases;
    }

    private findSavedVehicleIndexBySerial(serial: string): number {
        if (!serial || serial.length === 0) return -1;
        for (let i = 0; i < this.savedVehicles.length; i++) {
            if (this.savedVehicles[i] && this.savedVehicles[i].serial === serial) return i;
        }
        return -1;
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

    private withTimeout<T>(promise: Promise<T>, seconds: number, label: string): Promise<T> {
        if (!seconds || seconds <= 0) return promise;
        return new Promise<T>((resolve, reject) => {
            let settled = false;
            const timeoutEvent = this.createEvent('DelayedCallbackEvent') as any;
            timeoutEvent.bind(() => {
                if (settled) return;
                settled = true;
                reject(new Error(label + ' after ' + seconds + 's'));
            });
            timeoutEvent.reset(seconds);

            promise.then((value: T) => {
                if (settled) return;
                settled = true;
                try { timeoutEvent.enabled = false; } catch (e) { /* ignore */ }
                resolve(value);
            }).catch((err: any) => {
                if (settled) return;
                settled = true;
                try { timeoutEvent.enabled = false; } catch (e) { /* ignore */ }
                reject(err);
            });
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

    private loadDeletedSerials(): void {
        try {
            const jsonString = global.persistentStorageSystem.store.getString(this.DELETED_SERIALS_KEY);
            if (!jsonString || jsonString.length === 0) {
                this.deletedSerials = [];
                return;
            }

            const parsed = JSON.parse(jsonString) as string[];
            this.deletedSerials = Array.isArray(parsed) ? parsed.filter(s => !!s && s.length > 0) : [];
            if (this.deletedSerials.length > 0) {
                print('CollectionManager: Loaded ' + this.deletedSerials.length + ' deleted closet serials');
            }
        } catch (e) {
            this.deletedSerials = [];
            print('CollectionManager: Deleted serial load error: ' + e);
        }
    }

    private saveDeletedSerials(): void {
        try {
            global.persistentStorageSystem.store.putString(this.DELETED_SERIALS_KEY, JSON.stringify(this.deletedSerials));
        } catch (e) {
            print('CollectionManager: Deleted serial save error: ' + e);
        }
    }

    private isDeletedSerial(serial: string | undefined | null): boolean {
        if (!serial || serial.length === 0) return false;
        return this.deletedSerials.indexOf(serial) >= 0;
    }

    private rememberDeletedSerial(serial: string | undefined | null): void {
        if (!serial || serial.length === 0) return;
        if (this.deletedSerials.indexOf(serial) >= 0) return;
        this.deletedSerials.push(serial);
        this.saveDeletedSerials();
        print('CollectionManager: Remembered deleted closet serial — ' + serial);
    }

    private saveCollectionToStorage(): void {
        try {
            const store = global.persistentStorageSystem.store;
            const activeVehicles = this.savedVehicles.filter(v => !this.isDeletedSerial(v.serial || ''));
            const serializable = activeVehicles.map(v => ({
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

            let needsResave = false;
            this.savedVehicles = [];
            for (let i = 0; i < parsed.length; i++) {
                const item = parsed[i];
                if (item && this.isDeletedSerial(item.serial || '')) {
                    needsResave = true;
                    print('CollectionManager: Ignoring deleted closet item from storage — ' + (item.brand_model || item.item_name || item.serial));
                } else if (item) {
                    this.savedVehicles.push(item);
                }
            }
            if (this.savedVehicles.length === 0) {
                if (needsResave) this.saveCollectionToStorage();
                return;
            }

            // Retroactive field generation for cards saved before serial/date/city system
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
                    if (vehicleData.savedAt) {
                        const loadedGeneratedCard = this.loadGarmentCutoutForCard(i, vehicleData.savedAt, cardObj);
                        if (!loadedGeneratedCard) {
                            this.loadCardImageFromStorage(vehicleData.brand_model || vehicleData.item_name || 'Item', vehicleData.savedAt, cardObj);
                        }
                    }
                }
            }
            this.hideGarmentPlaceholderContainer();
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
        return this.savedVehicles.filter(v => !this.isDeletedSerial(v.serial || ''));
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

    // =====================================================================
    // FULL-LOOK (MIRROR OUTFIT) — one collector card per worn garment
    // =====================================================================

    // Background cut-out queue for outfit cards (processes one at a time, non-blocking)
    private _outfitCutoutQueue: Array<{ data: SavedVehicleData; cardObj: SceneObject; b64: string }> = [];
    private _outfitCutoutProcessing: boolean = false;

    /** Queues a single-garment cut-out to generate in the background (one at a time). */
    private enqueueOutfitCutout(data: SavedVehicleData, cardObj: SceneObject, b64: string): void {
        if (!b64 || b64.length === 0) return;
        this._outfitCutoutQueue.push({ data: data, cardObj: cardObj, b64: b64 });
        this.processOutfitCutoutQueue();
    }

    /** Drains the outfit cut-out queue one job at a time, updating each card's image when ready. */
    private async processOutfitCutoutQueue(): Promise<void> {
        if (this._outfitCutoutProcessing) return;
        this._outfitCutoutProcessing = true;
        while (this._outfitCutoutQueue.length > 0) {
            const job = this._outfitCutoutQueue.shift();
            if (!job) continue;
            const name = job.data.item_name || job.data.brand_model || 'item';
            try {
                const tex = await this.generateGarmentCutoutTexture(job.data, job.b64, true);
                this.applyCardImage(job.cardObj, tex);
                this.saveGarmentCutoutTextureToStorage(job.data.savedAt, tex, (saved: boolean, b64?: string) => {
                    const idx = this.findSavedVehicleIndexBySerial(job.data.serial);
                    if (idx >= 0) {
                        this.savedVehicles[idx].imageGenerated = saved;
                        this.saveCollectionToStorage();
                    }
                    if (saved && b64 && this.onCloudUploadImage) this.onCloudUploadImage(job.data.serial, b64);
                });
                print('CollectionManager: [OUTFIT] Background cut-out ready — ' + name);
            } catch (e) {
                print('CollectionManager: [OUTFIT] Background cut-out failed for ' + name + ': ' + e);
            }
        }
        this._outfitCutoutProcessing = false;
    }

    /**
     * Saves a worn outfit (mirror selfie, mode 'full_look') as one collector card
     * per garment. Each garment gets its own isolated AI cut-out; the cards appear
     * one by one in a grid in front of the user, then fly together into the
     * collection. Assumes the caller set isSavingCard = true and validated inputs.
     */
    private async saveFullLookAsCards(): Promise<void> {
        const look = this.lastVehicleData;
        if (!look || !this.verticalCardPrefab) { this.isSavingCard = false; return; }

        const allItems = (look.items || []).filter((it) => !!it && (!!it.item_name || !!it.category));
        if (allItems.length < 2) { this.isSavingCard = false; return; }

        const maxSize = this.maxCollectionSize || 100;
        const room = Math.max(0, maxSize - this.savedVehicles.length);
        const items = room > 0 ? allItems.slice(0, room) : [];
        if (items.length === 0) {
            if (this.onShowDescription) this.onShowDescription(tf('max_cards', { max: maxSize }));
            this.isSavingCard = false;
            return;
        }

        const capturedPhotoBase64 = this.lastCapturedBase64 || '';
        const headData = this.getUserHeadTransform();
        const revealRoot = this.getOrCreateRevealParent();
        const showStatus = this.onShowCardStatus || this.onShowAnimatedDescription || this.onShowDescription;
        const hideStatus = this.onHideCardStatus || null;

        if (this.onCardGenerationStarted) this.onCardGenerationStarted();

        // Outfit judgement text while the cards generate
        const lookFeedback = look.look_summary || look.feedback || '';
        if (lookFeedback.length > 0 && this.onShowAnimatedDescription) {
            this.onShowAnimatedDescription(lookFeedback);
        }

        const cardObjs: SceneObject[] = [];
        const savedList: SavedVehicleData[] = [];
        const baseTs = Date.now();

        // Decode the scan photo once — used as the instant placeholder on every card
        const scanTex = capturedPhotoBase64.length > 0 ? await this.decodeBase64Texture(capturedPhotoBase64) : null;

        // 1) Build every card up front and pop them into the grid quickly (staggered reveal)
        for (let i = 0; i < items.length; i++) {
            const savedData = this.buildSavedDataFromLookItem(items[i], look, baseTs + i);
            this.savedVehicles.push(savedData);
            savedList.push(savedData);
            if (capturedPhotoBase64.length > 0) {
                this.saveCardImageBase64ToStorage(savedData.item_name || savedData.brand_model, savedData.savedAt, capturedPhotoBase64);
            }
            const cardObj = this.verticalCardPrefab.instantiate(revealRoot);
            if (!cardObj) continue;
            this.populateCollectorCard(cardObj, savedData);
            if (scanTex) this.applyCardImage(cardObj, scanTex);
            const slot = this.computeOutfitGridSlot(i, items.length, headData);
            const ct = cardObj.getTransform();
            ct.setWorldPosition(slot.pos);
            ct.setWorldRotation(slot.rot);
            ct.setWorldScale(new vec3(0.001, 0.001, 0.001));
            cardObj.enabled = false;
            cardObjs.push(cardObj);
            if (this.onCloudSyncVehicle) this.onCloudSyncVehicle(savedData);

            // Reveal this card into its grid slot shortly after, staggered for a quick cascade
            const idx = cardObjs.length - 1;
            const revealDelay = this.createEvent('DelayedCallbackEvent') as any;
            revealDelay.bind(() => this.revealOutfitCard(cardObjs[idx], this.computeOutfitGridSlot(idx, cardObjs.length, headData)));
            revealDelay.reset(idx * 0.2);
        }
        this.saveCollectionToStorage();

        // 2) Generate the isolated cut-outs in the BACKGROUND (one at a time) so the cards
        //    appear instantly. Each card's image updates when ready, even once it is in the
        //    collection — just like an individual garment scan.
        for (let i = 0; i < cardObjs.length; i++) {
            this.enqueueOutfitCutout(savedList[i], cardObjs[i], capturedPhotoBase64);
        }

        if (showStatus) showStatus(tf('outfit_ready', { count: cardObjs.length }));

        // 3) Once the grid has popped in, stop the waiting SFX and fly the cards into the collection
        const revealsDone = cardObjs.length * 0.2 + 0.6;
        const successEvent = this.createEvent('DelayedCallbackEvent') as any;
        successEvent.bind(() => { if (this.onCardGenerationSuccess) this.onCardGenerationSuccess(); });
        successEvent.reset(revealsDone);

        const holdEvent = this.createEvent('DelayedCallbackEvent') as any;
        holdEvent.bind(() => this.flyOutfitCardsToCollection(cardObjs, savedList, hideStatus));
        holdEvent.reset(revealsDone + 1.0);
    }

    /** Builds a SavedVehicleData for a single worn garment from a LookItem + the shared look context. */
    private buildSavedDataFromLookItem(item: any, look: VehicleData, savedAt: number): SavedVehicleData {
        const rawName = item.item_name || item.subcategory || item.category || 'Garment';
        const name = this.buildUniqueSavedItemName(rawName);
        const asVehicle: VehicleData = {
            vehicle_found: true,
            clothing_found: true,
            mode: 'single_item',
            scan_context: look.scan_context || 'worn',
            brand: item.brand || '',
            brand_model: name,
            item_name: name,
            type: item.category || 'unknown',
            category: item.category || 'unknown',
            subcategory: item.subcategory || '',
            year: look.year || '',
            collection: look.collection || '',
            collection_year: look.collection_year || '',
            quality: item.condition || look.quality || '',
            color: item.color || '',
            material: item.material || '',
            pattern: item.pattern || '',
            fit: item.fit || '',
            condition: item.condition || '',
            confidence: typeof item.confidence === 'number' ? item.confidence : (look.confidence || 0),
            style_tags: item.style_tags || [],
            occasion_tags: item.occasion_tags || [],
            season_tags: item.season_tags || [],
            items: [],
            look_summary: '',
            suggested_pairings: item.suggested_pairings || [],
            feedback: item.feedback || '',
            top_speed: clampStat(item.top_speed),
            acceleration: clampStat(item.acceleration),
            braking: clampStat(item.braking),
            traction: clampStat(item.traction),
            comfort: clampStat(item.comfort),
            rarity: clampStat(item.rarity || 2),
            rarity_label: item.rarity_label || getRarityLabel(clampStat(item.rarity || 2)),
            scene: look.scene || '',
        };
        const pairingNote = this.buildPairingNote(asVehicle);
        const aiNote = this.buildDisplayNote(asVehicle, pairingNote);
        return {
            ...asVehicle,
            pairing_note: pairingNote,
            ai_note: aiNote,
            user_note: '',
            savedAt: savedAt,
            imageGenerated: false,
            serial: generateSerial(),
            dateScanned: formatScanDate(savedAt),
            cityScanned: this.cachedCity,
        } as SavedVehicleData;
    }

    /** Computes the world position + rotation of card `index` in a grid of `total` cards in front of the user. */
    private computeOutfitGridSlot(
        index: number,
        total: number,
        headData: { position: vec3; forward: vec3; rotation: quat } | null
    ): { pos: vec3; rot: quat } {
        const DISTANCE = 75;
        const SPACING_X = 14;
        const SPACING_Y = 18;
        const MAX_COLS = 3;

        const cols = Math.min(total, MAX_COLS);
        const rows = Math.ceil(total / cols);
        const col = index % cols;
        const row = Math.floor(index / cols);
        const itemsInRow = (row === rows - 1) ? (total - row * cols) : cols;
        const colCenter = (itemsInRow - 1) / 2;
        const rowCenter = (rows - 1) / 2;
        const xOff = (col - colCenter) * SPACING_X;
        const yOff = (rowCenter - row) * SPACING_Y;

        if (!headData) {
            return { pos: new vec3(xOff, yOff, -DISTANCE), rot: quat.fromEulerAngles(0, Math.PI, 0) };
        }
        const fwd = headData.forward.normalize();
        const right = fwd.cross(vec3.up()).normalize();
        const up = right.cross(fwd).normalize();
        const center = headData.position.add(fwd.uniformScale(DISTANCE));
        const pos = center.add(right.uniformScale(xOff)).add(up.uniformScale(yOff));
        return { pos: pos, rot: headData.rotation };
    }

    /** Scale-in reveal of one outfit card into its grid slot (own UpdateEvent). */
    private revealOutfitCard(cardObj: SceneObject, slot: { pos: vec3; rot: quat }): void {
        const GRID_SCALE = 0.33;
        const DUR = 0.45;
        const ct = cardObj.getTransform();
        ct.setWorldPosition(slot.pos);
        ct.setWorldRotation(slot.rot);
        ct.setWorldScale(new vec3(0.001, 0.001, 0.001));
        cardObj.enabled = true;
        const start = getTime();
        const ev = this.createEvent('UpdateEvent');
        ev.bind(() => {
            const t = Math.min((getTime() - start) / DUR, 1.0);
            const eased = 1.0 - Math.pow(1.0 - t, 3.0);
            const s = eased * GRID_SCALE;
            ct.setWorldScale(new vec3(s, s, s));
            ct.setWorldPosition(slot.pos);
            ct.setWorldRotation(slot.rot);
            if (t >= 1.0) { try { ev.enabled = false; } catch (e) { /* ignore */ } }
        });
    }

    /** Flies all outfit cards from their grid into the collection, staggered, then finalizes each. */
    private flyOutfitCardsToCollection(
        cardObjs: SceneObject[],
        savedList: SavedVehicleData[],
        hideStatus: ((seconds: number) => void) | null
    ): void {
        if (cardObjs.length === 0) { this.isSavingCard = false; return; }

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
        if (this.onCardFlyToInventory) this.onCardFlyToInventory();

        const endScale = this.cardInteraction ? this.cardInteraction.collectionCardScale : 0.18;
        let remaining = cardObjs.length;

        for (let i = 0; i < cardObjs.length; i++) {
            const cardObj = cardObjs[i];
            const savedData = savedList[i];
            const delayEv = this.createEvent('DelayedCallbackEvent') as any;
            delayEv.bind(() => {
                const ct = cardObj.getTransform();
                const startPos = ct.getWorldPosition();
                const startRot = ct.getWorldRotation();
                const startScale = ct.getWorldScale().x;
                const FLY = 0.7;
                const t0 = getTime();
                const flyEv = this.createEvent('UpdateEvent');
                flyEv.bind(() => {
                    const t = Math.min((getTime() - t0) / FLY, 1.0);
                    const eased = 1.0 - Math.pow(1.0 - t, 3.0);
                    ct.setWorldPosition(vec3.lerp(startPos, targetPos, eased));
                    ct.setWorldRotation(quat.slerp(startRot, targetRot, eased));
                    const s = startScale + (endScale - startScale) * eased;
                    ct.setWorldScale(new vec3(s, s, s));
                    if (t >= 1.0) {
                        try { flyEv.enabled = false; } catch (e) { /* ignore */ }
                        this.finalizeOutfitCard(cardObj, savedData, endScale);
                        remaining--;
                        if (remaining <= 0) {
                            this.isSavingCard = false;
                            this.updateCollectionButtonLabel();
                            if (hideStatus) hideStatus(2.5);
                        }
                    }
                });
            });
            delayEv.reset(i * 0.18);
        }
    }

    /** Reparents a flown outfit card into the collection and registers it in the parallel arrays. */
    private finalizeOutfitCard(cardObj: SceneObject, savedData: SavedVehicleData, scale: number): void {
        this.ensureCollectionRoot();
        if (this.collectionRoot) {
            cardObj.setParent(this.collectionRoot);
            const t = cardObj.getTransform();
            t.setLocalPosition(vec3.zero());
            t.setLocalRotation(quat.fromEulerAngles(0, 0, 0));
            t.setLocalScale(new vec3(scale, scale, scale));
        }
        cardObj.enabled = false;
        if (this.collectionCardObjects.indexOf(cardObj) < 0) {
            this.collectionCardObjects.push(cardObj);
            this.cardStates.push(this.STATE_IN_COLLECTION);
            this.cardImageReady.push(true);
            this.cardFrameHooked.push(false);
            this.reviewButtonHooked.push(false);
        }
        this.syncInteractionState();
        if (this.cardInteraction) {
            this.cardInteraction.hookCardFrameEvents(cardObj, this.collectionCardObjects.length - 1);
        }
        if (this.onCardSaved) this.onCardSaved(savedData);
    }
}
