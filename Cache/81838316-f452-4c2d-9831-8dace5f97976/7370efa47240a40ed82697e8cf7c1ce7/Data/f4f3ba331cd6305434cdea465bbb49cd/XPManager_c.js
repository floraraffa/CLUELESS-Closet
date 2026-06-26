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
// @input SceneObject xpContainer {"hint":"XP Container SceneObject (above head — contains Level Badge, Level Number, XP counter, XP Bar)"}
// @input Component.Text levelNumberText {"hint":"\"Level Number\" Text component inside XP Container"}
// @input Component.Text xpCounterText {"hint":"\"XP counter\" Text component inside XP Container"}
// @input SceneObject xpBarParent {"hint":"\"XP Bar\" parent SceneObject inside XP Container (contains 5 Plane children)"}
// @input SceneObject levelBadge {"hint":"\"Level Badge\" SceneObject inside XP Container"}
// @input string levelBadgeUrlTemplate {"hint":"Public URL template for level badge PNG. Use {level}. Example: https://.../level-badges/lvl-{level}.png"}
// @input float levelBadgePadDigits = 2 {"hint":"Pad digits for {level} in badge URL template. Example: 2 => 01, 50"}
// @input SceneObject levelUpBadgeReveal {"hint":"Optional reveal badge object shown in front of camera on level-up (Image or RenderMeshVisual)."}
// @input Component.Text levelUpTitleText {"hint":"Optional Level Up title text (e.g. LEVEL UP!)."}
// @input Component.Text levelUpBodyText {"hint":"Optional Level Up body text (e.g. from level X to Y)."}
// @input float levelUpRevealHoldDuration = 2.6 {"hint":"Level-up popup hold duration in seconds (excluding fade-in/out)"}
// @input Component.Text xpDisplay {"hint":"\"XP Display\" Text component attached to Camera Object (floating +XP popup)"}
// @input SceneObject userCardInfo {"hint":"\"User Card Info\" SceneObject on the hand (contains Level Badge, Level Number, XP counter, XP Bar)"}
// @input SceneObject acknowledgeButton {"hint":"\"Acknowledge button\" SceneObject inside User Card Info — closes the card"}
// @input SceneObject userCardButton {"hint":"\"User Card Button\" SceneObject on the hand (toggles User Card Info)"}
// @input SceneObject prestigeButton {"hint":"\"Prestige Button\" SceneObject inside User Card Info — only visible at max level"}
// @input Component.Text userCardText {"hint":"\"User Card\" Text child inside User Card Button"}
// @input Component.Text usernameText {"hint":"\"Username\" Text component inside XP Container (displays Snapchat display name)"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../Modules/Src/Assets/XPManager");
Object.setPrototypeOf(script, Module.XPManager.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("levelBadgeUrlTemplate", []);
    checkUndefined("levelBadgePadDigits", []);
    checkUndefined("levelUpRevealHoldDuration", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
