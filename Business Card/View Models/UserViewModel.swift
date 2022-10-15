import Combine
import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var user = User(name: "", biography: "", isEmployed: false, headshot: "")
    @Published var headshot: Image = Image(systemName: "person.fill")
    
    var anyCancellables = Set<AnyCancellable>()
    
    let baseURLString = "https://timbauschdev.herokuapp.com"
    
    init() {
        Networking(baseURLString: baseURLString).performFetchRequest(endpoint: .user)
            .sink { completion in
                
            } receiveValue: { [self] users in
                self.user = users.first ?? User(name: "", biography: "", isEmployed: false, headshot: "")
                print(user.biography)
                let imageURL = URL(string: baseURLString+Networking.NetworkRequests.headShot.rawValue+self.user.headshot)
                DispatchQueue.global().async {
                    let imageData = try? Data(contentsOf: imageURL!)
                    DispatchQueue.main.async {
                        self.headshot = Image(uiImage: UIImage(data: imageData!)!)
                    }
                }
            }
            .store(in: &anyCancellables)
    }
}
