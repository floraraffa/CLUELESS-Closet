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
exports.ConnectedLensManager = void 0;
var __selfType = requireType("./ConnectedLensManager");
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
 * ConnectedLensManager.ts — Colocated multiplayer manager for DGNS Vehicle Scanner
 *
 * Handles everything related to Connected Lens colocated multiplayer:
 *   - Session lifecycle via SessionController (from SpectaclesSyncKit)
 *   - Head position tracking via network messages (no SyncEntity dependency)
 *   - Remote player tracking (join/leave, head debug mesh, cam display)
 *   - Remote carousel rendering (read-only cards positioned in shared space)
 *   - Network messaging for carousel data + card exchange protocol
 *   - Card give flow: grab remote card → confirm dialog → transfer to requester
 *
 * NOTE: We intentionally avoid SyncEntity for head tracking because SyncEntity
 * waits for SessionController.notifyOnReady() which requires colocation to
 * complete. Instead, we use NetworkMessageWrapper which works immediately
 * after the session is connected.
 *
 * Colocated mode: players are face-to-face in the same physical space.
 * The SyncKit SessionControllerComponent handles shared coordinate alignment.
 * Ref: https://developers.snap.com/spectacles/about-spectacles-features/connected-lenses/building-connected-lenses
 *
 * @author DGNS
 * @license MIT
 */
const SessionController_1 = require("SpectaclesSyncKit.lspkg/Core/SessionController");
const NetworkMessageWrapper_1 = require("SpectaclesSyncKit.lspkg/Core/NetworkMessageWrapper");
const VehicleTypes_1 = require("./VehicleTypes");
const Localization_1 = require("./Localization");
let ConnectedLensManager = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var ConnectedLensManager = _classThis = class extends _classSuper {
        constructor() {
            super();
            // =====================================================================
            // INPUTS
            // =====================================================================
            this.camDisplay = this.camDisplay;
            this.verticalCardPrefab = this.verticalCardPrefab;
            this.collectionRoot = this.collectionRoot;
            this.headDebugMesh = this.headDebugMesh;
            this.headDebugMeshCustom = this.headDebugMeshCustom;
            this.headDebugHeightOffset = this.headDebugHeightOffset;
            this.headDebugDepthOffset = this.headDebugDepthOffset;
            this.confirmGiveContainer = this.confirmGiveContainer;
            this.confirmGiveYesButton = this.confirmGiveYesButton;
            this.confirmGiveCancelButton = this.confirmGiveCancelButton;
            this.confirmGiveText = this.confirmGiveText;
            this.confirmTradeContainer = this.confirmTradeContainer;
            this.remotePlayerInfoContainer = this.remotePlayerInfoContainer;
            this.remoteLevelBadgeUrlTemplate = this.remoteLevelBadgeUrlTemplate;
            this.remoteLevelBadgePadDigits = this.remoteLevelBadgePadDigits;
            this.xpContainerHeightOffset = this.xpContainerHeightOffset;
            this.wristAnchor = this.wristAnchor;
            this.worldMesh = this.worldMesh;
            this.headRotationOffset = this.headRotationOffset;
            this.colocationGuidanceText = this.colocationGuidanceText;
            // =====================================================================
            // CALLBACKS — Set by orchestrator (Car Scanner.ts)
            // =====================================================================
            this.onPlayerJoined = null;
            this.onPlayerLeft = null;
            /** Fires as soon as the session is connected (before colocation completes). */
            this.onSessionConnected = null;
            /** Fires when the full session is ready (colocation complete). */
            this.onSessionReady = null;
            /** Fires when the session fails (error or disconnect before ready). */
            this.onSessionFailed = null;
            /** Fires when the session is lost mid-game (disconnect after ready). */
            this.onSessionLost = null;
            /** Fires when the user intentionally cancels the SnapOS session dialog. */
            this.onSessionCancelled = null;
            this.onShowMessage = null;
            /** Shows persistent colocation guidance (stays visible until hidden). */
            this.onShowGuidance = null;
            /** Hides the persistent colocation guidance. */
            this.onHideGuidance = null;
            this.onConnectButton = null;
            /** Called when a card is received from another player (with optional image). */
            this.onCardReceived = null;
            /** Called when a card is given away — serial removed from persistent collection. */
            this.onCardGivenAway = null;
            /** Called to retrieve a card image base64 from persistent storage. */
            this.onGetCardImageBase64 = null;
            /** Called to retrieve the savedAt timestamp for a card serial. */
            this.onGetSavedAtForSerial = null;
            /** Called to check if local player owns a card serial (for give validation). */
            this.onHasCardSerial = null;
            /** Called to load a brand logo onto a SceneObject (delegates to CollectionManager's BrandLogoLoader). */
            this.onLoadBrandLogo = null;
            /** Optional callback from XPManager to resolve level badge URL. */
            this.onGetLevelBadgeUrl = null;
            /** Returns local carousel visibility and angle (for syncing remote carousel rotation). */
            this.onGetCarouselState = null;
            /** Called when a local card is placed in world space (for network broadcast). */
            this.onCardPlacedInWorld = null;
            /** Called when a local card is returned to the collection (for network broadcast). */
            this.onCardReturnedToCollection = null;
            // =====================================================================
            // INTERNAL STATE
            // =====================================================================
            this.sessionController = null;
            this.messaging = null;
            this.remotePlayers = new Map();
            this._inSession = false;
            this._sessionReady = false;
            this._syncSetupDone = false;
            this._headSyncEvent = null;
            this._frameCounter = 0;
            this._colocationGuidanceEvent = null;
            this._colocationStage = 'waiting'; // waiting | scanning | anchor_found | aligning | ready | timeout
            this._colocationFallbackFired = false;
            // Phase system removed — colocation is handled by SessionController internally
            // Local player stats (broadcast to remote players)
            this._localLevel = 1;
            this._localPrestige = 0;
            this._localTotalXP = 0;
            this._localTrustScore = 80;
            // LocatedAt spatial alignment — set after colocation completes
            this._locatedAtComponent = null;
            // Pre-computed head rotation correction quaternion (built from headRotationOffset in onAwake)
            this._headRotCorrection = quat.quatIdentity();
            // Card give state
            this.pendingGiveRequest = null;
            this.giveButtonsConnected = false;
            this.giveRequestTimestamp = 0;
            this.GIVE_REQUEST_TIMEOUT_MS = 30000; // 30 seconds
            // Network message IDs
            this.MESSAGE_NETWORK_ID = 'dgns_mp_msg';
            this.HEAD_UPDATE_EVENT = 'head_update';
            this.PLAYER_STATS_EVENT = 'player_stats';
            this.SCAN_STATE_EVENT = 'scan_state';
            this.CAROUSEL_DATA_EVENT = 'carousel_data';
            this.CAROUSEL_HIDE_EVENT = 'carousel_hide';
            this.CARD_GIVE_REQUEST_EVENT = 'card_give_request';
            this.CARD_GIVE_ACCEPTED_EVENT = 'card_give_accepted';
            this.CARD_GIVE_REJECTED_EVENT = 'card_give_rejected';
            this.CARD_IMAGE_EVENT = 'card_img';
            this.CARD_IMAGE_CHUNK_EVENT = 'card_img_chunk';
            this.CARD_IMAGE_TRANSFER_EVENT = 'card_img_xfer';
            this.CARD_IMAGE_CHUNK_XFER_EVENT = 'card_img_chunk_xfer';
            this.CARD_PLACED_EVENT = 'card_placed';
            this.CARD_RETURNED_EVENT = 'card_returned';
            this.CARD_GRAB_EVENT = 'card_grab';
            this.CARD_MOVE_EVENT = 'card_move';
            // COLOC_PHASE_EVENT removed — no custom phase protocol needed
            this.REMOTE_CAROUSEL_RADIUS = 3.5;
            this.REMOTE_CAROUSEL_RADIUS_WRIST = 3.5;
            this.REMOTE_CAROUSEL_HIDE_THRESHOLD = 0.5;
            this.REMOTE_CAROUSEL_TILT_DEG = 8;
            this.CUSTOM_HAT_SNAP_USERNAME = 'GuillaumeDGNS';
            this.HEAD_BROADCAST_INTERVAL = 3; // send every N frames
            this.HEAD_LERP_SPEED = 0.25; // interpolation factor per frame (0–1, higher = faster)
            this.IMAGE_CHUNK_SIZE = 85000; // chars per chunk (~85KB, within 100KB message limit)
            this.IMAGE_SEND_INTERVAL_MS = 60; // ms between image sends (rate limit safety)
            // Image chunk reassembly buffers (serial → chunks array + timestamp)
            this._imageChunkBuffers = new Map();
            this._imageXferChunkBuffers = new Map();
            this.CHUNK_TIMEOUT_MS = 30000;
            // Pending outgoing trade — holds the serial until the send is confirmed
            this._pendingOutgoingGiveSerial = '';
            this._pendingOutgoingGiveTimer = null;
            // Remote card SceneObject → { ownerConnId, serial } mapping for trade interaction
            this._remoteCardMeta = new Map();
            // Pending image for a card trade (received from giver)
            this._pendingTradeImageB64 = '';
            this._pendingTradeSerial = '';
            // Guard to prevent duplicate trade requests from the requester side
            this._pendingRequestSerial = '';
            // Remote world-placed cards: key = "connId_serial" → SceneObject clone
            this._remoteWorldCards = new Map();
            // Remote cards currently being grabbed/dragged: key = "connId_serial" → SceneObject
            this._remoteGrabbedCards = new Map();
            // Local billboard loop for cards currently grabbed by this user.
            this._localGrabBillboardEvents = new Map();
            this.remoteMediaModule = require('LensStudio:RemoteMediaModule');
            this.internetModule = require('LensStudio:InternetModule');
            this._remoteBadgeTextureCache = new Map();
            this._remoteBadgeLoading = new Set();
            this._remoteBadgePending = new Map();
            // =====================================================================
            // COLOCATION GUIDANCE — Guide players through spatial calibration
            // Per Snap docs: "The first user establishes the shared coordinate space
            // automatically. Subsequent players are guided to look at a friend who
            // has already colocated to align their space with theirs."
            // https://developers.snap.com/spectacles/about-spectacles-features/connected-lenses/using-connected-lenses
            // =====================================================================
            this.COLOCATION_TIMEOUT_SEC = 60;
            this.GUIDANCE_INTERVAL_SEC = 10;
            /** Broadcasts local head position/rotation + wrist position to all remote players (throttled). */
            this._headBroadcastLogOnce = false;
            this._headBroadcastWarnedOnce = false;
            // =====================================================================
            // INCOMING MESSAGE HANDLERS
            // =====================================================================
            this._headUpdateLogCount = 0;
            this._closeHooked = new Set();
        }
        __initialize() {
            super.__initialize();
            // =====================================================================
            // INPUTS
            // =====================================================================
            this.camDisplay = this.camDisplay;
            this.verticalCardPrefab = this.verticalCardPrefab;
            this.collectionRoot = this.collectionRoot;
            this.headDebugMesh = this.headDebugMesh;
            this.headDebugMeshCustom = this.headDebugMeshCustom;
            this.headDebugHeightOffset = this.headDebugHeightOffset;
            this.headDebugDepthOffset = this.headDebugDepthOffset;
            this.confirmGiveContainer = this.confirmGiveContainer;
            this.confirmGiveYesButton = this.confirmGiveYesButton;
            this.confirmGiveCancelButton = this.confirmGiveCancelButton;
            this.confirmGiveText = this.confirmGiveText;
            this.confirmTradeContainer = this.confirmTradeContainer;
            this.remotePlayerInfoContainer = this.remotePlayerInfoContainer;
            this.remoteLevelBadgeUrlTemplate = this.remoteLevelBadgeUrlTemplate;
            this.remoteLevelBadgePadDigits = this.remoteLevelBadgePadDigits;
            this.xpContainerHeightOffset = this.xpContainerHeightOffset;
            this.wristAnchor = this.wristAnchor;
            this.worldMesh = this.worldMesh;
            this.headRotationOffset = this.headRotationOffset;
            this.colocationGuidanceText = this.colocationGuidanceText;
            // =====================================================================
            // CALLBACKS — Set by orchestrator (Car Scanner.ts)
            // =====================================================================
            this.onPlayerJoined = null;
            this.onPlayerLeft = null;
            /** Fires as soon as the session is connected (before colocation completes). */
            this.onSessionConnected = null;
            /** Fires when the full session is ready (colocation complete). */
            this.onSessionReady = null;
            /** Fires when the session fails (error or disconnect before ready). */
            this.onSessionFailed = null;
            /** Fires when the session is lost mid-game (disconnect after ready). */
            this.onSessionLost = null;
            /** Fires when the user intentionally cancels the SnapOS session dialog. */
            this.onSessionCancelled = null;
            this.onShowMessage = null;
            /** Shows persistent colocation guidance (stays visible until hidden). */
            this.onShowGuidance = null;
            /** Hides the persistent colocation guidance. */
            this.onHideGuidance = null;
            this.onConnectButton = null;
            /** Called when a card is received from another player (with optional image). */
            this.onCardReceived = null;
            /** Called when a card is given away — serial removed from persistent collection. */
            this.onCardGivenAway = null;
            /** Called to retrieve a card image base64 from persistent storage. */
            this.onGetCardImageBase64 = null;
            /** Called to retrieve the savedAt timestamp for a card serial. */
            this.onGetSavedAtForSerial = null;
            /** Called to check if local player owns a card serial (for give validation). */
            this.onHasCardSerial = null;
            /** Called to load a brand logo onto a SceneObject (delegates to CollectionManager's BrandLogoLoader). */
            this.onLoadBrandLogo = null;
            /** Optional callback from XPManager to resolve level badge URL. */
            this.onGetLevelBadgeUrl = null;
            /** Returns local carousel visibility and angle (for syncing remote carousel rotation). */
            this.onGetCarouselState = null;
            /** Called when a local card is placed in world space (for network broadcast). */
            this.onCardPlacedInWorld = null;
            /** Called when a local card is returned to the collection (for network broadcast). */
            this.onCardReturnedToCollection = null;
            // =====================================================================
            // INTERNAL STATE
            // =====================================================================
            this.sessionController = null;
            this.messaging = null;
            this.remotePlayers = new Map();
            this._inSession = false;
            this._sessionReady = false;
            this._syncSetupDone = false;
            this._headSyncEvent = null;
            this._frameCounter = 0;
            this._colocationGuidanceEvent = null;
            this._colocationStage = 'waiting'; // waiting | scanning | anchor_found | aligning | ready | timeout
            this._colocationFallbackFired = false;
            // Phase system removed — colocation is handled by SessionController internally
            // Local player stats (broadcast to remote players)
            this._localLevel = 1;
            this._localPrestige = 0;
            this._localTotalXP = 0;
            this._localTrustScore = 80;
            // LocatedAt spatial alignment — set after colocation completes
            this._locatedAtComponent = null;
            // Pre-computed head rotation correction quaternion (built from headRotationOffset in onAwake)
            this._headRotCorrection = quat.quatIdentity();
            // Card give state
            this.pendingGiveRequest = null;
            this.giveButtonsConnected = false;
            this.giveRequestTimestamp = 0;
            this.GIVE_REQUEST_TIMEOUT_MS = 30000; // 30 seconds
            // Network message IDs
            this.MESSAGE_NETWORK_ID = 'dgns_mp_msg';
            this.HEAD_UPDATE_EVENT = 'head_update';
            this.PLAYER_STATS_EVENT = 'player_stats';
            this.SCAN_STATE_EVENT = 'scan_state';
            this.CAROUSEL_DATA_EVENT = 'carousel_data';
            this.CAROUSEL_HIDE_EVENT = 'carousel_hide';
            this.CARD_GIVE_REQUEST_EVENT = 'card_give_request';
            this.CARD_GIVE_ACCEPTED_EVENT = 'card_give_accepted';
            this.CARD_GIVE_REJECTED_EVENT = 'card_give_rejected';
            this.CARD_IMAGE_EVENT = 'card_img';
            this.CARD_IMAGE_CHUNK_EVENT = 'card_img_chunk';
            this.CARD_IMAGE_TRANSFER_EVENT = 'card_img_xfer';
            this.CARD_IMAGE_CHUNK_XFER_EVENT = 'card_img_chunk_xfer';
            this.CARD_PLACED_EVENT = 'card_placed';
            this.CARD_RETURNED_EVENT = 'card_returned';
            this.CARD_GRAB_EVENT = 'card_grab';
            this.CARD_MOVE_EVENT = 'card_move';
            // COLOC_PHASE_EVENT removed — no custom phase protocol needed
            this.REMOTE_CAROUSEL_RADIUS = 3.5;
            this.REMOTE_CAROUSEL_RADIUS_WRIST = 3.5;
            this.REMOTE_CAROUSEL_HIDE_THRESHOLD = 0.5;
            this.REMOTE_CAROUSEL_TILT_DEG = 8;
            this.CUSTOM_HAT_SNAP_USERNAME = 'GuillaumeDGNS';
            this.HEAD_BROADCAST_INTERVAL = 3; // send every N frames
            this.HEAD_LERP_SPEED = 0.25; // interpolation factor per frame (0–1, higher = faster)
            this.IMAGE_CHUNK_SIZE = 85000; // chars per chunk (~85KB, within 100KB message limit)
            this.IMAGE_SEND_INTERVAL_MS = 60; // ms between image sends (rate limit safety)
            // Image chunk reassembly buffers (serial → chunks array + timestamp)
            this._imageChunkBuffers = new Map();
            this._imageXferChunkBuffers = new Map();
            this.CHUNK_TIMEOUT_MS = 30000;
            // Pending outgoing trade — holds the serial until the send is confirmed
            this._pendingOutgoingGiveSerial = '';
            this._pendingOutgoingGiveTimer = null;
            // Remote card SceneObject → { ownerConnId, serial } mapping for trade interaction
            this._remoteCardMeta = new Map();
            // Pending image for a card trade (received from giver)
            this._pendingTradeImageB64 = '';
            this._pendingTradeSerial = '';
            // Guard to prevent duplicate trade requests from the requester side
            this._pendingRequestSerial = '';
            // Remote world-placed cards: key = "connId_serial" → SceneObject clone
            this._remoteWorldCards = new Map();
            // Remote cards currently being grabbed/dragged: key = "connId_serial" → SceneObject
            this._remoteGrabbedCards = new Map();
            // Local billboard loop for cards currently grabbed by this user.
            this._localGrabBillboardEvents = new Map();
            this.remoteMediaModule = require('LensStudio:RemoteMediaModule');
            this.internetModule = require('LensStudio:InternetModule');
            this._remoteBadgeTextureCache = new Map();
            this._remoteBadgeLoading = new Set();
            this._remoteBadgePending = new Map();
            // =====================================================================
            // COLOCATION GUIDANCE — Guide players through spatial calibration
            // Per Snap docs: "The first user establishes the shared coordinate space
            // automatically. Subsequent players are guided to look at a friend who
            // has already colocated to align their space with theirs."
            // https://developers.snap.com/spectacles/about-spectacles-features/connected-lenses/using-connected-lenses
            // =====================================================================
            this.COLOCATION_TIMEOUT_SEC = 60;
            this.GUIDANCE_INTERVAL_SEC = 10;
            /** Broadcasts local head position/rotation + wrist position to all remote players (throttled). */
            this._headBroadcastLogOnce = false;
            this._headBroadcastWarnedOnce = false;
            // =====================================================================
            // INCOMING MESSAGE HANDLERS
            // =====================================================================
            this._headUpdateLogCount = 0;
            this._closeHooked = new Set();
        }
        // =====================================================================
        // LIFECYCLE
        // =====================================================================
        onAwake() {
            if (this.camDisplay)
                this.camDisplay.enabled = false;
            if (this.headDebugMesh)
                this.headDebugMesh.enabled = false;
            if (this.headDebugMeshCustom)
                this.headDebugMeshCustom.enabled = false;
            if (this.confirmGiveContainer)
                this.confirmGiveContainer.enabled = false;
            if (this.confirmTradeContainer)
                this.confirmTradeContainer.enabled = false;
            if (this.remotePlayerInfoContainer)
                this.remotePlayerInfoContainer.enabled = false;
            if (this.worldMesh)
                this.worldMesh.enabled = false;
            // Hide colocated guidance text at startup
            if (this.colocationGuidanceText) {
                const obj = this.colocationGuidanceText.getSceneObject();
                if (obj) {
                    obj.enabled = false;
                    print('ConnectedLensManager: colocationGuidanceText wired OK — "' + obj.name + '"');
                }
            }
            else {
                print('ConnectedLensManager: WARNING — colocationGuidanceText NOT wired!');
            }
            // Unparent Head Debug Mesh (and custom) from Camera Object so setWorldPosition/setWorldRotation
            // work directly in world space without fighting the local camera's moving transform.
            for (const mesh of [this.headDebugMesh, this.headDebugMeshCustom]) {
                if (!mesh)
                    continue;
                try {
                    const parent = mesh.getParent();
                    if (parent) {
                        print('ConnectedLensManager: Unparenting ' + mesh.name + ' from "' + parent.name + '" to scene root');
                        mesh.setParent(this.getSceneObject());
                    }
                }
                catch (e) {
                    print('ConnectedLensManager: Could not unparent ' + mesh.name + ': ' + e);
                }
            }
            // Build head rotation correction using explicit quaternion math (no fromEulerAngles ambiguity).
            if (this.headRotationOffset) {
                this._headRotCorrection = this.eulerDegreesToQuat(this.headRotationOffset.x, this.headRotationOffset.y, this.headRotationOffset.z);
                print('ConnectedLensManager: Head rotation offset = ('
                    + this.headRotationOffset.x + ', '
                    + this.headRotationOffset.y + ', '
                    + this.headRotationOffset.z + ') deg');
            }
            else {
                // Default: 180° Y rotation — explicit quat(w=0, x=0, y=1, z=0)
                this._headRotCorrection = new quat(0, 0, 1, 0);
                print('ConnectedLensManager: Using default head rotation offset (0, 180, 0) — explicit quat');
            }
            print('ConnectedLensManager: Initialized (colocated mode, waiting for startSession)');
        }
        /**
         * Converts Euler angles in degrees to a quaternion using explicit half-angle math.
         * Avoids any ambiguity with quat.fromEulerAngles (which may take degrees or radians).
         * Uses YXZ rotation order (standard for head/camera orientations).
         */
        eulerDegreesToQuat(xDeg, yDeg, zDeg) {
            const xRad = xDeg * Math.PI / 180;
            const yRad = yDeg * Math.PI / 180;
            const zRad = zDeg * Math.PI / 180;
            const qx = new quat(Math.cos(xRad / 2), Math.sin(xRad / 2), 0, 0);
            const qy = new quat(Math.cos(yRad / 2), 0, Math.sin(yRad / 2), 0);
            const qz = new quat(Math.cos(zRad / 2), 0, 0, Math.sin(zRad / 2));
            return qy.multiply(qx).multiply(qz);
        }
        // =====================================================================
        // GUIDANCE — Internal methods using dedicated Colocated Guidance text
        // =====================================================================
        showGuidance(text) {
            if (this.colocationGuidanceText) {
                const obj = this.colocationGuidanceText.getSceneObject();
                if (obj) {
                    obj.enabled = true;
                    print('ConnectedLensManager: [GUIDANCE] Text SceneObject enabled');
                }
                else {
                    print('ConnectedLensManager: [GUIDANCE] WARNING — getSceneObject() returned null');
                }
                this.colocationGuidanceText.text = text;
                try {
                    this.colocationGuidanceText.textFill.color = new vec4(1, 1, 1, 1);
                }
                catch (e) { /* textFill not available */ }
                print('ConnectedLensManager: [GUIDANCE] Set text: "' + text.substring(0, 50) + '"');
            }
            else {
                print('ConnectedLensManager: [GUIDANCE] WARNING — colocationGuidanceText is null!');
            }
            if (this.onShowGuidance)
                this.onShowGuidance(text);
        }
        hideGuidance() {
            if (this.colocationGuidanceText) {
                const obj = this.colocationGuidanceText.getSceneObject();
                if (obj)
                    obj.enabled = false;
                this.colocationGuidanceText.text = '';
            }
            if (this.onHideGuidance)
                this.onHideGuidance();
        }
        // =====================================================================
        // PUBLIC API
        // =====================================================================
        startSession() {
            if (this._inSession) {
                print('ConnectedLensManager: Already in session');
                return;
            }
            this._inSession = true;
            print('ConnectedLensManager: Starting colocated session...');
            try {
                this.sessionController = SessionController_1.SessionController.getInstance();
            }
            catch (e) {
                print('ConnectedLensManager: ERROR — SessionController not available: ' + e);
                if (this.onShowMessage)
                    this.onShowMessage((0, Localization_1.t)('connected_lens_unavail'));
                this._inSession = false;
                if (this.onSessionFailed)
                    this.onSessionFailed('SessionController unavailable');
                return;
            }
            this.listenToSessionEvents();
            this.sessionController.init();
            print('ConnectedLensManager: SessionController.init() called — waiting for SnapOS session dialog');
        }
        /** Notifies the network that the local player is scanning. */
        setLocalScanning(isScanning) {
            if (!this._syncSetupDone || !this.messaging)
                return;
            try {
                this.messaging.sendMessage(this.SCAN_STATE_EVENT, JSON.stringify({ scanning: isScanning }), true);
            }
            catch (e) { /* session not ready yet */ }
        }
        /** Notifies the network that the local player's carousel is visible. Sends cards + angle so remote sees rotation. */
        setLocalCarouselVisible(visible, cardData, carouselAngle) {
            if (!this._syncSetupDone || !this.messaging)
                return;
            if (visible && cardData && cardData.length > 0) {
                try {
                    const payload = { cards: cardData, angle: typeof carouselAngle === 'number' ? carouselAngle : 0 };
                    const jsonStr = JSON.stringify(payload);
                    this.messaging.sendMessage(this.CAROUSEL_DATA_EVENT, jsonStr, true);
                    print('ConnectedLensManager: Sent carousel data (' + cardData.length + ' cards, angle=' + (payload.angle.toFixed(2)) + ')');
                }
                catch (e) {
                    print('ConnectedLensManager: Error sending carousel data: ' + e);
                }
                // Send card images progressively (one per IMAGE_SEND_INTERVAL_MS)
                this.sendCarouselImages(cardData);
            }
            else if (!visible) {
                try {
                    this.messaging.sendMessage(this.CAROUSEL_HIDE_EVENT, '{}', true);
                    print('ConnectedLensManager: Sent carousel hide — remote collection should close');
                }
                catch (e) { /* ignore */ }
            }
        }
        /**
         * Sends card images progressively for the carousel.
         * For each card, reads the stored base64 and sends it via CARD_IMAGE or chunked.
         * Staggers sends to respect the 350 msg / 5s rate limit.
         */
        sendCarouselImages(cards) {
            let sendIndex = 0;
            const sendNext = () => {
                if (sendIndex >= cards.length)
                    return;
                if (!this.messaging || !this._syncSetupDone)
                    return;
                const card = cards[sendIndex];
                sendIndex++;
                if (!card.savedAt) {
                    // Schedule next send
                    this.createEvent('DelayedCallbackEvent').bind(() => sendNext());
                    return;
                }
                let b64 = null;
                if (this.onGetCardImageBase64) {
                    b64 = this.onGetCardImageBase64(card.savedAt);
                }
                if (!b64 || b64.length === 0) {
                    this.createEvent('DelayedCallbackEvent').bind(() => sendNext());
                    return;
                }
                this.sendCardImage(card.serial, b64, this.CARD_IMAGE_EVENT, this.CARD_IMAGE_CHUNK_EVENT);
                print('ConnectedLensManager: Sent image for ' + card.brand_model
                    + ' (' + b64.length + ' chars)');
                // Delay next send
                const delayEvent = this.createEvent('DelayedCallbackEvent');
                delayEvent.reset(this.IMAGE_SEND_INTERVAL_MS / 1000);
                delayEvent.bind(() => sendNext());
            };
            // Start with a tiny delay to let carousel metadata arrive first
            const startDelay = this.createEvent('DelayedCallbackEvent');
            startDelay.reset(0.1);
            startDelay.bind(() => sendNext());
        }
        /**
         * Sends a single card's image over the network.
         * If it fits in one message (<IMAGE_CHUNK_SIZE), sends as a single event.
         * Otherwise, chunks it into multiple messages.
         */
        sendCardImage(serial, b64, singleEvent, chunkEvent) {
            if (!this.messaging)
                return;
            if (b64.length <= this.IMAGE_CHUNK_SIZE) {
                // Fits in one message
                try {
                    const payload = JSON.stringify({ serial: serial, b64: b64 });
                    this.messaging.sendMessage(singleEvent, payload, true);
                }
                catch (e) {
                    print('ConnectedLensManager: Error sending card image: ' + e);
                }
            }
            else {
                // Chunk it
                const totalChunks = Math.ceil(b64.length / this.IMAGE_CHUNK_SIZE);
                for (let i = 0; i < totalChunks; i++) {
                    try {
                        const chunk = b64.substring(i * this.IMAGE_CHUNK_SIZE, (i + 1) * this.IMAGE_CHUNK_SIZE);
                        const payload = JSON.stringify({
                            serial: serial,
                            idx: i,
                            total: totalChunks,
                            data: chunk,
                        });
                        this.messaging.sendMessage(chunkEvent, payload, true);
                    }
                    catch (e) {
                        print('ConnectedLensManager: Error sending chunk ' + i + '/' + totalChunks + ': ' + e);
                    }
                }
                print('ConnectedLensManager: Sent image in ' + totalChunks + ' chunks for serial ' + serial);
            }
        }
        /** Updates the local player's stats broadcast to remote players. */
        setLocalPlayerStats(level, prestige, totalXP, trustScore) {
            this._localLevel = level;
            this._localPrestige = prestige;
            this._localTotalXP = totalXP;
            if (typeof trustScore === 'number')
                this._localTrustScore = trustScore;
            this.broadcastPlayerStats();
        }
        getConnectedPlayerCount() {
            return this.remotePlayers.size;
        }
        isInSession() {
            return this._inSession && this._syncSetupDone;
        }
        // =====================================================================
        // SESSION EVENTS
        // =====================================================================
        listenToSessionEvents() {
            if (!this.sessionController)
                return;
            // Session connected — fires immediately, BEFORE colocation.
            // All sync infrastructure is set up here.
            this.sessionController.onConnected.add((_session, _connectionInfo) => {
                print('ConnectedLensManager: Session connected — setting up messaging...');
                this.onSessionConnected_internal();
                if (this.onSessionConnected)
                    this.onSessionConnected();
            });
            // Colocation diagnostic events
            this.sessionController.notifyOnStartColocated(() => {
                print('ConnectedLensManager: [COLOCATION] Colocated setup STARTED — scanning environment');
                this._colocationStage = 'scanning';
            });
            this.sessionController.notifyOnMapExists(() => {
                print('ConnectedLensManager: [COLOCATION] Map exists — spatial anchor found (stage=' + this._colocationStage + ')');
                this._colocationStage = 'anchor_found';
            });
            this.sessionController.notifyOnLocatedAtFound(() => {
                print('ConnectedLensManager: [COLOCATION] Located At Found — aligning coordinate systems (stage=' + this._colocationStage + ')');
                this._colocationStage = 'aligning';
            });
            // Session fully ready (colocation handshake complete)
            this.sessionController.notifyOnReady(() => this.onSessionReady_internal());
            // User events
            this.sessionController.onUserJoinedSession.add((_session, userInfo) => {
                this.handleUserJoined(userInfo);
            });
            this.sessionController.onUserLeftSession.add((_session, userInfo) => {
                this.handleUserLeft(userInfo);
            });
            // Connection failed (pre-session) — includes CancelledByUser
            this.sessionController.onConnectionFailed.add((code, description) => {
                if (code === 'CancelledByUser') {
                    print('ConnectedLensManager: User cancelled session dialog');
                    this._inSession = false;
                    if (this.onSessionCancelled) {
                        this.onSessionCancelled();
                    }
                    else if (this.onSessionFailed) {
                        this.onSessionFailed('cancelled');
                    }
                }
                else {
                    print('ConnectedLensManager: Connection failed: ' + code + ' — ' + description);
                    if (this.onShowMessage)
                        this.onShowMessage((0, Localization_1.tf)('connection_failed', { desc: description }));
                    this._inSession = false;
                    if (this.onSessionFailed) {
                        this.onSessionFailed('connection_failed: ' + code + ' — ' + description);
                    }
                }
            });
            // Errors (in-session)
            this.sessionController.onError.add((_session, code, description) => {
                print('ConnectedLensManager: Session error: ' + code + ' — ' + description);
                if (this.onShowMessage)
                    this.onShowMessage((0, Localization_1.tf)('session_error', { desc: description }));
                this.stopColocationGuidance();
                this.hideGuidance();
                if (!this._sessionReady && this.onSessionFailed) {
                    this.onSessionFailed('error: ' + code + ' — ' + description);
                }
            });
            // Disconnect
            this.sessionController.onDisconnected.add((_session, disconnectInfo) => {
                print('ConnectedLensManager: Disconnected: ' + disconnectInfo);
                if (this.onShowMessage)
                    this.onShowMessage((0, Localization_1.t)('disconnected'));
                this.stopColocationGuidance();
                this.hideGuidance();
                this.cleanupRemotePlayers();
                const wasReady = this._sessionReady;
                this._sessionReady = false;
                this._inSession = false;
                this._syncSetupDone = false;
                if (wasReady) {
                    if (this.onSessionLost)
                        this.onSessionLost();
                }
                else {
                    if (this.onSessionFailed)
                        this.onSessionFailed('disconnected');
                }
            });
        }
        // =====================================================================
        // SESSION CONNECTED — Set up messaging + head tracking (pre-colocation)
        // =====================================================================
        onSessionConnected_internal() {
            if (this._syncSetupDone)
                return;
            this._syncSetupDone = true;
            print('ConnectedLensManager: Setting up message-based sync (no SyncEntity needed)...');
            this.setupMessaging();
            this.setupGiveButtons();
            this.startHeadSync();
            // Track players already in the session
            const users = this.sessionController.getUsers();
            for (let i = 0; i < users.length; i++) {
                const user = users[i];
                if (!this.sessionController.isLocalUserConnection(user)) {
                    this.handleUserJoined(user);
                }
            }
            // Broadcast initial stats
            this.broadcastPlayerStats();
            // Start colocation guidance — remind user to scan the room
            this.startColocationGuidance();
            print('ConnectedLensManager: Sync setup complete — local user: '
                + (this.sessionController.getLocalUserName() || 'unknown'));
        }
        // =====================================================================
        // SESSION READY — Colocation complete
        // =====================================================================
        onSessionReady_internal() {
            if (this._sessionReady)
                return; // Prevent double call if fallback already fired
            print('ConnectedLensManager: Session FULLY READY (colocated space aligned)');
            this._sessionReady = true;
            this._colocationStage = 'ready';
            // Grab the LocatedAtComponent for spatial alignment
            try {
                if (this.sessionController) {
                    this._locatedAtComponent = this.sessionController.getLocatedAtComponent();
                    if (this._locatedAtComponent) {
                        print('ConnectedLensManager: LocatedAtComponent acquired for spatial alignment');
                    }
                    else {
                        print('ConnectedLensManager: WARNING — No LocatedAtComponent available — positions will not be spatially aligned');
                        if (this.onShowMessage)
                            this.onShowMessage((0, Localization_1.t)('coloc_no_located_warn'));
                    }
                }
            }
            catch (e) {
                print('ConnectedLensManager: Could not get LocatedAtComponent: ' + e);
                if (this.onShowMessage)
                    this.onShowMessage((0, Localization_1.t)('coloc_no_located_warn'));
            }
            // In case onConnected didn't fire yet (edge case), setup now
            this.onSessionConnected_internal();
            // Stop colocation guidance — show success
            this.stopColocationGuidance();
            this.showGuidance((0, Localization_1.t)('all_synced'));
            // Hide the success message after 2.5 seconds, then trigger onSessionReady (shows Car Scan Interface)
            if (!this._colocationFallbackFired) {
                const readyEvent = this.createEvent('DelayedCallbackEvent');
                readyEvent.bind(() => {
                    this.hideGuidance();
                    if (this.onSessionReady)
                        this.onSessionReady();
                });
                readyEvent.reset(2.5);
            }
            else {
                const hideEvent = this.createEvent('DelayedCallbackEvent');
                hideEvent.bind(() => {
                    this.hideGuidance();
                });
                hideEvent.reset(2.5);
            }
        }
        // =====================================================================
        // LOCATEDAT SPATIAL CONVERSION
        // Converts between local world coordinates and the shared LocatedAt space.
        // Before colocation completes, passthrough (no conversion).
        // =====================================================================
        worldPosToLocated(pos) {
            if (!this._locatedAtComponent)
                return pos;
            try {
                const invMat = this._locatedAtComponent.getTransform().getInvertedWorldTransform();
                return invMat.multiplyPoint(pos);
            }
            catch (e) {
                return pos;
            }
        }
        locatedPosToWorld(pos) {
            if (!this._locatedAtComponent)
                return pos;
            try {
                const mat = this._locatedAtComponent.getTransform().getWorldTransform();
                return mat.multiplyPoint(pos);
            }
            catch (e) {
                return pos;
            }
        }
        worldRotToLocated(r) {
            if (!this._locatedAtComponent)
                return r;
            try {
                const invRot = this._locatedAtComponent.getTransform().getWorldRotation().invert();
                return invRot.multiply(r);
            }
            catch (e) {
                return r;
            }
        }
        locatedRotToWorld(r) {
            if (!this._locatedAtComponent)
                return r;
            try {
                const locRot = this._locatedAtComponent.getTransform().getWorldRotation();
                return locRot.multiply(r);
            }
            catch (e) {
                return r;
            }
        }
        startColocationGuidance() {
            if (this._sessionReady)
                return;
            if (this._colocationGuidanceEvent)
                return;
            const isHost = this.sessionController ? this.sessionController.isHost() : null;
            print('ConnectedLensManager: Starting colocation guidance — isHost=' + isHost);
            if (this.worldMesh) {
                this.worldMesh.enabled = true;
                print('ConnectedLensManager: World Mesh enabled for colocation scanning');
            }
            const guidanceMessages = (0, Localization_1.getColocationGuidanceMessages)();
            this.showGuidance(guidanceMessages[0]);
            let reminderCount = 0;
            const startTime = getTime();
            let lastMessageTime = startTime;
            this._colocationGuidanceEvent = this.createEvent('UpdateEvent');
            this._colocationGuidanceEvent.bind(() => {
                if (this._sessionReady) {
                    this.stopColocationGuidance();
                    return;
                }
                const now = getTime();
                const elapsedSec = Math.round(now - startTime);
                if (now - lastMessageTime >= this.GUIDANCE_INTERVAL_SEC) {
                    lastMessageTime = now;
                    reminderCount++;
                    const msg = guidanceMessages[reminderCount % guidanceMessages.length];
                    const remaining = Math.max(0, this.COLOCATION_TIMEOUT_SEC - elapsedSec);
                    const countdown = remaining > 0 ? '\n(' + elapsedSec + 's / ' + this.COLOCATION_TIMEOUT_SEC + 's)' : '';
                    this.showGuidance(msg + countdown);
                    print('ConnectedLensManager: [COLOCATION] ' + msg + ' — stage=' + this._colocationStage + ' elapsed=' + elapsedSec + 's');
                }
                if (elapsedSec >= this.COLOCATION_TIMEOUT_SEC && !this._colocationFallbackFired) {
                    this._colocationFallbackFired = true;
                    print('ConnectedLensManager: [COLOCATION] Timeout reached (' + elapsedSec + 's)'
                        + ' — stage=' + this._colocationStage
                        + ' hasLocatedAt=' + (this._locatedAtComponent !== null));
                    this.stopColocationGuidance();
                    this.showGuidance((0, Localization_1.t)('sync_timeout'));
                    const fallbackEvent = this.createEvent('DelayedCallbackEvent');
                    fallbackEvent.bind(() => {
                        this.hideGuidance();
                        if (!this._sessionReady) {
                            if (!this._locatedAtComponent) {
                                print('ConnectedLensManager: [COLOCATION] Fallback WITHOUT LocatedAt — spatial alignment will be broken');
                                if (this.onShowMessage)
                                    this.onShowMessage((0, Localization_1.t)('coloc_no_located_warn'));
                            }
                            if (this.onSessionReady) {
                                print('ConnectedLensManager: [COLOCATION] Fallback — triggering onSessionReady');
                                this.onSessionReady();
                            }
                        }
                    });
                    fallbackEvent.reset(2.5);
                }
            });
        }
        stopColocationGuidance() {
            if (this._colocationGuidanceEvent) {
                this._colocationGuidanceEvent.enabled = false;
                this._colocationGuidanceEvent = null;
                print('ConnectedLensManager: Colocation guidance stopped');
            }
            if (this.worldMesh) {
                this.worldMesh.enabled = false;
                print('ConnectedLensManager: World Mesh disabled');
            }
        }
        // broadcastColocPhase and onRemoteColocPhase removed — colocation is handled
        // entirely by SessionController internally. No custom phase protocol needed.
        // =====================================================================
        // MESSAGING SETUP — All network events handled here
        // =====================================================================
        setupMessaging() {
            this.messaging = new NetworkMessageWrapper_1.NetworkMessageWrapper(this.MESSAGE_NETWORK_ID);
            // Head position updates from remote players
            this.messaging.onRemoteEventReceived.getWrapper(this.HEAD_UPDATE_EVENT, true).add((msg) => this.onRemoteHeadUpdate(msg));
            // Player stats from remote players
            this.messaging.onRemoteEventReceived.getWrapper(this.PLAYER_STATS_EVENT, true).add((msg) => this.onRemotePlayerStats(msg));
            // Scan state from remote players
            this.messaging.onRemoteEventReceived.getWrapper(this.SCAN_STATE_EVENT, true).add((msg) => this.onRemoteScanState(msg));
            // Carousel events
            this.messaging.onRemoteEventReceived.getWrapper(this.CAROUSEL_DATA_EVENT, true).add((msg) => this.onRemoteCarouselData(msg));
            this.messaging.onRemoteEventReceived.getWrapper(this.CAROUSEL_HIDE_EVENT, true).add((msg) => this.onRemoteCarouselHide(msg));
            // Card exchange events
            this.messaging.onRemoteEventReceived.getWrapper(this.CARD_GIVE_REQUEST_EVENT, true).add((msg) => this.onCardGiveRequestReceived(msg));
            this.messaging.onRemoteEventReceived.getWrapper(this.CARD_GIVE_ACCEPTED_EVENT, true).add((msg) => this.onCardGiveAccepted(msg));
            this.messaging.onRemoteEventReceived.getWrapper(this.CARD_GIVE_REJECTED_EVENT, true).add((msg) => this.onCardGiveRejected(msg));
            // Card image events (carousel images sent individually per card)
            this.messaging.onRemoteEventReceived.getWrapper(this.CARD_IMAGE_EVENT, true).add((msg) => this.onRemoteCardImage(msg));
            this.messaging.onRemoteEventReceived.getWrapper(this.CARD_IMAGE_CHUNK_EVENT, true).add((msg) => this.onRemoteCardImageChunk(msg));
            // Card image transfer events (image sent after trade acceptance)
            this.messaging.onRemoteEventReceived.getWrapper(this.CARD_IMAGE_TRANSFER_EVENT, true).add((msg) => this.onCardImageTransfer(msg));
            this.messaging.onRemoteEventReceived.getWrapper(this.CARD_IMAGE_CHUNK_XFER_EVENT, true).add((msg) => this.onCardImageChunkTransfer(msg));
            // Card grab/move events (real-time card dragging visible to remote player)
            this.messaging.onRemoteEventReceived.getWrapper(this.CARD_GRAB_EVENT, true).add((msg) => this.onRemoteCardGrabbed(msg));
            this.messaging.onRemoteEventReceived.getWrapper(this.CARD_MOVE_EVENT, true).add((msg) => this.onRemoteCardMoved(msg));
            // World-placed card events (card taken from carousel and placed in space)
            this.messaging.onRemoteEventReceived.getWrapper(this.CARD_PLACED_EVENT, true).add((msg) => this.onRemoteCardPlaced(msg));
            this.messaging.onRemoteEventReceived.getWrapper(this.CARD_RETURNED_EVENT, true).add((msg) => this.onRemoteCardReturned(msg));
            print('ConnectedLensManager: Messaging set up (head + stats + carousel + images + card exchange + world cards)');
        }
        // =====================================================================
        // HEAD SYNC — Broadcast local head position + update remote players
        // =====================================================================
        startHeadSync() {
            if (this._headSyncEvent)
                return;
            this._headSyncEvent = this.createEvent('UpdateEvent');
            this._headSyncEvent.bind(() => {
                this._frameCounter++;
                this.broadcastLocalHead();
                this.updateRemotePlayers();
                this.checkGiveRequestTimeout();
                if (this._frameCounter % 150 === 0)
                    this.purgeStaleChunkBuffers();
            });
        }
        broadcastLocalHead() {
            if (this._frameCounter % this.HEAD_BROADCAST_INTERVAL !== 0)
                return;
            if (!this.messaging || !this.camDisplay)
                return;
            // Skip broadcasting if LocatedAtComponent is not yet available.
            // Without it, raw world positions are meaningless between devices.
            if (!this._locatedAtComponent) {
                if (!this._headBroadcastWarnedOnce && this._frameCounter > 30) {
                    this._headBroadcastWarnedOnce = true;
                    print('ConnectedLensManager: [HEAD] Skipping broadcast — LocatedAtComponent not available yet');
                }
                return;
            }
            try {
                const camParent = this.camDisplay.getParent();
                if (!camParent)
                    return;
                const camTransform = camParent.getTransform();
                const worldPos = camTransform.getWorldPosition();
                const worldRot = camTransform.getWorldRotation();
                const pos = this.worldPosToLocated(worldPos);
                const rot = this.worldRotToLocated(worldRot);
                const payload = {
                    px: pos.x, py: pos.y, pz: pos.z,
                    rx: rot.x, ry: rot.y, rz: rot.z, rw: rot.w,
                };
                if (this.wristAnchor) {
                    try {
                        const wristTransform = this.wristAnchor.getTransform();
                        const wristWorldPos = wristTransform.getWorldPosition();
                        const wristWorldRot = wristTransform.getWorldRotation();
                        const wristPos = this.worldPosToLocated(wristWorldPos);
                        const wristRot = this.worldRotToLocated(wristWorldRot);
                        payload.wx = wristPos.x;
                        payload.wy = wristPos.y;
                        payload.wz = wristPos.z;
                        payload.wrx = wristRot.x;
                        payload.wry = wristRot.y;
                        payload.wrz = wristRot.z;
                        payload.wrw = wristRot.w;
                    }
                    catch (e) { /* wrist not tracked */ }
                }
                if (this.onGetCarouselState) {
                    const state = this.onGetCarouselState();
                    payload.carouselVisible = state.visible;
                    if (state.visible && typeof state.angle === 'number') {
                        payload.carouselAngle = state.angle;
                    }
                }
                if (!this._headBroadcastLogOnce) {
                    this._headBroadcastLogOnce = true;
                    print('ConnectedLensManager: [DEBUG] First head broadcast — worldPos=('
                        + worldPos.x.toFixed(2) + ',' + worldPos.y.toFixed(2) + ',' + worldPos.z.toFixed(2)
                        + ') locatedPos=('
                        + pos.x.toFixed(2) + ',' + pos.y.toFixed(2) + ',' + pos.z.toFixed(2)
                        + ') hasLocatedAt=true');
                }
                const data = JSON.stringify(payload);
                this.messaging.sendMessage(this.HEAD_UPDATE_EVENT, data, true);
            }
            catch (e) {
                // Session might not be fully ready yet — ignore
            }
        }
        /** Broadcasts local player stats to remote players. */
        broadcastPlayerStats() {
            if (!this.messaging)
                return;
            try {
                const data = JSON.stringify({
                    level: this._localLevel,
                    prestige: this._localPrestige,
                    totalXP: this._localTotalXP,
                    trustScore: this._localTrustScore,
                });
                this.messaging.sendMessage(this.PLAYER_STATS_EVENT, data, true);
            }
            catch (e) { /* not connected yet */ }
        }
        onRemoteHeadUpdate(msg) {
            const connId = msg.senderConnectionId;
            const player = this.remotePlayers.get(connId);
            if (!player)
                return;
            try {
                const d = JSON.parse(msg.data);
                // Data arrives in LocatedAt space — convert back to local world
                const locPos = new vec3(d.px, d.py, d.pz);
                const locRot = new quat(d.rw, d.rx, d.ry, d.rz);
                player.targetHeadPos = this.locatedPosToWorld(locPos);
                player.targetHeadRot = this.locatedRotToWorld(locRot);
                // Wrist position (backwards-compatible — only if present)
                if (d.wx !== undefined && d.wy !== undefined && d.wz !== undefined) {
                    const locWrist = new vec3(d.wx, d.wy, d.wz);
                    player.targetWristPos = this.locatedPosToWorld(locWrist);
                    player.wristValid = true;
                }
                if (typeof d.carouselAngle === 'number') {
                    player.remoteCarouselAngleOffset = d.carouselAngle;
                }
                if (d.carouselVisible === false) {
                    player.isCarouselVisible = false;
                }
                if (d.wrx !== undefined && d.wry !== undefined && d.wrz !== undefined && d.wrw !== undefined) {
                    const locWristRot = new quat(d.wrw, d.wrx, d.wry, d.wrz);
                    player.targetWristRot = this.locatedRotToWorld(locWristRot);
                    player.wristRotValid = true;
                }
                // Log first 3 head updates received for diagnostics
                if (this._headUpdateLogCount < 3) {
                    this._headUpdateLogCount++;
                    print('ConnectedLensManager: [DEBUG] Head update #' + this._headUpdateLogCount
                        + ' from ' + player.displayName
                        + ' locatedPos=(' + d.px.toFixed(2) + ',' + d.py.toFixed(2) + ',' + d.pz.toFixed(2) + ')'
                        + ' worldPos=(' + player.targetHeadPos.x.toFixed(2) + ',' + player.targetHeadPos.y.toFixed(2) + ',' + player.targetHeadPos.z.toFixed(2) + ')'
                        + ' hasLocatedAt=' + (this._locatedAtComponent !== null));
                }
            }
            catch (e) { /* bad data */ }
        }
        onRemotePlayerStats(msg) {
            const connId = msg.senderConnectionId;
            const player = this.remotePlayers.get(connId);
            if (!player)
                return;
            try {
                const d = JSON.parse(msg.data);
                player.playerLevel = d.level || 1;
                player.playerPrestige = d.prestige || 0;
                player.playerTotalXP = d.totalXP || 0;
                player.playerTrustScore = typeof d.trustScore === 'number' ? d.trustScore : 80;
                print('ConnectedLensManager: Updated stats for ' + player.displayName
                    + ' — LVL ' + player.playerLevel + ' P' + player.playerPrestige
                    + ' Trust ' + player.playerTrustScore + '%');
            }
            catch (e) { /* bad data */ }
        }
        onRemoteScanState(msg) {
            const connId = msg.senderConnectionId;
            const player = this.remotePlayers.get(connId);
            if (!player)
                return;
            try {
                const d = JSON.parse(msg.data);
                player.isScanning = !!d.scanning;
            }
            catch (e) { /* bad data */ }
        }
        // =====================================================================
        // REMOTE PLAYER MANAGEMENT
        // =====================================================================
        handleUserJoined(userInfo) {
            if (this.sessionController.isLocalUserConnection(userInfo))
                return;
            const connId = userInfo.connectionId;
            if (this.remotePlayers.has(connId))
                return;
            const displayName = userInfo.displayName || 'Player';
            print('ConnectedLensManager: Player joined: ' + displayName + ' (' + connId + ')');
            const playerData = {
                connectionId: connId,
                displayName: displayName,
                headPos: vec3.zero(),
                headRot: quat.quatIdentity(),
                targetHeadPos: vec3.zero(),
                targetHeadRot: quat.quatIdentity(),
                wristPos: vec3.zero(),
                targetWristPos: vec3.zero(),
                wristValid: false,
                targetWristRot: quat.quatIdentity(),
                wristRot: quat.quatIdentity(),
                wristRotValid: false,
                isScanning: false,
                isCarouselVisible: false,
                playerLevel: 1,
                playerPrestige: 0,
                playerTotalXP: 0,
                playerTrustScore: 80,
                headDebugObj: null,
                camDisplayObj: null,
                remoteCards: [],
                remoteCardData: [],
                isCarouselShown: false,
                lastAppliedBadgeLevel: -1,
                remoteCarouselAngleOffset: 0,
            };
            this.remotePlayers.set(connId, playerData);
            this.assignHeadDebugMesh(playerData);
            // Broadcast our stats to the new player
            this.broadcastPlayerStats();
            if (this.onPlayerJoined)
                this.onPlayerJoined(displayName);
            if (this.onShowMessage)
                this.onShowMessage((0, Localization_1.tf)('player_joined', { name: displayName }));
        }
        handleUserLeft(userInfo) {
            const connId = userInfo.connectionId;
            const player = this.remotePlayers.get(connId);
            if (!player)
                return;
            print('ConnectedLensManager: Player left: ' + player.displayName);
            // Cancel any pending card exchange with this player
            if (this.pendingGiveRequest && this.pendingGiveRequest.requesterConnId === connId) {
                print('ConnectedLensManager: Cancelling pending give request — requester disconnected');
                this.pendingGiveRequest = null;
                if (this.confirmGiveContainer)
                    this.confirmGiveContainer.enabled = false;
            }
            // If we were giving a card to this player and they disconnected, cancel the removal
            if (this._pendingOutgoingGiveSerial.length > 0) {
                print('ConnectedLensManager: Receiver disconnected — cancelling card removal for ' + this._pendingOutgoingGiveSerial);
                if (this._pendingOutgoingGiveTimer) {
                    try {
                        this._pendingOutgoingGiveTimer.enabled = false;
                    }
                    catch (e) { /* ignore */ }
                    this._pendingOutgoingGiveTimer = null;
                }
                if (this.onShowMessage)
                    this.onShowMessage((0, Localization_1.t)('trade_cancelled_dc'));
                this._pendingOutgoingGiveSerial = '';
            }
            this.destroyRemoteCarousel(player);
            if (player.camDisplayObj) {
                try {
                    player.camDisplayObj.destroy();
                }
                catch (e) { /* ignore */ }
            }
            if (player.headDebugObj) {
                player.headDebugObj.enabled = false;
                player.headDebugObj = null;
            }
            this.remotePlayers.delete(connId);
            if (this.onPlayerLeft)
                this.onPlayerLeft(player.displayName);
            if (this.onShowMessage)
                this.onShowMessage((0, Localization_1.tf)('player_left', { name: player.displayName }));
        }
        assignHeadDebugMesh(player) {
            const localName = (this.sessionController ? this.sessionController.getLocalUserName() || '' : '').toLowerCase();
            const useCustom = (localName === this.CUSTOM_HAT_SNAP_USERNAME.toLowerCase()) && this.headDebugMeshCustom;
            const mesh = useCustom ? this.headDebugMeshCustom : this.headDebugMesh;
            if (!mesh)
                return;
            if (this.headDebugMesh)
                this.headDebugMesh.enabled = false;
            if (this.headDebugMeshCustom)
                this.headDebugMeshCustom.enabled = false;
            player.headDebugObj = mesh;
            mesh.enabled = true;
            print('ConnectedLensManager: Head Debug Mesh' + (useCustom ? ' (custom)' : '') + ' assigned to ' + player.displayName);
        }
        // =====================================================================
        // PER-FRAME UPDATE — Position remote players from cached message data
        // =====================================================================
        updateRemotePlayers() {
            let firstRemotePlayer = null;
            const t = this.HEAD_LERP_SPEED;
            this.remotePlayers.forEach((player, _key) => {
                // Smoothly interpolate towards the target received from network
                player.headPos = vec3.lerp(player.headPos, player.targetHeadPos, t);
                player.headRot = quat.slerp(player.headRot, player.targetHeadRot, t);
                // Interpolate wrist position and rotation
                if (player.wristValid) {
                    player.wristPos = vec3.lerp(player.wristPos, player.targetWristPos, t);
                }
                if (player.wristRotValid) {
                    player.wristRot = quat.slerp(player.wristRot, player.targetWristRot, t);
                }
                const remotePos = player.headPos;
                const remoteRot = player.headRot;
                // Periodic debug log for head/wrist tracking (every ~2 seconds)
                if (this._frameCounter % 60 === 0) {
                    print('ConnectedLensManager: [DEBUG] ' + player.displayName
                        + ' head=(' + remotePos.x.toFixed(1) + ',' + remotePos.y.toFixed(1) + ',' + remotePos.z.toFixed(1) + ')'
                        + ' wrist=' + (player.wristValid
                        ? '(' + player.wristPos.x.toFixed(1) + ',' + player.wristPos.y.toFixed(1) + ',' + player.wristPos.z.toFixed(1) + ')'
                        : 'N/A')
                        + ' debugObj=' + (player.headDebugObj ? 'yes' : 'no'));
                }
                // Position head debug mesh with rotation correction
                if (player.headDebugObj && player.headDebugObj.enabled) {
                    const debugTransform = player.headDebugObj.getTransform();
                    const correctedRot = remoteRot.multiply(this._headRotCorrection);
                    const headForward = correctedRot.multiplyVec3(vec3.forward()).normalize();
                    const offsetPos = new vec3(remotePos.x, remotePos.y + this.headDebugHeightOffset, remotePos.z).add(headForward.uniformScale(this.headDebugDepthOffset));
                    debugTransform.setWorldPosition(offsetPos);
                    debugTransform.setWorldRotation(correctedRot);
                    // Log rotation details every ~3 seconds for debugging hat orientation
                    if (this._frameCounter % 90 === 1) {
                        print('ConnectedLensManager: [HEAD ROT] raw=('
                            + remoteRot.w.toFixed(3) + ',' + remoteRot.x.toFixed(3) + ','
                            + remoteRot.y.toFixed(3) + ',' + remoteRot.z.toFixed(3)
                            + ') corrected=('
                            + correctedRot.w.toFixed(3) + ',' + correctedRot.x.toFixed(3) + ','
                            + correctedRot.y.toFixed(3) + ',' + correctedRot.z.toFixed(3)
                            + ') correction=('
                            + this._headRotCorrection.w.toFixed(3) + ',' + this._headRotCorrection.x.toFixed(3) + ','
                            + this._headRotCorrection.y.toFixed(3) + ',' + this._headRotCorrection.z.toFixed(3) + ')');
                    }
                }
                // Track first player with valid position for XP container
                if (!firstRemotePlayer && remotePos.length > 0.01) {
                    firstRemotePlayer = player;
                }
                // Show/hide cam display when scanning
                if (this.camDisplay) {
                    if (player.isScanning) {
                        this.camDisplay.enabled = true;
                        const camTransform = this.camDisplay.getTransform();
                        const forward = remoteRot.multiplyVec3(vec3.forward());
                        const camPos = remotePos.add(forward.uniformScale(0.3));
                        camTransform.setWorldPosition(camPos);
                        camTransform.setWorldRotation(remoteRot);
                    }
                    else {
                        this.camDisplay.enabled = false;
                    }
                }
                // Handle carousel visibility changes
                if (player.isCarouselVisible && !player.isCarouselShown) {
                    player.isCarouselShown = true;
                }
                else if (!player.isCarouselVisible && player.isCarouselShown) {
                    player.isCarouselShown = false;
                    this.destroyRemoteCarousel(player);
                }
                // Dynamic follow: reposition carousel cards as wrist/head moves
                if (player.isCarouselShown && player.remoteCards.length > 0) {
                    this.repositionRemoteCarousel(player);
                }
            });
            // Position remote player info container above the first remote player
            this.updateRemotePlayerInfoContainer(firstRemotePlayer);
        }
        /** Positions the XP/level info container above a remote player's head. */
        updateRemotePlayerInfoContainer(player) {
            if (!this.remotePlayerInfoContainer)
                return;
            if (!player || player.headPos.length < 0.01) {
                this.remotePlayerInfoContainer.enabled = false;
                return;
            }
            this.remotePlayerInfoContainer.enabled = true;
            const heightOffset = (this.xpContainerHeightOffset !== undefined && this.xpContainerHeightOffset !== null)
                ? this.xpContainerHeightOffset : 25;
            const aboveHead = new vec3(player.headPos.x, player.headPos.y + heightOffset, player.headPos.z);
            const containerTransform = this.remotePlayerInfoContainer.getTransform();
            containerTransform.setWorldPosition(aboveHead);
            // Billboard: face the local camera
            try {
                if (this.camDisplay) {
                    const camParent = this.camDisplay.getParent();
                    if (camParent) {
                        const camPos = camParent.getTransform().getWorldPosition();
                        const dir = new vec3(camPos.x - aboveHead.x, 0, camPos.z - aboveHead.z);
                        if (dir.length > 0.01) {
                            containerTransform.setWorldRotation(quat.lookAt(dir.normalize(), vec3.up()));
                        }
                    }
                }
            }
            catch (e) { /* ignore */ }
            // Update text children (matches Remote XP Container hierarchy)
            const prestigeStr = player.playerPrestige > 0 ? ' ' + '★'.repeat(player.playerPrestige) : '';
            const levelDef = (0, VehicleTypes_1.getLevelForXP)(player.playerTotalXP);
            this.setRemoteInfoText(this.remotePlayerInfoContainer, 'Username', player.displayName);
            this.setRemoteInfoText(this.remotePlayerInfoContainer, 'Level Number', (0, Localization_1.t)('lvl_prefix') + player.playerLevel + ': ' + levelDef.name + prestigeStr);
            this.setRemoteInfoText(this.remotePlayerInfoContainer, 'Level Name', levelDef.name);
            this.setRemoteInfoText(this.remotePlayerInfoContainer, 'XP counter', 'XP ' + player.playerTotalXP);
            // Trust score display
            const trustRank = (0, VehicleTypes_1.getTrustRank)(player.playerTrustScore);
            const trustText = trustRank.name + ' | ' + (0, VehicleTypes_1.formatTrustText)(player.playerTrustScore);
            this.setRemoteInfoText(this.remotePlayerInfoContainer, 'Scanned by: Username, rank, trust score', trustText);
            this.applyRemoteTrustColor(player.playerTrustScore);
            this.updateRemoteLevelBadge(player);
            // Update XP Bar (5 plane segments — same logic as XPManager.updateXPBar)
            this.updateRemoteXPBar(player.playerTotalXP);
        }
        getRemoteLevelBadgeUrl(level) {
            if (this.onGetLevelBadgeUrl) {
                const url = this.onGetLevelBadgeUrl(level);
                if (url && url.length > 0)
                    return url;
            }
            if (!this.remoteLevelBadgeUrlTemplate || this.remoteLevelBadgeUrlTemplate.length < 8)
                return '';
            const clamped = Math.max(1, Math.min(50, Math.round(level)));
            let lvl = String(clamped);
            if (this.remoteLevelBadgePadDigits > 1)
                lvl = lvl.padStart(this.remoteLevelBadgePadDigits, '0');
            return this.remoteLevelBadgeUrlTemplate.replace('{level}', lvl);
        }
        loadRemoteBadgeTexture(level, onReady) {
            const clamped = Math.max(1, Math.min(50, Math.round(level)));
            const cached = this._remoteBadgeTextureCache.get(clamped);
            if (cached) {
                onReady(cached);
                return;
            }
            const url = this.getRemoteLevelBadgeUrl(clamped);
            if (!url || !this.internetModule || !this.remoteMediaModule)
                return;
            if (!this._remoteBadgePending.has(clamped)) {
                this._remoteBadgePending.set(clamped, []);
            }
            this._remoteBadgePending.get(clamped).push(onReady);
            if (this._remoteBadgeLoading.has(clamped))
                return;
            this._remoteBadgeLoading.add(clamped);
            try {
                const req = RemoteServiceHttpRequest.create();
                req.url = url;
                req.setHeader('User-Agent', 'LensStudio/5.15 DGNS/RemoteLevelBadge');
                this.internetModule.performHttpRequest(req, (res) => {
                    if (res.statusCode < 200 || res.statusCode >= 400) {
                        this._remoteBadgeLoading.delete(clamped);
                        this._remoteBadgePending.delete(clamped);
                        return;
                    }
                    try {
                        const resource = res.asResource();
                        this.remoteMediaModule.loadResourceAsImageTexture(resource, (texture) => {
                            this._remoteBadgeTextureCache.set(clamped, texture);
                            this._remoteBadgeLoading.delete(clamped);
                            const cbs = this._remoteBadgePending.get(clamped) || [];
                            this._remoteBadgePending.delete(clamped);
                            for (let i = 0; i < cbs.length; i++)
                                cbs[i](texture);
                        }, (_err) => {
                            this._remoteBadgeLoading.delete(clamped);
                            this._remoteBadgePending.delete(clamped);
                        });
                    }
                    catch (e) {
                        this._remoteBadgeLoading.delete(clamped);
                        this._remoteBadgePending.delete(clamped);
                    }
                });
            }
            catch (e) {
                this._remoteBadgeLoading.delete(clamped);
                this._remoteBadgePending.delete(clamped);
            }
        }
        applyTextureToBadgeObject(obj, texture) {
            try {
                const img = obj.getComponent('Component.Image');
                if (img && img.mainMaterial && img.mainPass) {
                    img.mainMaterial = img.mainMaterial.clone();
                    img.mainPass.baseTex = texture;
                    obj.enabled = true;
                    return;
                }
                const mesh = obj.getComponent('Component.RenderMeshVisual');
                if (mesh && mesh.mainMaterial && mesh.mainPass) {
                    mesh.mainMaterial = mesh.mainMaterial.clone();
                    mesh.mainPass.baseTex = texture;
                    obj.enabled = true;
                }
            }
            catch (e) { /* ignore */ }
        }
        updateRemoteLevelBadge(player) {
            if (!this.remotePlayerInfoContainer)
                return;
            if (player.lastAppliedBadgeLevel === player.playerLevel)
                return;
            const badgeObj = (0, VehicleTypes_1.findChildByName)(this.remotePlayerInfoContainer, 'Level Badge');
            if (!badgeObj)
                return;
            player.lastAppliedBadgeLevel = player.playerLevel;
            this.loadRemoteBadgeTexture(player.playerLevel, (tex) => {
                this.applyTextureToBadgeObject(badgeObj, tex);
            });
        }
        setRemoteInfoText(parent, childName, value) {
            const child = (0, VehicleTypes_1.findChildByName)(parent, childName);
            if (!child)
                return;
            try {
                const textComp = child.getComponent('Component.Text');
                if (textComp)
                    textComp.text = value;
            }
            catch (e) { /* ignore */ }
        }
        applyRemoteTrustColor(score) {
            if (!this.remotePlayerInfoContainer)
                return;
            const child = (0, VehicleTypes_1.findChildByName)(this.remotePlayerInfoContainer, 'Scanned by: Username, rank, trust score');
            if (!child)
                return;
            try {
                const textComp = child.getComponent('Component.Text');
                if (!textComp)
                    return;
                const hex = (0, VehicleTypes_1.getTrustColor)(score);
                const r = parseInt(hex.substring(0, 2), 16) / 255;
                const g = parseInt(hex.substring(2, 4), 16) / 255;
                const b = parseInt(hex.substring(4, 6), 16) / 255;
                textComp.textFill.color = new vec4(r, g, b, 1);
            }
            catch (e) { /* ignore */ }
        }
        /** Updates the XP Bar inside the remote player info container (5 plane segments). */
        updateRemoteXPBar(totalXP) {
            if (!this.remotePlayerInfoContainer)
                return;
            const xpBarObj = (0, VehicleTypes_1.findChildByName)(this.remotePlayerInfoContainer, 'XP Bar');
            if (!xpBarObj)
                return;
            const levelDef = (0, VehicleTypes_1.getLevelForXP)(totalXP);
            const currentThreshold = levelDef.xpThreshold;
            const nextThreshold = (0, VehicleTypes_1.getXPForNextLevel)(levelDef.level);
            let fillRatio = 1.0;
            if (nextThreshold > 0 && nextThreshold > currentThreshold) {
                const xpInLevel = totalXP - currentThreshold;
                const xpNeeded = nextThreshold - currentThreshold;
                fillRatio = Math.max(0, Math.min(1, xpInLevel / xpNeeded));
            }
            const segmentsFilled = Math.round(fillRatio * 5);
            const childCount = xpBarObj.getChildrenCount();
            let planeIndex = 0;
            for (let i = 0; i < childCount; i++) {
                const child = xpBarObj.getChild(i);
                if (!child)
                    continue;
                if (!child.getComponent('Component.RenderMeshVisual'))
                    continue;
                child.enabled = (planeIndex < segmentsFilled);
                planeIndex++;
            }
        }
        // =====================================================================
        // INCOMING CARD IMAGE HANDLERS — Carousel images
        // =====================================================================
        /** Handles a complete card image received in a single message. */
        onRemoteCardImage(msg) {
            try {
                const d = JSON.parse(msg.data);
                const serial = d.serial;
                const b64 = d.b64;
                if (!serial || !b64)
                    return;
                this.applyRemoteCardImage(msg.senderConnectionId, serial, b64);
            }
            catch (e) {
                print('ConnectedLensManager: Error parsing card image: ' + e);
            }
        }
        /** Handles a chunked card image piece. Reassembles and applies when complete. */
        onRemoteCardImageChunk(msg) {
            try {
                const d = JSON.parse(msg.data);
                const serial = d.serial;
                const idx = d.idx;
                const total = d.total;
                const chunk = d.data;
                if (!serial || idx === undefined || !total || !chunk)
                    return;
                const key = msg.senderConnectionId + '_' + serial;
                if (!this._imageChunkBuffers.has(key)) {
                    this._imageChunkBuffers.set(key, { total: total, chunks: new Array(total).fill(''), ts: Date.now() });
                }
                const buf = this._imageChunkBuffers.get(key);
                buf.chunks[idx] = chunk;
                // Check if all chunks received
                let complete = true;
                for (let i = 0; i < buf.total; i++) {
                    if (!buf.chunks[i] || buf.chunks[i].length === 0) {
                        complete = false;
                        break;
                    }
                }
                if (complete) {
                    const fullB64 = buf.chunks.join('');
                    this._imageChunkBuffers.delete(key);
                    print('ConnectedLensManager: Reassembled image for ' + serial
                        + ' (' + fullB64.length + ' chars, ' + buf.total + ' chunks)');
                    this.applyRemoteCardImage(msg.senderConnectionId, serial, fullB64);
                }
            }
            catch (e) {
                print('ConnectedLensManager: Error parsing card image chunk: ' + e);
            }
        }
        /**
         * Applies a received base64 image to the matching remote card.
         * Finds the card by owner connectionId + serial, decodes base64 to texture.
         */
        applyRemoteCardImage(ownerConnId, serial, b64) {
            const player = this.remotePlayers.get(ownerConnId);
            if (!player)
                return;
            // Find the matching card SceneObject
            let targetCard = null;
            for (let i = 0; i < player.remoteCardData.length; i++) {
                if (player.remoteCardData[i].serial === serial && i < player.remoteCards.length) {
                    targetCard = player.remoteCards[i];
                    break;
                }
            }
            if (!targetCard) {
                print('ConnectedLensManager: Remote card not found for image — serial ' + serial);
                return;
            }
            const cardObj = targetCard;
            try {
                Base64.decodeTextureAsync(b64, (texture) => {
                    this.applyImageToCard(cardObj, texture);
                    print('ConnectedLensManager: Applied remote image for ' + serial);
                }, () => {
                    print('ConnectedLensManager: Failed to decode remote image for ' + serial);
                });
            }
            catch (e) {
                print('ConnectedLensManager: Error decoding remote image: ' + e);
            }
        }
        /**
         * Applies a texture to the 'Card Image' child of a card SceneObject.
         * Shared utility — works for both remote carousel cards and traded cards.
         */
        applyImageToCard(cardObj, texture) {
            const cardImageObj = (0, VehicleTypes_1.findChildByName)(cardObj, 'Card Image');
            if (!cardImageObj)
                return;
            const imgComp = cardImageObj.getComponent('Component.Image');
            if (imgComp) {
                imgComp.mainMaterial = imgComp.mainMaterial.clone();
                imgComp.mainPass.baseTex = texture;
                cardImageObj.enabled = true;
                return;
            }
            const meshComp = cardImageObj.getComponent('Component.RenderMeshVisual');
            if (meshComp) {
                meshComp.mainMaterial = meshComp.mainMaterial.clone();
                meshComp.mainPass.baseTex = texture;
                cardImageObj.enabled = true;
            }
        }
        // =====================================================================
        // REMOTE CAROUSEL — Instantiate read-only cards from network data
        // =====================================================================
        onRemoteCarouselData(msg) {
            const senderConnId = msg.senderConnectionId;
            const player = this.remotePlayers.get(senderConnId);
            if (!player) {
                print('ConnectedLensManager: Received carousel data from unknown player');
                return;
            }
            try {
                const jsonStr = msg.data;
                const parsed = JSON.parse(jsonStr);
                let cards;
                let angle = 0;
                if (Array.isArray(parsed)) {
                    cards = parsed;
                }
                else if (parsed && typeof parsed === 'object' && 'cards' in parsed) {
                    const obj = parsed;
                    cards = Array.isArray(obj.cards) ? obj.cards : [];
                    if (typeof obj.angle === 'number')
                        angle = obj.angle;
                }
                else {
                    cards = [];
                }
                print('ConnectedLensManager: Received ' + cards.length + ' cards from ' + player.displayName + ' (angle=' + angle.toFixed(2) + ')');
                this.destroyRemoteCarousel(player);
                player.remoteCardData = cards;
                player.remoteCarouselAngleOffset = angle;
                player.isCarouselVisible = true;
                this.buildRemoteCarousel(player, cards);
            }
            catch (e) {
                print('ConnectedLensManager: Error parsing carousel data: ' + e);
            }
        }
        onRemoteCarouselHide(msg) {
            const senderConnId = msg.senderConnectionId;
            const player = this.remotePlayers.get(senderConnId);
            if (!player)
                return;
            print('ConnectedLensManager: ' + player.displayName + ' hid their carousel');
            player.isCarouselVisible = false;
            this.destroyRemoteCarousel(player);
            player.remoteCardData = [];
            player.isCarouselShown = false;
        }
        buildRemoteCarousel(player, cards) {
            if (!this.verticalCardPrefab) {
                print('ConnectedLensManager: No card prefab — cannot build remote carousel');
                return;
            }
            const n = cards.length;
            for (let i = 0; i < n; i++) {
                try {
                    const cardObj = this.verticalCardPrefab.instantiate(this.collectionRoot || this.getSceneObject());
                    if (!cardObj)
                        continue;
                    cardObj.name = 'RemoteCard_' + player.displayName + '_' + i;
                    this.populateRemoteCard(cardObj, cards[i], player);
                    // Disable card scripts but hook Frame for trade interaction
                    this.setupRemoteCardInteraction(cardObj, player.connectionId, cards[i].serial);
                    // Hide Card Image by default (will be shown when image arrives)
                    const cardImageObj = (0, VehicleTypes_1.findChildByName)(cardObj, 'Card Image');
                    if (cardImageObj)
                        cardImageObj.enabled = false;
                    cardObj.getTransform().setLocalScale(new vec3(0.15, 0.15, 0.15));
                    player.remoteCards.push(cardObj);
                }
                catch (e) {
                    print('ConnectedLensManager: Error instantiating remote card ' + i + ': ' + e);
                }
            }
            // Position cards around wrist (or fallback)
            this.repositionRemoteCarousel(player);
            player.isCarouselShown = true;
            print('ConnectedLensManager: Built remote carousel for ' + player.displayName
                + ' (' + player.remoteCards.length + ' cards)'
                + (player.wristValid ? ' at wrist' : ' in front of head'));
        }
        /**
         * Returns the best center position for a remote player's carousel.
         * Prefers wrist position; falls back to 50cm in front of the head.
         */
        getRemoteCarouselCenter(player) {
            if (player.wristValid && player.wristPos.length > 0.01) {
                return player.wristPos;
            }
            // Fallback: 50cm in front of the remote player's head
            const forward = player.headRot.multiplyVec3(vec3.forward());
            return player.headPos.add(forward.uniformScale(50));
        }
        /**
         * Repositions all remote cards for a player around the carousel center.
         * Called on build and every frame when the carousel is visible (dynamic follow).
         */
        repositionRemoteCarousel(player) {
            const n = player.remoteCards.length;
            if (n === 0)
                return;
            const center = this.getRemoteCarouselCenter(player);
            const baseRadius = player.wristValid ? this.REMOTE_CAROUSEL_RADIUS_WRIST : this.REMOTE_CAROUSEL_RADIUS;
            const radius = Math.max(baseRadius, n * 0.7);
            const angleOffset = player.remoteCarouselAngleOffset ?? 0;
            const wristRot = player.wristRotValid ? player.wristRot : quat.quatIdentity();
            const hideThreshold = this.REMOTE_CAROUSEL_HIDE_THRESHOLD;
            for (let i = 0; i < n; i++) {
                const cardObj = player.remoteCards[i];
                if (!cardObj)
                    continue;
                try {
                    const angle = (i / n) * Math.PI * 2 + angleOffset;
                    const sinVal = Math.sin(angle);
                    if (hideThreshold > 0 && sinVal < -hideThreshold) {
                        cardObj.enabled = false;
                        continue;
                    }
                    cardObj.enabled = true;
                    const localX = Math.cos(angle) * radius;
                    const localZ = Math.sin(angle) * radius;
                    const localOffset = new vec3(localX, 0, localZ);
                    const worldOffset = wristRot.multiplyVec3(localOffset);
                    const cardPos = new vec3(center.x + worldOffset.x, center.y + worldOffset.y, center.z + worldOffset.z);
                    const transform = cardObj.getTransform();
                    transform.setWorldPosition(cardPos);
                    const viewerPos = this.getLocalCameraWorldPosition();
                    if (viewerPos && viewerPos.sub(cardPos).length > 0.01) {
                        const toViewer = viewerPos.sub(cardPos).normalize();
                        const billboardRot = quat.lookAt(toViewer, vec3.up());
                        const tiltRad = this.REMOTE_CAROUSEL_TILT_DEG * (Math.PI / 180);
                        const tiltQuat = quat.fromEulerAngles(-tiltRad, 0, 0);
                        transform.setWorldRotation(billboardRot.multiply(tiltQuat));
                    }
                    else {
                        const lookDir = cardPos.sub(center).normalize();
                        const up = wristRot.multiplyVec3(vec3.up());
                        transform.setWorldRotation(quat.lookAt(lookDir, up));
                    }
                    const rawOpacity = (sinVal + 1.0) * 0.5;
                    const opacity = Math.max(0, Math.min(1, rawOpacity * rawOpacity * (3 - 2 * rawOpacity)));
                    this.setRemoteCardOpacity(cardObj, opacity);
                }
                catch (e) { /* card may have been destroyed */ }
            }
        }
        setRemoteCardOpacity(obj, opacity) {
            const meshVisual = obj.getComponent('Component.RenderMeshVisual');
            if (meshVisual && meshVisual.mainPass) {
                try {
                    const baseColor = meshVisual.mainPass.baseColor;
                    meshVisual.mainPass.baseColor = new vec4(baseColor.r, baseColor.g, baseColor.b, opacity);
                }
                catch (e) { /* ignore */ }
            }
            const imageComp = obj.getComponent('Component.Image');
            if (imageComp && imageComp.mainPass) {
                try {
                    const baseColor = imageComp.mainPass.baseColor;
                    imageComp.mainPass.baseColor = new vec4(baseColor.r, baseColor.g, baseColor.b, opacity);
                }
                catch (e) { /* ignore */ }
            }
            const textComp = obj.getComponent('Component.Text');
            if (textComp) {
                try {
                    const tc = textComp.textFill.color;
                    textComp.textFill.color = new vec4(tc.r, tc.g, tc.b, opacity);
                }
                catch (e) { /* ignore */ }
            }
            const childCount = obj.getChildrenCount();
            for (let i = 0; i < childCount; i++) {
                const child = obj.getChild(i);
                if (child)
                    this.setRemoteCardOpacity(child, opacity);
            }
        }
        /**
         * Sets up interaction on a remote card for trade requests.
         * Disables CardInteraction/carousel scripts, but keeps the Frame component
         * active so pinch/grab can trigger requestCard().
         */
        setupRemoteCardInteraction(cardObj, ownerConnId, serial) {
            // Store metadata for trade request lookup
            this._remoteCardMeta.set(cardObj, { connId: ownerConnId, serial: serial });
            // Poll for the Frame script component and hook onTranslationStart
            let attempts = 0;
            const maxAttempts = 300;
            const pollEvent = this.createEvent('UpdateEvent');
            pollEvent.bind(() => {
                attempts++;
                if (attempts > maxAttempts) {
                    pollEvent.enabled = false;
                    return;
                }
                // Safety: if card was destroyed, stop polling
                try {
                    if (!cardObj || !cardObj.enabled)
                        return;
                    cardObj.getTransform(); // Will throw if destroyed
                }
                catch (e) {
                    pollEvent.enabled = false;
                    return;
                }
                // Search for Frame component on the card and its children
                const objectsToSearch = [cardObj];
                try {
                    const childCount = cardObj.getChildrenCount();
                    for (let ci = 0; ci < childCount; ci++) {
                        const child = cardObj.getChild(ci);
                        if (child)
                            objectsToSearch.push(child);
                    }
                }
                catch (e) { /* ignore */ }
                for (let oi = 0; oi < objectsToSearch.length; oi++) {
                    try {
                        const scripts = objectsToSearch[oi].getComponents('Component.ScriptComponent');
                        for (let si = 0; si < scripts.length; si++) {
                            const script = scripts[si];
                            if (!script)
                                continue;
                            if (script.onTranslationStart && typeof script.onTranslationStart.add === 'function'
                                && script.onTranslationEnd && typeof script.onTranslationEnd.add === 'function') {
                                // Hook grab start -> trigger trade request
                                script.onTranslationStart.add(() => {
                                    this.startLocalGrabBillboard(cardObj);
                                    const meta = this._remoteCardMeta.get(cardObj);
                                    if (meta) {
                                        print('ConnectedLensManager: Remote card grabbed — requesting trade for ' + meta.serial);
                                        this.requestCard(meta.connId, meta.serial);
                                    }
                                });
                                // Hook grab end -> stop local billboard and let remote carousel snap-back logic run.
                                script.onTranslationEnd.add(() => {
                                    this.stopLocalGrabBillboard(cardObj);
                                });
                                pollEvent.enabled = false;
                                print('ConnectedLensManager: Trade interaction hooked for remote card ' + serial);
                                return;
                            }
                        }
                    }
                    catch (e) { /* polling */ }
                }
            });
        }
        getLocalCameraWorldPosition() {
            if (!this.camDisplay)
                return null;
            try {
                const camParent = this.camDisplay.getParent();
                if (!camParent)
                    return null;
                return camParent.getTransform().getWorldPosition();
            }
            catch (e) {
                return null;
            }
        }
        startLocalGrabBillboard(cardObj) {
            this.stopLocalGrabBillboard(cardObj);
            const ev = this.createEvent('UpdateEvent');
            ev.bind(() => {
                try {
                    const camPos = this.getLocalCameraWorldPosition();
                    if (!camPos)
                        return;
                    const transform = cardObj.getTransform();
                    const cardPos = transform.getWorldPosition();
                    const dir = camPos.sub(cardPos);
                    if (dir.length > 0.01) {
                        transform.setWorldRotation(quat.lookAt(dir.normalize(), vec3.up()));
                    }
                }
                catch (e) {
                    this.stopLocalGrabBillboard(cardObj);
                }
            });
            this._localGrabBillboardEvents.set(cardObj, ev);
        }
        stopLocalGrabBillboard(cardObj) {
            const ev = this._localGrabBillboardEvents.get(cardObj);
            if (ev) {
                try {
                    ev.enabled = false;
                }
                catch (e) { /* ignore */ }
                this._localGrabBillboardEvents.delete(cardObj);
            }
        }
        buildRemoteScannedByText(player) {
            if (!player)
                return (0, Localization_1.t)('scanned_by_unknown');
            const trustRank = (0, VehicleTypes_1.getTrustRank)(player.playerTrustScore);
            return player.displayName + '\n' + trustRank.name + ' | ' + (0, VehicleTypes_1.formatTrustText)(player.playerTrustScore);
        }
        populateRemoteCard(cardObj, card, owner = null) {
            const set = (childName, text) => {
                const obj = (0, VehicleTypes_1.findChildByName)(cardObj, childName);
                if (obj) {
                    const tc = obj.getComponent('Component.Text');
                    if (tc)
                        tc.text = text;
                }
            };
            try {
                set('Car Brand and model', card.brand_model || '?');
                set('Car Type', (0, VehicleTypes_1.formatCarType)(card.type));
                set('Car Year', card.year || '?');
                set('Card Serial', card.serial || '');
                set('Date Scanned', card.dateScanned || '');
                set('City Scanned', card.cityScanned || '');
                const rarityObj = (0, VehicleTypes_1.findChildByName)(cardObj, 'Car Rarity');
                if (rarityObj) {
                    const tc = rarityObj.getComponent('Component.Text');
                    if (tc)
                        tc.text = (0, VehicleTypes_1.formatRarityText)(card.rarity, card.rarity_label);
                }
                this.setRemoteStatBar(cardObj, 'Top Speed Bar', card.top_speed);
                this.setRemoteStatBar(cardObj, 'Acceleration Bar', card.acceleration);
                this.setRemoteStatBar(cardObj, 'Braking Bar', card.braking);
                this.setRemoteStatBar(cardObj, 'Traction Bar', card.traction);
                this.setRemoteStatBar(cardObj, 'Comfort Bar', card.comfort);
                const brandForLogo = card.brand || (card.brand_model ? card.brand_model.trim().split(/\s+/)[0] : '');
                if (brandForLogo && this.onLoadBrandLogo) {
                    const logoObj = (0, VehicleTypes_1.findChildByName)(cardObj, 'Car Brand Logo');
                    if (logoObj)
                        this.onLoadBrandLogo(logoObj, brandForLogo);
                }
                const trustObj = (0, VehicleTypes_1.findChildByName)(cardObj, 'Scanned by: Username, rank, trust score');
                if (trustObj) {
                    const tc = trustObj.getComponent('Component.Text');
                    if (tc) {
                        tc.text = this.buildRemoteScannedByText(owner);
                        const hex = (0, VehicleTypes_1.getTrustColor)(owner ? owner.playerTrustScore : 80);
                        const r = parseInt(hex.substring(0, 2), 16) / 255;
                        const g = parseInt(hex.substring(2, 4), 16) / 255;
                        const b = parseInt(hex.substring(4, 6), 16) / 255;
                        tc.textFill.color = new vec4(r, g, b, 1);
                    }
                }
            }
            catch (e) {
                print('ConnectedLensManager: Error populating remote card: ' + e);
            }
        }
        setRemoteStatBar(cardObj, barName, value) {
            const barObj = (0, VehicleTypes_1.findChildByName)(cardObj, barName);
            if (!barObj)
                return;
            const clamped = Math.max(0, Math.min(5, Math.round(value)));
            try {
                const childCount = barObj.getChildrenCount();
                let planeIndex = 0;
                for (let i = 0; i < childCount; i++) {
                    const child = barObj.getChild(i);
                    if (!child)
                        continue;
                    if (!child.getComponent('Component.RenderMeshVisual'))
                        continue;
                    child.enabled = (planeIndex < clamped);
                    planeIndex++;
                }
            }
            catch (e) { /* ignore */ }
        }
        destroyRemoteCarousel(player) {
            const cardsToDestroy = [];
            for (let i = 0; i < player.remoteCards.length; i++) {
                try {
                    const card = player.remoteCards[i];
                    if (card) {
                        this.stopLocalGrabBillboard(card);
                        this._remoteCardMeta.delete(card);
                        // Disable card and all children to prevent Frame.ts callbacks during destruction
                        card.enabled = false;
                        const childCount = card.getChildrenCount();
                        for (let c = 0; c < childCount; c++) {
                            try {
                                card.getChild(c).enabled = false;
                            }
                            catch (e) { /* ignore */ }
                        }
                        cardsToDestroy.push(card);
                    }
                }
                catch (e) {
                    print('ConnectedLensManager: Error disabling remote card ' + i + ': ' + e);
                }
            }
            player.remoteCards = [];
            // Deferred destruction — let Frame.ts finish its current frame cycle
            if (cardsToDestroy.length > 0) {
                const destroyEvent = this.createEvent('DelayedCallbackEvent');
                destroyEvent.bind(() => {
                    for (let i = 0; i < cardsToDestroy.length; i++) {
                        try {
                            cardsToDestroy[i].destroy();
                        }
                        catch (e) { /* already destroyed */ }
                    }
                });
                destroyEvent.reset(0.1);
            }
        }
        // =====================================================================
        // CARD GIVE PROTOCOL — Request → Confirm → Transfer
        // =====================================================================
        requestCard(ownerConnectionId, cardSerial) {
            if (!this.messaging || !this._syncSetupDone)
                return;
            if (this._pendingRequestSerial === cardSerial) {
                print('ConnectedLensManager: Already requesting card ' + cardSerial + ' — ignoring duplicate');
                return;
            }
            if (this._pendingRequestSerial.length > 0) {
                print('ConnectedLensManager: Another request pending (' + this._pendingRequestSerial + ') — ignoring');
                if (this.onShowMessage)
                    this.onShowMessage((0, Localization_1.t)('give_request_busy'));
                return;
            }
            const player = this.remotePlayers.get(ownerConnectionId);
            if (!player)
                return;
            this._pendingRequestSerial = cardSerial;
            let cardName = '?';
            for (let i = 0; i < player.remoteCardData.length; i++) {
                if (player.remoteCardData[i].serial === cardSerial) {
                    cardName = player.remoteCardData[i].brand_model;
                    break;
                }
            }
            const request = {
                requesterConnId: this.sessionController.getLocalConnectionId(),
                requesterName: this.sessionController.getLocalUserName() || 'Someone',
                cardSerial: cardSerial,
                cardName: cardName,
            };
            this.messaging.sendMessage(this.CARD_GIVE_REQUEST_EVENT, JSON.stringify(request), true);
            if (this.onShowMessage)
                this.onShowMessage((0, Localization_1.tf)('requesting_card', { card: cardName, player: player.displayName }));
            print('ConnectedLensManager: Sent card give request for ' + cardSerial + ' to ' + player.displayName);
        }
        onCardGiveRequestReceived(msg) {
            try {
                const request = JSON.parse(msg.data);
                print('ConnectedLensManager: ' + request.requesterName + ' wants card ' + request.cardSerial);
                if (this.pendingGiveRequest) {
                    print('ConnectedLensManager: Already have a pending give request — rejecting new one (busy)');
                    if (this.messaging) {
                        this.messaging.sendMessage(this.CARD_GIVE_REJECTED_EVENT, JSON.stringify({ cardSerial: request.cardSerial, reason: 'busy' }), true);
                    }
                    return;
                }
                this.pendingGiveRequest = request;
                this.giveRequestTimestamp = Date.now();
                if (this.confirmGiveContainer) {
                    this.showContainer(this.confirmGiveContainer, () => this.rejectGiveRequest(), 'ConfirmGiveClose');
                }
                if (this.confirmGiveText) {
                    this.confirmGiveText.text = (0, Localization_1.tf)('give_card_confirm', { card: request.cardName, player: request.requesterName });
                }
            }
            catch (e) {
                print('ConnectedLensManager: Error parsing give request: ' + e);
            }
        }
        acceptGiveRequest() {
            if (!this.pendingGiveRequest || !this.messaging)
                return;
            const serial = this.pendingGiveRequest.cardSerial;
            if (this.onHasCardSerial && !this.onHasCardSerial(serial)) {
                print('ConnectedLensManager: Cannot give card ' + serial + ' — not in collection');
                if (this.onShowMessage)
                    this.onShowMessage((0, Localization_1.t)('card_no_longer'));
                if (this.confirmGiveContainer)
                    this.confirmGiveContainer.enabled = false;
                this.pendingGiveRequest = null;
                return;
            }
            print('ConnectedLensManager: Accepted give for ' + serial);
            this._pendingOutgoingGiveSerial = serial;
            this.messaging.sendMessage(this.CARD_GIVE_ACCEPTED_EVENT, JSON.stringify({ cardSerial: serial }), true);
            this.sendCardImageForTrade(serial);
            // Delay card removal to give the network message time to arrive.
            // If the receiver disconnects in the meantime, the card stays.
            if (this._pendingOutgoingGiveTimer) {
                try {
                    this._pendingOutgoingGiveTimer.enabled = false;
                }
                catch (e) { /* ignore */ }
            }
            const giveTimer = this.createEvent('DelayedCallbackEvent');
            giveTimer.reset(2.0);
            giveTimer.bind(() => {
                if (this._pendingOutgoingGiveSerial === serial) {
                    if (this.onCardGivenAway)
                        this.onCardGivenAway(serial);
                    if (this.onShowMessage)
                        this.onShowMessage((0, Localization_1.t)('card_given'));
                    this._pendingOutgoingGiveSerial = '';
                    this._pendingOutgoingGiveTimer = null;
                }
            });
            this._pendingOutgoingGiveTimer = giveTimer;
            if (this.confirmGiveContainer)
                this.confirmGiveContainer.enabled = false;
            this.pendingGiveRequest = null;
        }
        /**
         * Sends a card's image to the requester after a trade is accepted.
         * Reads the image from persistent storage and sends via CARD_IMAGE_TRANSFER.
         */
        sendCardImageForTrade(serial) {
            if (!this.messaging)
                return;
            let savedAt = 0;
            if (this.onGetSavedAtForSerial) {
                savedAt = this.onGetSavedAtForSerial(serial);
            }
            if (!savedAt) {
                print('ConnectedLensManager: No savedAt found for traded card ' + serial + ' — no image to send');
                return;
            }
            let b64 = null;
            if (this.onGetCardImageBase64) {
                b64 = this.onGetCardImageBase64(savedAt);
            }
            if (!b64 || b64.length === 0) {
                print('ConnectedLensManager: No image found for traded card ' + serial);
                return;
            }
            print('ConnectedLensManager: Sending image for traded card ' + serial
                + ' (' + b64.length + ' chars)');
            // Small delay so the ACCEPTED message arrives first
            const delayEvent = this.createEvent('DelayedCallbackEvent');
            delayEvent.reset(0.15);
            delayEvent.bind(() => {
                this.sendCardImage(serial, b64, this.CARD_IMAGE_TRANSFER_EVENT, this.CARD_IMAGE_CHUNK_XFER_EVENT);
            });
        }
        rejectGiveRequest() {
            if (!this.pendingGiveRequest || !this.messaging)
                return;
            print('ConnectedLensManager: Rejected give for ' + this.pendingGiveRequest.cardSerial);
            this.messaging.sendMessage(this.CARD_GIVE_REJECTED_EVENT, JSON.stringify({ cardSerial: this.pendingGiveRequest.cardSerial }), true);
            if (this.confirmGiveContainer)
                this.confirmGiveContainer.enabled = false;
            this.pendingGiveRequest = null;
        }
        onCardGiveAccepted(msg) {
            try {
                const data = JSON.parse(msg.data);
                const serial = data.cardSerial;
                const senderConnId = msg.senderConnectionId;
                const player = this.remotePlayers.get(senderConnId);
                print('ConnectedLensManager: Card give accepted! Serial: ' + serial);
                // Clear the request guard
                if (this._pendingRequestSerial === serial) {
                    this._pendingRequestSerial = '';
                }
                // Store pending trade serial — image will arrive shortly via CARD_IMAGE_TRANSFER
                this._pendingTradeSerial = serial;
                this._pendingTradeImageB64 = '';
                // Clean up world/grabbed clones for this traded card so they can't be re-grabbed
                this.cleanupRemoteCardClones(senderConnId, serial);
                if (player) {
                    for (let i = 0; i < player.remoteCardData.length; i++) {
                        if (player.remoteCardData[i].serial === serial) {
                            const card = player.remoteCardData[i];
                            if (this.onShowMessage)
                                this.onShowMessage((0, Localization_1.tf)('received_card', { name: card.brand_model }));
                            const cardCopy = { ...card };
                            const timeoutEvent = this.createEvent('DelayedCallbackEvent');
                            timeoutEvent.reset(3.0);
                            timeoutEvent.bind(() => {
                                const imgB64 = (this._pendingTradeSerial === serial) ? this._pendingTradeImageB64 : '';
                                if (this.onCardReceived) {
                                    this.onCardReceived(cardCopy, imgB64.length > 0 ? imgB64 : undefined);
                                }
                                if (this._pendingTradeSerial === serial) {
                                    this._pendingTradeSerial = '';
                                    this._pendingTradeImageB64 = '';
                                }
                            });
                            // Remove from remote display
                            player.remoteCardData.splice(i, 1);
                            if (player.remoteCards[i]) {
                                this._remoteCardMeta.delete(player.remoteCards[i]);
                                try {
                                    player.remoteCards[i].destroy();
                                }
                                catch (e) { /* ignore */ }
                                player.remoteCards.splice(i, 1);
                            }
                            break;
                        }
                    }
                }
            }
            catch (e) {
                print('ConnectedLensManager: Error handling give accepted: ' + e);
            }
        }
        // =====================================================================
        // CARD IMAGE TRANSFER — Image sent after trade acceptance
        // =====================================================================
        /** Handles a complete card image transfer (fits in one message). */
        onCardImageTransfer(msg) {
            try {
                const d = JSON.parse(msg.data);
                const serial = d.serial;
                const b64 = d.b64;
                if (!serial || !b64)
                    return;
                print('ConnectedLensManager: Received trade image for ' + serial
                    + ' (' + b64.length + ' chars)');
                if (this._pendingTradeSerial === serial) {
                    this._pendingTradeImageB64 = b64;
                }
            }
            catch (e) {
                print('ConnectedLensManager: Error parsing trade image: ' + e);
            }
        }
        /** Handles chunked card image transfer for trades. */
        onCardImageChunkTransfer(msg) {
            try {
                const d = JSON.parse(msg.data);
                const serial = d.serial;
                const idx = d.idx;
                const total = d.total;
                const chunk = d.data;
                if (!serial || idx === undefined || !total || !chunk)
                    return;
                const key = msg.senderConnectionId + '_xfer_' + serial;
                if (!this._imageXferChunkBuffers.has(key)) {
                    this._imageXferChunkBuffers.set(key, { total: total, chunks: new Array(total).fill(''), ts: Date.now() });
                }
                const buf = this._imageXferChunkBuffers.get(key);
                buf.chunks[idx] = chunk;
                // Check if all chunks received
                let complete = true;
                for (let i = 0; i < buf.total; i++) {
                    if (!buf.chunks[i] || buf.chunks[i].length === 0) {
                        complete = false;
                        break;
                    }
                }
                if (complete) {
                    const fullB64 = buf.chunks.join('');
                    this._imageXferChunkBuffers.delete(key);
                    print('ConnectedLensManager: Reassembled trade image for ' + serial
                        + ' (' + fullB64.length + ' chars, ' + buf.total + ' chunks)');
                    if (this._pendingTradeSerial === serial) {
                        this._pendingTradeImageB64 = fullB64;
                    }
                }
            }
            catch (e) {
                print('ConnectedLensManager: Error parsing trade image chunk: ' + e);
            }
        }
        onCardGiveRejected(msg) {
            let reason = '';
            let serial = '';
            try {
                const data = JSON.parse(msg.data);
                reason = data.reason || '';
                serial = data.cardSerial || '';
            }
            catch (e) { /* no data */ }
            // Clear the request guard
            if (serial && this._pendingRequestSerial === serial) {
                this._pendingRequestSerial = '';
            }
            else {
                this._pendingRequestSerial = '';
            }
            print('ConnectedLensManager: Card give request was rejected — reason=' + (reason || 'declined'));
            if (reason === 'busy') {
                if (this.onShowMessage)
                    this.onShowMessage((0, Localization_1.t)('give_request_busy'));
            }
            else {
                if (this.onShowMessage)
                    this.onShowMessage((0, Localization_1.t)('request_declined'));
            }
        }
        /**
         * Cleans up all remote card clones (world + grabbed) for a given owner + serial.
         * Also removes associated _remoteCardMeta entries to prevent re-interaction.
         */
        cleanupRemoteCardClones(ownerConnId, serial) {
            const key = ownerConnId + '_' + serial;
            if (this._remoteGrabbedCards.has(key)) {
                const anchor = this._remoteGrabbedCards.get(key);
                try {
                    const childCount = anchor.getChildrenCount();
                    for (let i = 0; i < childCount; i++) {
                        try {
                            const child = anchor.getChild(i);
                            this.stopLocalGrabBillboard(child);
                            this._remoteCardMeta.delete(child);
                        }
                        catch (e) { /* ignore */ }
                    }
                    anchor.destroy();
                }
                catch (e) { /* already destroyed */ }
                this._remoteGrabbedCards.delete(key);
                print('ConnectedLensManager: Cleaned up grabbed clone for traded card — ' + serial);
            }
            if (this._remoteWorldCards.has(key)) {
                const anchor = this._remoteWorldCards.get(key);
                try {
                    const childCount = anchor.getChildrenCount();
                    for (let i = 0; i < childCount; i++) {
                        try {
                            const child = anchor.getChild(i);
                            this.stopLocalGrabBillboard(child);
                            this._remoteCardMeta.delete(child);
                        }
                        catch (e) { /* ignore */ }
                    }
                    anchor.destroy();
                }
                catch (e) { /* already destroyed */ }
                this._remoteWorldCards.delete(key);
                print('ConnectedLensManager: Cleaned up world clone for traded card — ' + serial);
            }
        }
        // =====================================================================
        // GIVE REQUEST TIMEOUT — Auto-cancel after 30s of no response
        // =====================================================================
        checkGiveRequestTimeout() {
            if (!this.pendingGiveRequest)
                return;
            if (this._frameCounter % 30 !== 0)
                return;
            if (Date.now() - this.giveRequestTimestamp > this.GIVE_REQUEST_TIMEOUT_MS) {
                print('ConnectedLensManager: Give request timed out (30s) — auto-rejecting');
                this.rejectGiveRequest();
                if (this.onShowMessage)
                    this.onShowMessage((0, Localization_1.t)('trade_expired'));
            }
        }
        purgeStaleChunkBuffers() {
            const now = Date.now();
            for (const [key, buf] of this._imageChunkBuffers) {
                if (now - buf.ts > this.CHUNK_TIMEOUT_MS) {
                    print('ConnectedLensManager: Purging stale chunk buffer: ' + key);
                    this._imageChunkBuffers.delete(key);
                }
            }
            for (const [key, buf] of this._imageXferChunkBuffers) {
                if (now - buf.ts > this.CHUNK_TIMEOUT_MS) {
                    print('ConnectedLensManager: Purging stale xfer chunk buffer: ' + key);
                    this._imageXferChunkBuffers.delete(key);
                }
            }
        }
        // =====================================================================
        // CONFIRM GIVE BUTTONS SETUP
        // =====================================================================
        setupGiveButtons() {
            if (this.giveButtonsConnected)
                return;
            if (this.confirmGiveYesButton && this.onConnectButton) {
                this.onConnectButton(this.confirmGiveYesButton, () => {
                    print('ConnectedLensManager: Give confirmed');
                    this.acceptGiveRequest();
                }, 'ConfirmGiveYes');
            }
            if (this.confirmGiveCancelButton && this.onConnectButton) {
                this.onConnectButton(this.confirmGiveCancelButton, () => {
                    print('ConnectedLensManager: Give cancelled');
                    this.rejectGiveRequest();
                }, 'ConfirmGiveCancel');
            }
            this.hookContainerCloseButtons();
            this.giveButtonsConnected = true;
        }
        /**
         * Translates all static UI texts in Give/Trade containers (Yes/Cancel buttons, question texts).
         * Called once after language selection.
         */
        translateStaticTexts() {
            if (this.confirmGiveContainer)
                this.walkAndTranslate(this.confirmGiveContainer);
            if (this.confirmTradeContainer)
                this.walkAndTranslate(this.confirmTradeContainer);
            print('ConnectedLensManager: Static UI texts translated');
        }
        walkAndTranslate(obj) {
            const name = obj.name;
            try {
                const textComp = obj.getComponent('Component.Text');
                if (textComp) {
                    if (name === 'Yes') {
                        textComp.text = (0, Localization_1.t)('yes');
                    }
                    else if (name === 'Cancel') {
                        textComp.text = (0, Localization_1.t)('cancel_btn');
                    }
                    else if (name.indexOf('allow username') >= 0 || name.indexOf('Do you want to allow') >= 0) {
                        if (obj.getParent() && obj.getParent().name.indexOf('Trade') >= 0) {
                            textComp.text = (0, Localization_1.t)('trade_card_default');
                        }
                        else {
                            textComp.text = (0, Localization_1.t)('give_card_default');
                        }
                    }
                }
            }
            catch (e) { /* no text component */ }
            const count = obj.getChildrenCount();
            for (let i = 0; i < count; i++) {
                const child = obj.getChild(i);
                if (child)
                    this.walkAndTranslate(child);
            }
        }
        hookContainerCloseButtons() {
            // Close buttons are hooked lazily via showContainer() because Frame.ts
            // only creates FrameObject + buttons after OnStartEvent on an enabled object.
        }
        showContainer(container, closeCallback, debugName) {
            this.positionContainerInFrontOfUser(container);
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
        positionContainerInFrontOfUser(container) {
            if (!this.camDisplay)
                return;
            try {
                const camParent = this.camDisplay.getParent();
                if (!camParent)
                    return;
                const camTransform = camParent.getTransform();
                const camPos = camTransform.getWorldPosition();
                const camRot = camTransform.getWorldRotation();
                const forward = camRot.multiplyVec3(vec3.forward()).normalize();
                const spawnPos = camPos.add(forward.uniformScale(60));
                const transform = container.getTransform();
                transform.setWorldPosition(spawnPos);
                transform.setWorldRotation(quat.quatIdentity());
            }
            catch (e) { /* ignore */ }
        }
        deepSearchAndHookClose(root, callback, debugName) {
            const count = root.getChildrenCount();
            for (let i = 0; i < count; i++) {
                const child = root.getChild(i);
                if (!child)
                    continue;
                if (child.name === 'FrameObject') {
                    if (this.searchButtonsIn(child, callback, debugName))
                        return true;
                }
                if (this.deepSearchAndHookClose(child, callback, debugName))
                    return true;
            }
            return false;
        }
        searchButtonsIn(parent, callback, debugName) {
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
                            s.onTriggerUp.add(() => callback());
                            print('ConnectedLensManager: Frame close button hooked — ' + debugName);
                            return true;
                        }
                        if (s.onButtonPinched && typeof s.onButtonPinched.add === 'function') {
                            s.onButtonPinched.add(() => callback());
                            print('ConnectedLensManager: Frame close button hooked (pinch) — ' + debugName);
                            return true;
                        }
                    }
                    catch (e) { /* ignore */ }
                }
                if (this.searchButtonsIn(child, callback, debugName))
                    return true;
            }
            return false;
        }
        // =====================================================================
        // WORLD-PLACED CARD SYNC — Broadcast when a card is placed/returned
        // =====================================================================
        /** Called by the orchestrator when a local card is placed in the world. */
        broadcastCardPlaced(serial, worldPos, worldRot, scale) {
            if (!this.messaging || !this._syncSetupDone)
                return;
            const locPos = this.worldPosToLocated(worldPos);
            const locRot = this.worldRotToLocated(worldRot);
            try {
                const payload = JSON.stringify({
                    serial: serial,
                    px: locPos.x, py: locPos.y, pz: locPos.z,
                    rx: locRot.x, ry: locRot.y, rz: locRot.z, rw: locRot.w,
                    s: scale,
                });
                this.messaging.sendMessage(this.CARD_PLACED_EVENT, payload, true);
                print('ConnectedLensManager: Broadcast card placed — ' + serial);
            }
            catch (e) {
                print('ConnectedLensManager: Error broadcasting card placed: ' + e);
            }
        }
        /** Called by the orchestrator when a local card is returned to collection. */
        broadcastCardReturned(serial) {
            if (!this.messaging || !this._syncSetupDone)
                return;
            try {
                const payload = JSON.stringify({ serial: serial });
                this.messaging.sendMessage(this.CARD_RETURNED_EVENT, payload, true);
                print('ConnectedLensManager: Broadcast card returned — ' + serial);
            }
            catch (e) {
                print('ConnectedLensManager: Error broadcasting card returned: ' + e);
            }
        }
        /** Called by the orchestrator when a local card is grabbed from the carousel. */
        broadcastCardGrabbed(serial, worldPos, worldRot, scale) {
            if (!this.messaging || !this._syncSetupDone)
                return;
            const locPos = this.worldPosToLocated(worldPos);
            const locRot = this.worldRotToLocated(worldRot);
            try {
                const payload = JSON.stringify({
                    serial: serial,
                    px: locPos.x, py: locPos.y, pz: locPos.z,
                    rx: locRot.x, ry: locRot.y, rz: locRot.z, rw: locRot.w,
                    s: scale,
                });
                this.messaging.sendMessage(this.CARD_GRAB_EVENT, payload, false);
                print('ConnectedLensManager: Broadcast card grabbed — ' + serial);
            }
            catch (e) {
                print('ConnectedLensManager: Error broadcasting card grabbed: ' + e);
            }
        }
        /** Called by the orchestrator every few frames while a local card is being dragged. */
        broadcastCardMoving(serial, worldPos, worldRot, scale) {
            if (!this.messaging || !this._syncSetupDone)
                return;
            const locPos = this.worldPosToLocated(worldPos);
            const locRot = this.worldRotToLocated(worldRot);
            try {
                const payload = JSON.stringify({
                    serial: serial,
                    px: locPos.x, py: locPos.y, pz: locPos.z,
                    rx: locRot.x, ry: locRot.y, rz: locRot.z, rw: locRot.w,
                    s: scale,
                });
                this.messaging.sendMessage(this.CARD_MOVE_EVENT, payload, false);
            }
            catch (e) { /* throttled, ignore errors */ }
        }
        /** Handles a remote player grabbing a card from their carousel or world. */
        onRemoteCardGrabbed(msg) {
            const senderConnId = msg.senderConnectionId;
            const player = this.remotePlayers.get(senderConnId);
            try {
                const d = JSON.parse(msg.data);
                const serial = d.serial;
                if (!serial)
                    return;
                const locPos = new vec3(d.px, d.py, d.pz);
                const locRot = new quat(d.rw, d.rx, d.ry, d.rz);
                const scale = d.s || 0.36;
                const worldPos = this.locatedPosToWorld(locPos);
                const worldRot = this.locatedRotToWorld(locRot);
                const key = senderConnId + '_' + serial;
                // If already tracked as grabbed, just update position
                if (this._remoteGrabbedCards.has(key)) {
                    const obj = this._remoteGrabbedCards.get(key);
                    try {
                        obj.getTransform().setWorldPosition(worldPos);
                        obj.getTransform().setWorldRotation(worldRot);
                    }
                    catch (e) { /* destroyed */ }
                    return;
                }
                // If this card was previously placed in world, transfer the existing
                // world clone to grabbed state instead of creating a duplicate
                if (this._remoteWorldCards.has(key)) {
                    const worldAnchor = this._remoteWorldCards.get(key);
                    try {
                        const child = worldAnchor.getChildrenCount() > 0 ? worldAnchor.getChild(0) : null;
                        if (child) {
                            child.getTransform().setWorldPosition(worldPos);
                            child.getTransform().setWorldRotation(worldRot);
                        }
                        worldAnchor.name = 'RemoteGrabAnchor_' + serial;
                        if (child)
                            child.name = 'RemoteGrabbedCard_' + serial;
                    }
                    catch (e) { /* destroyed */ }
                    this._remoteGrabbedCards.set(key, worldAnchor);
                    this._remoteWorldCards.delete(key);
                    print('ConnectedLensManager: World card transferred to grabbed state — ' + serial);
                    return;
                }
                // Hide card from the remote carousel
                if (player) {
                    for (let i = 0; i < player.remoteCardData.length; i++) {
                        if (player.remoteCardData[i].serial === serial && i < player.remoteCards.length) {
                            const carouselCard = player.remoteCards[i];
                            if (carouselCard)
                                carouselCard.enabled = false;
                            break;
                        }
                    }
                }
                // Instantiate a floating clone at the grabbed position
                if (!this.verticalCardPrefab)
                    return;
                const clone = this.verticalCardPrefab.instantiate(this.collectionRoot || this.getSceneObject());
                if (!clone)
                    return;
                clone.name = 'RemoteGrabbedCard_' + serial;
                // Populate card data and image
                if (player) {
                    for (let i = 0; i < player.remoteCardData.length; i++) {
                        if (player.remoteCardData[i].serial === serial) {
                            this.populateRemoteCard(clone, player.remoteCardData[i], player);
                            if (i < player.remoteCards.length && player.remoteCards[i]) {
                                try {
                                    const imgObj = (0, VehicleTypes_1.findChildByName)(player.remoteCards[i], 'Card Image');
                                    if (imgObj) {
                                        const imgComp = imgObj.getComponent('Component.Image');
                                        if (imgComp && imgComp.mainPass && imgComp.mainPass.baseTex) {
                                            this.applyImageToCard(clone, imgComp.mainPass.baseTex);
                                        }
                                    }
                                }
                                catch (e) { /* ignore */ }
                            }
                            break;
                        }
                    }
                }
                // Position in world space
                const anchor = global.scene.createSceneObject('RemoteGrabAnchor_' + serial);
                clone.setParent(anchor);
                clone.getTransform().setWorldPosition(worldPos);
                clone.getTransform().setWorldRotation(worldRot);
                clone.getTransform().setLocalScale(new vec3(scale, scale, scale));
                this._remoteGrabbedCards.set(key, anchor);
                const playerName = player ? player.displayName : senderConnId;
                print('ConnectedLensManager: Remote card grabbed — ' + serial + ' from ' + playerName);
            }
            catch (e) {
                print('ConnectedLensManager: Error handling remote card grabbed: ' + e);
            }
        }
        /** Handles a remote player moving a grabbed card (real-time position update). */
        onRemoteCardMoved(msg) {
            const senderConnId = msg.senderConnectionId;
            try {
                const d = JSON.parse(msg.data);
                const serial = d.serial;
                if (!serial)
                    return;
                const key = senderConnId + '_' + serial;
                const anchor = this._remoteGrabbedCards.get(key);
                if (!anchor)
                    return;
                const locPos = new vec3(d.px, d.py, d.pz);
                const locRot = new quat(d.rw, d.rx, d.ry, d.rz);
                const scale = d.s || 0.36;
                const worldPos = this.locatedPosToWorld(locPos);
                const worldRot = this.locatedRotToWorld(locRot);
                // Update the clone position with lerp for smoothness
                try {
                    const t = anchor.getChildrenCount() > 0 ? anchor.getChild(0) : null;
                    if (t) {
                        const curPos = t.getTransform().getWorldPosition();
                        const lerpedPos = new vec3(curPos.x + (worldPos.x - curPos.x) * this.HEAD_LERP_SPEED, curPos.y + (worldPos.y - curPos.y) * this.HEAD_LERP_SPEED, curPos.z + (worldPos.z - curPos.z) * this.HEAD_LERP_SPEED);
                        t.getTransform().setWorldPosition(lerpedPos);
                        t.getTransform().setWorldRotation(quat.slerp(t.getTransform().getWorldRotation(), worldRot, this.HEAD_LERP_SPEED));
                        const curScale = t.getTransform().getLocalScale().x;
                        const newS = curScale + (scale - curScale) * this.HEAD_LERP_SPEED;
                        t.getTransform().setLocalScale(new vec3(newS, newS, newS));
                    }
                }
                catch (e) { /* anchor may be destroyed */ }
            }
            catch (e) { /* throttled, ignore */ }
        }
        /** Handles a remote player placing a card in world space. */
        onRemoteCardPlaced(msg) {
            const senderConnId = msg.senderConnectionId;
            const player = this.remotePlayers.get(senderConnId);
            try {
                const d = JSON.parse(msg.data);
                const serial = d.serial;
                if (!serial)
                    return;
                const locPos = new vec3(d.px, d.py, d.pz);
                const locRot = new quat(d.rw, d.rx, d.ry, d.rz);
                const scale = d.s || 0.36;
                // Convert from LocatedAt to local world
                const worldPos = this.locatedPosToWorld(locPos);
                const worldRot = this.locatedRotToWorld(locRot);
                const key = senderConnId + '_' + serial;
                // If the card was being grabbed, promote the grab clone to a world card
                if (this._remoteGrabbedCards.has(key)) {
                    const grabAnchor = this._remoteGrabbedCards.get(key);
                    try {
                        const child = grabAnchor.getChildrenCount() > 0 ? grabAnchor.getChild(0) : null;
                        if (child) {
                            child.getTransform().setWorldPosition(worldPos);
                            child.getTransform().setWorldRotation(worldRot);
                            child.getTransform().setLocalScale(new vec3(scale, scale, scale));
                        }
                        // Rename anchor
                        grabAnchor.name = 'RemoteWorldAnchor_' + serial;
                        if (child)
                            child.name = 'RemoteWorldCard_' + serial;
                    }
                    catch (e) { /* destroyed */ }
                    if (player) {
                        const child = grabAnchor.getChildrenCount() > 0 ? grabAnchor.getChild(0) : null;
                        if (child)
                            this.setupRemoteCardInteraction(child, senderConnId, serial);
                    }
                    this._remoteWorldCards.set(key, grabAnchor);
                    this._remoteGrabbedCards.delete(key);
                    const playerName = player ? player.displayName : senderConnId;
                    print('ConnectedLensManager: Grabbed card promoted to world card — ' + serial + ' from ' + playerName);
                    return;
                }
                // Destroy existing clone if any
                if (this._remoteWorldCards.has(key)) {
                    try {
                        this._remoteWorldCards.get(key).destroy();
                    }
                    catch (e) { /* ignore */ }
                    this._remoteWorldCards.delete(key);
                }
                // Find the card data from the player's carousel
                let cardData = null;
                let cardImageTexture = null;
                if (player) {
                    for (let i = 0; i < player.remoteCardData.length; i++) {
                        if (player.remoteCardData[i].serial === serial) {
                            cardData = player.remoteCardData[i];
                            // Try to grab the texture from the existing carousel card
                            if (i < player.remoteCards.length && player.remoteCards[i]) {
                                try {
                                    const imgObj = (0, VehicleTypes_1.findChildByName)(player.remoteCards[i], 'Card Image');
                                    if (imgObj && imgObj.enabled) {
                                        const imgComp = imgObj.getComponent('Component.Image');
                                        if (imgComp && imgComp.mainPass && imgComp.mainPass.baseTex) {
                                            cardImageTexture = imgComp.mainPass.baseTex;
                                        }
                                        if (!cardImageTexture) {
                                            const meshComp = imgObj.getComponent('Component.RenderMeshVisual');
                                            if (meshComp && meshComp.mainPass && meshComp.mainPass.baseTex) {
                                                cardImageTexture = meshComp.mainPass.baseTex;
                                            }
                                        }
                                    }
                                }
                                catch (e) { /* ignore */ }
                            }
                            break;
                        }
                    }
                }
                if (!this.verticalCardPrefab) {
                    print('ConnectedLensManager: No card prefab — cannot show remote world card');
                    return;
                }
                // Instantiate a clone at the world position
                const clone = this.verticalCardPrefab.instantiate(this.collectionRoot || this.getSceneObject());
                if (!clone)
                    return;
                clone.name = 'RemoteWorldCard_' + serial;
                if (cardData) {
                    this.populateRemoteCard(clone, cardData, player);
                }
                // Apply image if available
                if (cardImageTexture) {
                    this.applyImageToCard(clone, cardImageTexture);
                }
                else {
                    const cardImageObj = (0, VehicleTypes_1.findChildByName)(clone, 'Card Image');
                    if (cardImageObj)
                        cardImageObj.enabled = false;
                }
                // Unparent so it lives in world space
                const anchor = global.scene.createSceneObject('RemoteWorldAnchor_' + serial);
                clone.setParent(anchor);
                clone.getTransform().setWorldPosition(worldPos);
                clone.getTransform().setWorldRotation(worldRot);
                clone.getTransform().setLocalScale(new vec3(scale, scale, scale));
                // Set up trade interaction on this world-placed card
                if (player) {
                    this.setupRemoteCardInteraction(clone, senderConnId, serial);
                }
                this._remoteWorldCards.set(key, anchor);
                const playerName = player ? player.displayName : senderConnId;
                print('ConnectedLensManager: Remote world card placed — ' + serial
                    + ' from ' + playerName + ' at ('
                    + worldPos.x.toFixed(1) + ',' + worldPos.y.toFixed(1) + ',' + worldPos.z.toFixed(1) + ')');
            }
            catch (e) {
                print('ConnectedLensManager: Error handling remote card placed: ' + e);
            }
        }
        /** Handles a remote player returning a card to their collection. */
        onRemoteCardReturned(msg) {
            const senderConnId = msg.senderConnectionId;
            const player = this.remotePlayers.get(senderConnId);
            try {
                const d = JSON.parse(msg.data);
                const serial = d.serial;
                if (!serial)
                    return;
                // Force-clean every remote clone state for this serial (grabbed/world).
                // This is intentionally aggressive to prevent any ghost-card desync.
                this.cleanupRemoteCardClones(senderConnId, serial);
                // Re-show card in the remote carousel
                if (player) {
                    for (let i = 0; i < player.remoteCardData.length; i++) {
                        if (player.remoteCardData[i].serial === serial && i < player.remoteCards.length) {
                            const carouselCard = player.remoteCards[i];
                            if (carouselCard)
                                carouselCard.enabled = true;
                            break;
                        }
                    }
                }
                print('ConnectedLensManager: Remote card returned to carousel — ' + serial);
            }
            catch (e) {
                print('ConnectedLensManager: Error handling remote card returned: ' + e);
            }
        }
        // =====================================================================
        // CLEANUP
        // =====================================================================
        cleanupRemotePlayers() {
            this.remotePlayers.forEach((player, _key) => {
                this.destroyRemoteCarousel(player);
                if (player.camDisplayObj) {
                    try {
                        player.camDisplayObj.destroy();
                    }
                    catch (e) { /* ignore */ }
                }
                if (player.headDebugObj) {
                    player.headDebugObj.enabled = false;
                }
            });
            this.remotePlayers.clear();
            this._remoteCardMeta.clear();
            this._imageChunkBuffers.clear();
            this._imageXferChunkBuffers.clear();
            this._pendingTradeSerial = '';
            this._pendingTradeImageB64 = '';
            // Cancel any outgoing give that hasn't completed
            if (this._pendingOutgoingGiveSerial.length > 0) {
                if (this._pendingOutgoingGiveTimer) {
                    try {
                        this._pendingOutgoingGiveTimer.enabled = false;
                    }
                    catch (e) { /* ignore */ }
                    this._pendingOutgoingGiveTimer = null;
                }
                this._pendingOutgoingGiveSerial = '';
            }
            // Destroy all remote grabbed cards
            this._remoteGrabbedCards.forEach((anchor, _key) => {
                try {
                    anchor.destroy();
                }
                catch (e) { /* ignore */ }
            });
            this._remoteGrabbedCards.clear();
            // Destroy all remote world-placed cards
            this._remoteWorldCards.forEach((anchor, _key) => {
                try {
                    anchor.destroy();
                }
                catch (e) { /* ignore */ }
            });
            this._remoteWorldCards.clear();
            // Stop any remaining local billboard loops
            this._localGrabBillboardEvents.forEach((ev, _obj) => {
                try {
                    ev.enabled = false;
                }
                catch (e) { /* ignore */ }
            });
            this._localGrabBillboardEvents.clear();
            // Cancel any pending card exchange
            if (this.pendingGiveRequest) {
                print('ConnectedLensManager: Cancelling pending give request — session cleanup');
                this.pendingGiveRequest = null;
                if (this.confirmGiveContainer)
                    this.confirmGiveContainer.enabled = false;
            }
            if (this.headDebugMesh)
                this.headDebugMesh.enabled = false;
            if (this.headDebugMeshCustom)
                this.headDebugMeshCustom.enabled = false;
            if (this.remotePlayerInfoContainer)
                this.remotePlayerInfoContainer.enabled = false;
        }
    };
    __setFunctionName(_classThis, "ConnectedLensManager");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        ConnectedLensManager = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return ConnectedLensManager = _classThis;
})();
exports.ConnectedLensManager = ConnectedLensManager;
//# sourceMappingURL=ConnectedLensManager.js.map