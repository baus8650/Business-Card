import Foundation

struct Review: Codable, Identifiable {
    let id: UUID
    let ratingValue: Int
    let reviewTitle: String
    let ratingComment: String
}
