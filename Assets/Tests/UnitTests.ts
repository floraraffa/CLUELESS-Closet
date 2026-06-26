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

import {
    clampStat, getRarityLabel, getRarityStars, formatRarityText,
    generateSerial, getLevelForXP, getXPForNextLevel,
    getStreakMultiplier, formatPrestigeStars, formatCarType,
    formatScanDate, createDefaultProfile,
    LEVEL_TABLE, XP_PER_RARITY,
    normalizeScanContext,
    getTrustRank, getTrustPenalty, TRUST_DEFAULT, TRUST_SCAN_REWARD,
} from '../ClosetTypes';

@component
export class UnitTests extends BaseScriptComponent {

    @input
    @hint('Enable to run all unit tests on startup. Disable in production.')
    runTests: boolean = false;

    private passed: number = 0;
    private failed: number = 0;
    private total: number = 0;

    onAwake(): void {
        if (!this.runTests) return;

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
            this.testNormalizeScanContext();
            this.testSerialBatchUniqueness();
            this.testFormatScanDateEdgeCases();
            this.testTrustSystem();
            this.testJsonCollectionRoundTrip();

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

    private assert(condition: boolean, testName: string): void {
        this.total++;
        if (condition) {
            this.passed++;
            print('  PASS: ' + testName);
        } else {
            this.failed++;
            print('  FAIL: ' + testName);
        }
    }

    private assertEqual(actual: any, expected: any, testName: string): void {
        this.assert(actual === expected, testName + ' (got ' + actual + ', expected ' + expected + ')');
    }

    // =====================================================================
    // TEST SUITES
    // =====================================================================

    private testClampStat(): void {
        print('--- clampStat ---');
        this.assertEqual(clampStat(0), 1, 'clamp 0 → 1');
        this.assertEqual(clampStat(1), 1, 'clamp 1 → 1');
        this.assertEqual(clampStat(3), 3, 'clamp 3 → 3');
        this.assertEqual(clampStat(5), 5, 'clamp 5 → 5');
        this.assertEqual(clampStat(6), 5, 'clamp 6 → 5');
        this.assertEqual(clampStat(-1), 1, 'clamp -1 → 1');
        this.assertEqual(clampStat(NaN), 1, 'clamp NaN → 1');
        this.assertEqual(clampStat(undefined as any), 1, 'clamp undefined → 1');
        this.assertEqual(clampStat(2.7), 3, 'clamp 2.7 → 3 (rounded)');
    }

    private testGetRarityLabel(): void {
        print('--- getRarityLabel ---');
        this.assertEqual(getRarityLabel(1), 'Rust Bucket', 'rarity 1');
        this.assertEqual(getRarityLabel(2), 'Common', 'rarity 2');
        this.assertEqual(getRarityLabel(3), 'Uncommon', 'rarity 3');
        this.assertEqual(getRarityLabel(4), 'Rare', 'rarity 4');
        this.assertEqual(getRarityLabel(5), 'Legendary', 'rarity 5');
        // Edge: out-of-range falls back
        const label0 = getRarityLabel(0);
        this.assert(label0.length > 0, 'rarity 0 has a label');
    }

    private testGetRarityStars(): void {
        print('--- getRarityStars ---');
        const s1 = getRarityStars(1);
        const s5 = getRarityStars(5);
        this.assert(s1.length === 5, 'rarity 1 stars length = 5');
        this.assert(s5.length === 5, 'rarity 5 stars length = 5');
        this.assert(s1 !== s5, 'rarity 1 != rarity 5 stars');
    }

    private testFormatRarityText(): void {
        print('--- formatRarityText ---');
        const text = formatRarityText(3, 'Uncommon');
        this.assert(text.includes('Uncommon'), 'contains label');
        this.assert(text.length > 8, 'has stars + label');
    }

    private testGenerateSerial(): void {
        print('--- generateSerial ---');
        const s1 = generateSerial();
        const s2 = generateSerial();
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

    private testGetLevelForXP(): void {
        print('--- getLevelForXP ---');
        this.assertEqual(getLevelForXP(0).level, 1, 'XP 0 → level 1');
        this.assertEqual(getLevelForXP(49).level, 1, 'XP 49 → level 1');
        this.assertEqual(getLevelForXP(50).level, 2, 'XP 50 → level 2');
        this.assertEqual(getLevelForXP(200).level, 3, 'XP 200 → level 3');
        this.assertEqual(getLevelForXP(999).level, 4, 'XP 999 → level 4');
        this.assertEqual(getLevelForXP(1000).level, 5, 'XP 1000 → level 5');
        this.assertEqual(getLevelForXP(99999).level, 10, 'XP 99999 → level 10');

        // Name check
        this.assertEqual(getLevelForXP(0).name, 'Learner Driver', 'level 1 name');
    }

    private testGetXPForNextLevel(): void {
        print('--- getXPForNextLevel ---');
        this.assertEqual(getXPForNextLevel(1), 50, 'level 1 → next at 50');
        this.assertEqual(getXPForNextLevel(2), 200, 'level 2 → next at 200');
        this.assertEqual(getXPForNextLevel(10), -1, 'level 10 → -1 (max)');
    }

    private testGetStreakMultiplier(): void {
        print('--- getStreakMultiplier ---');
        this.assertEqual(getStreakMultiplier(0), 1.0, 'streak 0 → 1.0x');
        this.assertEqual(getStreakMultiplier(1), 1.0, 'streak 1 → 1.0x');
        this.assertEqual(getStreakMultiplier(2), 1.2, 'streak 2 → 1.2x');
        this.assertEqual(getStreakMultiplier(3), 1.5, 'streak 3 → 1.5x');
        this.assertEqual(getStreakMultiplier(10), 1.5, 'streak 10 → 1.5x');
    }

    private testFormatPrestigeStars(): void {
        print('--- formatPrestigeStars ---');
        this.assertEqual(formatPrestigeStars(0), '', 'prestige 0 → empty');
        this.assert(formatPrestigeStars(1).length > 0, 'prestige 1 → has stars');
        this.assert(formatPrestigeStars(3).length > formatPrestigeStars(1).length, 'prestige 3 > prestige 1');
    }

    private testFormatCarType(): void {
        print('--- formatCarType ---');
        this.assertEqual(formatCarType('sedan'), 'Sedan', 'sedan');
        this.assertEqual(formatCarType('sports'), 'Sports Car', 'sports');
        this.assertEqual(formatCarType('suv'), 'SUV', 'suv');
        this.assertEqual(formatCarType('truck'), 'Truck', 'truck');
        this.assertEqual(formatCarType('convertible'), 'Convertible', 'convertible');
        // Unknown type returns capitalized
        const unknown = formatCarType('spaceship');
        this.assert(unknown.length > 0, 'unknown type has fallback');
    }

    private testFormatScanDate(): void {
        print('--- formatScanDate ---');
        // Feb 19, 2026 at 12:00:00 UTC
        const ts = 1771502400000;
        const formatted = formatScanDate(ts);
        this.assert(formatted.length > 5, 'formatted date has length');
        this.assert(formatted.includes('2026'), 'contains year');
    }

    private testCreateDefaultProfile(): void {
        print('--- createDefaultProfile ---');
        const p = createDefaultProfile();
        this.assertEqual(p.level, 1, 'default level = 1');
        this.assertEqual(p.totalXP, 0, 'default XP = 0');
        this.assertEqual(p.prestige, 0, 'default prestige = 0');
        this.assertEqual(p.streakDays, 0, 'default streak = 0');
        this.assertEqual(p.totalScans, 0, 'default scans = 0');
        this.assertEqual(p.totalTrades, 0, 'default trades = 0');
    }

    private testLevelTable(): void {
        print('--- LEVEL_TABLE ---');
        this.assertEqual(LEVEL_TABLE.length, 10, 'table has 10 levels');
        this.assertEqual(LEVEL_TABLE[0].level, 1, 'first level = 1');
        this.assertEqual(LEVEL_TABLE[9].level, 10, 'last level = 10');
        this.assertEqual(LEVEL_TABLE[0].xpThreshold, 0, 'level 1 threshold = 0');

        // Thresholds must be strictly increasing
        let increasing = true;
        for (let i = 1; i < LEVEL_TABLE.length; i++) {
            if (LEVEL_TABLE[i].xpThreshold <= LEVEL_TABLE[i - 1].xpThreshold) {
                increasing = false;
                break;
            }
        }
        this.assert(increasing, 'thresholds strictly increasing');
    }

    private testXPPerRarity(): void {
        print('--- XP_PER_RARITY ---');
        this.assertEqual(XP_PER_RARITY[1], 10, 'rarity 1 = 10 XP');
        this.assertEqual(XP_PER_RARITY[2], 20, 'rarity 2 = 20 XP');
        this.assertEqual(XP_PER_RARITY[3], 50, 'rarity 3 = 50 XP');
        this.assertEqual(XP_PER_RARITY[4], 100, 'rarity 4 = 100 XP');
        this.assertEqual(XP_PER_RARITY[5], 250, 'rarity 5 = 250 XP');

        // Higher rarity = more XP
        let xpIncreasing = true;
        for (let r = 2; r <= 5; r++) {
            if (XP_PER_RARITY[r] <= XP_PER_RARITY[r - 1]) {
                xpIncreasing = false;
                break;
            }
        }
        this.assert(xpIncreasing, 'XP per rarity is strictly increasing');
    }

    // =====================================================================
    // REGRESSION: PERSISTENCE & SCAN FLOW
    // =====================================================================

    private testNormalizeScanContext(): void {
        print('--- normalizeScanContext ---');
        this.assertEqual(normalizeScanContext('worn'), 'worn', 'worn is valid');
        this.assertEqual(normalizeScanContext('flat_lay'), 'flat_lay', 'flat_lay is valid');
        this.assertEqual(normalizeScanContext('hanger'), 'hanger', 'hanger is valid');
        this.assertEqual(normalizeScanContext('rack'), 'rack', 'rack is valid');
        this.assertEqual(normalizeScanContext('mannequin'), 'mannequin', 'mannequin is valid');
        this.assertEqual(normalizeScanContext('garbage'), 'unknown', 'unknown on invalid');
        this.assertEqual(normalizeScanContext(null), 'unknown', 'unknown on null');
        this.assertEqual(normalizeScanContext(undefined), 'unknown', 'unknown on undefined');
        this.assertEqual(normalizeScanContext(''), 'unknown', 'unknown on empty string');
    }

    private testSerialBatchUniqueness(): void {
        print('--- serial batch uniqueness ---');
        const N = 50;
        const seen: { [k: string]: boolean } = {};
        let allUnique = true;
        for (let i = 0; i < N; i++) {
            const s = generateSerial();
            if (seen[s]) { allUnique = false; break; }
            seen[s] = true;
        }
        this.assert(allUnique, 'no duplicate among ' + N + ' serials');
    }

    private testFormatScanDateEdgeCases(): void {
        print('--- formatScanDate edge cases ---');
        const zero = formatScanDate(0);
        this.assert(zero.length > 0, 'epoch 0 does not crash');
        const huge = formatScanDate(9999999999999);
        this.assert(huge.length > 0, 'far-future date does not crash');
        const d1 = formatScanDate(1700000000000);
        const d2 = formatScanDate(1800000000000);
        this.assert(d1 !== d2, 'different timestamps → different dates');
    }

    private testTrustSystem(): void {
        print('--- trust system ---');
        this.assertEqual(typeof TRUST_DEFAULT, 'number', 'TRUST_DEFAULT is a number');
        this.assert(TRUST_DEFAULT > 0 && TRUST_DEFAULT <= 100, 'TRUST_DEFAULT in range');
        this.assert(TRUST_SCAN_REWARD > 0, 'scan reward is positive');
        const r100 = getTrustRank(100);
        const r0 = getTrustRank(0);
        this.assert(r100.name.length > 0, 'rank at 100 has name');
        this.assert(r0.name.length > 0, 'rank at 0 has name');
        this.assert(r100.name !== r0.name, 'max != min rank name');
        this.assert(getTrustPenalty(0) > 0, 'penalty > 0 for first cheat');
        this.assert(getTrustPenalty(5) > getTrustPenalty(0), 'penalty escalates');
    }

    private testJsonCollectionRoundTrip(): void {
        print('--- JSON collection round-trip ---');
        const card = {
            serial: generateSerial(),
            brand_model: 'Test Item',
            item_name: 'Test Item',
            savedAt: 1700000000000,
            imageGenerated: false,
            rarity: 2,
            dateScanned: formatScanDate(1700000000000),
            scan_context: normalizeScanContext('worn'),
        };
        const json = JSON.stringify([card]);
        const parsed = JSON.parse(json);
        this.assert(Array.isArray(parsed), 'parsed is array');
        this.assertEqual(parsed.length, 1, 'one item after round-trip');
        this.assertEqual(parsed[0].serial, card.serial, 'serial survives round-trip');
        this.assertEqual(parsed[0].savedAt, card.savedAt, 'savedAt survives round-trip');
        this.assertEqual(parsed[0].rarity, 2, 'rarity survives round-trip');
        this.assertEqual(parsed[0].imageGenerated, false, 'imageGenerated survives round-trip');
    }
}
