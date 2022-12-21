

import SwiftUI


struct MyCartView: View {
    
    @ObservedObject private var viewModel = MyCartViewModel()
    
    var body: some View {
        ZStack{
                Color("Background")
            VStack {
                
                Spacer()
                    .frame(height: 79)
                
                MyCartTopBar()
                
                Spacer()
                    .frame(height: 49)
                
                MyCartDescription(data: $viewModel.cartData, basketCount: $viewModel.basketCountDict)
                
            }
            
        }
        .ignoresSafeArea()
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
