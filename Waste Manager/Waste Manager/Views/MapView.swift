//
//  MapView.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 28/02/24.
//

import SwiftUI

struct MapView: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
            Rectangle()
                .fill(colorP.c5.opacity(0.6))
            
            VStack(spacing: 10) {
                SearchBar(dWidth: dWidth, dHeight: dHeight)
                    .padding(.bottom, 10)
                HStack(spacing: 10) {
                    NavigationLink {
                        TrueMapView()
                    } label: {
                        TypeWasteButton(dWidth: dWidth, dHeight: dHeight, i: 0)
                    }
                    NavigationLink {
                        WasteIdentDisplay(dWidth: dWidth, dHeight: dHeight)
                    } label: {
                        TypeWasteButton(dWidth: dWidth, dHeight: dHeight, i: 1)
                    }
                }
                HStack(spacing: 10) {
                    NavigationLink {
                        
                    } label: {
                        TypeWasteButton(dWidth: dWidth, dHeight: dHeight, i: 2)
                    }
                    NavigationLink {
                        
                    } label: {
                        TypeWasteButton(dWidth: dWidth, dHeight: dHeight, i: 3)
                    }
                }
                
                RoundedRectangle(cornerRadius: dWidth * 0.06)
                    .fill(colorP.c1)
                    .frame(height: dHeight*0.35)
                    .overlay {
                        MapProgress(dWidth: dWidth, dHeight: dHeight)
                    }
            }
            .padding(safeAreaInsets)
            .padding(.horizontal, 10)
            .padding(.bottom, dWidth / 5 + 10)
        }
    }
}

#Preview {
    MapView(dWidth: 300, dHeight: 700)
}
