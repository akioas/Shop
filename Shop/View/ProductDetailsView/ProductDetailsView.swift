

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
                
            }
            
        }
        .onAppear {
            if viewModel.productDetailsData == nil {
                viewModel.getData()
            }
        }
        
    }
    
    
}

func getImages(images: [String]?) -> [LAsyncImage]? {
    var asyncImages: [LAsyncImage]?
    if let images = images {
        for image in images {
            asyncImages?.append((LAsyncImage(url: URL(string: image)!)))

        }
    }
    return asyncImages
}



struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView()
    }
}
