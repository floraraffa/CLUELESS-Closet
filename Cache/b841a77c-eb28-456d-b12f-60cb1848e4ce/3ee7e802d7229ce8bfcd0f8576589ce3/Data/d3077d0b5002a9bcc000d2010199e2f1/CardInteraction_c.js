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
// @input SceneObject rightIndexTip {"hint":"Right hand index finger tip SceneObject (index-3_end joint)"}
// @input SceneObject rightThumbTip {"hint":"Right hand thumb tip SceneObject (thumb-3_end joint)"}
// @input SceneObject cardCollectionContainer {"hint":"Card Collection Container — SceneObject under left wrist"}
// @input SceneObject leftPalmAnchor {"hint":"Left palm anchor SceneObject (for fallback hand position)"}
// @input float collectionCardScale = 0.23 {"hint":"Scale of cards inside the carousel (small). Default: 0.18"}
// @input float pickedCardScale = 0.36 {"hint":"Scale of cards when picked / placed in world (big). Default: 0.36"}
// @input float carouselRadius = 6.5 {"hint":"Minimum radius (cm) of the carousel circle. Default: 2.5"}
// @input float carouselSwipeSensitivity = 0.65 {"hint":"Sensitivity of right-hand swipe to rotate carousel (0 = off, 1 = normal)"}
// @input float pinchBlockSwipeDistanceCm = 7.5 {"hint":"Index–thumb distance (cm) below which swipe is blocked (pinch or near-pinch). Increase if carousel still rotates when approaching to grab."}
// @input bool invertCarouselSwipeDirection {"hint":"If enabled, carousel only rotates counter-clockwise from swipe; otherwise clockwise only."}
// @input bool enablePinchGrabAssist = true {"hint":"Enable pinch grab assist when Frame grab is hard to trigger"}
// @input float pinchStartDistanceCm = 2.8 {"hint":"Pinch start distance (cm) between index and thumb"}
// @input float pinchReleaseDistanceCm = 4 {"hint":"Pinch release distance (cm) between index and thumb"}
// @input float pinchGrabRadiusCm = 16 {"hint":"Max distance (cm) from pinch center to card to start assist grab"}
// @input float carouselHideThreshold = 0.75 {"hint":"Hide when sin(angle) < -this (0 = only fade, no hide). Higher = pop/depop further behind wrist. Default 0.5 ≈ ~20° extra hidden each side."}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../Modules/Src/Assets/CardInteraction");
Object.setPrototypeOf(script, Module.CardInteraction.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("collectionCardScale", []);
    checkUndefined("pickedCardScale", []);
    checkUndefined("carouselRadius", []);
    checkUndefined("carouselSwipeSensitivity", []);
    checkUndefined("pinchBlockSwipeDistanceCm", []);
    checkUndefined("invertCarouselSwipeDirection", []);
    checkUndefined("enablePinchGrabAssist", []);
    checkUndefined("pinchStartDistanceCm", []);
    checkUndefined("pinchReleaseDistanceCm", []);
    checkUndefined("pinchGrabRadiusCm", []);
    checkUndefined("carouselHideThreshold", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
