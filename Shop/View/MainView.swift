

import SwiftUI


struct MainView: View {
    
    @ObservedObject private var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            
            Button(action: {
                Coordinator.push(view: MyCartView())
            })
            {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            Button(action: {
                Coordinator.push(view: ProductDetailsView())
            })
            {
                Image(systemName: "flame")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            .onAppear {
                viewModel.getData()
            }
            Text(viewModel.viewData?.bestSeller.first?.title ?? "MAIN")
        }
        .padding()
    }
        
}
