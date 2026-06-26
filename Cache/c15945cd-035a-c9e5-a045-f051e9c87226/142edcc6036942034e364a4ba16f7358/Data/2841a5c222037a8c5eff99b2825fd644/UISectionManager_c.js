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
// @ui {"widget":"label", "label":"<span style=\"color: #60A5FA;\">UI Section Configuration</span>"}
// @ui {"widget":"label", "label":"<span style=\"color: #94A3B8; font-size: 11px;\">Toggle group and section management settings</span>"}
// @input AssignableType toggleGroup {"hint":"ToggleGroup component that controls the section switching"}
// @input SceneObject[] uiSections {"hint":"Array of SceneObjects representing the UI sections (index matches toggle index)"}
// @input float defaultSectionIndex {"hint":"Index of the default section to show on start (-1 for none)", "widget":"slider", "min":-1, "max":10, "step":1}
// @ui {"widget":"separator"}
// @ui {"widget":"label", "label":"<span style=\"color: #60A5FA;\">Debug Configuration</span>"}
// @ui {"widget":"label", "label":"<span style=\"color: #94A3B8; font-size: 11px;\">Enable detailed logging for troubleshooting</span>"}
// @input bool enableDebugLogs = true {"hint":"Enable debug logging"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../../Modules/Src/Packages/SnapCloudExamples.lspkg/Example5-Media/Scripts/UISectionManager");
Object.setPrototypeOf(script, Module.UISectionManager.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("toggleGroup", []);
    checkUndefined("uiSections", []);
    checkUndefined("defaultSectionIndex", []);
    checkUndefined("enableDebugLogs", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
