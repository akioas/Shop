

import SwiftUI


struct MyCartView: View {
    
    @ObservedObject private var viewModel = MyCartViewModel()
    
    var body: some View {
        ZStack{
            Color("Background")
                .ignoresSafeArea()
            VStack {
                Button {
                    Coordinator.pop()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.blue)
                    
                }
                
                .onAppear {
                    if viewModel.viewData == nil {
                        viewModel.getData()
                    }
                }
                Text(viewModel.viewData?.basket?.first?.images ?? "CART")
            }
            .padding()
        }
    }
        
}





struct MyCartView_Previews: PreviewProvider {
    static var previews: some View {
        MyCartView()
    }
}
