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
                SampleUsersView()
                    .tabItem {
                        Label("Sample Users", systemImage: "person.2.crop.square.stack")
                    }
                
                DynamicUsersView()
                    .tabItem {
                        Label("Dynamic Users", systemImage: "line.3.horizontal.decrease.circle.fill")
                    }
            }
            
        }
        .modelContainer(for: User.self)
    }
}
