

import SwiftUI


struct ProductDetailsView: View {
    
    @ObservedObject private var viewModel = ProductViewModel()
    
    var body: some View {
        ZStack{
            Color("Background")
                .ignoresSafeArea()
            VStack {
                
                ProductDetailsTopBar()
                
                ProductImages(images: $viewModel.images)
                
                ProductDescription(data: $viewModel.productDetailsData)
                
            }
            
        }
        .onAppear {
            if viewModel.productDetailsData == nil {
                viewModel.getData()
            }
        }
        
    }
    
    
}


struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView()
    }
}
