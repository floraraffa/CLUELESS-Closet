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
exports.LeaderboardInfo = void 0;
var __selfType = requireType("./LeaderboardInfo");
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
const LeaderboardCore_1 = require("./LeaderboardCore");
var PositionType;
(function (PositionType) {
    PositionType[PositionType["Absolute"] = 0] = "Absolute";
    PositionType[PositionType["RelativeToCurrentUser"] = 1] = "RelativeToCurrentUser";
    PositionType[PositionType["CurrentUser"] = 2] = "CurrentUser";
})(PositionType || (PositionType = {}));
class BitmojiVisualSettings {
    constructor() {
        this.positionType = PositionType.Absolute;
        this.position = 0;
        this.relativePosition = -1;
        this.textureParameter = "baseTex";
        this.stickerId = "";
    }
}
let LeaderboardInfo = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = LeaderboardCore_1.LeaderboardCore;
    var LeaderboardInfo = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.autoInitialize = this.autoInitialize;
            this.enableTextOnlyWhenLoaded = this.enableTextOnlyWhenLoaded;
            this.disableWhenAllRequiredTagsAreUndefined = this.disableWhenAllRequiredTagsAreUndefined;
            this.texts = this.texts;
            this.bitmojis = this.bitmojis;
            this.TAG_REGEX = /\{([a-zA-Z0-9]+)(\[([+\-])?(\d+)])?(?:(\?)([^}]+)?)?}/g;
            this.originalTexts = {};
            this.updatedTexts = {};
            this.bitmojiRequestIds = {};
            this.onDisable = () => {
                for (const textComponent of this.texts) {
                    if (isNull(textComponent) || isNull(textComponent.getSceneObject())) {
                        continue;
                    }
                    textComponent.text = this.getTextToParse(textComponent);
                }
                for (const bitmojiSettings of this.bitmojis) {
                    if (isNull(bitmojiSettings.visual) || isNull(bitmojiSettings.visual.getSceneObject())) {
                        continue;
                    }
                    this.bitmojiStickerLoader.dismissToken(this.bitmojiRequestIds[bitmojiSettings.visual.uniqueIdentifier]);
                    bitmojiSettings.visual.mainPass[bitmojiSettings.textureParameter] = this.invisiblePixel;
                }
            };
        }
        __initialize() {
            super.__initialize();
            this.autoInitialize = this.autoInitialize;
            this.enableTextOnlyWhenLoaded = this.enableTextOnlyWhenLoaded;
            this.disableWhenAllRequiredTagsAreUndefined = this.disableWhenAllRequiredTagsAreUndefined;
            this.texts = this.texts;
            this.bitmojis = this.bitmojis;
            this.TAG_REGEX = /\{([a-zA-Z0-9]+)(\[([+\-])?(\d+)])?(?:(\?)([^}]+)?)?}/g;
            this.originalTexts = {};
            this.updatedTexts = {};
            this.bitmojiRequestIds = {};
            this.onDisable = () => {
                for (const textComponent of this.texts) {
                    if (isNull(textComponent) || isNull(textComponent.getSceneObject())) {
                        continue;
                    }
                    textComponent.text = this.getTextToParse(textComponent);
                }
                for (const bitmojiSettings of this.bitmojis) {
                    if (isNull(bitmojiSettings.visual) || isNull(bitmojiSettings.visual.getSceneObject())) {
                        continue;
                    }
                    this.bitmojiStickerLoader.dismissToken(this.bitmojiRequestIds[bitmojiSettings.visual.uniqueIdentifier]);
                    bitmojiSettings.visual.mainPass[bitmojiSettings.textureParameter] = this.invisiblePixel;
                }
            };
        }
        onAwake() {
            super.onAwake();
            if (!this.isInputValid()) {
                return;
            }
            for (const text of this.texts) {
                if (isNull(text) || isNull(text.getSceneObject())) {
                    continue;
                }
                this.originalTexts[text.uniqueIdentifier] = text.text;
                if (this.enableTextOnlyWhenLoaded) {
                    text.enabled = false;
                }
            }
            this.initializeInvisiblePixel();
            for (const bitmojiSettings of this.bitmojis) {
                if (isNull(bitmojiSettings.visual) || isNull(bitmojiSettings.visual.getSceneObject())) {
                    continue;
                }
                bitmojiSettings.visual.mainPass[bitmojiSettings.textureParameter] = this.invisiblePixel;
            }
            this.onLeaderboardRecordsUpdated.add((records) => {
                this.onRecordsUpdated(records);
            });
            this.createEvent("OnDisableEvent").bind(this.onDisable);
        }
        isInputValid() {
            if (!super.isInputValid()) {
                return false;
            }
            for (const bitmojiSettings of this.bitmojis) {
                if (bitmojiSettings.textureParameter.trim() === "") {
                    this.printWarning(`Please set texture parameter for Bitmoji visual on "${bitmojiSettings.visual?.getSceneObject()?.name}"`);
                    return false;
                }
                if (isNull(bitmojiSettings.visual)) {
                    continue;
                }
                if (typeof bitmojiSettings.visual.mainPass[bitmojiSettings.textureParameter] === "undefined") {
                    this.printWarning(`Material Pass parameter "${bitmojiSettings.textureParameter}" not found on Bitmoji visual on "${bitmojiSettings.visual?.getSceneObject()?.name}"`);
                }
            }
            return true;
        }
        onLeaderboardInfoRetrievedFailed(status) {
            super.onLeaderboardInfoRetrievedFailed(status);
            if (this.enableTextOnlyWhenLoaded) {
                this.onRecordsUpdated({ userRecords: this.allMergedRecords, currentUserRecord: this.currentUserRecord });
            }
        }
        ;
        onRecordsUpdated(records) {
            const currentUserIndex = this.getCurrentUserIndex(records.userRecords, records.currentUserRecord);
            this.updateBitmojis(records.userRecords, records.currentUserRecord, currentUserIndex);
            this.updateTexts(records.userRecords, records.currentUserRecord, currentUserIndex);
        }
        updateTexts(records, currentUserRecord, currentUserIndex) {
            for (const textComponent of this.texts) {
                if (isNull(textComponent) || isNull(textComponent.getSceneObject())) {
                    this.printWarning(`Skipping text component for ${textComponent?.getSceneObject()?.name} because it has been destroyed.`);
                    continue;
                }
                this.updateTextComponent(textComponent, records, currentUserRecord, currentUserIndex);
            }
        }
        updateTextComponent(textComponent, records, currentUserRecord, currentUserIndex) {
            let requiredTagsCount = 0;
            let validRequiredTagsCount = 0;
            const textToParse = this.getTextToParse(textComponent);
            textComponent.text = textToParse.replace(this.TAG_REGEX, (match, ...tags) => {
                const tag = tags[0].toLowerCase();
                const isCurrentUser = tag.startsWith("currentuser");
                const relativeIndexSign = tags[2];
                let index = tags[3] ? parseInt(tags[3]) : null;
                const required = tags[4] !== '?';
                const defaultValue = tags[5];
                if (!isCurrentUser && (index === null || isNaN(index))) {
                    this.printWarning(`Tag "${match}" is missing the index. Try with {${tags[0]}[0]} or {${tags[0]}[1]} etc.`);
                    return match;
                }
                if (!isCurrentUser && relativeIndexSign) {
                    if (relativeIndexSign === "+") {
                        index = currentUserIndex + index;
                    }
                    else if (relativeIndexSign === "-") {
                        index = currentUserIndex - index;
                    }
                }
                if (required) {
                    requiredTagsCount++;
                }
                const record = isCurrentUser ? currentUserRecord : records[index ?? 0];
                const mappings = this.getMappings(record, (isCurrentUser ? currentUserIndex : index) + 1);
                const mappingKey = isCurrentUser ? tag.replace(/^currentuser/, "") : tag;
                if (mappings && !(mappingKey in mappings)) {
                    this.printWarning(`Tag "${match}" is not recognized`);
                    return match;
                }
                const value = mappings?.[mappingKey];
                if (value !== undefined && value !== null) {
                    if (required) {
                        validRequiredTagsCount++;
                    }
                    return value;
                }
                else {
                    return defaultValue ?? "";
                }
            });
            this.updatedTexts[textComponent.uniqueIdentifier] = textComponent.text;
            if (this.disableWhenAllRequiredTagsAreUndefined) {
                textComponent.enabled = validRequiredTagsCount !== 0 || requiredTagsCount == 0;
            }
            else if (this.enableTextOnlyWhenLoaded) {
                textComponent.enabled = true;
            }
        }
        getMappings(record, position) {
            if (!record) {
                return null;
            }
            return {
                "displayname": record.snapchatUser.displayName,
                "username": record.snapchatUser.userName,
                "globalexactrank": record.globalExactRank,
                "globalrankpercentile": record.globalRankPercentile,
                "position": position,
                "score": record?.score,
            };
        }
        getTextToParse(textComponent) {
            const key = textComponent.uniqueIdentifier;
            if (key in this.updatedTexts) {
                // did an external script update the text?
                if (textComponent.text !== this.updatedTexts[key]) {
                    this.originalTexts[key] = textComponent.text;
                }
            }
            return this.originalTexts[key];
        }
        updateBitmojis(records, currentUserRecord, currentUserIndex) {
            for (const bitmojiSettings of this.bitmojis) {
                const { visual, positionType, position, relativePosition } = bitmojiSettings;
                if (isNull(visual) || isNull(visual.getSceneObject())) {
                    this.printWarning(`Skipping Bitmoji visual for ${visual?.getSceneObject()?.name} because it has been destroyed.`);
                    continue;
                }
                let index = 0;
                switch (positionType) {
                    case PositionType.Absolute:
                        index = position;
                        break;
                    case PositionType.RelativeToCurrentUser:
                        index = currentUserIndex + relativePosition;
                        break;
                    case PositionType.CurrentUser:
                        index = currentUserIndex;
                        break;
                }
                const isCurrentUser = positionType === PositionType.CurrentUser;
                const record = isCurrentUser ? currentUserRecord : records[index];
                visual.mainPass[bitmojiSettings.textureParameter] = this.invisiblePixel;
                if (isCurrentUser || (record && record.snapchatUser.hasBitmoji)) {
                    this.updateBitmojiImage(bitmojiSettings, record?.snapchatUser);
                }
            }
        }
        updateBitmojiImage(bitmojiSettings, snapchatUser) {
            this.bitmojiStickerLoader.dismissToken(this.bitmojiRequestIds[bitmojiSettings.visual.uniqueIdentifier]);
            const bitmojiRequestId = this.bitmojiStickerLoader.generateToken();
            this.bitmojiRequestIds[bitmojiSettings.visual.uniqueIdentifier] = bitmojiRequestId;
            const stickerId = (bitmojiSettings.stickerId || this.customStickerId) ?? "";
            this.bitmojiStickerLoader.loadForUser(snapchatUser, stickerId).then((texture) => {
                if (this.bitmojiStickerLoader.isTokenValid(bitmojiRequestId)) {
                    bitmojiSettings.visual.mainPass[bitmojiSettings.textureParameter] = texture;
                }
            });
        }
        getCurrentUserIndex(records, currentUserRecord) {
            if (currentUserRecord) {
                for (let i = 0; i < records.length; i++) {
                    if (records[i].snapchatUser.isSame(currentUserRecord.snapchatUser)) {
                        return i;
                    }
                }
            }
            return -1;
        }
        initializeInvisiblePixel() {
            if ("createWithFormat" in ProceduralTextureProvider) {
                // @ts-ignore
                this.invisiblePixel = ProceduralTextureProvider.createWithFormat(1, 1, TextureFormat.R8G8B8A8_UNORM);
            }
            else {
                // @ts-ignore
                this.invisiblePixel = ProceduralTextureProvider.create(1, 1, Colorspace.RGBA);
            }
        }
    };
    __setFunctionName(_classThis, "LeaderboardInfo");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        LeaderboardInfo = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return LeaderboardInfo = _classThis;
})();
exports.LeaderboardInfo = LeaderboardInfo;
//# sourceMappingURL=LeaderboardInfo.js.map