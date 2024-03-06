//
//  ArticlesView.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 28/02/24.
//

import SwiftUI

struct ArticlesView: View {
    @ObservedObject var modelData: ModelData = .shared
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
            
            VStack(spacing: 0) {
                SearchBar2(dWidth: dWidth, dHeight: dHeight)
                    .padding(.bottom, 10)
                ScrollView(showsIndicators: false) {
                    ArticlePreview(dWidth: dWidth, dHeight: dHeight)
                    ArticlePreview(dWidth: dWidth, dHeight: dHeight)
                    ArticlePreview(dWidth: dWidth, dHeight: dHeight)
                    ArticlePreview(dWidth: dWidth, dHeight: dHeight)
                    ArticlePreview(dWidth: dWidth, dHeight: dHeight)
                    ArticlePreview(dWidth: dWidth, dHeight: dHeight)
                    ArticlePreview(dWidth: dWidth, dHeight: dHeight)
                    ArticlePreview(dWidth: dWidth, dHeight: dHeight)
                    ArticlePreview(dWidth: dWidth, dHeight: dHeight)
                    ArticlePreview(dWidth: dWidth, dHeight: dHeight)
                    ArticlePreview(dWidth: dWidth, dHeight: dHeight)
                    ArticlePreview(dWidth: dWidth, dHeight: dHeight)
                }
                .clipShape(RoundedRectangle(cornerRadius: dWidth * 0.06))
            }
            .padding(safeAreaInsets)
            .padding(.horizontal, 10)
            .padding(.bottom, dWidth / 5 + 10)
        }
    }
}

#Preview {
    ArticlesView(dWidth: 300, dHeight: 700)
}
