//
//  Profile.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 28/02/24.
//

import Foundation
import SwiftUI

// Creates the struct for the profile
struct Profile {
    var username: String
    
    static let `default` = Profile(username: "UltiimateDog")
    
    init(username: String) {
        self.username = username
    }
}
