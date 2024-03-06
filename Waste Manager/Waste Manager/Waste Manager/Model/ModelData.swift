//
//  ModelData.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 28/02/24.
//

import SwiftUI
import RealityKit
import CoreML
import Vision
import SceneKit
import ARKit

// create and observable object that structs can access
class ModelData: ObservableObject {
    private init() { }
    
    static let shared = ModelData()
    
    @Published var ARview = ARView()
    // Creates a default profile
    @Published var profile = Profile.default
    @Published var IdentfiedWaste = "Not found"
    @Published var showTutorial = true
    
    // instantiate the core ML model
    @Published var model  = try! VNCoreMLModel(for: WasteClassification_v2(configuration: .init()).model)
    
    // call the continuouslyUpdate function every half second
    var timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
        continuouslyUpdate()
    })
}

struct ColorPalette {
    let c1 = Color.init(red: 251/255, green: 251/255, blue: 251/255)
    let c2 = Color.init(red: 31/255, green: 160/255, blue: 69/255)
    let c3 = Color.init(red: 95/255, green: 223/255, blue: 119/255)
    let c4 = Color.init(red: 221/255, green: 246/255, blue: 226/255)
    let c5 = Color.init(red: 119/255, green: 220/255, blue: 137/255)
    let c6 = Color.init(red: 72/255, green: 62/255, blue: 77/255)
}
