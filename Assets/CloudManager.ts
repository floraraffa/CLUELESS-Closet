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

import { createClient } from 'SupabaseClient.lspkg/supabase-snapcloud';
import { SnapCloudRequirements } from 'SnapCloudExamples.lspkg/SnapCloudRequirements';
import {
    SavedVehicleData, UserProfile, normalizeScanContext,
} from './ClosetTypes';
import { t, tf } from './Localization';

// =====================================================================
// CLOUD INTERFACES
// =====================================================================

export interface CloudUserProfile {
    user_id: string;
    display_name: string;
    level: number;
    total_xp: number;
    prestige: number;
    streak_days: number;
    total_scans: number;
    total_trades: number;
    trust_score: number;
    consecutive_cheats: number;
    total_cheats: number;
    cards_given: number;
    cards_received: number;
    last_login: string;
    created_at?: string;
    updated_at?: string;
}

export interface CloudVehicle {
    id?: number;
    user_id: string;
    serial: string;
    brand: string;
    brand_model: string;
    type: string;
    year: string;
    collection?: string;
    collection_year?: string;
    quality?: string;
    scan_context?: string;
    mode?: string;
    item_name?: string;
    category?: string;
    subcategory?: string;
    color?: string;
    material?: string;
    pattern?: string;
    fit?: string;
    condition?: string;
    confidence?: number;
    style_tags?: string[];
    occasion_tags?: string[];
    season_tags?: string[];
    items?: any[];
    look_summary?: string;
    suggested_pairings?: string[];
    pairing_note?: string;
    feedback?: string;
    ai_note?: string;
    user_note?: string;
    rarity: number;
    rarity_label: string;
    top_speed: number;
    acceleration: number;
    braking: number;
    traction: number;
    comfort: number;
    scene: string;
    city_scanned: string;
    date_scanned: string;
    image_url: string;
    saved_at: number;
    favorite?: boolean;
    created_at?: string;
}

/**
 * A saved outfit combination: which garments were combined and the
 * match percentage the lens computed when the user rated the look.
 */
export interface CloudOutfit {
    id?: number;
    user_id: string;
    serial_key: string;       // Sorted item serials joined with '+' (dedupe key)
    name: string;
    item_serials: string[];
    item_names: string[];
    match_percent: number;
    ai_feedback?: string;
    occasion?: string;
    season?: string;
    favorite?: boolean;
    created_at?: string;
    updated_at?: string;
}

// =====================================================================
// COMPONENT
// =====================================================================

@component
export class CloudManager extends BaseScriptComponent {

    // =====================================================================
    // INPUTS
    // =====================================================================
    @input
    @hint('SnapCloudRequirements script reference (holds SupabaseProject config)')
    @allowUndefined
    snapCloudRequirements: SnapCloudRequirements;

    // =====================================================================
    // CALLBACKS — Set by orchestrator
    // =====================================================================
    onAuthenticated: ((userId: string) => void) | null = null;
    onAuthFailed: ((error: string) => void) | null = null;
    onProfileSynced: ((profile: CloudUserProfile) => void) | null = null;
    onCollectionSynced: ((count: number) => void) | null = null;
    onShowMessage: ((text: string) => void) | null = null;
    /** Fired with this user's web pairing code (existing or newly created). */
    onPairingCode: ((code: string) => void) | null = null;
    /** Fired with the user's Bitmoji as a Texture (device only). */
    onBitmojiTexture: ((tex: Texture) => void) | null = null;
    /** Returns the local display name to store on the user's own cloud profile. */
    onGetUsername: (() => string) | null = null;

    // =====================================================================
    // CONSTANTS
    // =====================================================================
    private readonly STORAGE_BUCKET = 'closet-images';
    private readonly TABLE_PROFILES = 'user_profiles';
    private readonly TABLE_VEHICLES = 'closet_items';
    private readonly TABLE_OUTFITS = 'outfits';

    // =====================================================================
    // INTERNAL STATE
    // =====================================================================
    private client: any = null;
    private userId: string = '';
    private isAuthenticated: boolean = false;
    private isInitializing: boolean = false;
    private internetModule: InternetModule = require('LensStudio:InternetModule');
    private remoteMediaModule: RemoteMediaModule = require('LensStudio:RemoteMediaModule');
    private bitmojiModule: BitmojiModule = require('LensStudio:BitmojiModule');
    private cachedAvatarUrl: string = '';

    // =====================================================================
    // LIFECYCLE
    // =====================================================================
    onAwake(): void {
        this.createEvent('OnStartEvent').bind(() => {
            this.initialize();
        });
    }

    onDestroy(): void {
        if (this.client) {
            try { this.client.removeAllChannels(); } catch (e) { /* ignore */ }
        }
    }

    // =====================================================================
    // INITIALIZATION
    // =====================================================================

    private async initialize(): Promise<void> {
        if (this.isInitializing) return;
        this.isInitializing = true;

        if (!this.snapCloudRequirements || !this.snapCloudRequirements.isConfigured()) {
            print('CloudManager: SnapCloudRequirements not configured — cloud features disabled');
            this.isInitializing = false;
            return;
        }

        try {
            const supabaseProject = this.snapCloudRequirements.getSupabaseProject();
            this.client = createClient(supabaseProject.url, supabaseProject.publicToken, {
                realtime: { heartbeatIntervalMs: 2500 }
            });

            print('CloudManager: Supabase client created — authenticating...');
            await this.authenticate();
        } catch (e) {
            print('CloudManager: Init error: ' + e);
            this.isInitializing = false;
        }
    }

    // =====================================================================
    // AUTHENTICATION
    // =====================================================================

    private async authenticate(retryCount: number = 0): Promise<void> {
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
                if (this.onAuthFailed) this.onAuthFailed(JSON.stringify(error));
                return;
            }

            if (data?.user?.id) {
                this.userId = data.user.id;
                this.isAuthenticated = true;
                print('CloudManager: Authenticated — uid=' + this.userId.substring(0, 8) + '...');
                this.onAuthSuccess();
            }
        } catch (e) {
            if (retryCount < maxRetries) {
                print('CloudManager: Auth exception, retry ' + (retryCount + 1) + ': ' + e);
                await this.delay(1.0);
                return this.authenticate(retryCount + 1);
            }
            print('CloudManager: Auth exception final: ' + e);
            if (this.onAuthFailed) this.onAuthFailed(String(e));
        } finally {
            this.isInitializing = false;
        }
    }

    private onAuthSuccess(): void {
        if (this.onAuthenticated) this.onAuthenticated(this.userId);
        this.fetchAndUploadBitmoji().catch(() => {});
        this.ensureWebPairingCode().catch(() => {});
    }

    // =====================================================================
    // WEB PAIRING CODE — Personal code so this user can open the web closet
    // =====================================================================

    /**
     * Ensures this lens user has a personal web pairing code in web_tokens.
     * Created once per user; on later sessions the existing code is reused.
     * The code is printed to the log and announced once on creation so the
     * user can link the web (closetclub.netlify.app) to their own closet.
     */
    async ensureWebPairingCode(): Promise<string> {
        if (!this.isReady()) return '';

        try {
            const { data } = await this.client
                .from('web_tokens')
                .select('token')
                .eq('user_id', this.userId)
                .limit(1);

            if (data && data.length > 0) {
                print('CloudManager: [WEB] Pairing code ready — ' + data[0].token);
                if (this.onPairingCode) this.onPairingCode(data[0].token);
                return data[0].token;
            }

            const code = this.generatePairingCode();
            const { error } = await this.client
                .from('web_tokens')
                .insert({ token: code, user_id: this.userId, label: 'lens auto' });

            if (error) {
                print('CloudManager: [WEB] Pairing code insert error: ' + JSON.stringify(error));
                return '';
            }

            print('CloudManager: [WEB] Pairing code created — ' + code);
            if (this.onPairingCode) this.onPairingCode(code);
            if (this.onShowMessage) {
                this.onShowMessage('closetclub.netlify.app · ' + code);
            }
            return code;
        } catch (e) {
            print('CloudManager: [WEB] Pairing code exception: ' + e);
            return '';
        }
    }

    /** Readable personal code, e.g. "CLUB-K4T7-9XM2" (no 0/O/1/I). */
    private generatePairingCode(): string {
        const ALPHABET = 'ABCDEFGHJKMNPQRSTUVWXYZ23456789';
        let block1 = '';
        let block2 = '';
        for (let i = 0; i < 4; i++) {
            block1 += ALPHABET.charAt(Math.floor(Math.random() * ALPHABET.length));
            block2 += ALPHABET.charAt(Math.floor(Math.random() * ALPHABET.length));
        }
        return 'CLUB-' + block1 + '-' + block2;
    }

    // =====================================================================
    // PUBLIC API — Status
    // =====================================================================

    isReady(): boolean {
        return this.isAuthenticated && this.client !== null;
    }

    getUserId(): string {
        return this.userId;
    }

    /**
     * Tries to re-authenticate (e.g. after session expiry). Use when isReady() is false
     * but the user is trying to share or sync. Returns true if authenticated after the attempt.
     */
    async tryReconnect(): Promise<boolean> {
        if (!this.client) {
            print('CloudManager: tryReconnect — no client, cannot reconnect');
            return false;
        }
        print('CloudManager: tryReconnect — attempting to re-authenticate...');
        this.isInitializing = false;
        await this.authenticate(0);
        if (this.isAuthenticated) {
            print('CloudManager: tryReconnect — success, uid=' + this.userId.substring(0, 8) + '...');
        } else {
            print('CloudManager: tryReconnect — failed, still not authenticated');
        }
        return this.isAuthenticated;
    }

    // =====================================================================
    // PROFILE SYNC
    // =====================================================================

    async syncProfile(localProfile: UserProfile, totalScans: number, totalTrades: number): Promise<CloudUserProfile | null> {
        if (!this.isReady()) return null;

        try {
            const username = this.onGetUsername ? this.onGetUsername() : '';
            const profileData: any = {
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

            // Editor preview uses a simulated user ("Preview 1") — never let it
            // overwrite the real Snapchat display name written by the device.
            try {
                if (global.deviceInfoSystem.isEditor()) delete profileData.display_name;
            } catch (e) { /* ignore */ }

            const { data, error } = await this.client
                .from(this.TABLE_PROFILES)
                .upsert(profileData, { onConflict: 'user_id' })
                .select();

            if (error) {
                print('CloudManager: Profile sync error: ' + JSON.stringify(error));
                return null;
            }

            const result = data && data.length > 0 ? data[0] as CloudUserProfile : null;
            print('CloudManager: Profile synced — Style ' + localProfile.level
                + ' | XP ' + localProfile.totalXP
                + ' | Prestige ' + localProfile.prestige);
            if (this.onProfileSynced && result) this.onProfileSynced(result);
            return result;
        } catch (e) {
            print('CloudManager: Profile sync exception: ' + e);
            return null;
        }
    }

    async fetchCloudProfile(): Promise<CloudUserProfile | null> {
        if (!this.isReady()) return null;

        try {
            const { data, error } = await this.client
                .from(this.TABLE_PROFILES)
                .select('*')
                .eq('user_id', this.userId)
                .limit(1);

            if (error || !data || data.length === 0) return null;
            return data[0] as CloudUserProfile;
        } catch (e) {
            print('CloudManager: Fetch profile exception: ' + e);
            return null;
        }
    }

    // =====================================================================
    // COLLECTION SYNC
    // =====================================================================

    async syncVehicle(vehicle: SavedVehicleData): Promise<boolean> {
        if (!this.isReady()) return false;

        try {
            const vehicleData: any = {
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
            } else {
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
        } catch (e) {
            print('CloudManager: Closet item sync exception: ' + e);
            return false;
        }
    }

    private shouldRetryWithoutOptionalClosetColumns(error: any): boolean {
        const text = JSON.stringify(error || {});
        return text.indexOf('ai_note') >= 0 || text.indexOf('user_note') >= 0;
    }

    private removeOptionalClosetColumns(row: any): any {
        const fallback = { ...row };
        delete fallback.ai_note;
        delete fallback.user_note;
        return fallback;
    }

    async syncFullCollection(vehicles: SavedVehicleData[]): Promise<number> {
        if (!this.isReady() || vehicles.length === 0) return 0;

        try {
            // Sync vehicles one by one to preserve existing image_url values
            let synced = 0;
            for (let i = 0; i < vehicles.length; i++) {
                const ok = await this.syncVehicle(vehicles[i]);
                if (ok) synced++;
            }
            print('CloudManager: Full collection sync OK — ' + synced + '/' + vehicles.length + ' vehicles');
            if (this.onCollectionSynced) this.onCollectionSynced(synced);
            return synced;
        } catch (e) {
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
    async mergeCollections(localVehicles: SavedVehicleData[]): Promise<SavedVehicleData[]> {
        if (!this.isReady()) return localVehicles;

        const cloudVehicles = await this.fetchCloudCollection();
        if (cloudVehicles.length === 0 && localVehicles.length === 0) return localVehicles;

        const localBySerial = new Map<string, SavedVehicleData>();
        for (const v of localVehicles) {
            localBySerial.set(v.serial, v);
        }

        const merged: SavedVehicleData[] = [...localVehicles];
        const toSyncToCloud: SavedVehicleData[] = [];

        for (const cv of cloudVehicles) {
            const localV = localBySerial.get(cv.serial);
            if (!localV) {
                // Cloud-only → add locally
                const imported: SavedVehicleData = {
                    vehicle_found: true,
                    clothing_found: true,
                    mode: (cv.mode as any) || 'single_item',
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
                    scan_context: normalizeScanContext(cv.scan_context),
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

    async fetchCloudCollection(): Promise<CloudVehicle[]> {
        if (!this.isReady()) return [];

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
            return (data || []) as CloudVehicle[];
        } catch (e) {
            print('CloudManager: Fetch collection exception: ' + e);
            return [];
        }
    }

    async deleteCloudVehicle(serial: string): Promise<boolean> {
        if (!this.isReady()) return false;

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
        } catch (e) {
            print('CloudManager: Delete vehicle exception: ' + e);
            return false;
        }
    }

    async resetCloudCollection(): Promise<void> {
        if (!this.isReady()) return;

        try {
            // 1. Delete all vehicles
            const { error: vehicleError } = await this.client
                .from(this.TABLE_VEHICLES)
                .delete()
                .eq('user_id', this.userId);

            if (vehicleError) {
                print('CloudManager: [RESET] Vehicles delete FAILED: ' + JSON.stringify(vehicleError));
            } else {
                print('CloudManager: [RESET] All vehicles deleted from cloud');
            }

            // 2. Delete user profile (AFTER vehicles due to FK constraint)
            const { error: profileError } = await this.client
                .from(this.TABLE_PROFILES)
                .delete()
                .eq('user_id', this.userId);

            if (profileError) {
                print('CloudManager: [RESET] Profile delete FAILED: ' + JSON.stringify(profileError));
            } else {
                print('CloudManager: [RESET] User profile deleted from cloud');
            }

            // 3. Clean up card images from storage bucket (best-effort)
            try {
                const { data: files } = await this.client.storage
                    .from(this.STORAGE_BUCKET)
                    .list(this.userId + '/');

                if (files && files.length > 0) {
                    const paths = files.map((f: any) => this.userId + '/' + f.name);
                    const { error: removeError } = await this.client.storage
                        .from(this.STORAGE_BUCKET)
                        .remove(paths);

                    if (removeError) {
                        print('CloudManager: [RESET] Storage cleanup error: ' + JSON.stringify(removeError));
                    } else {
                        print('CloudManager: [RESET] ' + files.length + ' card images removed from storage');
                    }
                }
            } catch (storageErr) {
                print('CloudManager: [RESET] Storage cleanup skipped: ' + storageErr);
            }

            print('CloudManager: [RESET] Full cloud reset complete (vehicles + profile + images)');
            if (this.onShowMessage) this.onShowMessage(t('profile_collection_reset'));
        } catch (e) {
            print('CloudManager: [RESET] Exception: ' + e);
        }
    }

    // =====================================================================
    // OUTFIT SYNC — Saved combinations with match percentage
    // =====================================================================

    /**
     * Saves an outfit combination to the cloud with its match percentage.
     * The same set of garments (regardless of slot order) upserts into one
     * row, so re-rating a look updates its match % instead of duplicating.
     */
    async syncOutfit(items: SavedVehicleData[], matchPercent: number, aiFeedback: string = ''): Promise<boolean> {
        if (!this.isReady() || !items || items.length < 2) return false;

        try {
            const withSerial = items.filter(i => i && typeof i.serial === 'string' && i.serial.length > 0);
            if (withSerial.length < 2) {
                print('CloudManager: Outfit sync skipped — items missing serials');
                return false;
            }

            const serials = withSerial.map(i => i.serial).sort();
            const names = withSerial.map(i => i.item_name || i.brand_model || 'Item');
            const outfitData: any = {
                user_id: this.userId,
                serial_key: serials.join('+'),
                name: names.slice(0, 3).join(' + '),
                item_serials: serials,
                item_names: names,
                match_percent: Math.round(Math.max(0, Math.min(100, matchPercent))),
                updated_at: new Date().toISOString(),
            };
            // La nota de la IA solo se escribe cuando existe: el guardado
            // rápido (al colocar prendas) nunca borra una nota ya guardada.
            if (aiFeedback && aiFeedback.length > 0) {
                outfitData.ai_feedback = aiFeedback;
            }

            const { error } = await this.client
                .from(this.TABLE_OUTFITS)
                .upsert(outfitData, { onConflict: 'user_id,serial_key' });

            if (error) {
                print('CloudManager: Outfit sync error: ' + JSON.stringify(error));
                return false;
            }

            print('CloudManager: Outfit synced — ' + outfitData.name + ' (' + outfitData.match_percent + '%)');
            return true;
        } catch (e) {
            print('CloudManager: Outfit sync exception: ' + e);
            return false;
        }
    }

    /** Updates the favorite flag of one garment in the cloud. */
    async setFavorite(serial: string, favorite: boolean): Promise<boolean> {
        if (!this.isReady() || !serial) return false;
        try {
            const { error } = await this.client
                .from(this.TABLE_VEHICLES)
                .update({ favorite: favorite })
                .eq('user_id', this.userId)
                .eq('serial', serial);
            if (error) {
                print('CloudManager: [FAV] Update error: ' + JSON.stringify(error));
                return false;
            }
            print('CloudManager: [FAV] ' + serial + ' -> ' + (favorite ? 'favorite' : 'not favorite'));
            return true;
        } catch (e) {
            print('CloudManager: [FAV] Exception: ' + e);
            return false;
        }
    }

    /** Restore requests queued from the web ("Enviar al lente"). */
    async fetchRestoreRequests(): Promise<string[]> {
        if (!this.isReady()) return [];
        try {
            const { data, error } = await this.client
                .from('restore_requests')
                .select('serial')
                .eq('user_id', this.userId);
            if (error) {
                print('CloudManager: [RESTORE] Fetch error: ' + JSON.stringify(error));
                return [];
            }
            return (data || []).map((r: any) => r.serial as string);
        } catch (e) {
            print('CloudManager: [RESTORE] Exception: ' + e);
            return [];
        }
    }

    async clearRestoreRequests(serials: string[]): Promise<void> {
        if (!this.isReady() || !serials || serials.length === 0) return;
        try {
            await this.client
                .from('restore_requests')
                .delete()
                .eq('user_id', this.userId)
                .in('serial', serials);
        } catch (e) {
            print('CloudManager: [RESTORE] Clear exception: ' + e);
        }
    }

    /** Serials deleted on the WEB — the lens must purge them locally. */
    async fetchWebDeletedSerials(): Promise<string[]> {
        if (!this.isReady()) return [];
        try {
            const { data, error } = await this.client
                .from('deleted_serials')
                .select('serial')
                .eq('user_id', this.userId);
            if (error) {
                print('CloudManager: [WEB] Tombstones fetch error: ' + JSON.stringify(error));
                return [];
            }
            return (data || []).map((r: any) => r.serial as string);
        } catch (e) {
            print('CloudManager: [WEB] Tombstones exception: ' + e);
            return [];
        }
    }

    async fetchOutfits(): Promise<CloudOutfit[]> {
        if (!this.isReady()) return [];

        try {
            const { data, error } = await this.client
                .from(this.TABLE_OUTFITS)
                .select('*')
                .eq('user_id', this.userId)
                .order('match_percent', { ascending: false });

            if (error) {
                print('CloudManager: Fetch outfits error: ' + JSON.stringify(error));
                return [];
            }
            return (data || []) as CloudOutfit[];
        } catch (e) {
            print('CloudManager: Fetch outfits exception: ' + e);
            return [];
        }
    }

    // =====================================================================
    // IMAGE STORAGE
    // =====================================================================

    async uploadCardImage(serial: string, base64Image: string): Promise<string> {
        if (!this.isReady() || !base64Image || base64Image.length === 0) return '';

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
        } catch (e) {
            print('CloudManager: Image upload exception: ' + e);
            return '';
        }
    }

    async downloadCardImage(imageUrl: string): Promise<Texture | null> {
        if (!imageUrl || imageUrl.length === 0) return null;

        return new Promise<Texture | null>((resolve) => {
            try {
                const request = RemoteServiceHttpRequest.create();
                request.url = imageUrl;
                this.internetModule.performHttpRequest(request, (response: RemoteServiceHttpResponse) => {
                    if (response.statusCode < 200 || response.statusCode >= 400) {
                        resolve(null);
                        return;
                    }
                    try {
                        const resource = response.asResource();
                        if (!resource) { resolve(null); return; }
                        this.remoteMediaModule.loadResourceAsImageTexture(resource,
                            (tex: Texture) => resolve(tex),
                            () => resolve(null)
                        );
                    } catch (e) { resolve(null); }
                });
            } catch (e) { resolve(null); }
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
    async fetchAndUploadBitmoji(): Promise<string> {
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

            // Entrega el Bitmoji como textura para la card de perfil
            try {
                this.remoteMediaModule.loadResourceAsImageTexture(resource,
                    (tex: Texture) => { if (this.onBitmojiTexture) this.onBitmojiTexture(tex); },
                    () => { /* avatar optional */ });
            } catch (e) { /* ignore */ }

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
        } catch (e) {
            print('CloudManager: [BITMOJI] Exception: ' + e);
            return '';
        }
    }

    /** Returns the cached avatar URL (empty string if not yet fetched). */
    getAvatarUrl(): string {
        return this.cachedAvatarUrl;
    }

    private getBitmojiUser(): Promise<any> {
        return new Promise((resolve) => {
            try {
                global.userContextSystem.getCurrentUser((user: any) => {
                    resolve(user);
                });
            } catch (e) {
                print('CloudManager: [BITMOJI] getCurrentUser error: ' + e);
                resolve(null);
            }
        });
    }

    private getBitmoji2DResource(user: any): Promise<any> {
        return new Promise((resolve) => {
            try {
                const options = Bitmoji2DOptions.create();
                options.user = user;
                this.bitmojiModule.requestBitmoji2DResource(options, (resource: any) => {
                    resolve(resource);
                });
            } catch (e) {
                print('CloudManager: [BITMOJI] requestBitmoji2DResource error: ' + e);
                resolve(null);
            }
        });
    }

    private downloadBitmojiBytes(resource: any): Promise<Uint8Array | null> {
        return new Promise((resolve) => {
            try {
                this.remoteMediaModule.loadResourceAsBytes(
                    resource,
                    (bytes: Uint8Array) => resolve(bytes),
                    (err: string) => {
                        print('CloudManager: [BITMOJI] loadResourceAsBytes failed: ' + err);
                        resolve(null);
                    }
                );
            } catch (e) {
                print('CloudManager: [BITMOJI] downloadBitmojiBytes error: ' + e);
                resolve(null);
            }
        });
    }

    // =====================================================================
    // UTILITY
    // =====================================================================

    private delay(seconds: number): Promise<void> {
        return new Promise<void>((resolve) => {
            const event = this.createEvent('DelayedCallbackEvent') as any;
            event.bind(() => resolve());
            event.reset(seconds);
        });
    }
}

