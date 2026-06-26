"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.BitmojiStickerLoader = void 0;
const TokenManager_1 = require("./TokenManager");
class BitmojiStickerLoader extends TokenManager_1.TokenManager {
    constructor(bitmojiModule, remoteMediaModule) {
        super();
        this.bitmojiModule = bitmojiModule;
        this.remoteMediaModule = remoteMediaModule;
        this.stickerData = [];
        this.currentUserPromises = new Map();
    }
    updateStorageWithCurrentUser(currentSnapchatUser) {
        const stickerDataEntry = this.findStickerDataEntry(currentSnapchatUser);
        if (stickerDataEntry) {
            for (const [stickerId, promise] of stickerDataEntry.stickerMap) {
                if (!this.currentUserPromises.has(stickerId)) {
                    this.currentUserPromises.set(stickerId, promise);
                }
            }
            stickerDataEntry.stickerMap = this.currentUserPromises;
        }
        else {
            this.stickerData.push({
                snapchatUser: currentSnapchatUser,
                stickerMap: this.currentUserPromises,
            });
        }
    }
    async loadForUser(snapchatUser, stickerId) {
        if (isNull(snapchatUser)) {
            if (isNull(this.currentUserPromises.get(stickerId))) {
                this.currentUserPromises.set(stickerId, this.loadBitmoji(null, stickerId));
            }
            return this.currentUserPromises.get(stickerId);
        }
        const stickerDataEntry = this.findStickerDataEntry(snapchatUser);
        const isPromiseForStickerExists = stickerDataEntry && stickerDataEntry.stickerMap.has(stickerId);
        if (isPromiseForStickerExists) {
            return stickerDataEntry.stickerMap.get(stickerId);
        }
        const promise = this.loadBitmoji(snapchatUser, stickerId);
        if (!stickerDataEntry) {
            this.stickerData.push({
                snapchatUser: snapchatUser,
                stickerMap: new Map([[stickerId, promise]]),
            });
        }
        else {
            stickerDataEntry.stickerMap.set(stickerId, promise);
        }
        return promise;
    }
    loadBitmoji(user, poseId) {
        const options = Bitmoji2DOptions.create();
        if (!isNull(user)) {
            options.user = user;
        }
        if (poseId !== '') {
            options.poseId = poseId;
        }
        return new Promise((resolve, reject) => {
            this.bitmojiModule.requestBitmoji2DResource(options, (resource) => {
                this.remoteMediaModule.loadResourceAsImageTexture(resource, texture => resolve(texture), reject);
            });
        });
    }
    findStickerDataEntry(snapchatUser) {
        return this.stickerData.find((stickerDataEntry) => stickerDataEntry.snapchatUser.isSame(snapchatUser));
    }
}
exports.BitmojiStickerLoader = BitmojiStickerLoader;
//# sourceMappingURL=BitmojiStickerLoader.js.map