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
// @input SceneObject languageContainer {"hint":"\"Language Container\" SceneObject — shown first at launch for language selection"}
// @input SceneObject acceptButton {"hint":"\"Accept CapsuleButton\" SceneObject inside Language Container"}
// @input Component.Text acceptButtonText {"hint":"Text component of the Accept button label (child of Accept CapsuleButton)"}
// @input SceneObject languageButtonFR {"hint":"\"Language Button FR\" SceneObject"}
// @input SceneObject languageButtonEN {"hint":"\"Language Button EN\" SceneObject"}
// @input SceneObject languageButtonES {"hint":"\"Language Button ES\" SceneObject"}
// @input SceneObject welcomeContainer {"hint":"\"Welcome Container\" root SceneObject — shown after language is accepted"}
// @input Component.Text welcomeTitleText {"hint":"Title Text component in Welcome Container (\"Closet Club\")"}
// @input Component.Text welcomeDescriptionText {"hint":"Description Text component in Welcome Container"}
// @input Component.Text soloButtonText {"hint":"Text component inside Solo CapsuleButton"}
// @input Component.Text connectedLensButtonText {"hint":"Text component inside secondary mode CapsuleButton"}
// @input SceneObject soloButton {"hint":"\"Solo CapsuleButton\" SceneObject — starts solo mode"}
// @input SceneObject connectedLensButton {"hint":"\"Connected Lens CapsuleButton\" SceneObject — hidden/deprioritized for Closet Club MVP"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../Modules/Src/Assets/WelcomeManager");
Object.setPrototypeOf(script, Module.WelcomeManager.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    if (script.onAwake) {
       script.onAwake();
    }
});
