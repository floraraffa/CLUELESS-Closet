if (script.onAwake) {
    script.onAwake();
    return;
}
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
// @input boolean autoInitialize = "true"
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
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../Modules/Src/Packages/LeaderboardInfo.lsc/CC Resources/LeaderboardCore");
Object.setPrototypeOf(script, Module.LeaderboardCore.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("autoInitialize", []);
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
    if (script.onAwake) {
       script.onAwake();
    }
});
