import SDWebImageSwiftUI
import SwiftUI

struct ProjectRowView: View {
    var appIcon: String
    var name: String
    var yearCompleted: Int
    var shortDescription: String
    var applicationType: ApplicationType
    var baseURLString: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                WebImage(url: URL(string: baseURLString+Networking.NetworkRequests.appIcon.rawValue+appIcon))
                    .resizable()
                    .placeholder {
                        ProgressView()
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 72)
                    .cornerRadius(16)
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.title2)
                        .fontWeight(.bold)
                    HStack {
                        Text(String(yearCompleted))
                            .font(.subheadline)
                        Image(systemName: isiOSApp(type: applicationType.id) ? "ipad.and.iphone" : "safari")
                    }
                }
            }
            Text(shortDescription.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression))
            
        }
    }
    
    func isiOSApp(type: UUID) -> Bool {
        if type.uuidString == "DB62EB9D-1C27-4CCE-BD22-CEE732E74332" {
            return true
        } else {
            return false
        }
    }
}

