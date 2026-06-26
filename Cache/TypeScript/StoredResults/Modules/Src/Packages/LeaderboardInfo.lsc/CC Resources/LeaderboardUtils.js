"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.isSameUserEntry = isSameUserEntry;
function isSameUserEntry(entryA, entryB) {
    if (!isNull(entryA) && !isNull(entryB) && !isNull(entryA.snapchatUser) && !isNull(entryB.snapchatUser) &&
        entryA.snapchatUser.isSame(entryB.snapchatUser)) {
        return true;
    }
    return false;
}
//# sourceMappingURL=LeaderboardUtils.js.map