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
        
            VStack {
             Text("Redirected to new Page").font(.title)
                    .padding()
            }
            .padding(.horizontal)
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
}

// Preview provider here, if necessary


#Preview(windowStyle: .automatic) {
    LandingPage()
}
