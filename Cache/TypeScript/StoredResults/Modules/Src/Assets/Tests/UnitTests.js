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
exports.UnitTests = void 0;
var __selfType = requireType("./UnitTests");
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
 * UnitTests.ts — Unit test runner for DGNS Vehicle Scanner
 *
 * Validates pure functions from ClosetTypes.ts and related modules.
 * Attach to a SceneObject and set runTests = true in the Inspector to execute.
 * Results are printed to the console log.
 *
 * @author DGNS
 * @license MIT
 */
const ClosetTypes_1 = require("../ClosetTypes");
let UnitTests = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var UnitTests = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.runTests = this.runTests;
            this.passed = 0;
            this.failed = 0;
            this.total = 0;
        }
        __initialize() {
            super.__initialize();
            this.runTests = this.runTests;
            this.passed = 0;
            this.failed = 0;
            this.total = 0;
        }
        onAwake() {
            if (!this.runTests)
                return;
            this.createEvent('OnStartEvent').bind(() => {
                print('');
                print('========================================');
                print('  DGNS Vehicle Scanner — Unit Tests');
                print('========================================');
                print('');
                this.testClampStat();
                this.testGetRarityLabel();
                this.testGetRarityStars();
                this.testFormatRarityText();
                this.testGenerateSerial();
                this.testGetLevelForXP();
                this.testGetXPForNextLevel();
                this.testGetStreakMultiplier();
                this.testFormatPrestigeStars();
                this.testFormatCarType();
                this.testFormatScanDate();
                this.testCreateDefaultProfile();
                this.testLevelTable();
                this.testXPPerRarity();
                print('');
                print('========================================');
                print('  Results: ' + this.passed + '/' + this.total + ' passed'
                    + (this.failed > 0 ? ' (' + this.failed + ' FAILED)' : ' — ALL PASSED'));
                print('========================================');
                print('');
            });
        }
        // =====================================================================
        // ASSERTION HELPERS
        // =====================================================================
        assert(condition, testName) {
            this.total++;
            if (condition) {
                this.passed++;
                print('  PASS: ' + testName);
            }
            else {
                this.failed++;
                print('  FAIL: ' + testName);
            }
        }
        assertEqual(actual, expected, testName) {
            this.assert(actual === expected, testName + ' (got ' + actual + ', expected ' + expected + ')');
        }
        // =====================================================================
        // TEST SUITES
        // =====================================================================
        testClampStat() {
            print('--- clampStat ---');
            this.assertEqual((0, ClosetTypes_1.clampStat)(0), 1, 'clamp 0 → 1');
            this.assertEqual((0, ClosetTypes_1.clampStat)(1), 1, 'clamp 1 → 1');
            this.assertEqual((0, ClosetTypes_1.clampStat)(3), 3, 'clamp 3 → 3');
            this.assertEqual((0, ClosetTypes_1.clampStat)(5), 5, 'clamp 5 → 5');
            this.assertEqual((0, ClosetTypes_1.clampStat)(6), 5, 'clamp 6 → 5');
            this.assertEqual((0, ClosetTypes_1.clampStat)(-1), 1, 'clamp -1 → 1');
            this.assertEqual((0, ClosetTypes_1.clampStat)(NaN), 1, 'clamp NaN → 1');
            this.assertEqual((0, ClosetTypes_1.clampStat)(undefined), 1, 'clamp undefined → 1');
            this.assertEqual((0, ClosetTypes_1.clampStat)(2.7), 3, 'clamp 2.7 → 3 (rounded)');
        }
        testGetRarityLabel() {
            print('--- getRarityLabel ---');
            this.assertEqual((0, ClosetTypes_1.getRarityLabel)(1), 'Rust Bucket', 'rarity 1');
            this.assertEqual((0, ClosetTypes_1.getRarityLabel)(2), 'Common', 'rarity 2');
            this.assertEqual((0, ClosetTypes_1.getRarityLabel)(3), 'Uncommon', 'rarity 3');
            this.assertEqual((0, ClosetTypes_1.getRarityLabel)(4), 'Rare', 'rarity 4');
            this.assertEqual((0, ClosetTypes_1.getRarityLabel)(5), 'Legendary', 'rarity 5');
            // Edge: out-of-range falls back
            const label0 = (0, ClosetTypes_1.getRarityLabel)(0);
            this.assert(label0.length > 0, 'rarity 0 has a label');
        }
        testGetRarityStars() {
            print('--- getRarityStars ---');
            const s1 = (0, ClosetTypes_1.getRarityStars)(1);
            const s5 = (0, ClosetTypes_1.getRarityStars)(5);
            this.assert(s1.length === 5, 'rarity 1 stars length = 5');
            this.assert(s5.length === 5, 'rarity 5 stars length = 5');
            this.assert(s1 !== s5, 'rarity 1 != rarity 5 stars');
        }
        testFormatRarityText() {
            print('--- formatRarityText ---');
            const text = (0, ClosetTypes_1.formatRarityText)(3, 'Uncommon');
            this.assert(text.includes('Uncommon'), 'contains label');
            this.assert(text.length > 8, 'has stars + label');
        }
        testGenerateSerial() {
            print('--- generateSerial ---');
            const s1 = (0, ClosetTypes_1.generateSerial)();
            const s2 = (0, ClosetTypes_1.generateSerial)();
            this.assert(s1.startsWith('DGNS-'), 'starts with DGNS-');
            this.assert(s1.length === 19, 'length = 19 (DGNS-XXXX-XXXX-XXXX)');
            this.assert(s1 !== s2, 'two serials are unique');
            // Format check: DGNS-XXXX-XXXX-XXXX
            const parts = s1.split('-');
            this.assertEqual(parts.length, 4, 'has 4 parts');
            this.assertEqual(parts[0], 'DGNS', 'first part is DGNS');
            this.assertEqual(parts[1].length, 4, 'block 1 = 4 chars');
            this.assertEqual(parts[2].length, 4, 'block 2 = 4 chars');
            this.assertEqual(parts[3].length, 4, 'block 3 = 4 chars');
        }
        testGetLevelForXP() {
            print('--- getLevelForXP ---');
            this.assertEqual((0, ClosetTypes_1.getLevelForXP)(0).level, 1, 'XP 0 → level 1');
            this.assertEqual((0, ClosetTypes_1.getLevelForXP)(49).level, 1, 'XP 49 → level 1');
            this.assertEqual((0, ClosetTypes_1.getLevelForXP)(50).level, 2, 'XP 50 → level 2');
            this.assertEqual((0, ClosetTypes_1.getLevelForXP)(200).level, 3, 'XP 200 → level 3');
            this.assertEqual((0, ClosetTypes_1.getLevelForXP)(999).level, 4, 'XP 999 → level 4');
            this.assertEqual((0, ClosetTypes_1.getLevelForXP)(1000).level, 5, 'XP 1000 → level 5');
            this.assertEqual((0, ClosetTypes_1.getLevelForXP)(99999).level, 10, 'XP 99999 → level 10');
            // Name check
            this.assertEqual((0, ClosetTypes_1.getLevelForXP)(0).name, 'Learner Driver', 'level 1 name');
        }
        testGetXPForNextLevel() {
            print('--- getXPForNextLevel ---');
            this.assertEqual((0, ClosetTypes_1.getXPForNextLevel)(1), 50, 'level 1 → next at 50');
            this.assertEqual((0, ClosetTypes_1.getXPForNextLevel)(2), 200, 'level 2 → next at 200');
            this.assertEqual((0, ClosetTypes_1.getXPForNextLevel)(10), -1, 'level 10 → -1 (max)');
        }
        testGetStreakMultiplier() {
            print('--- getStreakMultiplier ---');
            this.assertEqual((0, ClosetTypes_1.getStreakMultiplier)(0), 1.0, 'streak 0 → 1.0x');
            this.assertEqual((0, ClosetTypes_1.getStreakMultiplier)(1), 1.0, 'streak 1 → 1.0x');
            this.assertEqual((0, ClosetTypes_1.getStreakMultiplier)(2), 1.2, 'streak 2 → 1.2x');
            this.assertEqual((0, ClosetTypes_1.getStreakMultiplier)(3), 1.5, 'streak 3 → 1.5x');
            this.assertEqual((0, ClosetTypes_1.getStreakMultiplier)(10), 1.5, 'streak 10 → 1.5x');
        }
        testFormatPrestigeStars() {
            print('--- formatPrestigeStars ---');
            this.assertEqual((0, ClosetTypes_1.formatPrestigeStars)(0), '', 'prestige 0 → empty');
            this.assert((0, ClosetTypes_1.formatPrestigeStars)(1).length > 0, 'prestige 1 → has stars');
            this.assert((0, ClosetTypes_1.formatPrestigeStars)(3).length > (0, ClosetTypes_1.formatPrestigeStars)(1).length, 'prestige 3 > prestige 1');
        }
        testFormatCarType() {
            print('--- formatCarType ---');
            this.assertEqual((0, ClosetTypes_1.formatCarType)('sedan'), 'Sedan', 'sedan');
            this.assertEqual((0, ClosetTypes_1.formatCarType)('sports'), 'Sports Car', 'sports');
            this.assertEqual((0, ClosetTypes_1.formatCarType)('suv'), 'SUV', 'suv');
            this.assertEqual((0, ClosetTypes_1.formatCarType)('truck'), 'Truck', 'truck');
            this.assertEqual((0, ClosetTypes_1.formatCarType)('convertible'), 'Convertible', 'convertible');
            // Unknown type returns capitalized
            const unknown = (0, ClosetTypes_1.formatCarType)('spaceship');
            this.assert(unknown.length > 0, 'unknown type has fallback');
        }
        testFormatScanDate() {
            print('--- formatScanDate ---');
            // Feb 19, 2026 at 12:00:00 UTC
            const ts = 1771502400000;
            const formatted = (0, ClosetTypes_1.formatScanDate)(ts);
            this.assert(formatted.length > 5, 'formatted date has length');
            this.assert(formatted.includes('2026'), 'contains year');
        }
        testCreateDefaultProfile() {
            print('--- createDefaultProfile ---');
            const p = (0, ClosetTypes_1.createDefaultProfile)();
            this.assertEqual(p.level, 1, 'default level = 1');
            this.assertEqual(p.totalXP, 0, 'default XP = 0');
            this.assertEqual(p.prestige, 0, 'default prestige = 0');
            this.assertEqual(p.streakDays, 0, 'default streak = 0');
            this.assertEqual(p.totalScans, 0, 'default scans = 0');
            this.assertEqual(p.totalTrades, 0, 'default trades = 0');
        }
        testLevelTable() {
            print('--- LEVEL_TABLE ---');
            this.assertEqual(ClosetTypes_1.LEVEL_TABLE.length, 10, 'table has 10 levels');
            this.assertEqual(ClosetTypes_1.LEVEL_TABLE[0].level, 1, 'first level = 1');
            this.assertEqual(ClosetTypes_1.LEVEL_TABLE[9].level, 10, 'last level = 10');
            this.assertEqual(ClosetTypes_1.LEVEL_TABLE[0].xpThreshold, 0, 'level 1 threshold = 0');
            // Thresholds must be strictly increasing
            let increasing = true;
            for (let i = 1; i < ClosetTypes_1.LEVEL_TABLE.length; i++) {
                if (ClosetTypes_1.LEVEL_TABLE[i].xpThreshold <= ClosetTypes_1.LEVEL_TABLE[i - 1].xpThreshold) {
                    increasing = false;
                    break;
                }
            }
            this.assert(increasing, 'thresholds strictly increasing');
        }
        testXPPerRarity() {
            print('--- XP_PER_RARITY ---');
            this.assertEqual(ClosetTypes_1.XP_PER_RARITY[1], 10, 'rarity 1 = 10 XP');
            this.assertEqual(ClosetTypes_1.XP_PER_RARITY[2], 20, 'rarity 2 = 20 XP');
            this.assertEqual(ClosetTypes_1.XP_PER_RARITY[3], 50, 'rarity 3 = 50 XP');
            this.assertEqual(ClosetTypes_1.XP_PER_RARITY[4], 100, 'rarity 4 = 100 XP');
            this.assertEqual(ClosetTypes_1.XP_PER_RARITY[5], 250, 'rarity 5 = 250 XP');
            // Higher rarity = more XP
            let xpIncreasing = true;
            for (let r = 2; r <= 5; r++) {
                if (ClosetTypes_1.XP_PER_RARITY[r] <= ClosetTypes_1.XP_PER_RARITY[r - 1]) {
                    xpIncreasing = false;
                    break;
                }
            }
            this.assert(xpIncreasing, 'XP per rarity is strictly increasing');
        }
    };
    __setFunctionName(_classThis, "UnitTests");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        UnitTests = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return UnitTests = _classThis;
})();
exports.UnitTests = UnitTests;
//# sourceMappingURL=UnitTests.js.map