//
//  NavigationBar.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 28/02/24.
//

import SwiftUI

struct NavigationBarView: View {
    @State var currentTab: Tab = .Home
    let colorP = ColorPalette()
    
    // Hide native bar
    init () {
        UITabBar.appearance().isHidden = true
    }
        
    var body: some View {
        GeometryReader { proxy in
            let dHeight = proxy.size.height
            let dWidth = proxy.size.width
            
            TabView(selection: $currentTab) {
                HomeView()
                    .tag(Tab.Home)
                CameraView()
                    .tag(Tab.Camera)
                ArticlesView()
                    .tag(Tab.Articles)
                ProfileView()
                    .tag(Tab.Profile)
                MapView(dWidth: dWidth, dHeight: dHeight)
                    .ignoresSafeArea()
                    .tag(Tab.Maps)
            }
            .overlay(alignment: .bottom) {
                HStack(spacing: 0) {
                    ForEach (Tab.allCases, id: \.rawValue) { tab in
                        TabButton(tab: tab)
                    }
                    .background(colorP.c5)
                    .padding(.bottom, 5)
                }
            }
            .ignoresSafeArea()
        }
    }
    
    func TabButton(tab: Tab) -> some View {
        Button {
            withAnimation(.spring()) {
                currentTab = tab
            }
        } label: {
            ZStack {
                Circle()
                    .fill(currentTab == tab ? LinearGradient(colors: [colorP.c2, colorP.c5], startPoint: .top, endPoint: .bottom) : LinearGradient(colors: [Color.clear], startPoint: .top, endPoint: .bottom))
                    .offset(y: currentTab == tab ? -35 : 0)
                Image(systemName: currentTab == tab ? tab.rawValue + ".fill": tab.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: tab == Tab.Articles || tab == Tab.Maps ? 25 : 27)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(currentTab == tab ? colorP.c1 : colorP.c1)
                    .contentShape(Rectangle())
                    .offset(y: currentTab == tab ? -35 : 0)
            }
        }
    }
}

// Tabbar enum
enum Tab: String, CaseIterable {
    case Profile = "person"
    case Home = "house"
    case Camera = "camera"
    case Maps = "map"
    case Articles = "book.pages"
    
    var tabName: String {
        switch self {
        case .Profile:
            return "Profile"
        case .Home:
            return "Home"
        case .Camera:
            return "Camera"
        case .Maps:
            return "Map"
        case .Articles:
            return "Articles"
        }
    }
}

#Preview {
    NavigationBarView()
}
