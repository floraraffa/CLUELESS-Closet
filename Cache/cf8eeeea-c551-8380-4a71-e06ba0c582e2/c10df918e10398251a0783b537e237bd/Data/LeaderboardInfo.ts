import { LeaderboardCore } from "./LeaderboardCore";
import { LeaderboardRecordsWrapper } from "./Interfaces/LeaderboardRelated";

type RelativeIndexSign = "+" | "-";

enum PositionType {
    Absolute = 0,
    RelativeToCurrentUser = 1,
    CurrentUser = 2
}

@typedef
class BitmojiVisualSettings {

    @input
    visual: MaterialMeshVisual | null;

    @input("int")
    @widget(new ComboBoxWidget()
        .addItem("Absolute position", 0)
        .addItem("Relative to current user", 1)
        .addItem("Current user", 2))
    positionType: PositionType = PositionType.Absolute;

    @input("int")
    @showIf("positionType", 0)
    @widget(new SpinBoxWidget(0, 1000, 1))
    position: number = 0;

    @input("int")
    @showIf("positionType", 1)
    @widget(new SpinBoxWidget(-1000, 1000, 1))
    relativePosition: number = -1;

    @input
    textureParameter: string = "baseTex";

    @input
    @hint("If empty, the Leaderboard \"Custom Sticker Id\" will be used")
    stickerId: string = "";
}

@component
export class LeaderboardInfo extends LeaderboardCore {
    @input
    @showIf('autoInitialize', false)
    protected readonly autoInitialize: boolean = true;

    @ui.separator
    @input
    enableTextOnlyWhenLoaded: boolean = true;

    @input
    @hint('If true, text components will be disabled when none of the <b>required</b> tags are available, for example if there is no score in that position.<br>Optional tags do not affect this.')
    disableWhenAllRequiredTagsAreUndefined: boolean = true;

    @input
    texts: Text[];

    @input
    bitmojis: BitmojiVisualSettings[];

    @ui.group_start('Help')
    @ui.label('Code values for populating text components that will be replaced with leaderboard information:<br>')
    @ui.label('<code>{displayName[0]}</code>')
    @ui.label('<code>{username[0]}</code>')
    @ui.label('<code>{globalExactRank[0]}</code>')
    @ui.label('<code>{globalRankPercentile[0]}</code>')
    @ui.label('<code>{position[0]}</code>')
    @ui.label('<code>{score[0]}</code>')
    @ui.label('<code>{currentUserDisplayName}</code>')
    @ui.label('<code>{currentUserUsername}</code>')
    @ui.label('<code>{currentUserGlobalExactRank}</code>')
    @ui.label('<code>{currentUserGlobalRankPercentile}</code>')
    @ui.label('<code>{currentUserPosition}</code>')
    @ui.label('<code>{currentUserScore}</code>')
    @ui.label('<br>Replace <code>0</code> with the index you want to display, for example <code>{displayName[1]}</code> for the second record in the leaderboard.')
    @ui.label('<br>You can also use a (positive or negative) index relative to the current user, like <code>{displayName[+1]}</code> for record right after the current user record.')
    @ui.label('<br>Optional tags: add a <code>?</code> to make the tag optional. You can also add a default value like <code>{displayName[0]?No name}</code>.')
    @ui.group_end

    // tag can be {abc} but also array like {entry[0]}, optional like {entry?} and relative like {entry[+1]}
    // also supports default value like {entry?default text}
    private TAG_REGEX = /\{([a-zA-Z0-9]+)(\[([+\-])?(\d+)])?(?:(\?)([^}]+)?)?}/g;
    private originalTexts: Record<Text["uniqueIdentifier"], string> = {};
    private updatedTexts: Record<Text["uniqueIdentifier"], string> = {};
    private invisiblePixel: Texture;
    private bitmojiRequestIds: Record<Image["uniqueIdentifier"], number> = {};

    onAwake() {
        super.onAwake();
        if (!this.isInputValid()) {
            return;
        }

        for (const text of this.texts) {
            if (isNull(text) || isNull(text.getSceneObject())) {
                continue;
            }
            this.originalTexts[text.uniqueIdentifier] = text.text;
            if (this.enableTextOnlyWhenLoaded) {
                text.enabled = false;
            }
        }

        this.initializeInvisiblePixel();
        for (const bitmojiSettings of this.bitmojis) {
            if (isNull(bitmojiSettings.visual) || isNull(bitmojiSettings.visual.getSceneObject())) {
                continue;
            }
            bitmojiSettings.visual.mainPass[bitmojiSettings.textureParameter] = this.invisiblePixel;
        }

        this.onLeaderboardRecordsUpdated.add((records: LeaderboardRecordsWrapper) => {
            this.onRecordsUpdated(records);
        });

        this.createEvent("OnDisableEvent").bind(this.onDisable);
    }

    protected isInputValid(): boolean {
        if (!super.isInputValid()) {
            return false;
        }

        for (const bitmojiSettings of this.bitmojis) {
            if (bitmojiSettings.textureParameter.trim() === "") {
                this.printWarning(`Please set texture parameter for Bitmoji visual on "${bitmojiSettings.visual?.getSceneObject()?.name}"`);
                return false;
            }
            if (isNull(bitmojiSettings.visual)) {
                continue;
            }
            if (typeof bitmojiSettings.visual.mainPass[bitmojiSettings.textureParameter] === "undefined") {
                this.printWarning(`Material Pass parameter "${bitmojiSettings.textureParameter}" not found on Bitmoji visual on "${bitmojiSettings.visual?.getSceneObject()?.name}"`);
            }
        }
        return true;
    }

    protected onLeaderboardInfoRetrievedFailed(status) {
        super.onLeaderboardInfoRetrievedFailed(status);
        if (this.enableTextOnlyWhenLoaded) {
            this.onRecordsUpdated({ userRecords: this.allMergedRecords, currentUserRecord: this.currentUserRecord });
        }
    };

    private onRecordsUpdated(records: LeaderboardRecordsWrapper) {
        const currentUserIndex = this.getCurrentUserIndex(records.userRecords, records.currentUserRecord);
        this.updateBitmojis(records.userRecords, records.currentUserRecord, currentUserIndex);
        this.updateTexts(records.userRecords, records.currentUserRecord, currentUserIndex);
    }

    private updateTexts(records: Leaderboard.UserRecord[], currentUserRecord: Leaderboard.UserRecord | null, currentUserIndex: number) {
        for (const textComponent of this.texts) {
            if (isNull(textComponent) || isNull(textComponent.getSceneObject())) {
                this.printWarning(`Skipping text component for ${textComponent?.getSceneObject()?.name} because it has been destroyed.`);
                continue;
            }

            this.updateTextComponent(textComponent, records, currentUserRecord, currentUserIndex);
        }
    }

    private updateTextComponent(textComponent: Text, records: Leaderboard.UserRecord[], currentUserRecord: Leaderboard.UserRecord | null, currentUserIndex: number) {
        let requiredTagsCount = 0;
        let validRequiredTagsCount = 0;
        const textToParse = this.getTextToParse(textComponent);

        textComponent.text = textToParse.replace(this.TAG_REGEX, (match, ...tags) => {
            const tag = tags[0].toLowerCase();
            const isCurrentUser = tag.startsWith("currentuser");
            const relativeIndexSign: RelativeIndexSign | undefined = tags[2];
            let index = tags[3] ? parseInt(tags[3]) : null;
            const required = tags[4] !== '?';
            const defaultValue: string | undefined = tags[5];

            if (!isCurrentUser && (index === null || isNaN(index))) {
                this.printWarning(`Tag "${match}" is missing the index. Try with {${tags[0]}[0]} or {${tags[0]}[1]} etc.`);
                return match;
            }

            if (!isCurrentUser && relativeIndexSign) {
                if (relativeIndexSign === "+") {
                    index = currentUserIndex + index;
                } else if (relativeIndexSign === "-") {
                    index = currentUserIndex - index;
                }
            }

            if (required) {
                requiredTagsCount++;
            }

            const record = isCurrentUser ? currentUserRecord : records[index ?? 0];
            const mappings = this.getMappings(record, (isCurrentUser ? currentUserIndex : index) + 1);

            const mappingKey = isCurrentUser ? tag.replace(/^currentuser/, "") : tag;
            if (mappings && !(mappingKey in mappings)) {
                this.printWarning(`Tag "${match}" is not recognized`);
                return match;
            }

            const value = mappings?.[mappingKey];
            if (value !== undefined && value !== null) {
                if (required) {
                    validRequiredTagsCount++;
                }
                return value;
            } else {
                return defaultValue ?? "";
            }
        });
        this.updatedTexts[textComponent.uniqueIdentifier] = textComponent.text;

        if (this.disableWhenAllRequiredTagsAreUndefined) {
            textComponent.enabled = validRequiredTagsCount !== 0 || requiredTagsCount == 0;
        } else if (this.enableTextOnlyWhenLoaded) {
            textComponent.enabled = true;
        }
    }

    private getMappings(record: Leaderboard.UserRecord | null, position: number): Record<string, any> | null {
        if (!record) {
            return null;
        }

        return {
            "displayname": record.snapchatUser.displayName,
            "username": record.snapchatUser.userName,
            "globalexactrank": record.globalExactRank,
            "globalrankpercentile": record.globalRankPercentile,
            "position": position,
            "score": record?.score,
        };
    }

    private getTextToParse(textComponent: Text): string {
        const key = textComponent.uniqueIdentifier;
        if (key in this.updatedTexts) {
            // did an external script update the text?
            if (textComponent.text !== this.updatedTexts[key]) {
                this.originalTexts[key] = textComponent.text;
            }
        }
        return this.originalTexts[key];
    }

    private updateBitmojis(records: Leaderboard.UserRecord[], currentUserRecord: Leaderboard.UserRecord | null, currentUserIndex: number) {
        for (const bitmojiSettings of this.bitmojis) {
            const { visual, positionType, position, relativePosition } = bitmojiSettings;
            if (isNull(visual) || isNull(visual.getSceneObject())) {
                this.printWarning(`Skipping Bitmoji visual for ${visual?.getSceneObject()?.name} because it has been destroyed.`);
                continue;
            }

            let index: number = 0;
            switch (positionType) {
                case PositionType.Absolute:
                    index = position;
                    break;
                case PositionType.RelativeToCurrentUser:
                    index = currentUserIndex + relativePosition;
                    break;
                case PositionType.CurrentUser:
                    index = currentUserIndex;
                    break;
            }

            const isCurrentUser = positionType === PositionType.CurrentUser;
            const record = isCurrentUser ? currentUserRecord : records[index];

            visual.mainPass[bitmojiSettings.textureParameter] = this.invisiblePixel;
            if (isCurrentUser || (record && record.snapchatUser.hasBitmoji)) {
                this.updateBitmojiImage(bitmojiSettings, record?.snapchatUser);
            }
        }
    }

    private updateBitmojiImage(bitmojiSettings: BitmojiVisualSettings, snapchatUser: SnapchatUser | null) {
        this.bitmojiStickerLoader.dismissToken(this.bitmojiRequestIds[bitmojiSettings.visual.uniqueIdentifier]);
        const bitmojiRequestId = this.bitmojiStickerLoader.generateToken();
        this.bitmojiRequestIds[bitmojiSettings.visual.uniqueIdentifier] = bitmojiRequestId;
        const stickerId = (bitmojiSettings.stickerId || this.customStickerId) ?? "";

        this.bitmojiStickerLoader.loadForUser(snapchatUser, stickerId).then((texture: Texture) => {
            if (this.bitmojiStickerLoader.isTokenValid(bitmojiRequestId)) {
                bitmojiSettings.visual.mainPass[bitmojiSettings.textureParameter] = texture;
            }
        });
    }

    private getCurrentUserIndex(records: Leaderboard.UserRecord[], currentUserRecord: Leaderboard.UserRecord | null) {
        if (currentUserRecord) {
            for (let i = 0; i < records.length; i++) {
                if (records[i].snapchatUser.isSame(currentUserRecord.snapchatUser)) {
                    return i;
                }
            }
        }
        return -1;
    }

    private onDisable = () => {
        for (const textComponent of this.texts) {
            if (isNull(textComponent) || isNull(textComponent.getSceneObject())) {
                continue;
            }
            textComponent.text = this.getTextToParse(textComponent);
        }

        for (const bitmojiSettings of this.bitmojis) {
            if (isNull(bitmojiSettings.visual) || isNull(bitmojiSettings.visual.getSceneObject())) {
                continue;
            }
            this.bitmojiStickerLoader.dismissToken(this.bitmojiRequestIds[bitmojiSettings.visual.uniqueIdentifier]);
            bitmojiSettings.visual.mainPass[bitmojiSettings.textureParameter] = this.invisiblePixel;
        }
    };

    private initializeInvisiblePixel() {
        if ("createWithFormat" in ProceduralTextureProvider) {
            // @ts-ignore
            this.invisiblePixel = ProceduralTextureProvider.createWithFormat(1, 1, TextureFormat.R8G8B8A8_UNORM);
        } else {
            // @ts-ignore
            this.invisiblePixel = ProceduralTextureProvider.create(1, 1, Colorspace.RGBA);
        }
    }
}
