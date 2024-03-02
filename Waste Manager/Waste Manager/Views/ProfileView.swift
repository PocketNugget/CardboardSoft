//
//  ProfileView.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 28/02/24.
//

import SwiftUI

struct ProfileView: View {
    let colorP = ColorPalette()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(colorP.c3)
            Text("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
