import SDWebImageSwiftUI
import SwiftUI

struct ProjectDetailView: View {
    @ObservedObject private var projectViewModel = ProjectDetailViewModel()
    let baseURLString = "https://timbauschdev.herokuapp.com"
    
    var project: Project
    
    init(project: Project) {
        self.project = project
        projectViewModel.fetchSkills(projectID: project.id)
        projectViewModel.fetchScreenshots(projectID: project.id)
        projectViewModel.fetchReviews(projectID: project.id)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(alignment: .center) {
                    WebImage(url: URL(string: baseURLString+Networking.NetworkRequests.appIcon.rawValue+project.appIcon!))
                        .resizable()
                        .placeholder {
                            ProgressView()
                        }
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 72)
                        .cornerRadius(16)
                    if project.repoLink != "" {
                        Link(destination: URL(string: project.repoLink!)!) {
                            Image("GitHubLogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 36)
                        }
                    }
                    if project.appLink != "" {
                        Link(destination: URL(string: project.appLink!)!) {
                            Image("AppStore")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 98)
                        }
                    }
                    
                }
                ScrollView {
                    Text(project.longDescription.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
                        .replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression))
                    .padding()
                }
                .frame(maxHeight: 380)
                VStack(alignment: .center) {
                    Text("Screenshots")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(alignment: .top) {
                            ForEach(projectViewModel.screenshots) { screenshot in
                                ScreenShotView(id: screenshot.id.uuidString, image: screenshot.image, description: screenshot.description, baseURLString: baseURLString)
                            }
                        }
                    }
                    .padding([.leading, .trailing, .bottom])
                }
                .background(Color("ScrollView"))
                if projectViewModel.reviews.count > 0 {
                    Text("Reviews")
                        .font(.title2)
                        .fontWeight(.bold)
                    ForEach(projectViewModel.reviews) { review in
                        ReviewView(title: review.reviewTitle, rating: review.ratingValue, comment: review.ratingComment)
                    }
                }
            }
        }
        
        .navigationTitle(project.name)
        .navigationBarTitleDisplayMode(.large)
    }
}
