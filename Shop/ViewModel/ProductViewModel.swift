

import Foundation

class ProductViewModel: ObservableObject {
    
    @Published var productDetailsData: ProductDetailsData?
    @Published var images: [String]?
    
    private let apiManager: APIManager = APIManager()
    
    func getData() {
        
        apiManager.fetch(screen: .productDetails) { (result: Result<ProductDetailsData, Error>) in
            switch result {
            case .success(let result):
                self.productDetailsData = result
                self.images = result.images
            case .failure(let error):
                print(error)
            }
        }
    }
}
