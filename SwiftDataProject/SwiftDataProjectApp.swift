//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by SCOTT CROWDER on 11/27/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Content", systemImage: "globe")
                    }
                Users()
                    .tabItem {
                        Label("Users", systemImage: "person.3.fill")
                    }
            }
            
        }
        .modelContainer(for: User.self)
    }
}
