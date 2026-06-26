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
// @input Asset.AudioTrackAsset[] tracks {"hint":"Array of AudioTrackAsset to use as playlist"}
// @input Component.AudioComponent audioPlayer {"hint":"AudioComponent dedicated to music playback"}
// @input SceneObject playPauseButton {"hint":"\"Play/Pause Button\" SceneObject (with RectangleButton/BaseButton)"}
// @input SceneObject prevTrackButton {"hint":"\"Previous Track Button\" SceneObject (with RectangleButton/BaseButton)"}
// @input SceneObject nextTrackButton {"hint":"\"Next Track Button\" SceneObject (with RectangleButton/BaseButton)"}
// @input Component.Text playPauseText {"hint":"Text element under Play/Pause button to show play/pause emoji icon"}
// @input Component.Text trackNameText {"hint":"Text element to display current track name (optional)"}
// @input bool autoPlay = true {"hint":"Auto-play first track on start"}
// @input bool loopPlaylist = true {"hint":"Loop playlist when reaching the end"}
// @input float volume = 0.5 {"hint":"Music volume (0.0 to 1.0)"}
// @input float narratorDuckMultiplier = 0.5 {"hint":"Volume multiplier while narrator speaks (0.5 = 50%)"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../Modules/Src/Assets/MusicPlayer");
Object.setPrototypeOf(script, Module.MusicPlayer.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("tracks", []);
    checkUndefined("audioPlayer", []);
    checkUndefined("autoPlay", []);
    checkUndefined("loopPlaylist", []);
    checkUndefined("volume", []);
    checkUndefined("narratorDuckMultiplier", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
