import Combine
import Foundation

final class Networking {
    
    let urlSession: URLSession
    var baseURLString: String
    
    enum NetworkRequests: String {
        case user = "/api/users"
        case headShot = "/Images/Headshots/"
    }
    
    init(urlSession: URLSession = .shared, baseURLString: String) {
        self.urlSession = urlSession
        self.baseURLString = baseURLString
    }
    
    func performFetchRequest(endpoint: NetworkRequests) -> AnyPublisher<[User], Error> {
        
        let urlComponents = NSURLComponents(string: baseURLString + endpoint.rawValue)
        
        guard let url = urlComponents?.url else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url).map { $0.data }
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
