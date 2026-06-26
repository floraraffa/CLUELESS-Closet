"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.LeaderboardConstants = void 0;
var LeaderboardConstants;
(function (LeaderboardConstants) {
    let FullLeaderboard;
    (function (FullLeaderboard) {
        FullLeaderboard.PRELOAD_ENTRY_COUNT = 20;
        FullLeaderboard.VISIBLE_ENTRIES_COUNT = 3;
        FullLeaderboard.ENTRY_SIZE_Y = 2 / FullLeaderboard.VISIBLE_ENTRIES_COUNT;
        FullLeaderboard.ENTRIES_LIMIT_TOP_POSITION_Y = 1;
        FullLeaderboard.ENTRIES_NEEDED_FOR_SCROLL = 4;
        FullLeaderboard.MIN_Y_COORD_TO_SHOW_ENTRY = -1 - FullLeaderboard.ENTRY_SIZE_Y / 2;
        FullLeaderboard.MAX_Y_COORD_TO_SHOW_ENTRY = 1 + FullLeaderboard.ENTRY_SIZE_Y;
        FullLeaderboard.ENTRIES_BOTTOM_LIMIT_POSITION_HEADER = -1 + FullLeaderboard.ENTRY_SIZE_Y / 2;
        FullLeaderboard.ENTRIES_BOTTOM_LIMIT_POSITION_NO_HEADER = -1 + FullLeaderboard.ENTRY_SIZE_Y / 2;
        FullLeaderboard.ENTRIES_TOP_LIMIT_POSITION = FullLeaderboard.ENTRIES_LIMIT_TOP_POSITION_Y - FullLeaderboard.ENTRY_SIZE_Y / 2;
        FullLeaderboard.MASKING_CORNER_RADIUS_POINTS = 40;
        FullLeaderboard.MASKING_CORNER_RADIUS_WORLD = 0.40;
        let SIDE_SWITCHER_SETTINGS;
        (function (SIDE_SWITCHER_SETTINGS) {
            SIDE_SWITCHER_SETTINGS.ICON_OPACITY_DISABLED = 0.65;
            SIDE_SWITCHER_SETTINGS.ICON_OPACITY_ENABLED = 1;
        })(SIDE_SWITCHER_SETTINGS = FullLeaderboard.SIDE_SWITCHER_SETTINGS || (FullLeaderboard.SIDE_SWITCHER_SETTINGS = {}));
        let ANIMATION;
        (function (ANIMATION) {
            ANIMATION.CENTER_POS = new vec2(0, 0);
            ANIMATION.HIDE_POS = new vec2(0, -0.15);
            ANIMATION.DURATION_SHOW = 0.120;
            ANIMATION.DURATION_HIDE = 0.175;
        })(ANIMATION = FullLeaderboard.ANIMATION || (FullLeaderboard.ANIMATION = {}));
        let SETUP;
        (function (SETUP) {
            SETUP.FOOTER_SAFE_REGION_SIZE_Y = 0.064;
            SETUP.HEADER_SAFE_REGION_SIZE_Y = 0.115;
            SETUP.ENTRIES_SAFE_REGION_SIZE_Y = 0.39;
        })(SETUP = FullLeaderboard.SETUP || (FullLeaderboard.SETUP = {}));
        FullLeaderboard.INITIAL_PARENT_POSITION = new vec2(0, -50);
        FullLeaderboard.INITIAL_ALPHA = 0;
        FullLeaderboard.END_ALPHA = 1;
        FullLeaderboard.DAILY_RESET_STRING = "Resets daily";
        FullLeaderboard.WEEKLY_RESET_STRING = "Resets weekly";
        FullLeaderboard.MONTHLY_RESET_STRING = "Resets monthly";
        FullLeaderboard.YEARLY_RESET_STRING = "Resets yearly";
    })(FullLeaderboard = LeaderboardConstants.FullLeaderboard || (LeaderboardConstants.FullLeaderboard = {}));
    let SingleBadge;
    (function (SingleBadge) {
        SingleBadge.POSITION = new vec2(-0.70, -0.90);
        SingleBadge.POSITION_OUT_OF_SCREEN = new vec2(-3, -0.90);
        SingleBadge.ANIMATION_DURATION = 0.5;
    })(SingleBadge = LeaderboardConstants.SingleBadge || (LeaderboardConstants.SingleBadge = {}));
    let ScoresWidget;
    (function (ScoresWidget) {
        ScoresWidget.MAX_FRIENDS_TO_COUNT = 5;
        ScoresWidget.FRIENDS_PLAYED_TEXT = "+ Friends Played";
        ScoresWidget.ANIMATION_DURATION = 0.4;
    })(ScoresWidget = LeaderboardConstants.ScoresWidget || (LeaderboardConstants.ScoresWidget = {}));
    let InertialAnimation;
    (function (InertialAnimation) {
        InertialAnimation.MAX_SPEED = 4;
        InertialAnimation.FRICTION = 1.5;
        InertialAnimation.SNAP_DURATION = 0.3;
        InertialAnimation.SPRINGNESS = 1000;
    })(InertialAnimation = LeaderboardConstants.InertialAnimation || (LeaderboardConstants.InertialAnimation = {}));
    let Component;
    (function (Component) {
        Component.USER_LIMIT_FRIENDS = 50;
        Component.USER_LIMIT_GLOBAL = 10;
    })(Component = LeaderboardConstants.Component || (LeaderboardConstants.Component = {}));
})(LeaderboardConstants || (exports.LeaderboardConstants = LeaderboardConstants = {}));
//# sourceMappingURL=LeaderboardConstants.js.map