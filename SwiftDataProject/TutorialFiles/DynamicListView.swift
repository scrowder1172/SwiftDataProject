//
//  DynamicListView.swift
//  SwiftDataProject
//
//  Created by SCOTT CROWDER on 11/27/23.
//

import SwiftUI
import SwiftData

struct DynamicListView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var users: [User]
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    var body: some View {
        List(users) { user in
            HStack {
                Text(user.name)
                
                Spacer()
                
                Text(String(user.unwrappedJobs.count))
                    .fontWeight(.black)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        }
        .toolbar {
            Button("Add Sample") {
                addSample()
            }
        }
    }
    
    func addSample() {
        let user1: User = User(name: "Piper Chapman", city: "New York", joinDate: .now)
        modelContext.insert(user1)
        
        let job1: Job = Job(name: "Organize sock drawer", priority: 3)
        let job2: Job = Job(name: "Make plans with Alex", priority: 4)
        
        user1.jobs?.append(job1)
        user1.jobs?.append(job2)
    }
}

#Preview {
    DynamicListView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
