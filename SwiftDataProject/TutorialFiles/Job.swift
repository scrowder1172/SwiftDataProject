//
//  Job.swift
//  SwiftDataProject
//
//  Created by SCOTT CROWDER on 11/27/23.
//

import Foundation
import SwiftData

@Model final class Job {
    var name: String
    var priority: Int
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
