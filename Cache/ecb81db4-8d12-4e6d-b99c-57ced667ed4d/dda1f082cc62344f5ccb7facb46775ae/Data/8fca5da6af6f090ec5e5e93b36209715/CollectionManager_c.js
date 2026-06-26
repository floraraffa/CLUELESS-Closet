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
// @input SceneObject saveButton {"hint":"\"Save\" button SceneObject on the Vehicle Card"}
// @input Asset.ObjectPrefab verticalCardPrefab {"hint":"ObjectPrefab for the Vertical Collector Card template"}
// @input SceneObject openCollectionButton {"hint":"\"Open Collection\" PinchButton SceneObject on the wrist"}
// @input Component.Text openCollectionButtonText {"hint":"Text component on the Open Collection button (toggles \"Open\" / \"Close\")"}
// @input SceneObject leftPalmAnchor {"hint":"Left palm anchor SceneObject (tracks the left palm center)"}
// @input SceneObject cardCollectionContainer {"hint":"Card Collection Container — SceneObject under Left Hand Wrist"}
// @input bool useWorldClosetView {"hint":"Show saved closet cards in front of the user instead of attached to the left wrist"}
// @input float closetViewDistance = 75 {"hint":"Distance in cm for the virtual closet view"}
// @input float closetViewHeightOffset = -8 {"hint":"Vertical offset in cm for the virtual closet view"}
// @input SceneObject garmentPlaceholderContainer {"hint":"Optional parent with Image/RenderMeshVisual children named Garment 1, Garment 2, etc."}
// @input bool generateGarmentCutoutOnSave = true {"hint":"Run GPT Image Edit on Save to remove the background and fill garment placeholders"}
// @input float garmentCutoutTimeoutSeconds = 60 {"hint":"Maximum seconds to wait for the AI closet image before keeping the scan photo"}
// @input float garmentCutoutMaxAttempts = 1 {"hint":"Maximum AI attempts for the closet cutout. Keep this at 1 for faster saves."}
// @input float maxGarmentPlaceholders = 2 {"hint":"Number of visible garment placeholder slots for the look builder"}
// @input float garmentPlaceholderColumns = 3 {"hint":"How many garment cards to place per row inside the closet list"}
// @input float garmentPlaceholderSpacing = 6 {"hint":"Spacing in cm between runtime garment placeholders"}
// @input float outfitSlotDropRadiusCm = 24 {"hint":"Drop radius in cm for dragging a bracelet card onto an outfit slot"}
// @input SceneObject shareCollectionButton {"hint":"\"Share Collection\" button on left hand (inside User Card Info)"}
// @input SceneObject confirmShareContainer {"hint":"\"Confirm Share Container\" with confirmation text, URL text, Yes/Cancel buttons"}
// @input SceneObject confirmShareYesButton {"hint":"\"Yes CapsuleButton\" inside Confirm Share Container"}
// @input SceneObject confirmShareCancelButton {"hint":"\"Cancel CapsuleButton\" inside Confirm Share Container"}
// @input Component.Text shareConfirmationText {"hint":"\"Collection Shared Confirmation\" Text — displays the URL after sharing"}
// @input SceneObject resetCollectionButton {"hint":"\"Reset Profile\" button inside User Card Info"}
// @input SceneObject confirmResetProfileContainer {"hint":"\"Confirm Reset Profile\" container with Yes/Cancel buttons"}
// @input SceneObject confirmResetYesButton {"hint":"\"Yes\" button inside Confirm Reset Profile Container"}
// @input SceneObject confirmResetCancelButton {"hint":"\"Cancel\" button inside Confirm Reset Profile Container"}
// @input SceneObject deleteCardButton {"hint":"\"Delete Card\" button on left hand"}
// @input SceneObject confirmDeleteContainer {"hint":"\"Confirm Delete Card\" container with Yes/Cancel buttons"}
// @input SceneObject confirmDeleteYesButton {"hint":"\"Yes\" button inside Confirm Delete Container"}
// @input SceneObject confirmDeleteCancelButton {"hint":"\"Cancel\" button inside Confirm Delete Container"}
// @input AssignableType brandLogoLoader {"hint":"BrandLogoLoader script reference (for loading logos onto collector cards)"}
// @input AssignableType_1 cardInteraction {"hint":"CardInteraction script reference (handles grab/release, auto-rotation, lerp)"}
// @input float maxCollectionSize = 100 {"hint":"Maximum number of cards in collection. Default: 100. Increase for premium users."}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../Modules/Src/Assets/CollectionManager");
Object.setPrototypeOf(script, Module.CollectionManager.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("useWorldClosetView", []);
    checkUndefined("closetViewDistance", []);
    checkUndefined("closetViewHeightOffset", []);
    checkUndefined("generateGarmentCutoutOnSave", []);
    checkUndefined("garmentCutoutTimeoutSeconds", []);
    checkUndefined("garmentCutoutMaxAttempts", []);
    checkUndefined("maxGarmentPlaceholders", []);
    checkUndefined("garmentPlaceholderColumns", []);
    checkUndefined("garmentPlaceholderSpacing", []);
    checkUndefined("outfitSlotDropRadiusCm", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
