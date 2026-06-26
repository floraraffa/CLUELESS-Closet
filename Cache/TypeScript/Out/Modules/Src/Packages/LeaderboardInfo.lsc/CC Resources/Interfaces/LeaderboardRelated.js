"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ScoresWidgetType = exports.EndStateOption = exports.HighScoreWidgetOption = exports.HeaderOption = exports.TestScenario = exports.BackgroundCustomization = exports.ScoreResetIntervalOption = void 0;
var ScoreResetIntervalOption;
(function (ScoreResetIntervalOption) {
    ScoreResetIntervalOption[ScoreResetIntervalOption["Day"] = 0] = "Day";
    ScoreResetIntervalOption[ScoreResetIntervalOption["Week"] = 1] = "Week";
    ScoreResetIntervalOption[ScoreResetIntervalOption["Month"] = 2] = "Month";
    ScoreResetIntervalOption[ScoreResetIntervalOption["Year"] = 3] = "Year";
})(ScoreResetIntervalOption || (exports.ScoreResetIntervalOption = ScoreResetIntervalOption = {}));
var BackgroundCustomization;
(function (BackgroundCustomization) {
    BackgroundCustomization[BackgroundCustomization["None"] = 0] = "None";
    BackgroundCustomization[BackgroundCustomization["Bitmoji"] = 1] = "Bitmoji";
    BackgroundCustomization[BackgroundCustomization["Texture"] = 2] = "Texture";
})(BackgroundCustomization || (exports.BackgroundCustomization = BackgroundCustomization = {}));
var TestScenario;
(function (TestScenario) {
    TestScenario[TestScenario["None"] = 0] = "None";
    TestScenario[TestScenario["ScoreSubmit"] = 1] = "ScoreSubmit";
    TestScenario[TestScenario["ScoresWidget"] = 2] = "ScoresWidget";
})(TestScenario || (exports.TestScenario = TestScenario = {}));
var HeaderOption;
(function (HeaderOption) {
    HeaderOption[HeaderOption["None"] = 0] = "None";
    HeaderOption[HeaderOption["Title"] = 1] = "Title";
    HeaderOption[HeaderOption["TopScore"] = 2] = "TopScore";
})(HeaderOption || (exports.HeaderOption = HeaderOption = {}));
var HighScoreWidgetOption;
(function (HighScoreWidgetOption) {
    HighScoreWidgetOption[HighScoreWidgetOption["Delay"] = 0] = "Delay";
    HighScoreWidgetOption[HighScoreWidgetOption["Manual"] = 1] = "Manual";
})(HighScoreWidgetOption || (exports.HighScoreWidgetOption = HighScoreWidgetOption = {}));
var EndStateOption;
(function (EndStateOption) {
    EndStateOption[EndStateOption["None"] = 0] = "None";
    EndStateOption[EndStateOption["SideSwitcher"] = 1] = "SideSwitcher";
    EndStateOption[EndStateOption["Leaderboard"] = 2] = "Leaderboard";
})(EndStateOption || (exports.EndStateOption = EndStateOption = {}));
var ScoresWidgetType;
(function (ScoresWidgetType) {
    ScoresWidgetType[ScoresWidgetType["SingleSticker"] = 0] = "SingleSticker";
    ScoresWidgetType[ScoresWidgetType["TwoStickers"] = 1] = "TwoStickers";
    ScoresWidgetType[ScoresWidgetType["ThreeStickers"] = 2] = "ThreeStickers";
})(ScoresWidgetType || (exports.ScoresWidgetType = ScoresWidgetType = {}));
//# sourceMappingURL=LeaderboardRelated.js.map