import Foundation

class UserManager {
    static let shared                 = UserManager()
    private let userDefaults          = UserDefaults.standard
    private let currentUserIdentifier = "currentUserIdentifier"
    private let currentToken          = "currentToken"
    private let isShownOnBoard        = "isShownOnBoard"
    
    private init() {}
    
    func setAccessToken(token: String) {
        userDefaults.set(token, forKey: currentToken)
    }
    func getAccessToken() -> String? {
        return userDefaults.string(forKey: currentToken)
    }
    
    func deleteCurrentSession() {
        userDefaults.set(nil, forKey: currentToken)
        userDefaults.synchronize()
        AppCenter.shared.start()
    }
    func getShownOnBoard() -> Bool? {
        return userDefaults.bool(forKey: isShownOnBoard)
    }
    func setShownOnBoard(isShown: Bool?) {
        userDefaults.set(isShown, forKey: isShownOnBoard)
    }
}
