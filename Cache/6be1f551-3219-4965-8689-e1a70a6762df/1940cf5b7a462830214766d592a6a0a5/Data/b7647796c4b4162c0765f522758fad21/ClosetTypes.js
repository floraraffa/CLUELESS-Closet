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
exports.TRUST_SCAN_REWARD = exports.TRUST_DEFAULT = exports.TRUST_RANKS = exports.XP_PER_RARITY = exports.LEVEL_TABLE = exports.ClosetTypes = void 0;
exports.normalizeScanContext = normalizeScanContext;
exports.getStreakMultiplier = getStreakMultiplier;
exports.getLevelForXP = getLevelForXP;
exports.getXPForNextLevel = getXPForNextLevel;
exports.createDefaultProfile = createDefaultProfile;
exports.formatPrestigeStars = formatPrestigeStars;
exports.getTrustRank = getTrustRank;
exports.getTrustPenalty = getTrustPenalty;
exports.getTrustColor = getTrustColor;
exports.formatTrustText = formatTrustText;
exports.clampStat = clampStat;
exports.getRarityLabel = getRarityLabel;
exports.getRarityStars = getRarityStars;
exports.formatRarityText = formatRarityText;
exports.formatCarType = formatCarType;
exports.formatScanDate = formatScanDate;
exports.generateSerial = generateSerial;
exports.findChildByName = findChildByName;
exports.enableAllDescendants = enableAllDescendants;
var __selfType = requireType("./ClosetTypes");
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
 * ClosetTypes.ts — Data layer for DGNS Vehicle Scanner
 *
 * Contains shared interfaces, type definitions, and pure utility functions
 * used across all modules. The @component class is a no-op placeholder
 * required by Lens Studio (all .ts files must have one).
 *
 * @author DGNS
 * @license MIT
 */
let ClosetTypes = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var ClosetTypes = _classThis = class extends _classSuper {
        constructor() {
            super();
        }
        __initialize() {
            super.__initialize();
        }
    };
    __setFunctionName(_classThis, "ClosetTypes");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        ClosetTypes = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return ClosetTypes = _classThis;
})();
exports.ClosetTypes = ClosetTypes;
function normalizeScanContext(value) {
    if (value === 'worn' || value === 'flat_lay' || value === 'hanger' ||
        value === 'rack' || value === 'mannequin') {
        return value;
    }
    return 'unknown';
}
/** Style level definitions for the Closet Club profile. */
exports.LEVEL_TABLE = [
    { level: 1, name: 'Style Starter', xpThreshold: 0 },
    { level: 2, name: 'Closet Curious', xpThreshold: 50 },
    { level: 3, name: 'Outfit Explorer', xpThreshold: 200 },
    { level: 4, name: 'Trend Spotter', xpThreshold: 500 },
    { level: 5, name: 'Look Builder', xpThreshold: 1000 },
    { level: 6, name: 'Wardrobe Curator', xpThreshold: 1800 },
    { level: 7, name: 'Color Matcher', xpThreshold: 3000 },
    { level: 8, name: 'Layering Pro', xpThreshold: 4800 },
    { level: 9, name: 'Closet Stylist', xpThreshold: 7300 },
    { level: 10, name: 'Fashion Insider', xpThreshold: 10800 },
    { level: 11, name: 'Capsule Creator', xpThreshold: 13000 },
    { level: 12, name: 'Street Style Scout', xpThreshold: 15500 },
    { level: 13, name: 'Texture Mixer', xpThreshold: 18500 },
    { level: 14, name: 'Accessory Ace', xpThreshold: 22000 },
    { level: 15, name: 'Fit Polisher', xpThreshold: 26000 },
    { level: 16, name: 'Palette Pro', xpThreshold: 30500 },
    { level: 17, name: 'Look Architect', xpThreshold: 35500 },
    { level: 18, name: 'Trend Editor', xpThreshold: 41000 },
    { level: 19, name: 'Wardrobe Muse', xpThreshold: 47000 },
    { level: 20, name: 'Style Strategist', xpThreshold: 54000 },
    { level: 21, name: 'Statement Maker', xpThreshold: 61500 },
    { level: 22, name: 'Closet Connoisseur', xpThreshold: 69500 },
    { level: 23, name: 'Runway Reader', xpThreshold: 78000 },
    { level: 24, name: 'Editorial Eye', xpThreshold: 87000 },
    { level: 25, name: 'Outfit Director', xpThreshold: 97000 },
    { level: 26, name: 'Silhouette Specialist', xpThreshold: 108000 },
    { level: 27, name: 'Color Storyteller', xpThreshold: 120000 },
    { level: 28, name: 'Layering Expert', xpThreshold: 133000 },
    { level: 29, name: 'Personal Stylist', xpThreshold: 147000 },
    { level: 30, name: 'Fashion Curator', xpThreshold: 162000 },
    { level: 31, name: 'Style Maven', xpThreshold: 178000 },
    { level: 32, name: 'Wardrobe Visionary', xpThreshold: 195000 },
    { level: 33, name: 'Trend Forecaster', xpThreshold: 213000 },
    { level: 34, name: 'Look Mentor', xpThreshold: 232000 },
    { level: 35, name: 'Fashion Tastemaker', xpThreshold: 252000 },
    { level: 36, name: 'Capsule Master', xpThreshold: 274000 },
    { level: 37, name: 'Closet Creative', xpThreshold: 297000 },
    { level: 38, name: 'Style Authority', xpThreshold: 322000 },
    { level: 39, name: 'Outfit Alchemist', xpThreshold: 348000 },
    { level: 40, name: 'Fashion Visionary', xpThreshold: 376000 },
    { level: 41, name: 'Wardrobe Icon', xpThreshold: 406000 },
    { level: 42, name: 'Runway Strategist', xpThreshold: 438000 },
    { level: 43, name: 'Signature Stylist', xpThreshold: 472000 },
    { level: 44, name: 'Trend Oracle', xpThreshold: 508000 },
    { level: 45, name: 'Couture Curator', xpThreshold: 546000 },
    { level: 46, name: 'Style Luminary', xpThreshold: 586000 },
    { level: 47, name: 'Fashion Virtuoso', xpThreshold: 628000 },
    { level: 48, name: 'Closet Legend', xpThreshold: 672000 },
    { level: 49, name: 'Style Star', xpThreshold: 720000 },
    { level: 50, name: 'Fashion Icon', xpThreshold: 770000 },
];
/** XP awarded per vehicle rarity (1-5). */
exports.XP_PER_RARITY = {
    1: 10, // Rust Bucket
    2: 20, // Common
    3: 50, // Uncommon
    4: 100, // Rare
    5: 250, // Legendary
};
/** Streak multiplier by consecutive days. */
function getStreakMultiplier(streakDays) {
    if (streakDays <= 1)
        return 1.0;
    if (streakDays === 2)
        return 1.2;
    return 1.5; // 3+ days
}
/** Returns the LevelDef for a given cumulative XP total. */
function getLevelForXP(totalXP) {
    let result = exports.LEVEL_TABLE[0];
    for (let i = 0; i < exports.LEVEL_TABLE.length; i++) {
        if (totalXP >= exports.LEVEL_TABLE[i].xpThreshold) {
            result = exports.LEVEL_TABLE[i];
        }
        else {
            break;
        }
    }
    return result;
}
/** Returns XP needed for the NEXT level, or -1 if already max. */
function getXPForNextLevel(currentLevel) {
    if (currentLevel >= exports.LEVEL_TABLE.length)
        return -1;
    const nextIdx = currentLevel; // LEVEL_TABLE[0] = level 1, so LEVEL_TABLE[currentLevel] = next level
    if (nextIdx >= exports.LEVEL_TABLE.length)
        return -1;
    return exports.LEVEL_TABLE[nextIdx].xpThreshold;
}
/** Returns a default empty UserProfile. */
function createDefaultProfile() {
    return {
        level: 1,
        totalXP: 0,
        prestige: 0,
        lastLoginDate: '',
        streakDays: 0,
        totalScans: 0,
        totalTrades: 0,
        trustScore: exports.TRUST_DEFAULT,
        consecutiveCheats: 0,
        totalCheats: 0,
        cardsGiven: 0,
        cardsReceived: 0,
    };
}
/** Formats prestige stars: e.g. prestige=3 -> "⭐⭐⭐" */
function formatPrestigeStars(prestige) {
    if (prestige <= 0)
        return '';
    let stars = '';
    for (let i = 0; i < prestige; i++) {
        stars += '\u2B50'; // ⭐
    }
    return stars;
}
exports.TRUST_RANKS = [
    { minScore: 95, name: 'Style Icon' },
    { minScore: 85, name: 'Trusted Stylist' },
    { minScore: 70, name: 'Closet Regular' },
    { minScore: 55, name: 'Style Explorer' },
    { minScore: 40, name: 'Needs Review' },
    { minScore: 25, name: 'Scan Rookie' },
    { minScore: 10, name: 'Closet Newcomer' },
    { minScore: 0, name: 'Unverified Stylist' },
];
exports.TRUST_DEFAULT = 80;
function getTrustRank(score) {
    const clamped = Math.max(0, Math.min(100, Math.round(score)));
    for (let i = 0; i < exports.TRUST_RANKS.length; i++) {
        if (clamped >= exports.TRUST_RANKS[i].minScore)
            return exports.TRUST_RANKS[i];
    }
    return exports.TRUST_RANKS[exports.TRUST_RANKS.length - 1];
}
/**
 * Penalty for a cheat attempt. Escalates with consecutive cheats.
 * First offense: -3, then -5, -8, -12, -17... (accelerating).
 */
function getTrustPenalty(consecutiveCheats) {
    const base = 3;
    const escalation = Math.min(consecutiveCheats, 10);
    return base + escalation * 2;
}
/** Reward for a legitimate successful scan: +2 (steady recovery). */
exports.TRUST_SCAN_REWARD = 2;
/**
 * Returns a hex color string interpolated between red (0%) and green (100%).
 * Format: "rrggbb" (no # prefix — Lens Studio richtext uses <color=...>).
 */
function getTrustColor(score) {
    const t = Math.max(0, Math.min(100, score)) / 100;
    const r = Math.round(255 * (1 - t));
    const g = Math.round(255 * t);
    const rHex = r.toString(16).padStart(2, '0');
    const gHex = g.toString(16).padStart(2, '0');
    return rHex + gHex + '00';
}
function formatTrustText(score) {
    return 'Style Score: ' + Math.round(Math.max(0, Math.min(100, score))) + '%';
}
// =====================================================================
// STAT UTILITIES
// =====================================================================
/** Clamps a stat value to the 1-5 integer range. Defaults to 1 if invalid. */
function clampStat(value) {
    if (!value || typeof value !== 'number') {
        return 1;
    }
    return Math.max(1, Math.min(5, Math.round(value)));
}
// =====================================================================
// RARITY UTILITIES
// =====================================================================
/** Returns the rarity label for a score (1-5). */
function getRarityLabel(rarity) {
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
function getRarityStars(rarity) {
    const clamped = Math.max(1, Math.min(5, Math.round(rarity)));
    let stars = '';
    for (let i = 0; i < 5; i++) {
        stars += (i < clamped) ? '★' : '☆';
    }
    return stars;
}
/** Formats rarity as "★★★★☆ Rare" */
function formatRarityText(rarity, label) {
    return getRarityStars(rarity) + ' ' + label;
}
// =====================================================================
// CLOTHING CATEGORY FORMATTING
// =====================================================================
/** Formats a clothing category code into a display-friendly string. */
function formatCarType(type) {
    const typeMap = {
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
function formatScanDate(timestamp) {
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
    }
    catch (e) {
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
function generateSerial() {
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
function findChildByName(parent, name) {
    const childCount = parent.getChildrenCount();
    for (let i = 0; i < childCount; i++) {
        const child = parent.getChild(i);
        if (!child)
            continue;
        if (child.name === name)
            return child;
        const found = findChildByName(child, name);
        if (found)
            return found;
    }
    return null;
}
/** Recursively enables all descendants of a SceneObject. */
function enableAllDescendants(parent) {
    const count = parent.getChildrenCount();
    for (let i = 0; i < count; i++) {
        const child = parent.getChild(i);
        if (child) {
            child.enabled = true;
            enableAllDescendants(child);
        }
    }
}
//# sourceMappingURL=ClosetTypes.js.map