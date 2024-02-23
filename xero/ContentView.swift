import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    // Grid columns definition
    private let gridColumns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    let img = Image("image") // Correctly loading the image from your assets

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns, spacing: 5) {
                ForEach(1...24, id: \.self) { _ in
                    img // Use the image directly
                        .resizable() // Make the image resizable
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 250)
                        .cornerRadius(25)
                        .padding(15)
                        
                }
            }
            .padding(.horizontal)
        }
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
    ContentView()
}
