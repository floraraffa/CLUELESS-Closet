/**
 * ClosetTypes.ts — Data layer for DGNS Vehicle Scanner
 *
 * Contains shared interfaces, type definitions, and pure utility functions
 * used across all modules. The @component class is a no-op placeholder
 * required by Lens Studio (all .ts files must have one).
 *
 * @author DGNS
 * @license MIT
 */

@component
export class ClosetTypes extends BaseScriptComponent {
    // No-op component — required by Lens Studio.
    // This file only provides exported interfaces and utility functions.
}

export type ScanContext = 'worn' | 'flat_lay' | 'hanger' | 'rack' | 'mannequin' | 'unknown';

export function normalizeScanContext(value?: string | null): ScanContext {
    if (value === 'worn' || value === 'flat_lay' || value === 'hanger' ||
        value === 'rack' || value === 'mannequin') {
        return value;
    }
    return 'unknown';
}

// =====================================================================
// INTERFACES
// =====================================================================

/**
 * One garment inside a full-look (worn outfit) scan. In full_look mode the
 * scanner returns one rich LookItem per worn garment, so each can become its
 * own collector card without an extra analysis call.
 */
export interface LookItem {
    item_name: string;        // Display name, e.g. "White cotton t-shirt"
    brand?: string;
    category: string;         // top, bottom, shoes, outerwear, accessory, dress
    subcategory?: string;
    color?: string;
    material?: string;
    pattern?: string;
    fit?: string;
    condition?: string;
    style_tags?: string[];
    occasion_tags?: string[];
    season_tags?: string[];
    suggested_pairings?: string[];
    feedback?: string;
    confidence?: number;
    top_speed?: number;       // Condition meter 1-5
    acceleration?: number;    // Versatility meter 1-5
    braking?: number;         // Matchability meter 1-5
    traction?: number;        // Uniqueness meter 1-5
    comfort?: number;         // Trend score meter 1-5
    rarity?: number;          // Closet value 1-5
    rarity_label?: string;
}

/**
 * Clothing or outfit identification data returned by OpenAI Vision.
 * Some legacy vehicle field names are kept so existing Lens Studio scene
 * bindings continue to work during the first Closet Club port.
 */
export interface VehicleData {
    vehicle_found?: boolean;
    clothing_found?: boolean;
    mode?: 'single_item' | 'full_look';
    scan_context?: ScanContext;
    brand?: string;
    brand_model: string;      // Display name, e.g. "Black oversized blazer"
    item_name?: string;
    type: string;             // Category, e.g. "outerwear", "top", "look"
    category?: string;
    subcategory?: string;
    year?: string;
    collection?: string;
    collection_year?: string;
    quality?: string;
    color?: string;
    material?: string;
    pattern?: string;
    fit?: string;
    condition?: string;
    style_tags?: string[];
    occasion_tags?: string[];
    season_tags?: string[];
    items?: LookItem[];
    look_summary?: string;
    suggested_pairings?: string[];
    pairing_note?: string;
    feedback?: string;
    ai_note?: string;
    user_note?: string;
    confidence?: number;
    top_speed: number;       // Condition meter
    acceleration: number;    // Versatility meter
    braking: number;         // Matchability meter
    traction: number;        // Uniqueness meter
    comfort: number;         // Trend score meter
    rarity: number;          // Closet value 1-5
    rarity_label: string;    // e.g. "Basic", "Signature"
    scene?: string;          // Brief context visible around the scan
    rejection_reason?: string;
}

/**
 * Extended vehicle data for saved collection items.
 * Includes metadata for persistence, image state, and unique serial.
 */
export interface SavedVehicleData extends VehicleData {
    savedAt: number;           // Unix timestamp when saved
    imageGenerated: boolean;   // Whether a card/scan image is stored for this item
    serial: string;            // Unique card serial e.g. "CLUE-7F3A-B2C1-49E8"
    dateScanned: string;       // Formatted scan date e.g. "Feb 15, 2026"
    cityScanned: string;       // City where the vehicle was scanned (from device location)
    favorite?: boolean;        // Marked as favorite (synced with the web)
}

// =====================================================================
// USER PROFILE — XP, Levels, Prestige
// =====================================================================

/**
 * User profile data persisted locally.
 * Tracks level progression, XP, prestige resets, and daily login streak.
 */
export interface UserProfile {
    level: number;            // 1-50
    totalXP: number;          // Cumulative XP across all levels (resets on prestige)
    prestige: number;         // Number of prestige resets (stars)
    lastLoginDate: string;    // ISO date "YYYY-MM-DD" of last session
    streakDays: number;       // Consecutive daily login count
    totalScans: number;       // Lifetime scan count
    totalTrades: number;      // Lifetime trade count
    trustScore: number;       // 0-100 anti-cheat reputation (default 80)
    consecutiveCheats: number; // Current cheat streak counter
    totalCheats: number;      // Lifetime cheat attempt count
    cardsGiven: number;       // Lifetime cards given via trade
    cardsReceived: number;    // Lifetime cards received via trade
}

/**
 * Level definition: name, cumulative XP threshold, and display label.
 */
export interface LevelDef {
    level: number;
    name: string;
    xpThreshold: number;      // Cumulative XP needed to reach this level
}

/** Style level definitions for the Closet Club profile. */
export const LEVEL_TABLE: LevelDef[] = [
    { level: 1,  name: 'Style Starter',       xpThreshold: 0 },
    { level: 2,  name: 'Closet Curious',      xpThreshold: 50 },
    { level: 3,  name: 'Outfit Explorer',     xpThreshold: 200 },
    { level: 4,  name: 'Trend Spotter',       xpThreshold: 500 },
    { level: 5,  name: 'Look Builder',        xpThreshold: 1000 },
    { level: 6,  name: 'Wardrobe Curator',    xpThreshold: 1800 },
    { level: 7,  name: 'Color Matcher',       xpThreshold: 3000 },
    { level: 8,  name: 'Layering Pro',        xpThreshold: 4800 },
    { level: 9,  name: 'Closet Stylist',      xpThreshold: 7300 },
    { level: 10, name: 'Fashion Insider',     xpThreshold: 10800 },
    { level: 11, name: 'Capsule Creator',     xpThreshold: 13000 },
    { level: 12, name: 'Street Style Scout',  xpThreshold: 15500 },
    { level: 13, name: 'Texture Mixer',       xpThreshold: 18500 },
    { level: 14, name: 'Accessory Ace',       xpThreshold: 22000 },
    { level: 15, name: 'Fit Polisher',        xpThreshold: 26000 },
    { level: 16, name: 'Palette Pro',         xpThreshold: 30500 },
    { level: 17, name: 'Look Architect',      xpThreshold: 35500 },
    { level: 18, name: 'Trend Editor',        xpThreshold: 41000 },
    { level: 19, name: 'Wardrobe Muse',       xpThreshold: 47000 },
    { level: 20, name: 'Style Strategist',    xpThreshold: 54000 },
    { level: 21, name: 'Statement Maker',     xpThreshold: 61500 },
    { level: 22, name: 'Closet Connoisseur',  xpThreshold: 69500 },
    { level: 23, name: 'Runway Reader',       xpThreshold: 78000 },
    { level: 24, name: 'Editorial Eye',       xpThreshold: 87000 },
    { level: 25, name: 'Outfit Director',     xpThreshold: 97000 },
    { level: 26, name: 'Silhouette Specialist', xpThreshold: 108000 },
    { level: 27, name: 'Color Storyteller',   xpThreshold: 120000 },
    { level: 28, name: 'Layering Expert',     xpThreshold: 133000 },
    { level: 29, name: 'Personal Stylist',    xpThreshold: 147000 },
    { level: 30, name: 'Fashion Curator',     xpThreshold: 162000 },
    { level: 31, name: 'Style Maven',         xpThreshold: 178000 },
    { level: 32, name: 'Wardrobe Visionary',  xpThreshold: 195000 },
    { level: 33, name: 'Trend Forecaster',    xpThreshold: 213000 },
    { level: 34, name: 'Look Mentor',         xpThreshold: 232000 },
    { level: 35, name: 'Fashion Tastemaker',  xpThreshold: 252000 },
    { level: 36, name: 'Capsule Master',      xpThreshold: 274000 },
    { level: 37, name: 'Closet Creative',     xpThreshold: 297000 },
    { level: 38, name: 'Style Authority',     xpThreshold: 322000 },
    { level: 39, name: 'Outfit Alchemist',    xpThreshold: 348000 },
    { level: 40, name: 'Fashion Visionary',   xpThreshold: 376000 },
    { level: 41, name: 'Wardrobe Icon',       xpThreshold: 406000 },
    { level: 42, name: 'Runway Strategist',   xpThreshold: 438000 },
    { level: 43, name: 'Signature Stylist',   xpThreshold: 472000 },
    { level: 44, name: 'Trend Oracle',        xpThreshold: 508000 },
    { level: 45, name: 'Couture Curator',     xpThreshold: 546000 },
    { level: 46, name: 'Style Luminary',      xpThreshold: 586000 },
    { level: 47, name: 'Fashion Virtuoso',    xpThreshold: 628000 },
    { level: 48, name: 'Closet Legend',       xpThreshold: 672000 },
    { level: 49, name: 'Style Star',          xpThreshold: 720000 },
    { level: 50, name: 'Fashion Icon',        xpThreshold: 770000 },
];

/** XP awarded per vehicle rarity (1-5). */
export const XP_PER_RARITY: { [key: number]: number } = {
    1: 10,    // Rust Bucket
    2: 20,    // Common
    3: 50,    // Uncommon
    4: 100,   // Rare
    5: 250,   // Legendary
};

/** Streak multiplier by consecutive days. */
export function getStreakMultiplier(streakDays: number): number {
    if (streakDays <= 1) return 1.0;
    if (streakDays === 2) return 1.2;
    return 1.5;  // 3+ days
}

/** Returns the LevelDef for a given cumulative XP total. */
export function getLevelForXP(totalXP: number): LevelDef {
    let result = LEVEL_TABLE[0];
    for (let i = 0; i < LEVEL_TABLE.length; i++) {
        if (totalXP >= LEVEL_TABLE[i].xpThreshold) {
            result = LEVEL_TABLE[i];
        } else {
            break;
        }
    }
    return result;
}

/** Returns XP needed for the NEXT level, or -1 if already max. */
export function getXPForNextLevel(currentLevel: number): number {
    if (currentLevel >= LEVEL_TABLE.length) return -1;
    const nextIdx = currentLevel; // LEVEL_TABLE[0] = level 1, so LEVEL_TABLE[currentLevel] = next level
    if (nextIdx >= LEVEL_TABLE.length) return -1;
    return LEVEL_TABLE[nextIdx].xpThreshold;
}

/** Returns a default empty UserProfile. */
export function createDefaultProfile(): UserProfile {
    return {
        level: 1,
        totalXP: 0,
        prestige: 0,
        lastLoginDate: '',
        streakDays: 0,
        totalScans: 0,
        totalTrades: 0,
        trustScore: TRUST_DEFAULT,
        consecutiveCheats: 0,
        totalCheats: 0,
        cardsGiven: 0,
        cardsReceived: 0,
    };
}

/** Formats prestige stars: e.g. prestige=3 -> "⭐⭐⭐" */
export function formatPrestigeStars(prestige: number): string {
    if (prestige <= 0) return '';
    let stars = '';
    for (let i = 0; i < prestige; i++) {
        stars += '\u2B50';  // ⭐
    }
    return stars;
}

// =====================================================================
// TRUST SCORE — Anti-cheat reputation system
// =====================================================================

export interface TrustRankDef {
    minScore: number;
    name: string;
}

export const TRUST_RANKS: TrustRankDef[] = [
    { minScore: 95, name: 'Style Icon' },
    { minScore: 85, name: 'Trusted Stylist' },
    { minScore: 70, name: 'Closet Lover' },
    { minScore: 55, name: 'Style Explorer' },
    { minScore: 40, name: 'Needs Review' },
    { minScore: 25, name: 'Scan Rookie' },
    { minScore: 10, name: 'Closet Newcomer' },
    { minScore: 0,  name: 'Unverified Stylist' },
];

export const TRUST_DEFAULT: number = 80;

export function getTrustRank(score: number): TrustRankDef {
    const clamped = Math.max(0, Math.min(100, Math.round(score)));
    for (let i = 0; i < TRUST_RANKS.length; i++) {
        if (clamped >= TRUST_RANKS[i].minScore) return TRUST_RANKS[i];
    }
    return TRUST_RANKS[TRUST_RANKS.length - 1];
}

/**
 * Penalty for a cheat attempt. Escalates with consecutive cheats.
 * First offense: -3, then -5, -8, -12, -17... (accelerating).
 */
export function getTrustPenalty(consecutiveCheats: number): number {
    const base = 3;
    const escalation = Math.min(consecutiveCheats, 10);
    return base + escalation * 2;
}

/** Reward for a legitimate successful scan: +2 (steady recovery). */
export const TRUST_SCAN_REWARD: number = 2;

/**
 * Returns a hex color string interpolated between red (0%) and green (100%).
 * Format: "rrggbb" (no # prefix — Lens Studio richtext uses <color=...>).
 */
export function getTrustColor(score: number): string {
    const t = Math.max(0, Math.min(100, score)) / 100;
    const r = Math.round(255 * (1 - t));
    const g = Math.round(255 * t);
    const rHex = r.toString(16).padStart(2, '0');
    const gHex = g.toString(16).padStart(2, '0');
    return rHex + gHex + '00';
}

export function formatTrustText(score: number): string {
    return 'Fashion Trust: ' + Math.round(Math.max(0, Math.min(100, score))) + '%';
}

// =====================================================================
// STAT UTILITIES
// =====================================================================

/** Clamps a stat value to the 1-5 integer range. Defaults to 1 if invalid. */
export function clampStat(value: number): number {
    if (!value || typeof value !== 'number') {
        return 1;
    }
    return Math.max(1, Math.min(5, Math.round(value)));
}

// =====================================================================
// RARITY UTILITIES
// =====================================================================

/** Returns the rarity label for a score (1-5). */
export function getRarityLabel(rarity: number): string {
    switch (rarity) {
        case 1: return 'Basic';
        case 2: return 'Everyday';
        case 3: return 'Versatile';
        case 4: return 'Statement';
        case 5: return 'Signature';
        default: return 'Everyday';
    }
}

/** Returns a star string for the given rarity score. E.g. 3 -> "★★★☆☆" */
export function getRarityStars(rarity: number): string {
    const clamped = Math.max(1, Math.min(5, Math.round(rarity)));
    let stars = '';
    for (let i = 0; i < 5; i++) {
        stars += (i < clamped) ? '★' : '☆';
    }
    return stars;
}

/** Formats rarity as "★★★★☆ Rare" */
export function formatRarityText(rarity: number, label: string): string {
    return getRarityStars(rarity) + ' ' + label;
}

// =====================================================================
// CLOTHING CATEGORY FORMATTING
// =====================================================================

/** Formats a clothing category code into a display-friendly string. */
export function formatCarType(type: string): string {
    const typeMap: { [key: string]: string } = {
        top: 'Top',
        bottom: 'Bottom',
        shoes: 'Shoes',
        outerwear: 'Outerwear',
        accessory: 'Accessory',
        dress: 'Dress',
        look: 'Full Look',
        unknown: 'Unknown',
    };
    return typeMap[(type || '').toLowerCase()] || type || 'Unknown';
}

// =====================================================================
// SCAN CONTEXT — Date & City capture at scan time
// =====================================================================

/** Formats a timestamp into a readable date string: "Feb 15, 2026" */
export function formatScanDate(timestamp: number): string {
    try {
        const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        const d = new Date(timestamp);
        const month = d.getMonth();
        const day = d.getDate();
        const year = d.getFullYear();
        if (isNaN(month) || isNaN(day) || isNaN(year)) {
            print('ClosetTypes: Date parsing failed for timestamp ' + timestamp);
            return timestamp.toString();
        }
        return months[month] + ' ' + day + ', ' + year;
    } catch (e) {
        print('ClosetTypes: formatScanDate error: ' + e);
        return timestamp.toString();
    }
}

// =====================================================================
// SERIAL GENERATION
// =====================================================================

/**
 * Generates a unique closet card serial in format: CLUE-XXXX-XXXX-XXXX
 * Uses a combination of timestamp-derived hex and random hex to guarantee
 * uniqueness even across future connected lens / multiplayer sessions.
 *
 * Anatomy:
 *   CLUE — Fixed prefix (brand identifier)
 *   Block 1 — 4 hex chars derived from timestamp (low bits)
 *   Block 2 — 4 hex chars random
 *   Block 3 — 4 hex chars random
 *
 * Collision probability: ~1 in 4 billion per timestamp millisecond.
 */
export function generateSerial(): string {
    const HEX = '0123456789ABCDEF';

    // Block 1: timestamp-derived (last 16 bits of ms timestamp in hex)
    const ts = Date.now();
    const tsHex = ((ts & 0xFFFF) >>> 0).toString(16).toUpperCase().padStart(4, '0');

    // Block 2 & 3: random hex
    let block2 = '';
    let block3 = '';
    for (let i = 0; i < 4; i++) {
        block2 += HEX.charAt(Math.floor(Math.random() * 16));
        block3 += HEX.charAt(Math.floor(Math.random() * 16));
    }

    return 'CLUE-' + tsHex + '-' + block2 + '-' + block3;
}

// =====================================================================
// SCENE OBJECT HELPERS
// =====================================================================

/** Recursively searches for a child SceneObject by name. */
export function findChildByName(parent: SceneObject, name: string): SceneObject | null {
    const childCount = parent.getChildrenCount();
    for (let i = 0; i < childCount; i++) {
        const child = parent.getChild(i);
        if (!child) continue;
        if (child.name === name) return child;
        const found = findChildByName(child, name);
        if (found) return found;
    }
    return null;
}

/** Recursively enables all descendants of a SceneObject. */
export function enableAllDescendants(parent: SceneObject): void {
    const count = parent.getChildrenCount();
    for (let i = 0; i < count; i++) {
        const child = parent.getChild(i);
        if (child) {
            child.enabled = true;
            enableAllDescendants(child);
        }
    }
}
