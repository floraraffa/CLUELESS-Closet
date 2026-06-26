if (script.onAwake) {
    script.onAwake();
    return;
}
/*
@typedef BitmojiVisualSettings
@property {Component.MaterialMeshVisual} visual
@property {int} positionType {"widget":"combobox", "values":[{"label":"Absolute position", "value":0}, {"label":"Relative to current user", "value":1}, {"label":"Current user", "value":2}]}
@property {int} position {"widget":"spinbox", "min":0, "max":1000, "step":1, "showIf":"positionType", "showIfValue":0}
@property {int} relativePosition = -1 {"widget":"spinbox", "min":-1000, "max":1000, "step":1, "showIf":"positionType", "showIfValue":1}
@property {string} textureParameter = "baseTex"
@property {string} stickerId {"hint":"If empty, the Leaderboard \"Custom Sticker Id\" will be used"}
*/
function checkUndefined(property, showIfData) {
    for (var i = 0; i < showIfData.length; i++) {
        if (showIfData[i][0] && script[showIfData[i][0]] != showIfData[i][1]) {
            return;
        }
    }
    if (script[property] == undefined) {
        throw new Error("Input " + property + " was not provided for the object " + script.getSceneObject().name);
    }
}
// @ui {"widget":"label", "label":"You can find an example of initialization here: <a href=\"https://developers.snap.com/lens-studio/features/games/leaderboard#initializeWithOptions\">developers.snap.com/&hellip;/leaderboard</a>", "showIf":"autoInitialize", "showIfValue":false}
// @input string leaderboardName {"hint":"Changing leaderboard name will reset scores", "showIf":"autoInitialize", "showIfValue":true}
// @input int userLimit = "10" {"hint":"Maximum user limit is 50", "showIf":"autoInitialize", "showIfValue":true}
// @input int scoreLifetimeOption = "3" {"label":"Score Reset Interval", "widget":"combobox", "values":[{"label":"Day", "value":0}, {"label":"Week", "value":1}, {"label":"Month", "value":2}, {"label":"Year", "value":3}], "showIf":"autoInitialize", "showIfValue":true}
// @input string leaderboardStartDate = "12/31/2024" {"label":"Score Reset Anchor", "hint":"In format mm/dd/yyyy, this is the start date for the recurring score reset interval.<br>For example, if you select \"Week\" as the Score Reset Interval and set this date to 12/31/2024, the leaderboard will reset every week on Tuesday.", "showIf":"autoInitialize", "showIfValue":true}
// @input int scoreOrdering = "1" {"widget":"combobox", "values":[{"label":"Descending", "value":1}, {"label":"Ascending", "value":2}], "showIf":"autoInitialize", "showIfValue":true}
// @input string customStickerId {"hint":"Please enter bitmoji sticker id or leave empty to use selfie sticker"}
// @ui {"widget":"separator"}
// @input Asset.BitmojiModule bitmojiModule
// @input Asset.RemoteMediaModule remoteMediaModule
// @input Asset.LeaderboardModule leaderboardModule
// @input int debugMode = "0" {"widget":"combobox", "values":[{"label":"None", "value":0}, {"label":"Submit score", "value":1}, {"label":"Custom entries count", "value":2}]}
// @input int entriesCount = "10"
// @input int scoreToSubmit = "100" {"showIf":"debugMode", "showIfValue":1}
// @input bool printDebugStatements = "true" {"label":"Print Info"}
// @input bool printWarningStatements = "true" {"label":"Print Warnings"}
// @input bool autoInitialize = true {"showIf":"autoInitialize", "showIfValue":false}
// @ui {"widget":"separator"}
// @input bool enableTextOnlyWhenLoaded = true
// @input bool disableWhenAllRequiredTagsAreUndefined = true {"hint":"If true, text components will be disabled when none of the <b>required</b> tags are available, for example if there is no score in that position.<br>Optional tags do not affect this."}
// @input Component.Text[] texts
// @input BitmojiVisualSettings[] bitmojis
// @ui {"widget":"group_start", "label":"Help"}
// @ui {"widget":"label", "label":"Code values for populating text components that will be replaced with leaderboard information:<br>"}
// @ui {"widget":"label", "label":"<code>{displayName[0]}</code>"}
// @ui {"widget":"label", "label":"<code>{username[0]}</code>"}
// @ui {"widget":"label", "label":"<code>{globalExactRank[0]}</code>"}
// @ui {"widget":"label", "label":"<code>{globalRankPercentile[0]}</code>"}
// @ui {"widget":"label", "label":"<code>{position[0]}</code>"}
// @ui {"widget":"label", "label":"<code>{score[0]}</code>"}
// @ui {"widget":"label", "label":"<code>{currentUserDisplayName}</code>"}
// @ui {"widget":"label", "label":"<code>{currentUserUsername}</code>"}
// @ui {"widget":"label", "label":"<code>{currentUserGlobalExactRank}</code>"}
// @ui {"widget":"label", "label":"<code>{currentUserGlobalRankPercentile}</code>"}
// @ui {"widget":"label", "label":"<code>{currentUserPosition}</code>"}
// @ui {"widget":"label", "label":"<code>{currentUserScore}</code>"}
// @ui {"widget":"label", "label":"<br>Replace <code>0</code> with the index you want to display, for example <code>{displayName[1]}</code> for the second record in the leaderboard."}
// @ui {"widget":"label", "label":"<br>You can also use a (positive or negative) index relative to the current user, like <code>{displayName[+1]}</code> for record right after the current user record."}
// @ui {"widget":"label", "label":"<br>Optional tags: add a <code>?</code> to make the tag optional. You can also add a default value like <code>{displayName[0]?No name}</code>."}
// @ui {"widget":"group_end"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../Modules/Src/Packages/LeaderboardInfo.lsc/CC Resources/LeaderboardInfo");
Object.setPrototypeOf(script, Module.LeaderboardInfo.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("leaderboardName", [["autoInitialize",true]]);
    checkUndefined("userLimit", [["autoInitialize",true]]);
    checkUndefined("scoreLifetimeOption", [["autoInitialize",true]]);
    checkUndefined("leaderboardStartDate", [["autoInitialize",true]]);
    checkUndefined("scoreOrdering", [["autoInitialize",true]]);
    checkUndefined("customStickerId", []);
    checkUndefined("bitmojiModule", []);
    checkUndefined("remoteMediaModule", []);
    checkUndefined("leaderboardModule", []);
    checkUndefined("debugMode", []);
    checkUndefined("entriesCount", []);
    checkUndefined("scoreToSubmit", [["debugMode",1]]);
    checkUndefined("printDebugStatements", []);
    checkUndefined("printWarningStatements", []);
    checkUndefined("autoInitialize", [["autoInitialize",false]]);
    checkUndefined("enableTextOnlyWhenLoaded", []);
    checkUndefined("disableWhenAllRequiredTagsAreUndefined", []);
    checkUndefined("texts", []);
    checkUndefined("bitmojis", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
