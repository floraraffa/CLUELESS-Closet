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
exports.AnalyticsManager = void 0;
var __selfType = requireType("./AnalyticsManager");
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
 * AnalyticsManager.ts — Lightweight analytics for DGNS Vehicle Scanner
 *
 * Tracks session metrics, timing data, and error logs without blocking the main flow.
 * Persists cumulative stats locally and optionally syncs to cloud.
 *
 * @author DGNS
 * @license MIT
 */
let AnalyticsManager = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var AnalyticsManager = _classThis = class extends _classSuper {
        constructor() {
            super();
            // =====================================================================
            // SESSION COUNTERS (reset each launch)
            // =====================================================================
            this.scansThisSession = 0;
            this.savesThisSession = 0;
            this.tradesThisSession = 0;
            this.errorsThisSession = 0;
            this.antiCheatBlocksThisSession = 0;
            // =====================================================================
            // TIMING
            // =====================================================================
            this.scanTimings = [];
            this.imageGenTimings = [];
            // =====================================================================
            // ERROR LOG (circular buffer, last N errors)
            // =====================================================================
            this.MAX_ERROR_LOG = 20;
            this.errorLog = [];
            // =====================================================================
            // CUMULATIVE STATS (persisted across sessions)
            // =====================================================================
            this.STORAGE_KEY = 'dgns_analytics';
            this.cumulativeStats = {
                totalSessions: 0,
                totalScans: 0,
                totalSaves: 0,
                totalTrades: 0,
                totalErrors: 0,
                totalAntiCheatBlocks: 0,
                firstSessionDate: '',
                lastSessionDate: '',
            };
            // =====================================================================
            // CALLBACKS
            // =====================================================================
            /** Optional: sync analytics snapshot to cloud. */
            this.onSyncToCloud = null;
        }
        __initialize() {
            super.__initialize();
            // =====================================================================
            // SESSION COUNTERS (reset each launch)
            // =====================================================================
            this.scansThisSession = 0;
            this.savesThisSession = 0;
            this.tradesThisSession = 0;
            this.errorsThisSession = 0;
            this.antiCheatBlocksThisSession = 0;
            // =====================================================================
            // TIMING
            // =====================================================================
            this.scanTimings = [];
            this.imageGenTimings = [];
            // =====================================================================
            // ERROR LOG (circular buffer, last N errors)
            // =====================================================================
            this.MAX_ERROR_LOG = 20;
            this.errorLog = [];
            // =====================================================================
            // CUMULATIVE STATS (persisted across sessions)
            // =====================================================================
            this.STORAGE_KEY = 'dgns_analytics';
            this.cumulativeStats = {
                totalSessions: 0,
                totalScans: 0,
                totalSaves: 0,
                totalTrades: 0,
                totalErrors: 0,
                totalAntiCheatBlocks: 0,
                firstSessionDate: '',
                lastSessionDate: '',
            };
            // =====================================================================
            // CALLBACKS
            // =====================================================================
            /** Optional: sync analytics snapshot to cloud. */
            this.onSyncToCloud = null;
        }
        // =====================================================================
        // LIFECYCLE
        // =====================================================================
        onAwake() {
            this.loadStats();
            this.cumulativeStats.totalSessions++;
            const today = new Date().toISOString().split('T')[0];
            if (!this.cumulativeStats.firstSessionDate) {
                this.cumulativeStats.firstSessionDate = today;
            }
            this.cumulativeStats.lastSessionDate = today;
            this.saveStats();
            print('AnalyticsManager: Session #' + this.cumulativeStats.totalSessions + ' started');
        }
        // =====================================================================
        // PUBLIC API — Called by other modules
        // =====================================================================
        /** Log a generic event. */
        logEvent(category, action, label) {
            print('Analytics: [' + category + '] ' + action + (label ? ' — ' + label : ''));
        }
        /** Record a completed scan with timing. */
        logScan(durationMs, success) {
            this.scansThisSession++;
            this.cumulativeStats.totalScans++;
            if (success) {
                this.scanTimings.push(durationMs);
            }
            this.saveStats();
        }
        /** Record a completed save with image generation timing. */
        logSave(imageGenDurationMs) {
            this.savesThisSession++;
            this.cumulativeStats.totalSaves++;
            this.imageGenTimings.push(imageGenDurationMs);
            this.saveStats();
        }
        /** Record a completed trade. */
        logTrade(type, method) {
            this.tradesThisSession++;
            this.cumulativeStats.totalTrades++;
            this.saveStats();
            this.logEvent('trade', type, method);
        }
        /** Record an anti-cheat block. */
        logAntiCheatBlock() {
            this.antiCheatBlocksThisSession++;
            this.cumulativeStats.totalAntiCheatBlocks++;
            this.saveStats();
            this.logEvent('anti_cheat', 'blocked', 'screen_or_photo');
        }
        /** Record an error. */
        logError(category, message) {
            this.errorsThisSession++;
            this.cumulativeStats.totalErrors++;
            this.errorLog.push({ timestamp: Date.now(), category, message: message.substring(0, 200) });
            if (this.errorLog.length > this.MAX_ERROR_LOG) {
                this.errorLog.shift();
            }
            this.saveStats();
            print('Analytics: [ERROR] [' + category + '] ' + message);
        }
        // =====================================================================
        // GETTERS — Session stats
        // =====================================================================
        getSessionStats() {
            return {
                scans: this.scansThisSession,
                saves: this.savesThisSession,
                trades: this.tradesThisSession,
                errors: this.errorsThisSession,
                antiCheatBlocks: this.antiCheatBlocksThisSession,
                avgScanMs: this.average(this.scanTimings),
                avgImageGenMs: this.average(this.imageGenTimings),
            };
        }
        getCumulativeStats() {
            return { ...this.cumulativeStats };
        }
        getRecentErrors() {
            return [...this.errorLog];
        }
        /** Returns a JSON snapshot of all analytics for cloud sync. */
        getSnapshot() {
            return JSON.stringify({
                session: this.getSessionStats(),
                cumulative: this.cumulativeStats,
                recentErrors: this.errorLog,
            });
        }
        // =====================================================================
        // PERSISTENCE
        // =====================================================================
        saveStats() {
            try {
                const store = global.persistentStorageSystem.store;
                store.putString(this.STORAGE_KEY, JSON.stringify(this.cumulativeStats));
            }
            catch (e) { /* silent */ }
        }
        loadStats() {
            try {
                const store = global.persistentStorageSystem.store;
                const json = store.getString(this.STORAGE_KEY);
                if (json && json.length > 2) {
                    const loaded = JSON.parse(json);
                    Object.assign(this.cumulativeStats, loaded);
                    print('AnalyticsManager: Loaded cumulative stats — '
                        + this.cumulativeStats.totalSessions + ' sessions, '
                        + this.cumulativeStats.totalScans + ' scans');
                }
            }
            catch (e) {
                print('AnalyticsManager: Error loading stats: ' + e);
            }
        }
        // =====================================================================
        // UTILS
        // =====================================================================
        average(arr) {
            if (arr.length === 0)
                return 0;
            let sum = 0;
            for (let i = 0; i < arr.length; i++)
                sum += arr[i];
            return Math.round(sum / arr.length);
        }
    };
    __setFunctionName(_classThis, "AnalyticsManager");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        AnalyticsManager = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return AnalyticsManager = _classThis;
})();
exports.AnalyticsManager = AnalyticsManager;
//# sourceMappingURL=AnalyticsManager.js.map