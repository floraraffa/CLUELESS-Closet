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
// @ui {"widget":"label", "label":"<span style=\"color: #60A5FA;\">Camera Configuration</span>"}
// @ui {"widget":"label", "label":"<span style=\"color: #94A3B8; font-size: 11px;\">Camera and texture settings for shared camera access</span>"}
// @input Component.Camera editorCamera
// @input Asset.Texture screenCropTexture
// @input Asset.CameraModule camModule
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../../Modules/Src/Packages/SnapCloudExamples.lspkg/CompositeCameraModified/Scripts/CameraService");
Object.setPrototypeOf(script, Module.CameraService.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("editorCamera", []);
    checkUndefined("screenCropTexture", []);
    checkUndefined("camModule", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
