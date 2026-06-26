"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getUTCTime = getUTCTime;
exports.getIdFromUTCTime = getIdFromUTCTime;
exports.getMilisecondsToFinish = getMilisecondsToFinish;
exports.constructLeaderboardId = constructLeaderboardId;
exports.isDateStringValid = isDateStringValid;
exports.convertMilisecondsToDateString = convertMilisecondsToDateString;
function getUTCTime(date) {
    //return date.getTime() + date.getTimezoneOffset() * 60 * 1000;
    return date.getTime();
}
function getIdFromUTCTime(utcTime, challengeDurationMS, offset) {
    return Math.floor((utcTime + offset) / challengeDurationMS);
}
function getMilisecondsToFinish(utcStartTime, challengeDurationMS, challengeId, utcCurrentTime) {
    return challengeDurationMS * (challengeId + 1) + utcStartTime - utcCurrentTime;
}
function constructLeaderboardId(namePrefix, startDate, relativeIndex, durationOptionStr, scoreOrderingStr) {
    return "".concat(namePrefix, startDate, relativeIndex, durationOptionStr, scoreOrderingStr);
}
function isDateStringValid(dateString) {
    return !isNaN(Date.parse(dateString));
}
function convertMilisecondsToDateString(miliseconds) {
    if (miliseconds < 0) {
        return "";
    }
    const days = Math.floor(miliseconds / (24 * 60 * 60 * 1000));
    miliseconds = miliseconds % (24 * 60 * 60 * 1000);
    const hours = Math.floor(miliseconds / (60 * 60 * 1000));
    miliseconds = miliseconds % (60 * 60 * 1000);
    const minutes = Math.floor(miliseconds / (60 * 1000));
    return `${days}d ${hours}h ${minutes}m`;
}
//# sourceMappingURL=DateUtils.js.map