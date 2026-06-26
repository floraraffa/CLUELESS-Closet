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
exports.LeaderboardCore = exports.DebugMode = exports.ScoreLifetimeOptionsToResetString = exports.ScoreLifetimeOptionsToScoreLifetimeSeconds = void 0;
var __selfType = requireType("./LeaderboardCore");
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
const LeaderboardRelated_1 = require("./Interfaces/LeaderboardRelated");
const CachedEvent_1 = require("./Modules/CachedEvent");
const BitmojiStickerLoader_1 = require("./BitmojiStickerLoader");
const DateUtils_1 = require("./Modules/DateUtils");
const LeaderboardStorageScoresTracker_1 = require("./LeaderboardStorageScoresTracker");
const TokenManager_1 = require("./TokenManager");
const LeaderboardUtils_1 = require("./LeaderboardUtils");
var UsersType = Leaderboard.UsersType;
const LeaderboardConstants_1 = require("./Interfaces/LeaderboardConstants");
var ScoreLifetimeSeconds;
(function (ScoreLifetimeSeconds) {
    ScoreLifetimeSeconds[ScoreLifetimeSeconds["Day"] = 86400] = "Day";
    ScoreLifetimeSeconds[ScoreLifetimeSeconds["Week"] = 604800] = "Week";
    ScoreLifetimeSeconds[ScoreLifetimeSeconds["Month"] = 2592000] = "Month";
    ScoreLifetimeSeconds[ScoreLifetimeSeconds["Year"] = 31104000] = "Year";
})(ScoreLifetimeSeconds || (ScoreLifetimeSeconds = {}));
exports.ScoreLifetimeOptionsToScoreLifetimeSeconds = {
    [LeaderboardRelated_1.ScoreResetIntervalOption.Day]: ScoreLifetimeSeconds.Day,
    [LeaderboardRelated_1.ScoreResetIntervalOption.Week]: ScoreLifetimeSeconds.Week,
    [LeaderboardRelated_1.ScoreResetIntervalOption.Month]: ScoreLifetimeSeconds.Month,
    [LeaderboardRelated_1.ScoreResetIntervalOption.Year]: ScoreLifetimeSeconds.Year,
};
exports.ScoreLifetimeOptionsToResetString = {
    [LeaderboardRelated_1.ScoreResetIntervalOption.Day]: LeaderboardConstants_1.LeaderboardConstants.FullLeaderboard.DAILY_RESET_STRING,
    [LeaderboardRelated_1.ScoreResetIntervalOption.Week]: LeaderboardConstants_1.LeaderboardConstants.FullLeaderboard.WEEKLY_RESET_STRING,
    [LeaderboardRelated_1.ScoreResetIntervalOption.Month]: LeaderboardConstants_1.LeaderboardConstants.FullLeaderboard.MONTHLY_RESET_STRING,
    [LeaderboardRelated_1.ScoreResetIntervalOption.Year]: LeaderboardConstants_1.LeaderboardConstants.FullLeaderboard.YEARLY_RESET_STRING,
};
var DebugMode;
(function (DebugMode) {
    DebugMode[DebugMode["None"] = 0] = "None";
    DebugMode[DebugMode["SubmitScore"] = 1] = "SubmitScore";
    DebugMode[DebugMode["EntriesCount"] = 2] = "EntriesCount";
})(DebugMode || (exports.DebugMode = DebugMode = {}));
let LeaderboardCore = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var LeaderboardCore = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.autoInitialize = this.autoInitialize;
            this.leaderboardName = this.leaderboardName;
            this.userLimit = this.userLimit;
            this.scoreLifetimeOption = this.scoreLifetimeOption;
            this.leaderboardStartDate = this.leaderboardStartDate;
            this.scoreOrdering = this.scoreOrdering;
            this.customStickerId = this.customStickerId;
            this.bitmojiModule = this.bitmojiModule;
            this.remoteMediaModule = this.remoteMediaModule;
            this.leaderboardModule = this.leaderboardModule;
            this.debugMode = this.debugMode;
            this.entriesCount = this.entriesCount;
            this.scoreToSubmit = this.scoreToSubmit;
            this.printDebugStatements = this.printDebugStatements;
            this.printWarningStatements = this.printWarningStatements;
            this.ScoreResetIntervalOption = LeaderboardRelated_1.ScoreResetIntervalOption;
            this.onLeaderboardRecordsUpdated = new CachedEvent_1.CachedEvent();
            this.onScoreSubmittedSuccess = new CachedEvent_1.CachedEvent();
            this.userType = Leaderboard.UsersType.Friends;
            this.useTimer = true;
            this.leaderboard = null;
            this.leaderboardParams = null;
            this.currentUserRecord = null;
            this.allMergedRecords = [];
            this.updateEvent = null;
            this.userBitmojiTexture = null;
            this.tokenManager = new TokenManager_1.TokenManager();
            this.scoresTracker = new LeaderboardStorageScoresTracker_1.LeaderboardStorageScoresTracker();
        }
        __initialize() {
            super.__initialize();
            this.autoInitialize = this.autoInitialize;
            this.leaderboardName = this.leaderboardName;
            this.userLimit = this.userLimit;
            this.scoreLifetimeOption = this.scoreLifetimeOption;
            this.leaderboardStartDate = this.leaderboardStartDate;
            this.scoreOrdering = this.scoreOrdering;
            this.customStickerId = this.customStickerId;
            this.bitmojiModule = this.bitmojiModule;
            this.remoteMediaModule = this.remoteMediaModule;
            this.leaderboardModule = this.leaderboardModule;
            this.debugMode = this.debugMode;
            this.entriesCount = this.entriesCount;
            this.scoreToSubmit = this.scoreToSubmit;
            this.printDebugStatements = this.printDebugStatements;
            this.printWarningStatements = this.printWarningStatements;
            this.ScoreResetIntervalOption = LeaderboardRelated_1.ScoreResetIntervalOption;
            this.onLeaderboardRecordsUpdated = new CachedEvent_1.CachedEvent();
            this.onScoreSubmittedSuccess = new CachedEvent_1.CachedEvent();
            this.userType = Leaderboard.UsersType.Friends;
            this.useTimer = true;
            this.leaderboard = null;
            this.leaderboardParams = null;
            this.currentUserRecord = null;
            this.allMergedRecords = [];
            this.updateEvent = null;
            this.userBitmojiTexture = null;
            this.tokenManager = new TokenManager_1.TokenManager();
            this.scoresTracker = new LeaderboardStorageScoresTracker_1.LeaderboardStorageScoresTracker();
        }
        onAwake() {
            if (!global.deviceInfoSystem.isEditor()) {
                this.debugMode = DebugMode.None;
            }
            this.currentUserPromise = new Promise((resolve, reject) => {
                this.currentUserResolver = resolve;
            });
            this.currentUserBitmojiPromise = new Promise((resolve, reject) => {
                this.currentUserBitmojiResolver = resolve;
            });
            this.getLeaderboardPromise = new Promise((resolve, reject) => {
                this.getLeaderboardResolver = resolve;
                this.getLeaderboardRejecter = reject;
            });
            this.updateEvent = this.createEvent("UpdateEvent");
            this.updateEvent.enabled = false;
            this.updateEvent.bind(() => this.onUpdate());
            this.adjustUserLimit();
            if (this.autoInitialize) {
                this.initializeLeaderboard({
                    name: this.leaderboardName,
                    userType: this.userType,
                    scoreOrdering: this.scoreOrdering,
                    scoreResetInterval: this.scoreLifetimeOption,
                    userLimit: this.userLimit,
                    useTimer: this.useTimer,
                    leaderboardStartDate: this.leaderboardStartDate,
                });
            }
        }
        submitScore(score) {
            this.printDebug("Submitting score " + score);
            if (!isNull(this.leaderboard)) {
                this.leaderboard.submitScore(score, (currentUserRecord) => this.onSubmitScoreSuccess(currentUserRecord), (status) => this.onSubmitScoreFailed(status));
            }
        }
        submitScoreAsync(score) {
            this.printDebug("Submitting score " + score);
            return this.getLeaderboardPromise.then((leaderboard) => {
                return new Promise((resolve, reject) => {
                    leaderboard.submitScore(score, (currentUserRecord) => {
                        this.onSubmitScoreSuccess(currentUserRecord);
                        resolve();
                    }, (status) => {
                        this.onSubmitScoreFailed(status);
                        reject();
                    });
                });
            });
        }
        async getLeaderboard() {
            return this.getLeaderboardPromise;
        }
        async getCurrentUser() {
            return this.currentUserPromise;
        }
        async getCurrentUserBitmoji() {
            if (isNull(this.currentUserRecord)) {
                this.bitmojiStickerLoader.loadForUser(null, '').then((texture) => {
                    this.userBitmojiTexture = texture;
                    this.currentUserBitmojiResolver(texture);
                });
            }
            return this.currentUserBitmojiPromise;
        }
        get bitmojiStickerLoader() {
            if (isNull(this.bitmojiStickerLoaderInstance)) {
                this.bitmojiStickerLoaderInstance = new BitmojiStickerLoader_1.BitmojiStickerLoader(this.bitmojiModule, this.remoteMediaModule);
            }
            return this.bitmojiStickerLoaderInstance;
        }
        initializeWithOptions(initializationOptions) {
            if (this.autoInitialize) {
                throw new Error("Please remove Auto Initialize from component inputs");
            }
            this.initializeLeaderboard(initializationOptions);
        }
        initializeLeaderboard(initializationOptions) {
            initializationOptions.userLimit = initializationOptions.userLimit ?? this.userLimit;
            if (isNull(initializationOptions.userType) ||
                isNull(initializationOptions.scoreOrdering) ||
                isNull(initializationOptions.userLimit) ||
                isNull(initializationOptions.scoreResetInterval) ||
                isNull(initializationOptions.useTimer) ||
                isNull(initializationOptions.name)) {
                this.printWarning("LeaderboardInitializationOptions are incorrect");
                throw new Error("LeaderboardInitializationOptions are incorrect");
            }
            if (!initializationOptions.useTimer && !initializationOptions.name.trim().length) {
                throw new Error("Please provide leaderboard name");
            }
            if (initializationOptions.useTimer && isNull(initializationOptions.leaderboardStartDate)) {
                throw new Error("Please provide leaderboard start date");
            }
            this.useTimer = initializationOptions.useTimer;
            const ttlSeconds = exports.ScoreLifetimeOptionsToScoreLifetimeSeconds[initializationOptions.scoreResetInterval];
            const scoreOrdering = initializationOptions.scoreOrdering;
            const userType = initializationOptions.userType;
            const details = this.createNewLeaderboardDetails(initializationOptions.leaderboardStartDate, initializationOptions.name, ttlSeconds, initializationOptions.scoreResetInterval, scoreOrdering);
            if (this.autoInitialize) {
                initializationOptions.name = details.leaderboardId;
            }
            const leaderboardParams = {
                leaderboardName: initializationOptions.name,
                ttlSeconds: ttlSeconds,
                scoreLifetimeOption: initializationOptions.scoreResetInterval,
                orderingType: scoreOrdering,
                userType: userType,
                userLimit: initializationOptions.userLimit,
                leaderboardDetails: initializationOptions.useTimer ? details : null,
                leaderboardNamePrefix: initializationOptions.name,
            };
            this.createLeaderboard(leaderboardParams);
            this.updateEvent.enabled = true;
        }
        isInputValid() {
            if (this.leaderboardName.trim() === "") {
                this.printWarning("Please set leaderboard name. Important: changing leaderboard name will reset scores");
                return false;
            }
            if (!(0, DateUtils_1.isDateStringValid)(this.leaderboardStartDate)) {
                this.printWarning("Please set correct date format, for example 12/31/2024");
                return false;
            }
            return true;
        }
        createNewLeaderboardDetails(leaderboardStartDateString, leaderboardNamePrefix, scoreLifetimeSeconds, scoreLifetimeOption, scoreOrdering) {
            const currentDate = new Date();
            const scoreLifetimeMillis = scoreLifetimeSeconds * 1000;
            const parsedStartDate = new Date(Date.parse(leaderboardStartDateString));
            const offsetDateMillis = (Date.UTC(parsedStartDate.getFullYear(), parsedStartDate.getMonth(), parsedStartDate.getDate(), 0, 0, 0, 0));
            const leaderboardRelativeIndex = (0, DateUtils_1.getIdFromUTCTime)((0, DateUtils_1.getUTCTime)(currentDate), scoreLifetimeMillis, -offsetDateMillis);
            const leaderboardDetails = {
                currentDate: currentDate,
                offsetDateMillis: offsetDateMillis,
                leaderboardRelativeIndex: leaderboardRelativeIndex,
                leaderboardId: (0, DateUtils_1.constructLeaderboardId)(leaderboardNamePrefix, leaderboardStartDateString, leaderboardRelativeIndex.toString(), scoreLifetimeOption.toString(), scoreOrdering.toString()),
                timeToFinish: (0, DateUtils_1.getMilisecondsToFinish)(offsetDateMillis, scoreLifetimeMillis, leaderboardRelativeIndex, (0, DateUtils_1.getUTCTime)(currentDate)),
                leaderboardStartDate: leaderboardStartDateString,
            };
            return leaderboardDetails;
        }
        updateLeaderboardDetails() {
            if (isNull(this.leaderboardParams.leaderboardDetails)) {
                return;
            }
            const currentDate = new Date();
            const timeToFinishMs = (0, DateUtils_1.getMilisecondsToFinish)(this.leaderboardParams.leaderboardDetails.offsetDateMillis, this.leaderboardParams.ttlSeconds * 1000, this.leaderboardParams.leaderboardDetails.leaderboardRelativeIndex, (0, DateUtils_1.getUTCTime)(currentDate));
            if (timeToFinishMs <= 0) {
                this.reset();
                this.recreateLeaderboard();
                return;
            }
            this.leaderboardParams.leaderboardDetails.timeToFinish = timeToFinishMs;
        }
        adjustUserLimit() {
            if (this.userType === UsersType.Friends) {
                if (this.userLimit > LeaderboardConstants_1.LeaderboardConstants.Component.USER_LIMIT_FRIENDS) {
                    this.printWarning("User limit was set to max value = " + LeaderboardConstants_1.LeaderboardConstants.Component.USER_LIMIT_FRIENDS);
                }
                this.userLimit = MathUtils.clamp(this.userLimit, 0, LeaderboardConstants_1.LeaderboardConstants.Component.USER_LIMIT_FRIENDS);
            }
            else if (this.userType === UsersType.Global) {
                if (this.userLimit > LeaderboardConstants_1.LeaderboardConstants.Component.USER_LIMIT_GLOBAL) {
                    this.printWarning("User limit was set to max value = " + LeaderboardConstants_1.LeaderboardConstants.Component.USER_LIMIT_GLOBAL);
                }
                this.userLimit = MathUtils.clamp(this.userLimit, 0, LeaderboardConstants_1.LeaderboardConstants.Component.USER_LIMIT_GLOBAL);
            }
        }
        createLeaderboard(leaderboardParameters) {
            if (this.leaderboardParams !== null && this.leaderboardParams.token) {
                this.tokenManager.dismissToken(this.leaderboardParams.token);
            }
            const newToken = this.tokenManager.generateToken();
            leaderboardParameters.token = newToken;
            this.leaderboardParams = leaderboardParameters;
            const leaderboardCreateOptions = Leaderboard.CreateOptions.create();
            leaderboardCreateOptions.name = leaderboardParameters.leaderboardName;
            leaderboardCreateOptions.ttlSeconds = leaderboardParameters.ttlSeconds;
            leaderboardCreateOptions.orderingType = leaderboardParameters.orderingType;
            this.scoresTracker.setActiveLeaderboardName(this.leaderboardParams.leaderboardName);
            this.leaderboardModule.getLeaderboard(leaderboardCreateOptions, (leaderboard) => {
                if (!this.tokenManager.isTokenValid(newToken)) {
                    return;
                }
                this.printDebug("Leaderboard retrieved!");
                const retrievalOptions = this.createLeaderboardRetrievalOption(leaderboardParameters);
                this.leaderboard = leaderboard;
                this.getLeaderboardResolver(leaderboard);
                this.leaderboard.getLeaderboardInfo(retrievalOptions, (others, currentUser) => this.onLeaderboardInfoRetrievedSuccessful(others, currentUser, newToken), (status) => this.onLeaderboardInfoRetrievedFailed(status));
            }, () => {
                this.getLeaderboardRejecter();
                this.printWarning("Leaderboard retrieval failed");
            });
        }
        addEntriesIfDoesntExist(leaderboardRecords, currentUserRecord) {
            for (let i = 0; i < leaderboardRecords.length; i++) {
                let isEntryKnown = false;
                for (let j = 0; j < this.allMergedRecords.length; j++) {
                    if ((0, LeaderboardUtils_1.isSameUserEntry)(this.allMergedRecords[j], leaderboardRecords[i])) {
                        this.allMergedRecords[j] = leaderboardRecords[i];
                        isEntryKnown = true;
                        break;
                    }
                }
                if (!isEntryKnown) {
                    this.allMergedRecords.push(leaderboardRecords[i]);
                }
            }
            if (!isNull(currentUserRecord)) {
                let isCurrentUserInRecords = false;
                for (let i = 0; i < this.allMergedRecords.length; i++) {
                    if ((0, LeaderboardUtils_1.isSameUserEntry)(this.allMergedRecords[i], currentUserRecord)) {
                        isCurrentUserInRecords = true;
                        this.allMergedRecords[i] = currentUserRecord;
                        break;
                    }
                }
                if (!isCurrentUserInRecords) {
                    this.allMergedRecords.push(currentUserRecord);
                }
            }
        }
        sortByScore(leaderboardRecords, orderingType) {
            const compareFn = orderingType === Leaderboard.OrderingType.Descending ?
                (a, b) => b.score - a.score : (a, b) => a.score - b.score;
            leaderboardRecords.sort(compareFn);
            if (this.leaderboardParams.userType === UsersType.Global) {
                const compareFnGlobalRank = (a, b) => a.globalExactRank - b.globalExactRank;
                leaderboardRecords.sort(compareFnGlobalRank);
            }
        }
        onCurrentUserBitmojiLoaded(texture) {
            this.currentUserBitmojiResolver(texture);
            this.userBitmojiTexture = texture;
        }
        loadBitmojiIfNotLoaded() {
            if (!isNull(this.userBitmojiTexture)) {
                return;
            }
            const isCurrentUserObjectPresent = !isNull(this.currentUserRecord) && !isNull(this.currentUserRecord.snapchatUser);
            const hasBitmoji = isCurrentUserObjectPresent &&
                !isNull(this.currentUserRecord.snapchatUser.hasBitmoji) && this.currentUserRecord.snapchatUser.hasBitmoji;
            if (!hasBitmoji && isCurrentUserObjectPresent) {
                return;
            }
            const currentUser = isCurrentUserObjectPresent ? this.currentUserRecord.snapchatUser : null;
            this.bitmojiStickerLoader.loadForUser(currentUser, this.customStickerId ?? '')
                .then((texture) => this.onCurrentUserBitmojiLoaded(texture))
                .catch((e) => {
                this.printDebug("Error loading bitmoji: " + e.message);
            });
        }
        onSubmitScoreSuccess(currentUserRecord) {
            this.printDebug("onSubmitScoreSuccess");
            this.onCurrentUserRecordUpdated(currentUserRecord);
            this.updateScoresState();
            this.onScoreSubmittedSuccess.trigger({
                userRecords: this.allMergedRecords,
                currentUserRecord: this.currentUserRecord,
            });
        }
        onSubmitScoreFailed(status) {
            this.printDebug("onSubmitScoreFailed");
        }
        onCurrentUserRecordUpdated(currentUserRecord) {
            if (isNull(currentUserRecord)) {
                return;
            }
            this.currentUserRecord = currentUserRecord;
            if (!isNull(this.currentUserRecord) && !isNull(this.currentUserRecord.snapchatUser)) {
                this.bitmojiStickerLoader.updateStorageWithCurrentUser(this.currentUserRecord.snapchatUser);
            }
            this.loadBitmojiIfNotLoaded();
            this.addEntriesIfDoesntExist([], currentUserRecord);
            this.sortByScore(this.allMergedRecords, this.leaderboardParams.orderingType);
        }
        updateScoresState() {
            this.onLeaderboardRecordsUpdated.trigger({
                userRecords: this.allMergedRecords,
                currentUserRecord: this.currentUserRecord,
            });
            if (!isNull(this.currentUserRecord) && !isNull(this.currentUserRecord.snapchatUser)) {
                this.currentUserResolver(this.currentUserRecord.snapchatUser);
            }
        }
        onLeaderboardInfoRetrievedSuccessful(otherRecords, currentUserRecord, token) {
            if (!this.tokenManager.isTokenValid(token)) {
                return;
            }
            if (this.debugMode != DebugMode.None && this.entriesCount === 0) {
                currentUserRecord = null;
            }
            this.onCurrentUserRecordUpdated(currentUserRecord);
            if (this.debugMode != DebugMode.None) {
                this.addEntriesIfDoesntExist(otherRecords.slice(0, Math.max(this.entriesCount - 1, 0)), currentUserRecord);
            }
            else {
                this.addEntriesIfDoesntExist(otherRecords, currentUserRecord);
            }
            this.sortByScore(this.allMergedRecords, this.leaderboardParams.orderingType);
            this.updateScoresState();
            if (this.debugMode === DebugMode.SubmitScore && this.entriesCount > 0) {
                this.submitScore(this.scoreToSubmit);
            }
        }
        ;
        onLeaderboardInfoRetrievedFailed(status) {
            this.printDebug("Failed to retrieve scores. Status = " + status);
        }
        ;
        createLeaderboardRetrievalOption(leaderboardParameters) {
            const leaderboardRetrievalOption = Leaderboard.RetrievalOptions.create();
            leaderboardRetrievalOption.usersLimit = leaderboardParameters.userLimit;
            leaderboardRetrievalOption.usersType = leaderboardParameters.userType;
            return leaderboardRetrievalOption;
        }
        reset() {
            this.currentUserRecord = null;
            this.allMergedRecords = [];
        }
        recreateLeaderboard() {
            this.leaderboardParams.leaderboardDetails = this.createNewLeaderboardDetails(this.leaderboardParams.leaderboardDetails.leaderboardStartDate, this.leaderboardParams.leaderboardNamePrefix, this.leaderboardParams.ttlSeconds, this.leaderboardParams.scoreLifetimeOption, this.leaderboardParams.orderingType);
            this.leaderboardParams.leaderboardName = this.leaderboardParams.leaderboardDetails.leaderboardId;
            this.createLeaderboard(this.leaderboardParams);
        }
        onUpdate() {
            this.updateLeaderboardDetails();
        }
        printDebug(message) {
            if (this.printDebugStatements) {
                print(this.getSceneObject().name + " - " + message);
            }
        }
        printWarning(message) {
            if (this.printWarningStatements) {
                print(this.getSceneObject().name + " - WARNING, " + message);
            }
        }
    };
    __setFunctionName(_classThis, "LeaderboardCore");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        LeaderboardCore = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return LeaderboardCore = _classThis;
})();
exports.LeaderboardCore = LeaderboardCore;
//# sourceMappingURL=LeaderboardCore.js.map