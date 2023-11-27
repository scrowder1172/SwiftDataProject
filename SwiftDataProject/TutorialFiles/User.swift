//
//  user.swift
//  SwiftDataProject
//
//  Created by SCOTT CROWDER on 11/27/23.
//

import Foundation
import SwiftData

@Model final class User {
    var name: String
    var city: String
    var joinDate: Date
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
