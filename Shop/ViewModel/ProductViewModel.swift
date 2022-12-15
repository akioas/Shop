

import Foundation

class ProductViewModel: ObservableObject {
    
    @Published var viewData: ProductDetailsData?
    
    private let apiManager: APIManager = APIManager()
    
    func getData() {
        
        apiManager.fetch(screen: .productDetails) { (result: Result<ProductDetailsData, Error>) in
            switch result {
            case .success(let result):
                self.viewData = result
            case .failure(let error):
                print(error)
            }
        }
    }
}
