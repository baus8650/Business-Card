import Combine
import Foundation
import SwiftUI

class ProjectListViewModel: ObservableObject {
    @Published var projects = [Project]()
    
    var anyCancellables = Set<AnyCancellable>()
    
    let baseURLString = "https://timbauschdev.herokuapp.com"
    
    init() {
        Networking(baseURLString: baseURLString).fetchAllProjects(endpoint: .allProjects)
            .sink { completion in

            } receiveValue: { [self] projects in
                let sortedProjectsByYear = projects.sorted {
                    $0.yearCompleted > $1.yearCompleted
                }
                let sortedByType = sortedProjectsByYear.sorted {
                    isiOSApp(type: $0.applicationType.id) > isiOSApp(type: $1.applicationType.id)
                }
                self.projects = sortedByType
            }
            .store(in: &anyCancellables)
    }
    
    func isiOSApp(type: UUID) -> Int {
        if type.uuidString == "DB62EB9D-1C27-4CCE-BD22-CEE732E74332" {
            return 1
        } else {
            return 0
        }
    }
}
