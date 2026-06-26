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
// @input SceneObject camDisplay {"hint":"Cam Display object under Camera Object — shown to remote players when scanning"}
// @input Asset.ObjectPrefab verticalCardPrefab {"hint":"Vertical Collector Card prefab — same as CollectionManager"}
// @input SceneObject collectionRoot {"hint":"Parent SceneObject for remote carousel cards (Remote Collection Root)"}
// @input SceneObject headDebugMesh {"hint":"Head Debug Mesh — cube placed at remote player head position for testing"}
// @input SceneObject headDebugMeshCustom {"hint":"Custom head mesh (e.g. different hat) — used only when local Snap username is GuillaumeDGNS"}
// @input float headDebugHeightOffset {"hint":"Height offset (cm) for Head Debug Mesh / hat above remote head. Positive = higher. Default: 0"}
// @input float headDebugDepthOffset {"hint":"Depth offset (cm) for Head Debug Mesh / hat along head forward axis. Positive = forward, negative = backward. Default: 0"}
// @input SceneObject confirmGiveContainer {"hint":"Confirm Give Card container — shown when someone requests your card"}
// @input SceneObject confirmGiveYesButton {"hint":"\"Yes\" button inside Confirm Give Card container"}
// @input SceneObject confirmGiveCancelButton {"hint":"\"Cancel\" button inside Confirm Give Card container"}
// @input Component.Text confirmGiveText {"hint":"Text component on Confirm Give Card — shows \"Give [card] to [player]?\""}
// @input SceneObject confirmTradeContainer {"hint":"Confirm Trade Card container — shown when a trade is proposed"}
// @input SceneObject remotePlayerInfoContainer {"hint":"XP Container — positioned above remote player head to show their level/prestige"}
// @input string remoteLevelBadgeUrlTemplate {"hint":"Fallback public URL template for remote level badges. Use {level}. Example: https://.../level-badges/lvl-{level}.png"}
// @input float remoteLevelBadgePadDigits = 2 {"hint":"Pad digits for {level} in remote badge URL template. Example: 2 => 01, 50"}
// @input float xpContainerHeightOffset = 25 {"hint":"Height offset (cm) for the XP container above the remote player head. Default: 25. Lower = closer to head."}
// @input SceneObject wristAnchor {"hint":"Left wrist anchor (Card Collection Container) — used to broadcast wrist position for remote carousel placement"}
// @input SceneObject worldMesh {"hint":"World Mesh SceneObject — enabled during colocation scanning to visualize environment, disabled after"}
// @input vec3 headRotationOffset {"hint":"Head rotation offset in degrees (X, Y, Z) — corrects mesh orientation vs camera. Default: (0, 180, 0). Adjust if hat appears upside down or sideways."}
// @input Component.Text colocationGuidanceText {"hint":"Colocated Guidance Text — dedicated text element for colocation flow messages (child of Camera Object). Avoids conflicts with XP Display."}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../Modules/Src/Assets/ConnectedLensManager");
Object.setPrototypeOf(script, Module.ConnectedLensManager.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("remoteLevelBadgeUrlTemplate", []);
    checkUndefined("remoteLevelBadgePadDigits", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
