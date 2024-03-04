//
//  ArticlePreview.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 03/03/24.
//

import SwiftUI

struct ArticlePreview: View {
    @ObservedObject var modelData: ModelData = .shared
    let dWidth: Double
    let dHeight: Double
    let colorP = ColorPalette()
    
    var body: some View {
        RoundedRectangle(cornerRadius: dWidth * 0.05)
            .fill(colorP.c1)
            .frame(height: dHeight * 0.15)
            .overlay {
                HStack {
                    Image(systemName: "photo.artframe")
                        .resizable()
                        .frame(width: dHeight * 0.13, height: dHeight * 0.13)
                        .clipShape(RoundedRectangle(cornerRadius: dWidth * 0.04))
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title")
                            .font(.headline)
                            .bold()
                            .foregroundStyle(Color.black)
                        Spacer()
                        HStack {
                            Image(systemName: "person.slash.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: dWidth*0.05)
                                .clipShape(Circle())
                            Text("Author")
                                .font(.caption)
                                .italic()
                                .foregroundStyle(Color.black)
                            Spacer()
                            Text("Date")
                                .font(.caption)
                                .italic()
                                .foregroundStyle(Color.black)
                        }
                    }
                }
                .padding(.all, 10)
            }
    }
}

#Preview {
    ArticlePreview(dWidth: 300, dHeight: 700)
}
