import Foundation

struct ScreenShot: Codable, Identifiable {
    let id: UUID
    let description: String
    let image: String
}

