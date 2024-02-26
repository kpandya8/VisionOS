//
//  landingPage.swift
//  xero
//
//  Created by Vrushik Mehta on 2/18/24.
//

import Foundation
import SwiftUI
import RealityKit
import RealityKitContent


struct LandingPage: View {
    // Grid columns definition
    private let gridColumns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    let img = Image("image") // Correctly loading the image from your assets

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        
        TabView {
                    HomeTabView()
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                        }

                   AboutTabView()
                        .tabItem {
                            Label("About", systemImage: "swiftdata")
                        }
            ThirdTabView()
                .tabItem {
                    Label("Third", systemImage: "swiftdata")
                }
            FourthTabView()
                .tabItem {
                    Label("Fourth", systemImage: "swiftdata")
                }
                }
            }
        }

        struct HomeTabView: View {
            var body: some View {
                // Your first tab content here
                VStack {
                    DemoView()
                }
            }
        }

        struct AboutTabView: View {
            var body: some View {
                // Your second tab content here
                VStack{
                HikeView()
            }
            }
        }
struct ThirdTabView: View {
    var body: some View {
        // Your second tab content here
        VStack {
            ContentView()
        }
    }
}
struct FourthTabView: View {
    var body: some View {
        // Your second tab content here
        VStack {
            Text("Fourth Tab")
                .font(.largeTitle)
        }
    }
}

// Preview provider here, if necessary


#Preview(windowStyle: .automatic) {
    LandingPage()
}
