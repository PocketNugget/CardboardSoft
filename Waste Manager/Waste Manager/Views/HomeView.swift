//
//  Home.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 28/02/24.
//

import SwiftUI

struct HomeView: View {
    let colorP = ColorPalette()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(colorP.c3.opacity(0.5))
            Text("Home")
        }
    }
}

#Preview {
    HomeView()
}
