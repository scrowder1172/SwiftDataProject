//
//  DynamicListView.swift
//  SwiftDataProject
//
//  Created by SCOTT CROWDER on 11/27/23.
//

import SwiftUI
import SwiftData

struct DynamicListView: View {
    
    @Query var users: [User]
    
    init(minimumJoinDate: Date) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: \User.name)
    }
    
    var body: some View {
        List(users) { user in
            Text(user.name)
        }
    }
}

#Preview {
    DynamicListView(minimumJoinDate: .now)
        .modelContainer(for: User.self)
}
