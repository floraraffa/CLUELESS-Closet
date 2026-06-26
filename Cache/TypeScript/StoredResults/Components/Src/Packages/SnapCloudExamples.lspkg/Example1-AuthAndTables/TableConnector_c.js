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
// @ui {"widget":"separator"}
// @ui {"widget":"label", "label":"<span style=\"color: #60A5FA;\">Supabase Configuration</span>"}
// @ui {"widget":"label", "label":"<span style=\"color: #94A3B8; font-size: 11px;\">Centralized configuration and interactive elements</span>"}
// @input AssignableType snapCloudRequirements {"hint":"Reference to SnapCloudRequirements for centralized Supabase configuration"}
// @input AssignableType_1 dataRetrievalButton {"hint":"Optional: RectangleButton to trigger data retrieval (from Spectacles UI Kit)"}
// @input Component.Text logText {"hint":"Optional: Text component to display logs on device"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../Modules/Src/Packages/SnapCloudExamples.lspkg/Example1-AuthAndTables/TableConnector");
Object.setPrototypeOf(script, Module.TableConnector.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("snapCloudRequirements", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
