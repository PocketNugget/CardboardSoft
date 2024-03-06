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
    
    var currentWaste: Int
    var wasteGoal: Int
    
    var RecWaste: Int
    var RecWasteGoal: Int
    
    var OrgWaste: Int
    var OrgWasteGoal: Int
    
    var GlassWaste: Int
    var GlassWasteGoal: Int
    
    var E_Waste: Int
    var E_WasteGoal: Int
    
    static let `default` = Profile(username: "UltiimateDog")
    
    init(username: String) {
        self.username = username
        
        RecWaste = 5
        RecWasteGoal = 10
        OrgWaste = 2
        OrgWasteGoal = 6
        GlassWaste = 3
        GlassWasteGoal = 8
        E_Waste = 0
        E_WasteGoal = 1
        
        currentWaste = RecWaste + OrgWaste + GlassWaste + E_Waste
        wasteGoal = RecWasteGoal + OrgWasteGoal + GlassWasteGoal + E_WasteGoal
    }
    
    mutating func changeGoals(RGoal: Int?, OGoal: Int?, GGoal: Int?, EGoal: Int?) {
        RecWasteGoal = RGoal ?? RecWasteGoal
        OrgWasteGoal = OGoal ?? OrgWasteGoal
        GlassWasteGoal = GGoal ?? GlassWaste
        E_WasteGoal = EGoal ?? E_WasteGoal
        wasteGoal = RecWasteGoal + OrgWasteGoal + GlassWasteGoal + E_WasteGoal
    }
    
    mutating func AddWaste(quantity: Int, type: String) {
        if quantity <= 0 {
            return
        }
        switch type {
        case "Recycle":
            RecWaste += quantity
        case "Organic":
            OrgWaste += quantity
        case "Electronic":
            E_Waste += quantity
        case "Glass":
            GlassWaste += quantity
        default:
            return
        }
        currentWaste = RecWaste + OrgWaste + GlassWaste + E_Waste
    }
}
