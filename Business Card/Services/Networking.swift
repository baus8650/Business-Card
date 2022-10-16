import Combine
import Foundation

final class Networking {
    
    let urlSession: URLSession
    var baseURLString: String
    
    enum NetworkRequests: String {
        case user = "/api/users"
        case headShot = "/Images/Headshots/"
        case allProjects = "/api/projects/"
        case appIcon = "/Images/AppIcons/"
        case screenShot = "/Images/ScreenShots/"
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
    
    func fetchAllProjects(endpoint: NetworkRequests) -> AnyPublisher<[Project], Error> {
        let urlComponents = NSURLComponents(string: baseURLString + endpoint.rawValue)
        guard let url = urlComponents?.url else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url).map { $0.data }
            .decode(type: [Project].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func fetchSkillsForProject(endPoint: NetworkRequests, projectID : String) -> AnyPublisher<[Skill], Error> {
        let urlComponents = NSURLComponents(string: baseURLString + endPoint.rawValue + projectID + "/skills")
        guard let url = urlComponents?.url else {
            fatalError("Invalid URL")
        }
        return URLSession.shared.dataTaskPublisher(for: url).map { $0.data }
            .decode(type: [Skill].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func fetchScreenshotsForProject(endPoint: NetworkRequests, projectID : String) -> AnyPublisher<[ScreenShot], Error> {
        let urlComponents = NSURLComponents(string: baseURLString + endPoint.rawValue + projectID + "/screenshots")
        guard let url = urlComponents?.url else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url).map { $0.data }
            .decode(type: [ScreenShot].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func fetchReviewsForProject(endPoint: NetworkRequests, projectID : String) -> AnyPublisher<[Review], Error> {
        let urlComponents = NSURLComponents(string: baseURLString + endPoint.rawValue + projectID + "/reviews")
        guard let url = urlComponents?.url else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url).map { $0.data }
            .decode(type: [Review].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
