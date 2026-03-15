import Foundation

struct AuthResponse: Decodable {
    let success: Bool
    let token: String
}
