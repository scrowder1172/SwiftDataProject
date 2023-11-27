//
//  JobsView.swift
//  SwiftDataProject
//
//  Created by SCOTT CROWDER on 11/27/23.
//

import SwiftUI
import SwiftData

struct JobsView: View {
    
    @Query(
        sort: [
            SortDescriptor(\Job.owner?.name),
            SortDescriptor(\Job.name)
        ]
    ) var jobs: [Job]
    
    var body: some View {
        NavigationStack {
            List(jobs) { job in
                VStack(alignment: .leading) {
                    Text(job.name)
                    Text("Owner: \(job.owner?.name ?? "N/A")")
                        .font(.caption)
                }
                
            }
            .navigationTitle("Jobs")
        }
    }
}

#Preview {
    JobsView()
}
