import Foundation

struct Review: Codable {
    let id: UUID
    let ratingValue: Int
    let reviewTitle: String
    let ratingComment: String
}
