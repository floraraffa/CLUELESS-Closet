/**
 * LanguageVideoPlayer.ts — plays a remote video on a target Image while a watched
 * container is visible, and unloads it the moment the container disappears.
 *
 * Designed for the Language Container welcome screen: the video plays in place of
 * the coat photo, then is released (texture dropped, original photo restored) as
 * soon as the container is hidden.
 *
 * Uses ONLY the standard InternetModule + RemoteMediaModule — no Experimental API,
 * fully publishable to Lens Explorer. Needs a DIRECT .mp4 URL (HTTPS).
 *
 * Attach this to an ALWAYS-ENABLED object (e.g. the orchestrator), NOT to the
 * container itself — a disabled object stops updating and could never detect when
 * the container comes back.
 *
 * @author DGNS
 * @license MIT
 */

@component
export class LanguageVideoPlayer extends BaseScriptComponent {

    @input
    @hint('Direct URL to a .mp4 video (HTTPS, no login page). e.g. https://files.catbox.moe/xxxx.mp4')
    videoUrl: string = '';

    @input
    @hint('The Image to play the video on (the coat photo Image inside the Language Container).')
    targetImage: Image;

    @input
    @allowUndefined
    @hint('Container whose visibility drives the video (the Language Container). When it is disabled, the video unloads. Defaults to this object if unset.')
    watchContainer: SceneObject;

    @input
    @hint('Loop the video while the container is visible.')
    loopVideo: boolean = true;

    private internetModule: InternetModule = require('LensStudio:InternetModule');
    private remoteMediaModule: RemoteMediaModule = require('LensStudio:RemoteMediaModule');

    private fallbackTexture: Texture | null = null;
    private videoTexture: Texture | null = null;
    private videoControl: VideoTextureProvider | null = null;
    private isShown: boolean = false;
    private loadToken: number = 0;

    onAwake(): void {
        // Give the target Image its own material instance so swapping its texture
        // never affects other Images that share the same source material.
        if (this.targetImage && this.targetImage.mainMaterial) {
            try { this.targetImage.mainMaterial = this.targetImage.mainMaterial.clone(); } catch (e) { /* ignore */ }
        }
        // Remember the original photo so we can restore it on unload / failure.
        if (this.targetImage && this.targetImage.mainPass) {
            this.fallbackTexture = this.targetImage.mainPass.baseTex;
        }

        // Poll the watched container's visibility (works even while it is hidden,
        // because this script lives on an always-enabled object).
        this.createEvent('UpdateEvent').bind(() => this.tick());
    }

    private getWatched(): SceneObject {
        return this.watchContainer || this.sceneObject;
    }

    private tick(): void {
        const watched = this.getWatched();
        const visible = !!watched && watched.enabled;
        if (visible && !this.isShown) {
            this.isShown = true;
            this.showVideo();
        } else if (!visible && this.isShown) {
            this.isShown = false;
            this.hideVideo();
        }
    }

    private showVideo(): void {
        if (!this.videoUrl || this.videoUrl.length === 0 || !this.targetImage) return;

        this.loadToken++;
        const token = this.loadToken;
        try {
            const resource = this.internetModule.makeResourceFromUrl(this.videoUrl);
            this.remoteMediaModule.loadResourceAsVideoTexture(
                resource,
                (texture: Texture) => {
                    // Ignore if a newer request started or the container hid meanwhile.
                    if (token !== this.loadToken || !this.isShown) return;
                    this.applyVideo(texture);
                },
                (err: string) => {
                    print('LanguageVideoPlayer: video load failed, keeping photo: ' + err);
                }
            );
        } catch (e) {
            print('LanguageVideoPlayer: showVideo exception: ' + e);
        }
    }

    private applyVideo(texture: Texture): void {
        this.videoTexture = texture;
        if (this.targetImage && this.targetImage.mainPass) {
            this.targetImage.mainPass.baseTex = texture;
        }
        try {
            this.videoControl = texture.control as VideoTextureProvider;
            if (this.videoControl && typeof this.videoControl.play === 'function') {
                this.videoControl.play(this.loopVideo ? -1 : 1);
            }
        } catch (e) {
            print('LanguageVideoPlayer: play failed: ' + e);
        }
    }

    private hideVideo(): void {
        // Invalidate any in-flight load so a late callback can't re-apply the video.
        this.loadToken++;

        if (this.videoControl) {
            try { this.videoControl.stop(); } catch (e) { /* ignore */ }
        }
        this.videoControl = null;

        // Restore the original photo and drop the video texture so it can be freed.
        if (this.targetImage && this.targetImage.mainPass && this.fallbackTexture) {
            this.targetImage.mainPass.baseTex = this.fallbackTexture;
        }
        this.videoTexture = null;
    }
}
