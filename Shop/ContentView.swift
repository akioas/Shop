

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                FetchViewModel().getData(screen: .main)
                
            })
            {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
