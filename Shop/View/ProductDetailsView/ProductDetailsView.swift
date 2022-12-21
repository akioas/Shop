

import SwiftUI


struct ProductDetailsView: View {
    
    @ObservedObject private var viewModel = ProductViewModel()

    private let spacerLength = 30.0
    
    var body: some View {
        GeometryReader { reader in
            ZStack{
                
                Color("Background")
                
                VStack {
                    
                    Spacer()
                        .frame(height: 79)
                    
                    ProductDetailsTopBar()
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Carousel(images: $viewModel.images)
                    
                    Spacer(minLength: 11)
                    
                    ProductDescription(data: $viewModel.productDetailsData)
                    
                }
                
            }
            .ignoresSafeArea()
            .onAppear {
                if viewModel.productDetailsData == nil {
                    viewModel.getData()
                }
            }
        }
        
    }
}


struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView()
    }
}
