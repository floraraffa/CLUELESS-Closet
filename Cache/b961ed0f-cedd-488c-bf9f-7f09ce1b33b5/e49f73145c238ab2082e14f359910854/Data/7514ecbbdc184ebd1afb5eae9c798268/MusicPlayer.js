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
exports.MusicPlayer = void 0;
var __selfType = requireType("./MusicPlayer");
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
const Localization_1 = require("./Localization");
let MusicPlayer = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var MusicPlayer = _classThis = class extends _classSuper {
        constructor() {
            super();
            // =====================================================================
            // INPUTS
            // =====================================================================
            this.tracks = this.tracks;
            this.audioPlayer = this.audioPlayer;
            this.playPauseButton = this.playPauseButton;
            this.prevTrackButton = this.prevTrackButton;
            this.nextTrackButton = this.nextTrackButton;
            this.playPauseText = this.playPauseText;
            this.trackNameText = this.trackNameText;
            this.autoPlay = this.autoPlay;
            this.loopPlaylist = this.loopPlaylist;
            this.volume = this.volume;
            this.narratorDuckMultiplier = this.narratorDuckMultiplier;
            // =====================================================================
            // INTERNAL STATE
            // =====================================================================
            this.currentTrackIndex = 0;
            this.isPlaying = false;
            this.isPaused = false;
            this.suppressNextFinishCallback = false;
            this.isNarrationDucked = false;
        }
        __initialize() {
            super.__initialize();
            // =====================================================================
            // INPUTS
            // =====================================================================
            this.tracks = this.tracks;
            this.audioPlayer = this.audioPlayer;
            this.playPauseButton = this.playPauseButton;
            this.prevTrackButton = this.prevTrackButton;
            this.nextTrackButton = this.nextTrackButton;
            this.playPauseText = this.playPauseText;
            this.trackNameText = this.trackNameText;
            this.autoPlay = this.autoPlay;
            this.loopPlaylist = this.loopPlaylist;
            this.volume = this.volume;
            this.narratorDuckMultiplier = this.narratorDuckMultiplier;
            // =====================================================================
            // INTERNAL STATE
            // =====================================================================
            this.currentTrackIndex = 0;
            this.isPlaying = false;
            this.isPaused = false;
            this.suppressNextFinishCallback = false;
            this.isNarrationDucked = false;
        }
        // =====================================================================
        // LIFECYCLE
        // =====================================================================
        onAwake() {
            print('MusicPlayer: Initializing...');
            if (!this.audioPlayer) {
                print('MusicPlayer: ERROR - audioPlayer not assigned!');
                return;
            }
            if (!this.tracks || this.tracks.length === 0) {
                print('MusicPlayer: WARNING - no tracks in playlist');
                return;
            }
            print('MusicPlayer: ' + this.tracks.length + ' tracks loaded');
            // Set initial output volume
            this.applyOutputVolume();
            // Register finish callback to auto-advance to next track
            this.audioPlayer.setOnFinish(() => {
                if (this.suppressNextFinishCallback) {
                    this.suppressNextFinishCallback = false;
                    print('MusicPlayer: onFinish ignored (manual pause/stop)');
                    return;
                }
                if (this.isPaused) {
                    print('MusicPlayer: onFinish ignored (currently paused)');
                    return;
                }
                print('MusicPlayer: Track finished');
                this.onTrackFinished();
            });
            // Wait for SIK/UIKit to initialize
            this.createEvent('OnStartEvent').bind(() => {
                this.setupButtons();
                if (this.autoPlay) {
                    this.playTrack(0);
                }
                else {
                    this.updatePlayPauseIcon();
                    this.updateTrackNameDisplay();
                }
            });
        }
        // =====================================================================
        // BUTTON SETUP
        // =====================================================================
        setupButtons() {
            // Play/Pause button
            if (this.playPauseButton) {
                const ok = this.bindButtonEvent(this.playPauseButton, () => this.onPlayPausePressed(), 'Play/Pause');
                if (!ok)
                    print('MusicPlayer: Play/Pause: no supported button event found');
            }
            // Previous Track button
            if (this.prevTrackButton) {
                const ok = this.bindButtonEvent(this.prevTrackButton, () => this.onPrevTrackPressed(), 'Prev Track');
                if (!ok)
                    print('MusicPlayer: Prev Track: no supported button event found');
            }
            // Next Track button
            if (this.nextTrackButton) {
                const ok = this.bindButtonEvent(this.nextTrackButton, () => this.onNextTrackPressed(), 'Next Track');
                if (!ok)
                    print('MusicPlayer: Next Track: no supported button event found');
            }
        }
        bindButtonEvent(root, cb, label) {
            const toCheck = [root];
            const childCount = root.getChildrenCount();
            for (let i = 0; i < childCount; i++) {
                const child = root.getChild(i);
                if (child)
                    toCheck.push(child);
            }
            for (let i = 0; i < toCheck.length; i++) {
                const obj = toCheck[i];
                const scripts = obj.getComponents('Component.ScriptComponent');
                for (let j = 0; j < scripts.length; j++) {
                    const s = scripts[j];
                    if (!s)
                        continue;
                    if (s.onTriggerUp && typeof s.onTriggerUp.add === 'function') {
                        s.onTriggerUp.add(cb);
                        print('MusicPlayer: ' + label + ' button connected (trigger)');
                        return true;
                    }
                    if (s.onButtonPinched && typeof s.onButtonPinched.add === 'function') {
                        s.onButtonPinched.add(cb);
                        print('MusicPlayer: ' + label + ' button connected (pinch)');
                        return true;
                    }
                }
            }
            return false;
        }
        // =====================================================================
        // PLAYBACK CONTROLS
        // =====================================================================
        /**
         * Plays the track at the given index.
         */
        playTrack(index) {
            if (!this.tracks || this.tracks.length === 0)
                return;
            if (!this.audioPlayer)
                return;
            // Clamp index
            if (index < 0)
                index = this.loopPlaylist ? this.tracks.length - 1 : 0;
            if (index >= this.tracks.length)
                index = this.loopPlaylist ? 0 : this.tracks.length - 1;
            this.currentTrackIndex = index;
            const track = this.tracks[this.currentTrackIndex];
            if (!track) {
                print('MusicPlayer: Track at index ' + index + ' is null');
                return;
            }
            try {
                this.audioPlayer.audioTrack = track;
                this.applyOutputVolume();
                this.audioPlayer.play(1);
                this.isPlaying = true;
                this.isPaused = false;
                print('MusicPlayer: Playing track ' + (this.currentTrackIndex + 1) + '/' + this.tracks.length);
            }
            catch (e) {
                print('MusicPlayer: Error playing track: ' + e);
            }
            this.updatePlayPauseIcon();
            this.updateTrackNameDisplay();
        }
        /**
         * Called when Play/Pause button is pressed.
         */
        onPlayPausePressed() {
            if (!this.audioPlayer)
                return;
            if (this.isPlaying && !this.isPaused) {
                // Currently playing → pause
                try {
                    this.suppressNextFinishCallback = true;
                    this.audioPlayer.pause();
                    this.isPaused = true;
                    print('MusicPlayer: Paused');
                }
                catch (e) {
                    print('MusicPlayer: Pause error: ' + e);
                }
            }
            else if (this.isPaused) {
                // Currently paused → resume
                try {
                    this.audioPlayer.resume();
                    this.applyOutputVolume();
                    this.isPaused = false;
                    print('MusicPlayer: Resumed');
                }
                catch (e) {
                    print('MusicPlayer: Resume error: ' + e);
                }
            }
            else {
                // Not playing at all → start from current track
                this.playTrack(this.currentTrackIndex);
            }
            this.updatePlayPauseIcon();
        }
        /**
         * Lowers/restores music volume while narrator TTS is speaking.
         * true => duck to baseVolume * narratorDuckMultiplier
         * false => restore base volume
         */
        setNarrationDucked(ducked) {
            this.isNarrationDucked = ducked;
            this.applyOutputVolume();
        }
        applyOutputVolume() {
            if (!this.audioPlayer)
                return;
            const base = Math.max(0, Math.min(1, this.volume));
            const duck = Math.max(0, Math.min(1, this.narratorDuckMultiplier));
            this.audioPlayer.volume = this.isNarrationDucked ? base * duck : base;
        }
        /**
         * Called when Previous Track button is pressed.
         */
        onPrevTrackPressed() {
            print('MusicPlayer: Previous track');
            // Stop current playback
            try {
                this.suppressNextFinishCallback = true;
                this.audioPlayer.stop(true);
            }
            catch (e) {
                // ignore
            }
            this.playTrack(this.currentTrackIndex - 1);
        }
        /**
         * Called when Next Track button is pressed.
         */
        onNextTrackPressed() {
            print('MusicPlayer: Next track');
            // Stop current playback
            try {
                this.suppressNextFinishCallback = true;
                this.audioPlayer.stop(true);
            }
            catch (e) {
                // ignore
            }
            this.playTrack(this.currentTrackIndex + 1);
        }
        /**
         * Called when the current track finishes playing.
         * Auto-advances to the next track.
         */
        onTrackFinished() {
            const nextIndex = this.currentTrackIndex + 1;
            if (nextIndex >= this.tracks.length) {
                if (this.loopPlaylist) {
                    print('MusicPlayer: Playlist looping back to start');
                    this.playTrack(0);
                }
                else {
                    print('MusicPlayer: Playlist ended');
                    this.isPlaying = false;
                    this.isPaused = false;
                    this.updatePlayPauseIcon();
                }
            }
            else {
                this.playTrack(nextIndex);
            }
        }
        // =====================================================================
        // UI UPDATES
        // =====================================================================
        /**
         * Updates the play/pause emoji icon.
         */
        updatePlayPauseIcon() {
            if (!this.playPauseText)
                return;
            if (this.isPlaying && !this.isPaused) {
                this.playPauseText.text = '\u{23F8}'; // ⏸ pause icon
            }
            else {
                this.playPauseText.text = '\u{25B6}'; // ▶ play icon
            }
        }
        /**
         * Updates the track name display if a text element is assigned.
         */
        updateTrackNameDisplay() {
            if (!this.trackNameText)
                return;
            if (!this.tracks || this.tracks.length === 0) {
                this.trackNameText.text = (0, Localization_1.t)('no_tracks');
                return;
            }
            const track = this.tracks[this.currentTrackIndex];
            if (track && track.name) {
                this.trackNameText.text = track.name;
            }
            else {
                this.trackNameText.text = (0, Localization_1.tf)('track_n', { n: this.currentTrackIndex + 1 });
            }
        }
    };
    __setFunctionName(_classThis, "MusicPlayer");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        MusicPlayer = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return MusicPlayer = _classThis;
})();
exports.MusicPlayer = MusicPlayer;
//# sourceMappingURL=MusicPlayer.js.map