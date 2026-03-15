class TokenManager {
    static let shared = TokenManager()
    private init() {}
    
    var bearerToken: String?
}
