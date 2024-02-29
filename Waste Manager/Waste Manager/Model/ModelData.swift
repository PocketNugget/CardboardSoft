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
    @Published var IdentfiedWaste = ""
    @Published var showTutorial = true
    
    // instantiate the core ML model
    @Published var model  = try! VNCoreMLModel(for: WasteClassification_v2(configuration: .init()).model)
    
    // call the continuouslyUpdate function every half second
    var timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
        continuouslyUpdate()
    })
}

struct ColorPalette {
    let c1 = Color.init(red: 0.7529411764705882, green: 1, blue: 0.4196078431372549)
    let c2 = Color.init(red: 119/255, green: 230/255, blue: 137/255)
    let c3 = Color.init(red: 210/255, green: 235/255, blue: 215/255)
    let c4 = Color.init(red: 0.8352941176470589, green: 0.8352941176470589, blue: 0.8352941176470589)
    let c5 = Color.init(red: 0, green: 0, blue: 0)
}
