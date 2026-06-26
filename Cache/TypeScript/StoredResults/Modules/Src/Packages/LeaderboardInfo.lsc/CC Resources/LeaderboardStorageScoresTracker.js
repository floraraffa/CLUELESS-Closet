"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.LeaderboardStorageScoresTracker = void 0;
class LeaderboardStorageScoresTracker {
    constructor() {
        this.uniqueLeaderboardKeyPrefix = "300LB]";
        this.store = global.persistentStorageSystem.store;
        this.store.onStoreFull = this.onStorageFull;
    }
    setActiveLeaderboardName(formattedLeaderboardName) {
        formattedLeaderboardName = this.convertToLeaderboardName(formattedLeaderboardName);
        this.activeFormattedLeaderboardName = formattedLeaderboardName;
    }
    getLeaderboardLastChecksumOrNull(formattedLeaderboardName) {
        formattedLeaderboardName = this.convertToLeaderboardName(formattedLeaderboardName);
        const checksumExists = this.store.has(formattedLeaderboardName);
        if (!checksumExists) {
            return null;
        }
        return this.store.getInt(formattedLeaderboardName);
    }
    saveChecksum(checksum, formattedLeaderboardName) {
        if (isNull(this.store)) {
            return;
        }
        formattedLeaderboardName = this.convertToLeaderboardName(formattedLeaderboardName);
        this.store.putInt(formattedLeaderboardName, checksum);
        if (!isNull(this.activeFormattedLeaderboardName)) {
            this.clearLeaderboardKeysExceptActive();
        }
    }
    onStorageFull() {
        this.clearLeaderboardKeysExceptActive();
    }
    clearLeaderboardKeysExceptActive() {
        const keys = this.store.getAllKeys();
        keys.forEach(key => {
            if (this.isLeaderboardKeyString(key) && this.activeFormattedLeaderboardName !== key) {
                this.store.remove(key);
            }
        });
    }
    isLeaderboardKeyString(key) {
        return key.startsWith(this.uniqueLeaderboardKeyPrefix);
    }
    convertToLeaderboardName(formattedLeaderboardName) {
        return this.uniqueLeaderboardKeyPrefix.concat(formattedLeaderboardName);
    }
}
exports.LeaderboardStorageScoresTracker = LeaderboardStorageScoresTracker;
//# sourceMappingURL=LeaderboardStorageScoresTracker.js.map