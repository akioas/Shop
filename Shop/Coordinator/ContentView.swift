

import SwiftUI


struct ContentView: View {
    @StateObject private var coordinator = Coordinator
    
    var body: some View {
        ZStack {
            coordinator.container.view
                .transition(.move(edge: .trailing))
        }
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
