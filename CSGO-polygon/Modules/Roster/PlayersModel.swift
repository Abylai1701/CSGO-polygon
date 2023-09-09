import Foundation

struct Players: Codable {
    let id: Int
    let nick: String?
    let img: String?
    let level: Int
    let role: Int
    
    enum CodingKeys: String, CodingKey {
        case id, nick, level, role
        case img = "img"
    }
}
