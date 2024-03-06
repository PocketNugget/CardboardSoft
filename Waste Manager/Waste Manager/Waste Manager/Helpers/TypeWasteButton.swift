//
//  TypeWasteButton.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 29/02/24.
//

import SwiftUI

struct TypeWasteButton: View {
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    let images = ["waterbottle", "carrot", "wineglass", "macbook.and.iphone"]
    let sizes = [0.13, 0.25, 0.15, 0.35]
    let text = ["Reciclable", "Organica", "Vidrio", "Electronicos"]
    let i: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: dWidth * 0.0636)
            .fill(
                LinearGradient(colors: [Color.green, colorP.c2], startPoint: .top, endPoint: .center)
            )
            .frame(width: dWidth * 0.45, height: dWidth * 0.45)
            .overlay {
                VStack {
                    Image(systemName: images[i])
                        .resizable()
                        .scaledToFit()
                        .frame(width: dWidth * sizes[i])
                        .foregroundStyle(Color.white)
                        .padding(.top, i == 3 ? 15 : 0)
                    Spacer()
                    Text(text[i])
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color.white)
                }
                .padding(.vertical, 20)
        }
    }
}

#Preview {
    TypeWasteButton(dWidth: 300, dHeight: 700, i: 1)
}
