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
// @input SceneObject vehicleCard {"hint":"Vehicle Card SceneObject (3D card displayed above the vehicle)"}
// @input Component.Text brandModelText {"hint":"Text component for brand and model"}
// @input Component.Text carTypeText {"hint":"Text component for vehicle type"}
// @input Component.Text carYearText {"hint":"Text component for production year"}
// @input Component.Text carRarityText {"hint":"\"Car Rarity\" Text component (displays ★★★☆☆ Uncommon)"}
// @input SceneObject carBrandLogo {"hint":"\"Item Accent\" SceneObject used as the result-card garment photo"}
// @input SceneObject topSpeedBar {"hint":"\"Top Speed Bar\" SceneObject containing 5 Planes + 1 Text"}
// @input SceneObject accelerationBar {"hint":"\"Acceleration Bar\" SceneObject containing 5 Planes + 1 Text"}
// @input SceneObject brakingBar {"hint":"\"Braking Bar\" SceneObject containing 5 Planes + 1 Text"}
// @input SceneObject tractionBar {"hint":"\"Traction Bar\" SceneObject containing 5 Planes + 1 Text"}
// @input SceneObject comfortBar {"hint":"\"Comfort Bar\" SceneObject containing 5 Planes + 1 Text"}
// @input Component.Text topSpeedText {"hint":"Text label \"Top Speed\""}
// @input Component.Text accelerationText {"hint":"Text label \"Acceleration\""}
// @input Component.Text brakingText {"hint":"Text label \"Braking\""}
// @input Component.Text tractionText {"hint":"Text label \"Traction\""}
// @input Component.Text comfortText {"hint":"Text label \"Comfort\""}
// @input Component.Text cardStatusText {"hint":"\"Debug card text\" — used for card generation status messages (separate from subtitles)"}
// @input Component.Text styleNotesText {"hint":"\"Style Notes\" Text component on the Closet Card"}
// @input SceneObject editNoteButton {"hint":"Optional button that opens keyboard editing for Style Notes"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../Modules/Src/Assets/VehicleCardUI");
Object.setPrototypeOf(script, Module.VehicleCardUI.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    if (script.onAwake) {
       script.onAwake();
    }
});
