"use strict";
var __esDecorate = (this && this.__esDecorate) || function (ctor, descriptorIn, decorators, contextIn, initializers, extraInitializers) {
    function accept(f) { if (f !== void 0 && typeof f !== "function") throw new TypeError("Function expected"); return f; }
    var kind = contextIn.kind, key = kind === "getter" ? "get" : kind === "setter" ? "set" : "value";
    var target = !descriptorIn && ctor ? contextIn["static"] ? ctor : ctor.prototype : null;
    var descriptor = descriptorIn || (target ? Object.getOwnPropertyDescriptor(target, contextIn.name) : {});
    var _, done = false;
    for (var i = decorators.length - 1; i >= 0; i--) {
        var context = {};
        for (var p in contextIn) context[p] = p === "access" ? {} : contextIn[p];
        for (var p in contextIn.access) context.access[p] = contextIn.access[p];
        context.addInitializer = function (f) { if (done) throw new TypeError("Cannot add initializers after decoration has completed"); extraInitializers.push(accept(f || null)); };
        var result = (0, decorators[i])(kind === "accessor" ? { get: descriptor.get, set: descriptor.set } : descriptor[key], context);
        if (kind === "accessor") {
            if (result === void 0) continue;
            if (result === null || typeof result !== "object") throw new TypeError("Object expected");
            if (_ = accept(result.get)) descriptor.get = _;
            if (_ = accept(result.set)) descriptor.set = _;
            if (_ = accept(result.init)) initializers.unshift(_);
        }
        else if (_ = accept(result)) {
            if (kind === "field") initializers.unshift(_);
            else descriptor[key] = _;
        }
    }
    if (target) Object.defineProperty(target, contextIn.name, descriptor);
    done = true;
};
var __runInitializers = (this && this.__runInitializers) || function (thisArg, initializers, value) {
    var useValue = arguments.length > 2;
    for (var i = 0; i < initializers.length; i++) {
        value = useValue ? initializers[i].call(thisArg, value) : initializers[i].call(thisArg);
    }
    return useValue ? value : void 0;
};
var __setFunctionName = (this && this.__setFunctionName) || function (f, name, prefix) {
    if (typeof name === "symbol") name = name.description ? "[".concat(name.description, "]") : "";
    return Object.defineProperty(f, "name", { configurable: true, value: prefix ? "".concat(prefix, " ", name) : name });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.WelcomeManager = void 0;
var __selfType = requireType("./WelcomeManager");
function component(target) {
    target.getTypeName = function () { return __selfType; };
    if (target.prototype.hasOwnProperty("getTypeName"))
        return;
    Object.defineProperty(target.prototype, "getTypeName", {
        value: function () { return __selfType; },
        configurable: true,
        writable: true
    });
}
/**
 * WelcomeManager.ts — Welcome screen, language selection & mode selection
 *
 * Flow:
 *   1. Language Container shows first (EN / FR / ES flags + Accept button)
 *   2. Clicking a flag sets the language and updates Accept button text live
 *   3. Clicking Accept hides Language Container, shows Welcome Container in selected language
 *   4. Solo mode starts the closet scanner.
 *
 * @author Closet Club
 * @license MIT
 */
const Localization_1 = require("./Localization");
let WelcomeManager = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var WelcomeManager = _classThis = class extends _classSuper {
        constructor() {
            super();
            // =====================================================================
            // INPUTS — Language Container
            // =====================================================================
            this.languageContainer = this.languageContainer;
            this.acceptButton = this.acceptButton;
            this.acceptButtonText = this.acceptButtonText;
            this.languageButtonFR = this.languageButtonFR;
            this.languageButtonEN = this.languageButtonEN;
            this.languageButtonES = this.languageButtonES;
            // =====================================================================
            // INPUTS — Welcome Container
            // =====================================================================
            this.welcomeContainer = this.welcomeContainer;
            this.welcomeTitleText = this.welcomeTitleText;
            this.welcomeDescriptionText = this.welcomeDescriptionText;
            this.soloButtonText = this.soloButtonText;
            this.soloButton = this.soloButton;
            // =====================================================================
            // CALLBACKS — Set by orchestrator
            // =====================================================================
            this.onSoloModeSelected = null;
            this.onShowMessage = null;
            this.onConnectButton = null;
            this.onLanguageSelected = null;
            // =====================================================================
            // INTERNAL STATE
            // =====================================================================
            this.buttonsConnected = false;
        }
        __initialize() {
            super.__initialize();
            // =====================================================================
            // INPUTS — Language Container
            // =====================================================================
            this.languageContainer = this.languageContainer;
            this.acceptButton = this.acceptButton;
            this.acceptButtonText = this.acceptButtonText;
            this.languageButtonFR = this.languageButtonFR;
            this.languageButtonEN = this.languageButtonEN;
            this.languageButtonES = this.languageButtonES;
            // =====================================================================
            // INPUTS — Welcome Container
            // =====================================================================
            this.welcomeContainer = this.welcomeContainer;
            this.welcomeTitleText = this.welcomeTitleText;
            this.welcomeDescriptionText = this.welcomeDescriptionText;
            this.soloButtonText = this.soloButtonText;
            this.soloButton = this.soloButton;
            // =====================================================================
            // CALLBACKS — Set by orchestrator
            // =====================================================================
            this.onSoloModeSelected = null;
            this.onShowMessage = null;
            this.onConnectButton = null;
            this.onLanguageSelected = null;
            // =====================================================================
            // INTERNAL STATE
            // =====================================================================
            this.buttonsConnected = false;
        }
        // =====================================================================
        // LIFECYCLE
        // =====================================================================
        onAwake() {
            (0, Localization_1.setLanguage)('en');
            if (this.languageContainer)
                this.languageContainer.enabled = true;
            if (this.welcomeContainer)
                this.welcomeContainer.enabled = false;
            this.createEvent('OnStartEvent').bind(() => {
                this.setupButtons();
                print('WelcomeManager: Language selection screen ready');
            });
        }
        // =====================================================================
        // PUBLIC API
        // =====================================================================
        show() {
            if (this.languageContainer)
                this.languageContainer.enabled = true;
            if (this.welcomeContainer)
                this.welcomeContainer.enabled = false;
            print('WelcomeManager: Language selection shown');
        }
        hide() {
            if (this.languageContainer)
                this.languageContainer.enabled = false;
            if (this.welcomeContainer)
                this.welcomeContainer.enabled = false;
            print('WelcomeManager: All containers hidden');
        }
        // =====================================================================
        // LANGUAGE SELECTION
        // =====================================================================
        selectLanguage(lang) {
            (0, Localization_1.setLanguage)(lang);
            if (this.acceptButtonText) {
                this.acceptButtonText.text = (0, Localization_1.t)('accept_button');
            }
            print('WelcomeManager: Language selected — ' + lang + ' → Accept="' + (0, Localization_1.t)('accept_button') + '"');
        }
        onAcceptPressed() {
            print('WelcomeManager: Accept pressed — language=' + (0, Localization_1.getLanguage)());
            if (this.languageContainer)
                this.languageContainer.enabled = false;
            this.applyWelcomeTranslations();
            if (this.welcomeContainer)
                this.welcomeContainer.enabled = true;
            if (this.onLanguageSelected)
                this.onLanguageSelected((0, Localization_1.getLanguage)());
        }
        applyWelcomeTranslations() {
            if (this.welcomeTitleText)
                this.welcomeTitleText.text = (0, Localization_1.t)('welcome_title');
            if (this.welcomeDescriptionText)
                this.welcomeDescriptionText.text = (0, Localization_1.t)('welcome_description');
            if (this.soloButtonText)
                this.soloButtonText.text = (0, Localization_1.t)('solo');
        }
        // =====================================================================
        // BUTTON SETUP
        // =====================================================================
        setupButtons() {
            if (this.buttonsConnected)
                return;
            // Language flag buttons
            this.connectButtonWithPolling(this.languageButtonFR, () => {
                this.selectLanguage('fr');
            }, 'LangFR');
            this.connectButtonWithPolling(this.languageButtonEN, () => {
                this.selectLanguage('en');
            }, 'LangEN');
            this.connectButtonWithPolling(this.languageButtonES, () => {
                this.selectLanguage('es');
            }, 'LangES');
            // Accept button
            this.connectButtonWithPolling(this.acceptButton, () => {
                this.onAcceptPressed();
            }, 'AcceptButton');
            // Solo button
            this.connectButtonWithPolling(this.soloButton, () => {
                print('WelcomeManager: Solo mode selected');
                this.hide();
                if (this.onSoloModeSelected)
                    this.onSoloModeSelected();
            }, 'SoloButton');
            this.buttonsConnected = true;
        }
        connectButtonWithPolling(buttonObj, callback, debugName) {
            if (!buttonObj) {
                print('WelcomeManager: [' + debugName + '] button not assigned');
                return;
            }
            if (this.onConnectButton) {
                const connected = this.onConnectButton(buttonObj, callback, debugName);
                if (connected) {
                    print('WelcomeManager: [' + debugName + '] connected via onConnectButton');
                    return;
                }
            }
            let attempts = 0;
            const maxAttempts = 300;
            let hooked = false;
            const pollEvent = this.createEvent('UpdateEvent');
            pollEvent.bind(() => {
                if (hooked) {
                    pollEvent.enabled = false;
                    return;
                }
                attempts++;
                if (attempts > maxAttempts) {
                    pollEvent.enabled = false;
                    return;
                }
                try {
                    const scripts = buttonObj.getComponents('Component.ScriptComponent');
                    for (let i = 0; i < scripts.length; i++) {
                        const script = scripts[i];
                        if (!script)
                            continue;
                        if (script.onButtonPinched && typeof script.onButtonPinched.add === 'function') {
                            script.onButtonPinched.add(() => callback());
                            hooked = true;
                            pollEvent.enabled = false;
                            print('WelcomeManager: [' + debugName + '] connected via onButtonPinched');
                            return;
                        }
                        if (script.onTriggerUp && typeof script.onTriggerUp.add === 'function') {
                            script.onTriggerUp.add(() => callback());
                            hooked = true;
                            pollEvent.enabled = false;
                            print('WelcomeManager: [' + debugName + '] connected via onTriggerUp');
                            return;
                        }
                    }
                }
                catch (e) { /* polling */ }
            });
        }
    };
    __setFunctionName(_classThis, "WelcomeManager");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        WelcomeManager = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return WelcomeManager = _classThis;
})();
exports.WelcomeManager = WelcomeManager;
//# sourceMappingURL=WelcomeManager.js.map