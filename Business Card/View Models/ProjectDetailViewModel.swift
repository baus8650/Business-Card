import Combine
import Foundation
import SwiftUI

class ProjectDetailViewModel: ObservableObject {
    @Published var project = Project(id: "0", name: "Unknown", yearCompleted: 0, shortDescription: "", longDescription: "", repoLink: "", appLink: "", appIcon: "", applicationType: ApplicationType(id: UUID()))
    @Published var skills = [Skill]()
    @Published var screenshots = [ScreenShot]()
    @Published var reviews = [Review]()
    
    var anyCancellables = Set<AnyCancellable>()
    
    let baseURLString = "https://timbauschdev.herokuapp.com"
    
    func fetchSkills(projectID: String) {
        Networking(baseURLString: baseURLString).fetchSkillsForProject(endPoint: .allProjects, projectID: projectID)
            .sink { completion in
                
            } receiveValue: { skills in
                self.skills = skills
            }
            .store(in: &anyCancellables)
    }
    
    func fetchScreenshots(projectID: String) {
        Networking(baseURLString: baseURLString).fetchScreenshotsForProject(endPoint: .allProjects, projectID: projectID)
            .sink { completion in
                
            } receiveValue: { screenshots in
                self.screenshots = screenshots
            }
            .store(in: &anyCancellables)
    }
    
    func fetchReviews(projectID: String) {
        Networking(baseURLString: baseURLString).fetchReviewsForProject(endPoint: .allProjects, projectID: projectID)
            .sink { completion in
                
            } receiveValue: { reviews in
                self.reviews = reviews
            }
            .store(in: &anyCancellables)
    }
    
}
