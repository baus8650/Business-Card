//
//  ScreenShotView.swift
//  Business Card
//
//  Created by Tim Bausch on 10/15/22.
//
import SDWebImageSwiftUI
import SwiftUI

struct ScreenShotView: View {
    var id: String
    var image: String
    var description: String
    var baseURLString: String
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: baseURLString+Networking.NetworkRequests.screenShot.rawValue+image))
                .resizable()
                .placeholder {
                    ProgressView()
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: 280)
                .cornerRadius(4)
            Text(description.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
                .replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression))
            .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: 290)
        .padding()
        
    }
}
