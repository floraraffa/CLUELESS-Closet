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
// @input AssignableType vehicleScanner {"hint":"ClothingScanner script — handles image capture + OpenAI analysis"}
// @input AssignableType_1 vehicleCardUI {"hint":"ClosetCardUI script — handles Vehicle Card display + close button"}
// @input AssignableType_2 vehicleNarrator {"hint":"StyleNarrator script — handles description + TTS + text scroll"}
// @input AssignableType_3 brandLogoLoader {"hint":"BrandLogoLoader script — handles brand logo loading"}
// @input AssignableType_4 collectionManager {"hint":"CollectionManager script — handles save/load/delete, carousel, persistence"}
// @input AssignableType_5 cardInteraction {"hint":"CardInteraction script — handles hand tracking, grab/release, carousel auto-rotation"}
// @input AssignableType_6 xpManager {"hint":"XPManager script — handles XP, levels, prestige, daily streak, user card"}
// @input AssignableType_7 welcomeManager {"hint":"WelcomeManager script — handles welcome screen, mode selection"}
// @input AssignableType_8 cloudManager {"hint":"CloudManager script — handles Snap Cloud / Supabase integration (auth, profile + collection sync)"}
// @input AssignableType_9 analyticsManager {"hint":"AnalyticsManager script — lightweight session metrics, timing, and error tracking"}
// @input AssignableType_10 musicPlayer {"hint":"MusicPlayer script — background music ducking while narrator speaks"}
// @input SceneObject scanButton {"hint":"\"Scan Vehicle\" button SceneObject (with RectangleButton)"}
// @input SceneObject carScanInterface {"hint":"\"Car Scan Interface\" root SceneObject — hidden until Solo mode starts"}
// @input SceneObject scannerButton {"hint":"\"Scanner Button\" on the left hand — reopens Car Scan Interface if closed via (x)"}
// @input SceneObject openCollectionDebugButton {"hint":"\"Open Collection Debug\" button under Camera — opens carousel in front of camera for preview testing"}
// @input Component.AudioComponent sfxAudio {"hint":"Shared SFX AudioComponent used to play one-shot UI/game sounds"}
// @input Asset.AudioTrackAsset sfxScanWaiting {"hint":"SFX: scan waiting (between button press and vehicle card results)"}
// @input Asset.AudioTrackAsset sfxVehicleCardShown {"hint":"SFX: vehicle card displayed"}
// @input Asset.AudioTrackAsset sfxCardGenerationWaiting {"hint":"SFX: card generation waiting"}
// @input Asset.AudioTrackAsset sfxCardGenerationSuccess {"hint":"SFX: card generation success"}
// @input Asset.AudioTrackAsset sfxCardFlyToInventory {"hint":"SFX: generated card flies back to inventory"}
// @input Asset.AudioTrackAsset sfxCardGenerationFailed {"hint":"SFX: card generation failed"}
// @input Asset.AudioTrackAsset sfxReviewGenerationWaiting {"hint":"SFX: review audio/text generation waiting"}
// @input Asset.AudioTrackAsset sfxCheatDetected {"hint":"SFX: cheat attempt detected"}
// @input Asset.AudioTrackAsset sfxCheatReprimand {"hint":"SFX: cheat reprimand message"}
// @input Asset.AudioTrackAsset sfxPositiveProgress {"hint":"SFX: Style points+/Style Score+ (same sound)"}
// @input Asset.AudioTrackAsset sfxNegativeProgress {"hint":"SFX: Style Score- (same sound)"}
// @input Asset.AudioTrackAsset sfxLevelUp {"hint":"SFX: level up"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../Modules/Src/Assets/ClosetClubScanner");
Object.setPrototypeOf(script, Module.ClosetClubScanner.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("vehicleScanner", []);
    checkUndefined("vehicleCardUI", []);
    checkUndefined("vehicleNarrator", []);
    checkUndefined("brandLogoLoader", []);
    checkUndefined("collectionManager", []);
    checkUndefined("cardInteraction", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
