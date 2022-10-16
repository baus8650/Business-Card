import Foundation
import SwiftUI

struct Project: Codable, Identifiable {
    let id: String
    let name: String
    let yearCompleted: Int
    let shortDescription: String
    let longDescription: String
    let repoLink: String?
    let appLink: String?
    let appIcon: String?
    let applicationType: ApplicationType
}
