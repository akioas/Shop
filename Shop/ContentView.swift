

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = ProductViewModel()
    
    var body: some View {
        VStack {
            Button(action: {
                viewModel.getData()
                print(self.viewModel)
                
            })
            {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            .onAppear {
                viewModel.getData()
            }
            Text(viewModel.viewData?.color?.first ?? "HELLO")
        }
        .padding()
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
