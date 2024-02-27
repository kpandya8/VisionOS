//
//  UIPractice.swift
//  xero
//
//  Created by Vrushik Mehta on 2/23/24.
//

import Foundation
import SwiftUI


struct DemoView: View {
    @State private var selection: Tab = .featured

    enum Tab {
          case featured
          case list
      }
    var body: some View {
           TabView(selection: $selection) {
               CategoryHome()
                   .tabItem {
                       Label("Featured", systemImage: "star")
                   }
                   .tag(Tab.featured)


               LandmarkList()
                   .tabItem {
                       Label("List", systemImage: "list.bullet")
                   }
                   .tag(Tab.list)
           }
       }
   }
#Preview {
    LandmarkList()
        .environment(ModelData())

}
