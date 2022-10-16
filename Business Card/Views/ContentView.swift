//
//  ContentView.swift
//  Business Card
//
//  Created by Tim Bausch on 10/15/22.
//
import Combine
import SDWebImageSwiftUI
import SwiftUI

struct ContentView: View {
    @ObservedObject private var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                WebImage(url: URL(string: userViewModel.baseURLString+Networking.NetworkRequests.headShot.rawValue+userViewModel.user.headshot))
                    .resizable()
                    .placeholder {
                        ProgressView()
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 132)
                    .cornerRadius(16)
                ScrollView {
                    Text(userViewModel.user.biography.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
                        .replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
                    )
                }
            }
            .padding()
            .navigationTitle(userViewModel.user.name)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
