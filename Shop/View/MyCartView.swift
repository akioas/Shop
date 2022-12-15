

import SwiftUI


struct MyCartView: View {
    
    @ObservedObject private var viewModel = MyCartViewModel()
    
    var body: some View {
        VStack {
            Button {
                Coordinator.pop()
            } label: {
                Image(systemName: "arrow.left")
                    .foregroundColor(.blue)

            }
            
            .onAppear {
                viewModel.getData()
            }
            Text(viewModel.viewData?.basket?.first?.images ?? "CART")
        }
        .padding()
    }
        
}
