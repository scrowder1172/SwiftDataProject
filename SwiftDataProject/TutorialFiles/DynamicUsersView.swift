//
//  DynamicUsersView.swift
//  SwiftDataProject
//
//  Created by SCOTT CROWDER on 11/27/23.
//

import SwiftUI
import SwiftData

struct DynamicUsersView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State private var showingUpcomingOnly: Bool = false
    
    @State private var showingWarning: Bool = false
    
    var body: some View {
        NavigationStack {
            DynamicListView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast)
            .navigationTitle("Users")
            .toolbar {
                Button("Add Sample Users", systemImage: "person.2.crop.square.stack") {
                    showingWarning = true
                }
                
                Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                    showingUpcomingOnly.toggle()
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
        
        let approxSecondsInDay: Double = 86400
        
        func createUser(_ namePassed: String, _ cityPassed: String, _ daysAgoJoined: Double) -> User {
            return User(name: namePassed, city: cityPassed, joinDate: .now.addingTimeInterval(approxSecondsInDay * daysAgoJoined))
        }
        
//        let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(approxSecondsInDay * -10))
//        let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(approxSecondsInDay * -5))
//        let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(approxSecondsInDay * 5))
//        let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(approxSecondsInDay * 10))
        let firstUser: User = createUser("Ed Sheeran", "London", -10)
        let secondUser: User = createUser("Rosa Diaz", "New York", -5)
        let thirdUser: User = createUser("Roy Kent", "London", 5)
        let fourthUser: User = createUser("Johnny English", "London", 10)
        

        modelContext.insert(firstUser)
        modelContext.insert(secondUser)
        modelContext.insert(thirdUser)
        modelContext.insert(fourthUser)
    }
}

#Preview {
    DynamicUsersView()
}
