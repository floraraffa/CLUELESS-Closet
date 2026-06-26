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
exports.CloudManager = void 0;
var __selfType = requireType("./CloudManager");
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
 * CloudManager.ts — Centralized Snap Cloud / Supabase integration for Closet Club
 *
 * Handles:
 *   - Snapchat authentication via Supabase Auth
 *   - User profile sync (XP, level, prestige, streak) to cloud
 *   - Vehicle collection backup/restore to cloud database
 *   - Card images upload/download via Supabase Storage
 *
 * Requires a SnapCloudRequirements component with a configured SupabaseProject.
 * All cloud operations are fire-and-forget with local-first fallback.
 *
 * @author DGNS
 * @license MIT
 */
const supabase_snapcloud_1 = require("SupabaseClient.lspkg/supabase-snapcloud");
const ClosetTypes_1 = require("./ClosetTypes");
const Localization_1 = require("./Localization");
// =====================================================================
// COMPONENT
// =====================================================================
let CloudManager = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var CloudManager = _classThis = class extends _classSuper {
        constructor() {
            super();
            // =====================================================================
            // INPUTS
            // =====================================================================
            this.snapCloudRequirements = this.snapCloudRequirements;
            // =====================================================================
            // CALLBACKS — Set by orchestrator
            // =====================================================================
            this.onAuthenticated = null;
            this.onAuthFailed = null;
            this.onProfileSynced = null;
            this.onCollectionSynced = null;
            this.onShowMessage = null;
            /** Returns the local display name to store on the user's own cloud profile. */
            this.onGetUsername = null;
            // =====================================================================
            // CONSTANTS
            // =====================================================================
            this.STORAGE_BUCKET = 'closet-images';
            this.TABLE_PROFILES = 'user_profiles';
            this.TABLE_VEHICLES = 'closet_items';
            // =====================================================================
            // INTERNAL STATE
            // =====================================================================
            this.client = null;
            this.userId = '';
            this.isAuthenticated = false;
            this.isInitializing = false;
            this.internetModule = require('LensStudio:InternetModule');
            this.remoteMediaModule = require('LensStudio:RemoteMediaModule');
            this.bitmojiModule = require('LensStudio:BitmojiModule');
            this.cachedAvatarUrl = '';
        }
        __initialize() {
            super.__initialize();
            // =====================================================================
            // INPUTS
            // =====================================================================
            this.snapCloudRequirements = this.snapCloudRequirements;
            // =====================================================================
            // CALLBACKS — Set by orchestrator
            // =====================================================================
            this.onAuthenticated = null;
            this.onAuthFailed = null;
            this.onProfileSynced = null;
            this.onCollectionSynced = null;
            this.onShowMessage = null;
            /** Returns the local display name to store on the user's own cloud profile. */
            this.onGetUsername = null;
            // =====================================================================
            // CONSTANTS
            // =====================================================================
            this.STORAGE_BUCKET = 'closet-images';
            this.TABLE_PROFILES = 'user_profiles';
            this.TABLE_VEHICLES = 'closet_items';
            // =====================================================================
            // INTERNAL STATE
            // =====================================================================
            this.client = null;
            this.userId = '';
            this.isAuthenticated = false;
            this.isInitializing = false;
            this.internetModule = require('LensStudio:InternetModule');
            this.remoteMediaModule = require('LensStudio:RemoteMediaModule');
            this.bitmojiModule = require('LensStudio:BitmojiModule');
            this.cachedAvatarUrl = '';
        }
        // =====================================================================
        // LIFECYCLE
        // =====================================================================
        onAwake() {
            this.createEvent('OnStartEvent').bind(() => {
                this.initialize();
            });
        }
        onDestroy() {
            if (this.client) {
                try {
                    this.client.removeAllChannels();
                }
                catch (e) { /* ignore */ }
            }
        }
        // =====================================================================
        // INITIALIZATION
        // =====================================================================
        async initialize() {
            if (this.isInitializing)
                return;
            this.isInitializing = true;
            if (!this.snapCloudRequirements || !this.snapCloudRequirements.isConfigured()) {
                print('CloudManager: SnapCloudRequirements not configured — cloud features disabled');
                this.isInitializing = false;
                return;
            }
            try {
                const supabaseProject = this.snapCloudRequirements.getSupabaseProject();
                this.client = (0, supabase_snapcloud_1.createClient)(supabaseProject.url, supabaseProject.publicToken, {
                    realtime: { heartbeatIntervalMs: 2500 }
                });
                print('CloudManager: Supabase client created — authenticating...');
                await this.authenticate();
            }
            catch (e) {
                print('CloudManager: Init error: ' + e);
                this.isInitializing = false;
            }
        }
        // =====================================================================
        // AUTHENTICATION
        // =====================================================================
        async authenticate(retryCount = 0) {
            const maxRetries = 3;
            try {
                const { data, error } = await this.client.auth.signInWithIdToken({
                    provider: 'snapchat',
                    token: ''
                });
                if (error) {
                    const { data: sessionData } = await this.client.auth.getSession();
                    if (sessionData?.session?.user?.id) {
                        this.userId = sessionData.session.user.id;
                        this.isAuthenticated = true;
                        print('CloudManager: Authenticated (existing session) — uid=' + this.userId.substring(0, 8) + '...');
                        this.onAuthSuccess();
                        return;
                    }
                    if (retryCount < maxRetries) {
                        print('CloudManager: Auth retry ' + (retryCount + 1) + '/' + maxRetries);
                        await this.delay(1.0);
                        return this.authenticate(retryCount + 1);
                    }
                    print('CloudManager: Auth failed after ' + maxRetries + ' retries: ' + JSON.stringify(error));
                    if (this.onAuthFailed)
                        this.onAuthFailed(JSON.stringify(error));
                    return;
                }
                if (data?.user?.id) {
                    this.userId = data.user.id;
                    this.isAuthenticated = true;
                    print('CloudManager: Authenticated — uid=' + this.userId.substring(0, 8) + '...');
                    this.onAuthSuccess();
                }
            }
            catch (e) {
                if (retryCount < maxRetries) {
                    print('CloudManager: Auth exception, retry ' + (retryCount + 1) + ': ' + e);
                    await this.delay(1.0);
                    return this.authenticate(retryCount + 1);
                }
                print('CloudManager: Auth exception final: ' + e);
                if (this.onAuthFailed)
                    this.onAuthFailed(String(e));
            }
            finally {
                this.isInitializing = false;
            }
        }
        onAuthSuccess() {
            if (this.onAuthenticated)
                this.onAuthenticated(this.userId);
            this.fetchAndUploadBitmoji().catch(() => { });
        }
        // =====================================================================
        // PUBLIC API — Status
        // =====================================================================
        isReady() {
            return this.isAuthenticated && this.client !== null;
        }
        getUserId() {
            return this.userId;
        }
        /**
         * Tries to re-authenticate (e.g. after session expiry). Use when isReady() is false
         * but the user is trying to share or sync. Returns true if authenticated after the attempt.
         */
        async tryReconnect() {
            if (!this.client) {
                print('CloudManager: tryReconnect — no client, cannot reconnect');
                return false;
            }
            print('CloudManager: tryReconnect — attempting to re-authenticate...');
            this.isInitializing = false;
            await this.authenticate(0);
            if (this.isAuthenticated) {
                print('CloudManager: tryReconnect — success, uid=' + this.userId.substring(0, 8) + '...');
            }
            else {
                print('CloudManager: tryReconnect — failed, still not authenticated');
            }
            return this.isAuthenticated;
        }
        // =====================================================================
        // PROFILE SYNC
        // =====================================================================
        async syncProfile(localProfile, totalScans, totalTrades) {
            if (!this.isReady())
                return null;
            try {
                const username = this.onGetUsername ? this.onGetUsername() : '';
                const profileData = {
                    user_id: this.userId,
                    display_name: username.length > 0 ? username : 'Stylist_' + this.userId.substring(0, 6),
                    level: localProfile.level,
                    total_xp: localProfile.totalXP,
                    prestige: localProfile.prestige,
                    streak_days: localProfile.streakDays,
                    total_scans: totalScans,
                    total_trades: totalTrades,
                    trust_score: typeof localProfile.trustScore === 'number' ? localProfile.trustScore : 80,
                    consecutive_cheats: localProfile.consecutiveCheats || 0,
                    total_cheats: localProfile.totalCheats || 0,
                    cards_given: localProfile.cardsGiven || 0,
                    cards_received: localProfile.cardsReceived || 0,
                    last_login: new Date().toISOString(),
                    updated_at: new Date().toISOString(),
                };
                const { data, error } = await this.client
                    .from(this.TABLE_PROFILES)
                    .upsert(profileData, { onConflict: 'user_id' })
                    .select();
                if (error) {
                    print('CloudManager: Profile sync error: ' + JSON.stringify(error));
                    return null;
                }
                const result = data && data.length > 0 ? data[0] : null;
                print('CloudManager: Profile synced — Style ' + localProfile.level
                    + ' | XP ' + localProfile.totalXP
                    + ' | Prestige ' + localProfile.prestige);
                if (this.onProfileSynced && result)
                    this.onProfileSynced(result);
                return result;
            }
            catch (e) {
                print('CloudManager: Profile sync exception: ' + e);
                return null;
            }
        }
        async fetchCloudProfile() {
            if (!this.isReady())
                return null;
            try {
                const { data, error } = await this.client
                    .from(this.TABLE_PROFILES)
                    .select('*')
                    .eq('user_id', this.userId)
                    .limit(1);
                if (error || !data || data.length === 0)
                    return null;
                return data[0];
            }
            catch (e) {
                print('CloudManager: Fetch profile exception: ' + e);
                return null;
            }
        }
        // =====================================================================
        // COLLECTION SYNC
        // =====================================================================
        async syncVehicle(vehicle) {
            if (!this.isReady())
                return false;
            try {
                const vehicleData = {
                    user_id: this.userId,
                    serial: vehicle.serial,
                    brand: vehicle.brand || '',
                    brand_model: vehicle.brand_model,
                    mode: vehicle.mode || 'single_item',
                    item_name: vehicle.item_name || vehicle.brand_model,
                    type: vehicle.type,
                    category: vehicle.category || vehicle.type,
                    subcategory: vehicle.subcategory || vehicle.year || '',
                    year: vehicle.year || '',
                    collection: vehicle.collection || '',
                    collection_year: vehicle.collection_year || '',
                    quality: vehicle.quality || '',
                    scan_context: vehicle.scan_context || 'unknown',
                    rarity: vehicle.rarity || 2,
                    rarity_label: vehicle.rarity_label || 'Everyday',
                    color: vehicle.color || '',
                    material: vehicle.material || '',
                    pattern: vehicle.pattern || '',
                    fit: vehicle.fit || '',
                    condition: vehicle.condition || '',
                    confidence: typeof vehicle.confidence === 'number' ? vehicle.confidence : null,
                    style_tags: vehicle.style_tags || [],
                    occasion_tags: vehicle.occasion_tags || [],
                    season_tags: vehicle.season_tags || [],
                    items: vehicle.items || [],
                    look_summary: vehicle.look_summary || '',
                    suggested_pairings: vehicle.suggested_pairings || [],
                    pairing_note: vehicle.pairing_note || '',
                    feedback: vehicle.feedback || '',
                    ai_note: vehicle.ai_note || '',
                    user_note: vehicle.user_note || '',
                    top_speed: vehicle.top_speed,
                    acceleration: vehicle.acceleration,
                    braking: vehicle.braking,
                    traction: vehicle.traction,
                    comfort: vehicle.comfort,
                    scene: vehicle.scene || '',
                    city_scanned: vehicle.cityScanned || '',
                    date_scanned: vehicle.dateScanned || '',
                    saved_at: vehicle.savedAt,
                };
                const { data: existing } = await this.client
                    .from(this.TABLE_VEHICLES)
                    .select('serial')
                    .eq('serial', vehicle.serial)
                    .limit(1);
                if (existing && existing.length > 0) {
                    const { image_url, ...updateData } = vehicleData;
                    let { error } = await this.client
                        .from(this.TABLE_VEHICLES)
                        .update(updateData)
                        .eq('serial', vehicle.serial);
                    if (error && this.shouldRetryWithoutOptionalClosetColumns(error)) {
                        const fallbackData = this.removeOptionalClosetColumns(updateData);
                        const retry = await this.client
                            .from(this.TABLE_VEHICLES)
                            .update(fallbackData)
                            .eq('serial', vehicle.serial);
                        error = retry.error;
                    }
                    if (error) {
                        print('CloudManager: Closet item update error (' + vehicle.brand_model + '): ' + JSON.stringify(error));
                        return false;
                    }
                }
                else {
                    vehicleData.image_url = '';
                    let { error } = await this.client
                        .from(this.TABLE_VEHICLES)
                        .insert(vehicleData);
                    if (error && this.shouldRetryWithoutOptionalClosetColumns(error)) {
                        const fallbackData = this.removeOptionalClosetColumns(vehicleData);
                        const retry = await this.client
                            .from(this.TABLE_VEHICLES)
                            .insert(fallbackData);
                        error = retry.error;
                    }
                    if (error) {
                        print('CloudManager: Closet item insert error (' + vehicle.brand_model + '): ' + JSON.stringify(error));
                        return false;
                    }
                }
                print('CloudManager: Closet item synced — ' + vehicle.brand_model + ' (' + vehicle.serial + ')');
                return true;
            }
            catch (e) {
                print('CloudManager: Closet item sync exception: ' + e);
                return false;
            }
        }
        shouldRetryWithoutOptionalClosetColumns(error) {
            const text = JSON.stringify(error || {});
            return text.indexOf('ai_note') >= 0 || text.indexOf('user_note') >= 0;
        }
        removeOptionalClosetColumns(row) {
            const fallback = { ...row };
            delete fallback.ai_note;
            delete fallback.user_note;
            return fallback;
        }
        async syncFullCollection(vehicles) {
            if (!this.isReady() || vehicles.length === 0)
                return 0;
            try {
                // Sync vehicles one by one to preserve existing image_url values
                let synced = 0;
                for (let i = 0; i < vehicles.length; i++) {
                    const ok = await this.syncVehicle(vehicles[i]);
                    if (ok)
                        synced++;
                }
                print('CloudManager: Full collection sync OK — ' + synced + '/' + vehicles.length + ' vehicles');
                if (this.onCollectionSynced)
                    this.onCollectionSynced(synced);
                return synced;
            }
            catch (e) {
                print('CloudManager: Full collection sync exception: ' + e);
                return 0;
            }
        }
        /**
         * Bidirectional merge: compares local and cloud collections, returns a merged result.
         * - Cloud-only vehicles are added to local
         * - Local-only vehicles are pushed to cloud
         * - Conflicts (same serial) resolved by most recent saved_at
         */
        async mergeCollections(localVehicles) {
            if (!this.isReady())
                return localVehicles;
            const cloudVehicles = await this.fetchCloudCollection();
            if (cloudVehicles.length === 0 && localVehicles.length === 0)
                return localVehicles;
            const localBySerial = new Map();
            for (const v of localVehicles) {
                localBySerial.set(v.serial, v);
            }
            const merged = [...localVehicles];
            const toSyncToCloud = [];
            for (const cv of cloudVehicles) {
                const localV = localBySerial.get(cv.serial);
                if (!localV) {
                    // Cloud-only → add locally
                    const imported = {
                        vehicle_found: true,
                        clothing_found: true,
                        mode: cv.mode || 'single_item',
                        brand: cv.brand,
                        brand_model: cv.brand_model,
                        item_name: cv.item_name || cv.brand_model,
                        type: cv.type,
                        category: cv.category || cv.type,
                        subcategory: cv.subcategory || cv.year || '',
                        year: cv.year || '',
                        collection: cv.collection || '',
                        collection_year: cv.collection_year || '',
                        quality: cv.quality || '',
                        scan_context: (0, ClosetTypes_1.normalizeScanContext)(cv.scan_context),
                        color: cv.color || '',
                        material: cv.material || '',
                        pattern: cv.pattern || '',
                        fit: cv.fit || '',
                        condition: cv.condition || '',
                        confidence: cv.confidence || 0,
                        style_tags: cv.style_tags || [],
                        occasion_tags: cv.occasion_tags || [],
                        season_tags: cv.season_tags || [],
                        items: cv.items || [],
                        look_summary: cv.look_summary || '',
                        suggested_pairings: cv.suggested_pairings || [],
                        pairing_note: cv.pairing_note || '',
                        feedback: cv.feedback || '',
                        ai_note: cv.ai_note || '',
                        user_note: cv.user_note || '',
                        top_speed: cv.top_speed,
                        acceleration: cv.acceleration,
                        braking: cv.braking,
                        traction: cv.traction,
                        comfort: cv.comfort,
                        rarity: cv.rarity,
                        rarity_label: cv.rarity_label || '',
                        scene: cv.scene || '',
                        savedAt: cv.saved_at,
                        imageGenerated: false,
                        serial: cv.serial,
                        dateScanned: cv.date_scanned || '',
                        cityScanned: cv.city_scanned || '',
                    };
                    merged.push(imported);
                    print('CloudManager: Merge — imported from cloud: ' + cv.brand_model);
                }
                // Same serial exists locally → local wins (already in merged)
            }
            // Local-only → push to cloud
            const cloudSerials = new Set(cloudVehicles.map(cv => cv.serial));
            for (const lv of localVehicles) {
                if (!cloudSerials.has(lv.serial)) {
                    toSyncToCloud.push(lv);
                }
            }
            if (toSyncToCloud.length > 0) {
                print('CloudManager: Merge — pushing ' + toSyncToCloud.length + ' local-only vehicles to cloud');
                await this.syncFullCollection(toSyncToCloud);
            }
            print('CloudManager: Merge complete — ' + merged.length + ' total vehicles');
            return merged;
        }
        async fetchCloudCollection() {
            if (!this.isReady())
                return [];
            try {
                const { data, error } = await this.client
                    .from(this.TABLE_VEHICLES)
                    .select('*')
                    .eq('user_id', this.userId)
                    .order('saved_at', { ascending: false });
                if (error) {
                    print('CloudManager: Fetch collection error: ' + JSON.stringify(error));
                    return [];
                }
                print('CloudManager: Fetched ' + (data?.length || 0) + ' vehicles from cloud');
                return (data || []);
            }
            catch (e) {
                print('CloudManager: Fetch collection exception: ' + e);
                return [];
            }
        }
        async deleteCloudVehicle(serial) {
            if (!this.isReady())
                return false;
            try {
                const { error } = await this.client
                    .from(this.TABLE_VEHICLES)
                    .delete()
                    .eq('user_id', this.userId)
                    .eq('serial', serial);
                if (error) {
                    print('CloudManager: Delete vehicle error: ' + JSON.stringify(error));
                    return false;
                }
                print('CloudManager: Vehicle deleted from cloud — ' + serial);
                return true;
            }
            catch (e) {
                print('CloudManager: Delete vehicle exception: ' + e);
                return false;
            }
        }
        async resetCloudCollection() {
            if (!this.isReady())
                return;
            try {
                // 1. Delete all vehicles
                const { error: vehicleError } = await this.client
                    .from(this.TABLE_VEHICLES)
                    .delete()
                    .eq('user_id', this.userId);
                if (vehicleError) {
                    print('CloudManager: [RESET] Vehicles delete FAILED: ' + JSON.stringify(vehicleError));
                }
                else {
                    print('CloudManager: [RESET] All vehicles deleted from cloud');
                }
                // 2. Delete user profile (AFTER vehicles due to FK constraint)
                const { error: profileError } = await this.client
                    .from(this.TABLE_PROFILES)
                    .delete()
                    .eq('user_id', this.userId);
                if (profileError) {
                    print('CloudManager: [RESET] Profile delete FAILED: ' + JSON.stringify(profileError));
                }
                else {
                    print('CloudManager: [RESET] User profile deleted from cloud');
                }
                // 3. Clean up card images from storage bucket (best-effort)
                try {
                    const { data: files } = await this.client.storage
                        .from(this.STORAGE_BUCKET)
                        .list(this.userId + '/');
                    if (files && files.length > 0) {
                        const paths = files.map((f) => this.userId + '/' + f.name);
                        const { error: removeError } = await this.client.storage
                            .from(this.STORAGE_BUCKET)
                            .remove(paths);
                        if (removeError) {
                            print('CloudManager: [RESET] Storage cleanup error: ' + JSON.stringify(removeError));
                        }
                        else {
                            print('CloudManager: [RESET] ' + files.length + ' card images removed from storage');
                        }
                    }
                }
                catch (storageErr) {
                    print('CloudManager: [RESET] Storage cleanup skipped: ' + storageErr);
                }
                print('CloudManager: [RESET] Full cloud reset complete (vehicles + profile + images)');
                if (this.onShowMessage)
                    this.onShowMessage((0, Localization_1.t)('profile_collection_reset'));
            }
            catch (e) {
                print('CloudManager: [RESET] Exception: ' + e);
            }
        }
        // =====================================================================
        // IMAGE STORAGE
        // =====================================================================
        async uploadCardImage(serial, base64Image) {
            if (!this.isReady() || !base64Image || base64Image.length === 0)
                return '';
            try {
                const imageBytes = Base64.decode(base64Image);
                const path = this.userId + '/' + serial + '.jpg';
                const { data, error } = await this.client.storage
                    .from(this.STORAGE_BUCKET)
                    .upload(path, imageBytes, {
                    contentType: 'image/jpeg',
                    upsert: true
                });
                if (error) {
                    print('CloudManager: Image upload error: ' + JSON.stringify(error));
                    return '';
                }
                const { data: urlData } = this.client.storage
                    .from(this.STORAGE_BUCKET)
                    .getPublicUrl(path);
                const publicUrl = urlData?.publicUrl || '';
                print('CloudManager: Image uploaded — ' + serial + ' → ' + (publicUrl ? publicUrl.substring(0, 80) + '...' : 'NO URL'));
                if (publicUrl) {
                    const { error: updateErr } = await this.client
                        .from(this.TABLE_VEHICLES)
                        .update({ image_url: publicUrl })
                        .eq('user_id', this.userId)
                        .eq('serial', serial);
                    if (updateErr) {
                        print('CloudManager: [WARN] Failed to set image_url in vehicles table: ' + JSON.stringify(updateErr));
                        print('CloudManager: [WARN] This is likely a missing UPDATE RLS policy on vehicles table');
                    }
                }
                return publicUrl;
            }
            catch (e) {
                print('CloudManager: Image upload exception: ' + e);
                return '';
            }
        }
        async downloadCardImage(imageUrl) {
            if (!imageUrl || imageUrl.length === 0)
                return null;
            return new Promise((resolve) => {
                try {
                    const request = RemoteServiceHttpRequest.create();
                    request.url = imageUrl;
                    this.internetModule.performHttpRequest(request, (response) => {
                        if (response.statusCode < 200 || response.statusCode >= 400) {
                            resolve(null);
                            return;
                        }
                        try {
                            const resource = response.asResource();
                            if (!resource) {
                                resolve(null);
                                return;
                            }
                            this.remoteMediaModule.loadResourceAsImageTexture(resource, (tex) => resolve(tex), () => resolve(null));
                        }
                        catch (e) {
                            resolve(null);
                        }
                    });
                }
                catch (e) {
                    resolve(null);
                }
            });
        }
        // =====================================================================
        // BITMOJI AVATAR
        // =====================================================================
        /**
         * Fetches the user's Bitmoji 2D image on-device, uploads it to Supabase Storage,
         * and caches the public URL. Returns the public URL or '' on failure.
         * Only works on-device (not in Lens Studio editor).
         */
        async fetchAndUploadBitmoji() {
            if (!this.isReady()) {
                print('CloudManager: [BITMOJI] Not ready, skipping');
                return '';
            }
            if (this.cachedAvatarUrl.length > 0) {
                print('CloudManager: [BITMOJI] Using cached avatar URL');
                return this.cachedAvatarUrl;
            }
            if (global.deviceInfoSystem.isEditor()) {
                print('CloudManager: [BITMOJI] Running in editor, Bitmoji 2D not available');
                return '';
            }
            try {
                const user = await this.getBitmojiUser();
                if (!user) {
                    print('CloudManager: [BITMOJI] Could not get current user');
                    return '';
                }
                const resource = await this.getBitmoji2DResource(user);
                if (!resource) {
                    print('CloudManager: [BITMOJI] Could not get Bitmoji 2D resource');
                    return '';
                }
                const bytes = await this.downloadBitmojiBytes(resource);
                if (!bytes || bytes.length === 0) {
                    print('CloudManager: [BITMOJI] Could not download Bitmoji bytes');
                    return '';
                }
                print('CloudManager: [BITMOJI] Got ' + bytes.length + ' bytes ('
                    + Math.round(bytes.length / 1024) + ' KB)');
                const path = this.userId + '/avatar.png';
                const { data, error } = await this.client.storage
                    .from(this.STORAGE_BUCKET)
                    .upload(path, bytes, {
                    contentType: 'image/png',
                    upsert: true,
                });
                if (error) {
                    print('CloudManager: [BITMOJI] Upload error: ' + JSON.stringify(error));
                    return '';
                }
                const { data: urlData } = this.client.storage
                    .from(this.STORAGE_BUCKET)
                    .getPublicUrl(path);
                const publicUrl = urlData?.publicUrl || '';
                if (publicUrl) {
                    this.cachedAvatarUrl = publicUrl;
                    print('CloudManager: [BITMOJI] Avatar uploaded → ' + publicUrl.substring(0, 80) + '...');
                }
                return publicUrl;
            }
            catch (e) {
                print('CloudManager: [BITMOJI] Exception: ' + e);
                return '';
            }
        }
        /** Returns the cached avatar URL (empty string if not yet fetched). */
        getAvatarUrl() {
            return this.cachedAvatarUrl;
        }
        getBitmojiUser() {
            return new Promise((resolve) => {
                try {
                    global.userContextSystem.getCurrentUser((user) => {
                        resolve(user);
                    });
                }
                catch (e) {
                    print('CloudManager: [BITMOJI] getCurrentUser error: ' + e);
                    resolve(null);
                }
            });
        }
        getBitmoji2DResource(user) {
            return new Promise((resolve) => {
                try {
                    const options = Bitmoji2DOptions.create();
                    options.user = user;
                    this.bitmojiModule.requestBitmoji2DResource(options, (resource) => {
                        resolve(resource);
                    });
                }
                catch (e) {
                    print('CloudManager: [BITMOJI] requestBitmoji2DResource error: ' + e);
                    resolve(null);
                }
            });
        }
        downloadBitmojiBytes(resource) {
            return new Promise((resolve) => {
                try {
                    this.remoteMediaModule.loadResourceAsBytes(resource, (bytes) => resolve(bytes), (err) => {
                        print('CloudManager: [BITMOJI] loadResourceAsBytes failed: ' + err);
                        resolve(null);
                    });
                }
                catch (e) {
                    print('CloudManager: [BITMOJI] downloadBitmojiBytes error: ' + e);
                    resolve(null);
                }
            });
        }
        // =====================================================================
        // UTILITY
        // =====================================================================
        delay(seconds) {
            return new Promise((resolve) => {
                const event = this.createEvent('DelayedCallbackEvent');
                event.bind(() => resolve());
                event.reset(seconds);
            });
        }
    };
    __setFunctionName(_classThis, "CloudManager");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        CloudManager = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return CloudManager = _classThis;
})();
exports.CloudManager = CloudManager;
//# sourceMappingURL=CloudManager.js.map