"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.TokenManager = void 0;
class TokenManager {
    constructor() {
        this.validTokens = new Set();
        this.incrementalToken = 0;
    }
    generateToken() {
        const generatedToken = this.incrementalToken;
        this.validTokens.add(generatedToken);
        this.incrementalToken += 1;
        return generatedToken;
    }
    isTokenValid(token) {
        return this.validTokens.has(token);
    }
    dismissToken(token) {
        if (token === null) {
            return;
        }
        this.validTokens.delete(token);
    }
}
exports.TokenManager = TokenManager;
//# sourceMappingURL=TokenManager.js.map