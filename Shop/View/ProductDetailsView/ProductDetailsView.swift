

import SwiftUI


struct ProductDetailsView: View {
    
    @ObservedObject private var viewModel = ProductViewModel()
    private let spacerLength = 30.0
    var body: some View {
        GeometryReader { reader in
            ZStack{
                Color("Background")
                    .ignoresSafeArea()
                VStack {
                    
                    ProductDetailsTopBar()
                        .frame(height: iconY)
                    Spacer(minLength: spacerLength)
                    Carousel(images: $viewModel.images)
                        .frame(height: (reader.size.height - spacerLength - iconY) / 2)
                    ProductDescription(data: $viewModel.productDetailsData)
                        .frame(height: (reader.size.height - spacerLength - iconY) / 2)
                }
                
            }
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
