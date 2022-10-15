//
//  Business_CardApp.swift
//  Business Card
//
//  Created by Tim Bausch on 10/15/22.
//

import SwiftUI

@main
struct Business_CardApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Biography", systemImage: "person.text.rectangle.fill")
                    }
            }
        }
    }
}
