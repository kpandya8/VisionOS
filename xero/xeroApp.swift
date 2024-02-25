//
//  xeroApp.swift
//  xero
//
//  Created by Vrushik Mehta on 2/15/24.
//

import SwiftUI

@main
struct xeroApp: App {
    
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            LandingPage().environment(modelData)
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}

#Preview(windowStyle: .automatic)
{
    
    LandingPage()
}


