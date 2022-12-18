

import SwiftUI


struct MyCartView: View {
    
    @ObservedObject private var viewModel = MyCartViewModel()
    
    var body: some View {
        ZStack{
            Color("Background")
                .ignoresSafeArea()
            VStack {
                MyCartTopBar()
                
                MyCartDescription(data: $viewModel.cartData, basketCount: $viewModel.basketCount)
                
            }
            
        }
        .onAppear {
            viewModel.getData()
        }
    }
        
}





struct MyCartView_Previews: PreviewProvider {
    static var previews: some View {
        MyCartView()
    }
}
