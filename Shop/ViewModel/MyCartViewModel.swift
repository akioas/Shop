

import Foundation

class MyCartViewModel: ObservableObject {
    
    @Published var viewData: MyCartData?
    
    private let apiManager: APIManager = APIManager()
    
    func getData() {
        
        apiManager.fetch(screen: .myCart) { (result: Result<MyCartData, Error>) in
            switch result {
            case .success(let result):
                self.viewData = result
            case .failure(let error):
                print(error)
            }
        }
    }
}
