import Combine
import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var user = User(name: "", biography: "", isEmployed: false, headshot: "")
    
    var anyCancellables = Set<AnyCancellable>()
    
    let baseURLString = "https://timbauschdev.herokuapp.com"
    
    init() {
        Networking(baseURLString: baseURLString).performFetchRequest(endpoint: .user)
            .sink { completion in
                
            } receiveValue: { [self] users in
                self.user = users.first ?? User(name: "", biography: "", isEmployed: false, headshot: "")
            }
            .store(in: &anyCancellables)
    }
}
