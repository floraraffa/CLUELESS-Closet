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
// @input Component.Image cameraFrameImage {"hint":"\"Camera Frame Photo\" Image in Car Scan Interface (shows live preview + freeze frame)"}
// @input Asset.AudioTrackAsset captureSoundAsset {"hint":"AudioTrackAsset for the camera shutter/capture sound effect"}
// @input Component.AudioComponent captureSoundPlayer {"hint":"AudioComponent to play the capture sound"}
// @input SceneObject vehicleCard {"hint":"Vehicle Card SceneObject — used for depth-based 3D positioning"}
// @input float cardOffsetX {"hint":"X offset from vehicle (cm)"}
// @input float cardOffsetY = 80 {"hint":"Y offset above vehicle (cm, height above roof)"}
// @input float cardOffsetZ {"hint":"Z offset from vehicle (cm)"}
// @input float cardBaseScale = 2 {"hint":"Base scale of Vehicle Card (recommended: 2)"}
// @input float cardMinScale = 1.5 {"hint":"Minimum card scale (recommended: 1.5)"}
// @input float cardMaxScale = 4 {"hint":"Maximum card scale (recommended: 4)"}
// @input bool enableAntiCheat = true {"hint":"Enable anti-cheat detection (rejects screens, photos, prints). Disable for testing with TV/monitor."}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../Modules/Src/Assets/VehicleScanner");
Object.setPrototypeOf(script, Module.VehicleScanner.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("cardOffsetX", []);
    checkUndefined("cardOffsetY", []);
    checkUndefined("cardOffsetZ", []);
    checkUndefined("cardBaseScale", []);
    checkUndefined("cardMinScale", []);
    checkUndefined("cardMaxScale", []);
    checkUndefined("enableAntiCheat", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
