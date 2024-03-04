//
//  CameraView.swift
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

struct CameraView: View {
    @ObservedObject var modelData: ModelData = .shared
    
    var body: some View {
        GeometryReader { proxy in
            let dWidth = proxy.size.width
            let dHeight = proxy.size.height
            
            ZStack{
                ARViewContainer().edgesIgnoringSafeArea(.all)
                
                // Only shows information if something is recognized
                if modelData.IdentfiedWaste != "" {
                    WasteIdentDisplay(dWidth: dWidth, dHeight: dHeight)
                }
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    @ObservedObject var recogd: ModelData = .shared
    
    func makeUIView(context: Context) -> ARView {
        let v = recogd.ARview
        return v
    }
    
    // Not needed becuase we won´t update the view
    func updateUIView(_ uiView: ARView, context: Context) { }
}

func continuouslyUpdate() {
    @ObservedObject var modelData: ModelData = .shared
    
    // access what we need from the observed object
    let v = modelData.ARview
    let sess = v.session
    let mod = modelData.model
    
    // access the current frame as an image
    let tempImage: CVPixelBuffer? = sess.currentFrame?.capturedImage
    
    //get the current camera frame from the live AR session
    if tempImage == nil {
        return
    }
    
    let tempciImage = CIImage(cvPixelBuffer: tempImage!)
    
    // create a reqeust to the Vision Core ML Model
    let request = VNCoreMLRequest(model: mod) { (request, error) in }
    
    //crop just the center of the captured camera frame to send to the ML model
    request.imageCropAndScaleOption = .centerCrop
    
    // perform the request
    let handler = VNImageRequestHandler(ciImage: tempciImage, orientation: .right)
    
    do {
        //send the request to the model
        try handler.perform([request])
    } catch {
        print(error)
    }
    
    guard let observations = request.results as? [VNClassificationObservation] else { return}
    
    // only proceed if the model prediction's confidence in the first result is greater than 90%
    modelData.IdentfiedWaste = ""
    if observations[0].confidence < 0.9  { return }
    
    // the model returns predictions in descending order of confidence
    // we want to select the first prediction, which has the higest confidence
    let topLabelObservation = observations[0].identifier
    
    // get just the first word from the prediction string
    modelData.IdentfiedWaste = topLabelObservation.components(separatedBy: [","])[0]
}


#Preview {
    CameraView()
}
