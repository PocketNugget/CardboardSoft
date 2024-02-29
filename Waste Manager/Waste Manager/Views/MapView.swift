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
                .fill(colorP.c3.opacity(0.5))
            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    TypeWasteButton(dWidth: dWidth, dHeight: dHeight, i: 0)
                    TypeWasteButton(dWidth: dWidth, dHeight: dHeight, i: 1)
                }
                HStack(spacing: 10) {
                    TypeWasteButton(dWidth: dWidth, dHeight: dHeight, i: 2)
                    TypeWasteButton(dWidth: dWidth, dHeight: dHeight, i: 3)
                }
            }
            .padding(safeAreaInsets)
            .padding(.horizontal, 10)
            .padding(.bottom, dWidth / 5 + 15)
            .padding(.top, 10)
        }
    }
}

#Preview {
    MapView(dWidth: 300, dHeight: 700)
}
