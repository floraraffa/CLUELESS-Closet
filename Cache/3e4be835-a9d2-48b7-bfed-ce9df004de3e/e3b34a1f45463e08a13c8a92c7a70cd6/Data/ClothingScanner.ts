/**
 * ClothingScanner.ts — Image capture + OpenAI clothing analysis for Closet Club
 *
 * Handles:
 *   - High-resolution image capture via CameraModule
 *   - Camera frame freeze/restore for preview feedback
 *   - Base64 encoding of textures
 *   - OpenAI Vision API call with clothing and outfit interpretation prompt
 *   - Parsing and validating the JSON response into VehicleData
 *   - Depth-based 3D positioning of the closet card
 *
 * Exposes a single public method `scanVehicle()` returning closet item data or null.
 *
 * @author Closet Club
 * @license MIT
 */

import { OpenAI } from 'RemoteServiceGateway.lspkg/HostedExternal/OpenAI';
import { VehicleData, clampStat, getRarityLabel, normalizeScanContext } from './ClosetTypes';
import { getLanguage } from './Localization';

@component
export class ClothingScanner extends BaseScriptComponent {

    // =====================================================================
    // MODULES
    // =====================================================================
    private cameraModule: CameraModule = require('LensStudio:CameraModule');
    private depthModule: DepthModule = require('LensStudio:DepthModule');

    // =====================================================================
    // INPUTS
    // =====================================================================
    @input
    @allowUndefined
    @hint('"Camera Frame Photo" Image in Car Scan Interface (shows live preview + freeze frame)')
    cameraFrameImage: Image;

    @input
    @allowUndefined
    @hint('AudioTrackAsset for the camera shutter/capture sound effect')
    captureSoundAsset: AudioTrackAsset;

    @input
    @allowUndefined
    @hint('AudioComponent to play the capture sound')
    captureSoundPlayer: AudioComponent;

    @input
    @allowUndefined
    @hint('Vehicle Card SceneObject — used for depth-based 3D positioning')
    vehicleCard: SceneObject;

    // =====================================================================
    // INPUTS - Card positioning parameters
    // =====================================================================
    @input
    @hint('X offset from vehicle (cm)')
    cardOffsetX: number = 0;

    @input
    @hint('Y offset above vehicle (cm, height above roof)')
    cardOffsetY: number = 80;

    @input
    @hint('Z offset from vehicle (cm)')
    cardOffsetZ: number = 0;

    @input
    @hint('Base scale of Vehicle Card (recommended: 2)')
    cardBaseScale: number = 2;

    @input
    @hint('Minimum card scale (recommended: 1.5)')
    cardMinScale: number = 1.5;

    @input
    @hint('Maximum card scale (recommended: 4)')
    cardMaxScale: number = 4;

    @input
    @hint('Enable anti-cheat detection (rejects screens, photos, prints). Disable for testing with TV/monitor.')
    enableAntiCheat: boolean = true;

    // =====================================================================
    // INTERNAL STATE
    // =====================================================================
    private depthSession: DepthFrameSession;
    private latestDepthData: DepthFrameData | null = null;
    private cameraTexture: Texture;
    private isScanning: boolean = false;
    private _lastRejectionReason: string = '';

    // High quality base64 for GPT-4o analysis
    private lastCapturedBase64: string = '';
    // Medium quality base64 for gpt-image-1 editing (smaller payload, passes proxy limits)
    private lastCapturedBase64Edit: string = '';
    // Last captured texture, used to show the real garment/look on the result card.
    private lastCapturedTexture: Texture | null = null;

    private readonly DEFAULT_BASE_SCALE: number = 2;
    private readonly DEFAULT_MIN_SCALE: number = 1.5;
    private readonly DEFAULT_MAX_SCALE: number = 4;
    private readonly NO_VEHICLE_MARKER: string = 'NO_VEHICLE';

    // =====================================================================
    // LIFECYCLE
    // =====================================================================
    onAwake(): void {
        this.createEvent('OnStartEvent').bind(() => {
            this.setupDepthTracking();
        });

        this.createEvent('OnDestroyEvent').bind(() => {
            if (this.depthSession) this.depthSession.stop();
        });
    }

    // =====================================================================
    // PUBLIC API
    // =====================================================================

    /**
     * Main entry point — captures an image, sends to OpenAI, returns VehicleData or null.
     * Also positions the Vehicle Card above the vehicle via depth data.
     * Throws on fatal errors. Returns null if no vehicle detected.
     */
    async scanVehicle(): Promise<VehicleData | null> {
        if (this.isScanning) {
            print('ClothingScanner: Scan already in progress');
            return null;
        }

        this.isScanning = true;
        this._lastRejectionReason = '';
        try {
            // Step 1: Capture image
            print('ClothingScanner: Capturing image...');
            const base64Image = await this.captureImage();

            // Store for CollectionManager (real photo for Image Edit)
            this.lastCapturedBase64 = base64Image;

            // Step 2: Send to OpenAI for identification
            print('ClothingScanner: Sending to GPT-4o Vision...');
            const vehicleData = await this.analyzeVehicle(base64Image);

            if (!vehicleData) {
                print('ClothingScanner: No vehicle detected');
                return null;
            }

            print('ClothingScanner: Vehicle identified: ' + vehicleData.brand_model);

            // Step 3: Position card above vehicle via depth
            this.positionCardAboveVehicle();

            return vehicleData;
        } finally {
            this.isScanning = false;
        }
    }

    /** Returns true if a scan is currently in progress. */
    getIsScanning(): boolean {
        return this.isScanning;
    }

    /**
     * Returns the Base64-encoded image from the last scan (high quality, for GPT-4o).
     */
    getLastCapturedBase64(): string {
        return this.lastCapturedBase64;
    }

    /**
     * Returns a compressed version of the captured image for gpt-image-1 editing.
     * Smaller payload to pass through the Snap proxy reliably.
     */
    getLastCapturedBase64ForEdit(): string {
        return this.lastCapturedBase64Edit.length > 0 ? this.lastCapturedBase64Edit : this.lastCapturedBase64;
    }

    /** Returns the latest captured camera texture for UI preview cards. */
    getLastCapturedTexture(): Texture | null {
        return this.lastCapturedTexture;
    }

    /** Returns the anti-cheat rejection reason from the last scan, or empty string if none. */
    getLastRejectionReason(): string {
        return this._lastRejectionReason;
    }

    /** Restores live camera feed on the preview image. */
    restoreLiveCameraFeed(): void {
        if (!this.cameraFrameImage || !this.cameraTexture) return;
        this.cameraFrameImage.mainPass.baseTex = this.cameraTexture;
        print('ClothingScanner: Live camera feed restored');
    }

    // =====================================================================
    // DEPTH & CAMERA SETUP
    // =====================================================================
    private setupDepthTracking(): void {
        try {
            const cameraRequest = CameraModule.createCameraRequest();
            cameraRequest.cameraId = CameraModule.CameraId.Default_Color;
            this.cameraTexture = this.cameraModule.requestCamera(cameraRequest);
            print('ClothingScanner: Camera stream started');

            if (this.cameraFrameImage) {
                this.cameraFrameImage.mainPass.baseTex = this.cameraTexture;
                print('ClothingScanner: Live camera preview enabled');
            }

            this.depthSession = this.depthModule.createDepthFrameSession();
            this.depthSession.onNewFrame.add((depthData: DepthFrameData) => {
                this.latestDepthData = depthData;
            });
            this.depthSession.start();
            print('ClothingScanner: Depth tracking started');
        } catch (error) {
            print('ClothingScanner: Setup ERROR: ' + error);
            print('ClothingScanner: Enable "Experimental APIs" in Project Settings > Permissions');
        }
    }

    // =====================================================================
    // IMAGE CAPTURE
    // =====================================================================
    private async captureImage(): Promise<string> {
        // Attempt 1: Still image capture (preferred to guarantee freeze frame)
        const stillTexture = await this.requestStillCaptureTexture(2);
        if (stillTexture) {
            this.lastCapturedTexture = stillTexture;
            this.freezeCameraFrame(stillTexture);
            const base64 = await this.textureToBase64(stillTexture);
            print('ClothingScanner: HD image (' + Math.round((base64.length * 0.75) / 1024) + ' KB)');

            // Encode a smaller JPEG for gpt-image-1 image editing (~300KB vs 1.3MB)
            try {
                const editBase64 = await this.textureToBase64ForEdit(stillTexture);
                this.lastCapturedBase64Edit = editBase64;
                print('ClothingScanner: Edit JPEG (' + Math.round((editBase64.length * 0.75) / 1024) + ' KB)');
            } catch (editErr) {
                print('ClothingScanner: Edit encode failed, using HD: ' + editErr);
                this.lastCapturedBase64Edit = base64;
            }

            return base64;
        }

        // Attempt 2: Fallback to continuous camera stream
        if (!this.cameraTexture) {
            throw new Error('No camera source available');
        }

        print('ClothingScanner: Still capture unavailable — fallback to live stream texture (freeze may look less stable)');
        this.lastCapturedTexture = this.cameraTexture;
        this.freezeCameraFrame(this.cameraTexture);
        const base64 = await this.textureToBase64(this.cameraTexture);
        print('ClothingScanner: Camera stream image (' + Math.round((base64.length * 0.75) / 1024) + ' KB)');

        try {
            const editBase64 = await this.textureToBase64ForEdit(this.cameraTexture);
            this.lastCapturedBase64Edit = editBase64;
            print('ClothingScanner: Edit JPEG (' + Math.round((editBase64.length * 0.75) / 1024) + ' KB)');
        } catch (editErr) {
            this.lastCapturedBase64Edit = base64;
        }

        return base64;
    }

    private async requestStillCaptureTexture(maxAttempts: number): Promise<Texture | null> {
        for (let attempt = 1; attempt <= maxAttempts; attempt++) {
            try {
                print('ClothingScanner: Still capture attempt #' + attempt + '...');
                const imageRequest = CameraModule.createImageRequest();
                const imageFrame = await this.cameraModule.requestImage(imageRequest);
                if (imageFrame && imageFrame.texture) {
                    return imageFrame.texture;
                }
            } catch (err) {
                print('ClothingScanner: Still capture failed #' + attempt + ': ' + err);
            }
            if (attempt < maxAttempts) {
                await this.delay(0.06);
            }
        }
        return null;
    }

    private delay(seconds: number): Promise<void> {
        return new Promise<void>((resolve) => {
            const ev = this.createEvent('DelayedCallbackEvent') as any;
            ev.bind(() => resolve());
            ev.reset(seconds);
        });
    }

    private freezeCameraFrame(capturedTexture: Texture): void {
        if (!this.cameraFrameImage) return;
        this.cameraFrameImage.mainPass.baseTex = capturedTexture;
        this.playCaptureSound();
    }

    private playCaptureSound(): void {
        if (!this.captureSoundPlayer || !this.captureSoundAsset) return;
        try {
            this.captureSoundPlayer.audioTrack = this.captureSoundAsset;
            this.captureSoundPlayer.play(1);
        } catch (e) {
            print('ClothingScanner: Capture sound error: ' + e);
        }
    }

    // =====================================================================
    // IMAGE -> BASE64 ENCODING
    // =====================================================================
    private textureToBase64(texture: Texture): Promise<string> {
        return new Promise<string>((resolve, reject) => {
            try {
                Base64.encodeTextureAsync(
                    texture,
                    (base64String: string) => resolve(base64String),
                    () => reject(new Error('Failed to encode texture to base64')),
                    CompressionQuality.HighQuality,
                    EncodingType.Jpg
                );
            } catch (error) {
                reject(error);
            }
        });
    }

    private textureToBase64ForEdit(texture: Texture): Promise<string> {
        return new Promise<string>((resolve, reject) => {
            try {
                Base64.encodeTextureAsync(
                    texture,
                    (base64String: string) => resolve(base64String),
                    () => reject(new Error('Failed to encode texture for edit')),
                    CompressionQuality.LowQuality,
                    EncodingType.Jpg
                );
            } catch (error) {
                reject(error);
            }
        });
    }

    // =====================================================================
    // OPENAI VISION ANALYSIS
    // =====================================================================
    private async analyzeVehicle(base64Image: string): Promise<VehicleData | null> {
        const antiCheatBlock = this.enableAntiCheat ? `
REAL-WORLD SCAN CHECK:
Prefer direct camera captures of physical wardrobe items (garments, shoes/footwear, bags, accessories) or outfits.
Only reject if the image is a screen, poster, catalog page, advertisement, or a scene with no wearable item at all.
Real standalone shoes, bags, hats, and accessories ARE valid wardrobe items — accept them, never reject them.
{
  "vehicle_found": false,
  "clothing_found": false,
  "rejection_reason": "NO_CLOTHING_DETECTED",
  "brand": "",
  "brand_model": "NO_CLOTHING",
  "item_name": "NO_CLOTHING",
  "type": "unknown",
  "category": "unknown",
  "year": "",
  "top_speed": 0, "acceleration": 0, "braking": 0, "traction": 0, "comfort": 0,
  "rarity": 0, "rarity_label": "", "scene": "", "feedback": ""
}
` : `
TESTING MODE: Identify visible garments or outfits even if the image is a screen/photo/reference.
`;

        const systemPrompt = `You are Closet Club, an AI wardrobe stylist for Spectacles. Analyze the image and respond ONLY with valid JSON.

If ONE wardrobe item is clearly visible (a garment, a pair of shoes/footwear, a bag, a hat, or an accessory), identify it:
{
  "vehicle_found": true,
  "clothing_found": true,
  "mode": "single_item",
  "scan_context": "hanger",
  "brand": "",
  "brand_model": "Black oversized blazer",
  "item_name": "Black oversized blazer",
  "type": "outerwear",
  "category": "outerwear",
  "subcategory": "blazer",
  "year": "2020s",
  "collection": "unknown",
  "collection_year": "2020s",
  "quality": "good",
  "color": "black",
  "material": "wool blend",
  "pattern": "solid",
  "fit": "oversized",
  "condition": "good",
  "style_tags": ["minimal", "smart casual"],
  "occasion_tags": ["work", "dinner", "city"],
  "season_tags": ["fall", "winter", "spring"],
  "items": [],
  "look_summary": "",
  "suggested_pairings": ["straight denim", "white t-shirt", "loafers", "minimal sneakers"],
  "pairing_note": "Pairs well with light denim, crisp white tops, or tailored trousers already in the closet.",
  "feedback": "A versatile blazer that can dress up denim or complete a minimal evening outfit.",
  "confidence": 0.86,
  "top_speed": 3,
  "acceleration": 1,
  "braking": 4,
  "traction": 5,
  "comfort": 5,
  "rarity": 3,
  "rarity_label": "Versatile",
  "scene": "brief context around the item"
}

If a FULL OUTFIT or multiple garments are visible, identify the look:
{
  "vehicle_found": true,
  "clothing_found": true,
  "mode": "full_look",
  "scan_context": "worn",
  "brand": "",
  "brand_model": "Relaxed minimal casual look",
  "item_name": "Relaxed minimal casual look",
  "type": "look",
  "category": "look",
  "subcategory": "casual outfit",
  "year": "2020s",
  "collection": "personal wardrobe",
  "collection_year": "2020s",
  "quality": "good",
  "color": "white, light blue, white",
  "material": "",
  "pattern": "mostly solid",
  "fit": "relaxed",
  "condition": "",
  "style_tags": ["casual", "minimal", "daytime"],
  "occasion_tags": ["coffee", "errands", "casual office"],
  "season_tags": ["spring", "summer"],
  "items": [
    {"item_name": "White cotton t-shirt", "brand": "", "category": "top", "subcategory": "t-shirt", "color": "white", "material": "cotton", "pattern": "solid", "fit": "regular", "condition": "good", "style_tags": ["casual", "minimal"], "occasion_tags": ["everyday", "weekend"], "season_tags": ["spring", "summer"], "suggested_pairings": ["denim jacket", "chinos", "white sneakers"], "feedback": "A clean basic that anchors most casual looks.", "confidence": 0.84, "top_speed": 4, "acceleration": 5, "braking": 5, "traction": 1, "comfort": 4, "rarity": 1, "rarity_label": "Basic"},
    {"item_name": "Light blue straight jeans", "brand": "", "category": "bottom", "subcategory": "straight jeans", "color": "light blue", "material": "denim", "pattern": "solid", "fit": "straight", "condition": "good", "style_tags": ["casual", "denim"], "occasion_tags": ["everyday"], "season_tags": ["all season"], "suggested_pairings": ["white tee", "sneakers", "overshirt"], "feedback": "Versatile straight denim that pairs with almost anything.", "confidence": 0.82, "top_speed": 4, "acceleration": 5, "braking": 5, "traction": 2, "comfort": 4, "rarity": 2, "rarity_label": "Everyday"},
    {"item_name": "White leather sneakers", "brand": "", "category": "shoes", "subcategory": "sneakers", "color": "white", "material": "leather", "pattern": "solid", "fit": "true to size", "condition": "good", "style_tags": ["minimal", "clean"], "occasion_tags": ["everyday", "casual office"], "season_tags": ["spring", "summer", "fall"], "suggested_pairings": ["denim", "chinos", "tee"], "feedback": "Crisp white sneakers that lift any casual outfit.", "confidence": 0.8, "top_speed": 4, "acceleration": 5, "braking": 4, "traction": 2, "comfort": 4, "rarity": 2, "rarity_label": "Everyday"}
  ],
  "look_summary": "Relaxed minimal casual outfit.",
  "suggested_pairings": ["oversized blazer", "denim jacket", "cap", "crossbody bag"],
  "pairing_note": "This look can be upgraded with a blazer or softened with a denim jacket if those exist in the closet.",
  "feedback": "The look is cohesive and easy to wear. Add a jacket or accessory to make it more intentional.",
  "confidence": 0.82,
  "top_speed": 3,
  "acceleration": 2,
  "braking": 4,
  "traction": 4,
  "comfort": 4,
  "rarity": 3,
  "rarity_label": "Versatile",
  "scene": "brief context around the outfit"
}
${antiCheatBlock}
Rules:
- ALWAYS return valid JSON. Never add text outside JSON.
- Detect any physical wardrobe item — garments, footwear/shoes (sneakers, boots, heels, sandals, loafers), bags, hats, jewelry and accessories — whether laid out on a surface, on a shelf, on hangers, held in hand, or worn by a person.
- Do not identify private sensitive traits of a person. Focus only on visible clothing and styling.
- Use "scan_context" values: worn, flat_lay, hanger, rack, mannequin, unknown.
- Use category values: top, bottom, shoes, outerwear, accessory, dress, look, unknown.
- Use "brand_model" and "item_name" as the same user-facing display title.
- If there is visible brand text/logo, put it in "brand"; otherwise leave brand as an empty string.
- "year" is the visible or inferred era/year. Use exact year only if visible on label/tag/print; otherwise use ranges like "2020s", "vintage 1990s", or "".
- "collection" is the visible collection/drop/line if readable, otherwise "unknown" or a useful wardrobe grouping.
- "collection_year" is the visible or inferred collection year/season, e.g. "SS24", "FW23", "2020s", or "".
- "quality" is a brief condition/material quality estimate: poor, fair, good, premium, luxury, or unknown.
- "suggested_pairings" lists 3-5 item types/colors that would combine well with this scan.
- "pairing_note" is one short sentence explaining what existing closet item types would pair well.
- "top_speed" is the Condition meter, 1-5.
- "acceleration" is the Versatility meter, 1-5.
- "braking" is the Matchability meter, 1-5.
- "traction" is the Uniqueness meter, 1-5.
- "comfort" is the Trend Score meter, 1-5.
- "rarity" is closet value: 1 Basic, 2 Everyday, 3 Versatile, 4 Statement, 5 Signature.
- "rarity_label" MUST match rarity: 1 "Basic", 2 "Everyday", 3 "Versatile", 4 "Statement", 5 "Signature".
- Keep "feedback" short, practical, and stylist-like. One sentence.
- If uncertain, use confidence below 0.7 and still make the best useful guess.
- A standalone pair of shoes, a bag, a hat, or an accessory ALWAYS counts as a usable item — identify it, never reject it.
- When a PERSON is wearing several garments (a mirror selfie or full outfit), use mode "full_look" and scan_context "worn", and put ONE complete object per worn garment in items[].
- In "full_look" mode, EACH items[] entry MUST be a full garment card with the SAME fields as a single-item scan: item_name, brand, category, subcategory, color, material, pattern, fit, condition, style_tags, occasion_tags, season_tags, suggested_pairings, feedback, confidence, the five meters (top_speed, acceleration, braking, traction, comfort), rarity, and rarity_label. Separate every distinct worn garment (top, layer/outerwear, bottom, shoes, dress, and notable accessories) into its own item so each can become its own card.
- Only if no wearable wardrobe item is visible at all (an empty scene or an unrelated object), return clothing_found false and brand_model "NO_CLOTHING".`;

        print('ClothingScanner: OpenAI call (image: ' + Math.round((base64Image.length * 0.75) / 1024) + ' KB)...');

        const response = await OpenAI.chatCompletions({
            model: 'gpt-4o',
            messages: [
                { role: 'system', content: systemPrompt },
                {
                    role: 'user',
                    content: [
                        {
                            type: 'image_url',
                            image_url: {
                                url: `data:image/jpeg;base64,${base64Image}`,
                                detail: 'high',
                            },
                        },
                        {
                            type: 'text',
                            text: 'Analyze this image for clothing or a full outfit. Return JSON only.',
                        },
                    ],
                },
            ],
            temperature: 0.2,
            // High enough to fit a full_look with several rich per-garment items
            // (single-item scans naturally use far fewer tokens).
            max_tokens: 4000,
        });

        const finishReason = response.choices[0].finish_reason;
        const content = response.choices[0].message.content;
        if (finishReason === 'length') {
            print('ClothingScanner: [WARN] Response truncated (finish_reason=length) — will attempt JSON repair');
        }
        print('ClothingScanner: OpenAI response: ' + content);

        const jsonMatch = content.match(/\{[\s\S]*\}/);
        if (!jsonMatch) {
            print('ClothingScanner: No JSON in response');
            return null;
        }

        try {
            let parsed: VehicleData;
            try {
                parsed = JSON.parse(jsonMatch[0]) as VehicleData;
            } catch (firstErr) {
                // Response was likely truncated mid-JSON — repair by balancing brackets and retry
                const repaired = this.repairTruncatedJson(jsonMatch[0]);
                parsed = JSON.parse(repaired) as VehicleData;
                print('ClothingScanner: Recovered a truncated JSON response (kept '
                    + (parsed.items ? parsed.items.length : 0) + ' items)');
            }

            if (this.enableAntiCheat && parsed.rejection_reason) {
                print('ClothingScanner: Scan rejected — ' + parsed.rejection_reason);
                this._lastRejectionReason = parsed.rejection_reason;
                return null;
            }

            // No clothing found? (Note: 'vehicle_found' is a legacy field the model fills
            // inconsistently — never reject on it; trust clothing_found + the NO_CLOTHING markers.)
            if (
                parsed.clothing_found === false ||
                parsed.brand_model === this.NO_VEHICLE_MARKER ||
                parsed.brand_model === 'NO_CLOTHING' ||
                parsed.brand_model.toLowerCase().includes('no_vehicle') ||
                parsed.brand_model.toLowerCase().includes('no vehicle') ||
                parsed.brand_model.toLowerCase().includes('no_clothing') ||
                parsed.brand_model.toLowerCase().includes('no clothing') ||
                parsed.brand_model.toLowerCase().includes('unknown')
            ) {
                return null;
            }

            parsed.vehicle_found = true;
            parsed.clothing_found = true;
            parsed.brand_model = parsed.item_name || parsed.brand_model;
            parsed.item_name = parsed.brand_model;
            parsed.scan_context = normalizeScanContext(parsed.scan_context);
            parsed.type = parsed.category || parsed.type || 'unknown';
            parsed.year = parsed.year || parsed.collection_year || '';
            parsed.collection = parsed.collection || 'unknown';
            parsed.collection_year = parsed.collection_year || parsed.year || '';
            parsed.quality = parsed.quality || parsed.condition || 'unknown';
            parsed.suggested_pairings = parsed.suggested_pairings || [];
            parsed.pairing_note = parsed.pairing_note || '';

            // Validate and clamp stats
            parsed.top_speed = clampStat(parsed.top_speed);
            parsed.acceleration = clampStat(parsed.acceleration);
            parsed.braking = clampStat(parsed.braking);
            parsed.traction = clampStat(parsed.traction);
            parsed.comfort = clampStat(parsed.comfort);
            parsed.rarity = clampStat(parsed.rarity || 2);
            parsed.rarity_label = getRarityLabel(parsed.rarity);

            // Normalize each worn-garment item (full_look mode) so every one can become its own card
            if (parsed.items && parsed.items.length > 0) {
                for (let i = 0; i < parsed.items.length; i++) {
                    const it = parsed.items[i];
                    if (!it) continue;
                    it.item_name = (it.item_name || it.subcategory || it.category || 'Garment').toString();
                    it.category = (it.category || 'unknown').toString();
                    it.top_speed = clampStat(it.top_speed);
                    it.acceleration = clampStat(it.acceleration);
                    it.braking = clampStat(it.braking);
                    it.traction = clampStat(it.traction);
                    it.comfort = clampStat(it.comfort);
                    it.rarity = clampStat(it.rarity || 2);
                    it.rarity_label = getRarityLabel(it.rarity);
                    it.suggested_pairings = it.suggested_pairings || [];
                    it.style_tags = it.style_tags || [];
                    it.occasion_tags = it.occasion_tags || [];
                    it.season_tags = it.season_tags || [];
                }
                print('ClothingScanner: full_look — ' + parsed.items.length + ' worn garments parsed');
            }

            print('ClothingScanner: Clothing: ' + parsed.brand_model +
                ' Category=' + parsed.type +
                ' Color=' + (parsed.color || 'N/A') +
                ' Value=' + parsed.rarity + ' (' + parsed.rarity_label + ')' +
                ' Confidence=' + (parsed.confidence || 0));

            return parsed;
        } catch (parseError) {
            print('ClothingScanner: JSON parse error: ' + parseError);
            return null;
        }
    }

    /**
     * Best-effort repair of a JSON string that was cut off (response hit the token
     * limit). Trims to the last complete object, then balances the still-open
     * brackets so a truncated full_look still yields the garments that came through.
     */
    private repairTruncatedJson(s: string): string {
        const start = s.indexOf('{');
        if (start > 0) s = s.substring(start);
        const lastBrace = s.lastIndexOf('}');
        if (lastBrace < 0) return s;
        const candidate = s.substring(0, lastBrace + 1);

        let inStr = false, esc = false, curly = 0, square = 0;
        for (let i = 0; i < candidate.length; i++) {
            const ch = candidate[i];
            if (inStr) {
                if (esc) { esc = false; }
                else if (ch === '\\') { esc = true; }
                else if (ch === '"') { inStr = false; }
                continue;
            }
            if (ch === '"') { inStr = true; }
            else if (ch === '{') { curly++; }
            else if (ch === '}') { curly--; }
            else if (ch === '[') { square++; }
            else if (ch === ']') { square--; }
        }
        let suffix = '';
        for (let i = 0; i < square; i++) suffix += ']';
        for (let i = 0; i < curly; i++) suffix += '}';
        return candidate + suffix;
    }

    // =====================================================================
    // 3D CARD POSITIONING (via depth data)
    // =====================================================================
    private positionCardAboveVehicle(): void {
        if (!this.vehicleCard) return;

        const cardTransform = this.vehicleCard.getTransform();

        const effectiveBaseScale = this.cardBaseScale <= 1 ? this.DEFAULT_BASE_SCALE : this.cardBaseScale;
        const effectiveMinScale = this.cardMinScale <= 1 ? this.DEFAULT_MIN_SCALE : this.cardMinScale;
        const effectiveMaxScale = this.cardMaxScale <= 1 ? this.DEFAULT_MAX_SCALE : this.cardMaxScale;

        // No depth data -> fallback position
        if (!this.latestDepthData) {
            cardTransform.setWorldPosition(new vec3(0, 80, -200));
            const s = effectiveBaseScale;
            cardTransform.setWorldScale(new vec3(s, s, s));
            return;
        }

        try {
            const depthCamera = this.latestDepthData.deviceCamera;
            const resolution = depthCamera.resolution;

            const normalizedCoord = new vec2(0.5, 0.5);
            const pixelX = Math.floor(0.5 * resolution.x);
            const pixelY = Math.floor(0.5 * resolution.y);
            const depthFrameIdx = pixelX + pixelY * resolution.x;
            const depthValue = this.latestDepthData.depthFrame[depthFrameIdx];

            // Validate depth (50cm to 20m)
            if (!depthValue || depthValue <= 50 || depthValue > 2000) {
                cardTransform.setWorldPosition(new vec3(0, 80, -200));
                const s = effectiveBaseScale;
                cardTransform.setWorldScale(new vec3(s, s, s));
                return;
            }

            // Unproject to 3D
            const point3D = depthCamera.unproject(normalizedCoord, depthValue);
            const worldFromDevice = this.latestDepthData.toWorldTrackingOriginFromDeviceRef;
            const vehicleWorldPos = worldFromDevice.multiplyPoint(point3D);

            const cardPosition = new vec3(
                vehicleWorldPos.x + this.cardOffsetX,
                vehicleWorldPos.y + this.cardOffsetY,
                vehicleWorldPos.z + this.cardOffsetZ
            );
            cardTransform.setWorldPosition(cardPosition);

            // Adaptive scale based on distance
            const distanceFactor = depthValue / 200.0;
            const scale = Math.max(effectiveMinScale, Math.min(effectiveMaxScale, effectiveBaseScale * distanceFactor));
            cardTransform.setWorldScale(new vec3(scale, scale, scale));

            // Orient facing camera (billboard)
            const cameraWorldPos = new vec3(
                worldFromDevice.column3.x,
                worldFromDevice.column3.y,
                worldFromDevice.column3.z
            );
            const toCamera = cameraWorldPos.sub(cardPosition);
            if (toCamera.length > 0.01) {
                cardTransform.setWorldRotation(quat.lookAt(toCamera.normalize(), vec3.up()));
            }

            print('ClothingScanner: Card positioned at depth=' + depthValue.toFixed(0) + 'cm, scale=' + scale.toFixed(2));
        } catch (error) {
            print('ClothingScanner: Positioning error: ' + error);
            cardTransform.setWorldPosition(new vec3(0, 80, -200));
            const s = effectiveBaseScale;
            cardTransform.setWorldScale(new vec3(s, s, s));
        }
    }
}
