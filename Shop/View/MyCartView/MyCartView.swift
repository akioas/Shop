

import SwiftUI


struct MyCartView: View {
    
    @ObservedObject private var viewModel = MyCartViewModel()
    
    var body: some View {
        ZStack{
            VStack {
                Color("Background")
                Color("Blue")
            }
                .ignoresSafeArea()
            VStack {
                MyCartTopBar()
                
                MyCartDescription(data: $viewModel.cartData, basketCount: $viewModel.basketCount)
                
            }
            
        }
        .onAppear {
            if viewModel.cartData == nil {
                viewModel.getData()
            }
        }
    }
        
}





struct MyCartView_Previews: PreviewProvider {
    static var previews: some View {
        MyCartView()
    }
}
