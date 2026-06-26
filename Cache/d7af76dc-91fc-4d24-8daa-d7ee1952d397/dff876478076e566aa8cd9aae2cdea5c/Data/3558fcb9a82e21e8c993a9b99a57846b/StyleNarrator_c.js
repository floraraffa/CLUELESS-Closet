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
// @input SceneObject fetchInfoButton {"hint":"\"Get More Info Button\" SceneObject (with RectangleButton)"}
// @input Component.Text carDescriptionText {"hint":"\"Car Description Subtitles\" Text for narrative description"}
// @input Component.AudioComponent ttsAudioPlayer {"hint":"AudioComponent for TTS playback"}
// @input SceneObject muteButton {"hint":"\"Mute Button\" SceneObject (with RectangleButton/BaseButton)"}
// @input Component.Text muteButtonText {"hint":"Text element under Mute Button to display mute/unmute icon"}
// @input Component.Text statusText {"hint":"\"Loading\" Text component on Car Scan Interface — unified status text (idle phrases, scanning, errors)"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../Modules/Src/Assets/StyleNarrator");
Object.setPrototypeOf(script, Module.StyleNarrator.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    if (script.onAwake) {
       script.onAwake();
    }
});
