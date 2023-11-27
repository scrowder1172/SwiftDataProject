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
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
