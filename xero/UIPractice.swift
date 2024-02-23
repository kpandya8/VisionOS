//
//  UIPractice.swift
//  xero
//
//  Created by Vrushik Mehta on 2/23/24.
//

import Foundation
import SwiftUI


struct DemoView: View {
    var body: some View {
        
        VStack {
            Image("image3")
                .frame(maxWidth: 600)
                .glassBackgroundEffect()
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(.white, lineWidth: 4)
                }.shadow(radius: 4)
            
        }
        
        .padding()
    }
}


#Preview {
    DemoView()
}
