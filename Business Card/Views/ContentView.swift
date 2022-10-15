//
//  ContentView.swift
//  Business Card
//
//  Created by Tim Bausch on 10/15/22.
//
import Combine
import SwiftUI

struct ContentView: View {
    @ObservedObject private var userViewModel = UserViewModel()
    
    var body: some View {
        VStack {
            Text(userViewModel.user.name)
                .font(.title)
            userViewModel.headshot
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 132)
                .cornerRadius(16)
            ScrollView {
                Text(userViewModel.user.biography.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
                    .replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
                    )
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
