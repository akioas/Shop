

import SwiftUI


struct ProductDetailsView: View {
    
    @ObservedObject private var viewModel = ProductViewModel()
    
    var body: some View {
        VStack {
            Button {
                Coordinator.pop()
            } label: {
                Image(systemName: "arrow.left")
                    .foregroundColor(.green)

            }
            
            Button(action: {
                Coordinator.push(view: MyCartView())
            })
            {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            .onAppear {
                viewModel.getData()
            }
            Text(viewModel.viewData?.color?.first ?? "DETAILS")
        }
        .padding()
    }
        
}
