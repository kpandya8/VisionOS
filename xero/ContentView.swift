import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    // Grid columns definition
    private let gridColumns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    let img = Image("image") // Correctly loading the image from your assets

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    func buttonPressed(){
        
    }
    var body: some View {
        ScrollView {
                  LazyVGrid(columns: gridColumns, spacing: 0) { // Reduced spacing for better fit
                      ForEach(1...6, id: \.self) { num in
                          ZStack {
                              Image("image\(num)")
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  .frame(width: 600, height: 400) // Adjusted frame size for better grid fitting
                                  .cornerRadius(25)
                                  .padding(25)
                              
                              VStack {
                                  Text("Image \(num)") // Added num to differentiate texts
                                      .font(.largeTitle)
                                      .foregroundColor(.black)
                                       // Make text more readable against the image background
                                  Button(action: buttonPressed) {
                                      Text("Start Folding")
                                          .foregroundColor(.white)
                                          .padding()
                                          .glassBackgroundEffect()
                                          .cornerRadius(10)
                                  }
                        }
                        
                    }
                        
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
