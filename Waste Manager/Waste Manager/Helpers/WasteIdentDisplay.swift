//
//  WasteIdentDisplay.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 02/03/24.
//

import SwiftUI

struct WasteIdentDisplay: View {
    @ObservedObject var modelData: ModelData = .shared
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    
    var body: some View {
        RoundedRectangle(cornerRadius: dWidth * 0.06)
            .frame(width: dWidth * 0.75, height: dWidth * 0.75)
            .foregroundColor(colorP.c1)
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        Text(modelData.IdentfiedWaste)
                            .font(.title)
                            .bold()
                            .foregroundStyle(Color.black)
                        Spacer()
                        QuantityButton(dWidth: dWidth, dHeight: dHeight)
                            .foregroundStyle(colorP.c2)
                    }
                    Spacer()
                    AdviceRectangle(dWidth: dWidth, dHeight: dHeight)
                    Spacer()
                    NavigationStack {
                        FindMapButton(dWidth: dWidth, dHeight: dHeight)
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
            }
    }
}

struct QuantityButton: View {
    @ObservedObject var modelData: ModelData = .shared
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    
    var body: some View {
        Menu {
            Button("Agrega 1", action: Add_1)
            Button("Agrega 2", action: Add_2)
            Button("Agrega 5", action: Add_5)
            Button("Agrega 10", action: Add_10)
        } label: {
            Image(systemName: "trash")
                .resizable()
                .scaledToFit()
                .frame(width: dWidth * 0.06)
                .overlay {
                    ZStack {
                        Circle()
                            .frame(width: dWidth * 0.045)
                            .foregroundStyle(colorP.c1)
                            .offset(x: dWidth * 0.02, y: -dWidth * 0.02)
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: dWidth * 0.035)
                            .offset(x: dWidth * 0.02, y: -dWidth * 0.02)
                    }
                }
        }
    }
    
    func Add_1() {
        modelData.profile.AddWaste(quantity: 1, type: modelData.IdentfiedWaste)
        return
    }
    func Add_2() {
        modelData.profile.AddWaste(quantity: 2, type: modelData.IdentfiedWaste)
        return
    }
    func Add_5() {
        modelData.profile.AddWaste(quantity: 5, type: modelData.IdentfiedWaste)
        return
    }
    func Add_10() {
        modelData.profile.AddWaste(quantity: 10, type: modelData.IdentfiedWaste)
        return
    }
}

struct FindMapButton: View {
    @ObservedObject var modelData: ModelData = .shared
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    
    var body: some View {
        NavigationLink {
            TrueMapView()
        } label: {
            RoundedRectangle(cornerRadius: dWidth * 0.06)
                .frame(width: dWidth * 0.65, height: dWidth * 0.1)
                .foregroundStyle(colorP.c2)
                .overlay {
                    Text("Explora lugares")
                        .font(.title3)
                        .foregroundStyle(colorP.c4)
                }
        }
    }
}

struct AdviceRectangle: View {
    @ObservedObject var modelData: ModelData = .shared
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    
    var body: some View {
        RoundedRectangle(cornerRadius: dWidth * 0.06)
            .foregroundStyle(colorP.c6)
            .overlay {
                ZStack {
                    Image("tierra")
                        .resizable()
                        .scaledToFit()
                        .frame(width: dWidth * 0.13)
                        .offset(x: -dWidth * 0.31, y: -dWidth * 0.21)
                    Text("   Un consejo muy, pero muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy muy largo.")
                        .foregroundStyle(colorP.c1)
                        .padding(.all, 10)
                }
            }
    }
}

#Preview {
    WasteIdentDisplay(dWidth: 300, dHeight: 700)
}
