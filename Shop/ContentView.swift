

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = FetchViewModel()
    
    var body: some View {
        VStack {
            Button(action: {
                viewModel.getData(screen: .Main)
                print(self.viewModel)
                
            })
            {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            .onAppear {
                viewModel.getData(screen: .Main)
            }
            Text(viewModel.mainData?.bestSeller.first?.title ?? "HELLO")
        }
        .padding()
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
