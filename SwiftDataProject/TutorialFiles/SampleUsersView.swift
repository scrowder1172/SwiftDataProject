//
//  SampleUsersView.swift
//  SwiftDataProject
//
//  Created by SCOTT CROWDER on 11/27/23.
//

import SwiftUI
import SwiftData

struct SampleUsersView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: \User.name) var allUsers: [User]
    
    @Query(filter: #Predicate<User> { user in
        user.name.contains("R")
    },
        sort: \User.name
    ) var uppercaseRUsers: [User]
    
    @Query(filter: #Predicate<User> { user in
        user.name.localizedStandardContains("R")
    },
        sort: \User.name
    ) var mixedCaseRUsers: [User]
    
    @Query(filter: #Predicate<User> { user in
        user.name.localizedStandardContains("R") &&
        user.city == "London"
    },
        sort: \User.name
    ) var mixedCaseRLondonUsers: [User]
    
    @Query(filter: #Predicate<User> { user in
        if user.name.localizedStandardContains("R") {
            if user.city == "London" {
                return true
            } else
            { return false }
        } else {
            return false
        }
    },
        sort: \User.name
    ) var longerFilterVersion: [User]
    
    @State private var showingWarning: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("All Users") {
                    ForEach(allUsers) { user in
                        Text(user.name)
                    }
                }
                
                Section("Uppercase R Users") {
                    ForEach(uppercaseRUsers) { user in
                        Text(user.name)
                    }
                }
                
                Section("Mixed Case R Users") {
                    ForEach(mixedCaseRUsers) { user in
                        Text(user.name)
                    }
                }
                
                Section("Mixed Case R London Users") {
                    ForEach(mixedCaseRLondonUsers) { user in
                        Text(user.name)
                    }
                }
                
                Section("Mixed Case R London Users (Longer Filter)") {
                    ForEach(longerFilterVersion) { user in
                        Text(user.name)
                    }
                }
            }
            .navigationTitle("Users")
            .toolbar {
                Button("Add Sample Users", systemImage: "person.2.crop.square.stack") {
                    showingWarning = true
                }
            }
            .alert("Delete All Users", isPresented: $showingWarning) {
                Button("OK") {
                    try? modelContext.delete(model: User.self)
                    addSampleUsers()
                }
                Button("Cancel") {
                    addSampleUsers()
                }
            } message: {
                Text("Do you want to delete all users?")
            }
        }
    }
    
    func addSampleUsers() {
        let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
        let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
        let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
        let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))

        modelContext.insert(first)
        modelContext.insert(second)
        modelContext.insert(third)
        modelContext.insert(fourth)
    }
}

#Preview {
    SampleUsersView()
}
