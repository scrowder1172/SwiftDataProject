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
    
    @State private var sortOrder: [SortDescriptor] = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    
    @State private var showingUpcomingOnly: Bool = false
    
    var body: some View {
        NavigationStack {
            DynamicListView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
            .navigationTitle("Users")
            .toolbar {
                
                Menu("Sort", systemImage: "line.3.horizontal.decrease") {
                    
                    Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                        showingUpcomingOnly.toggle()
                    }
                    
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate)
                            ])
                        
                        Text("Sort by Join Date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    DynamicUsersView()
}
