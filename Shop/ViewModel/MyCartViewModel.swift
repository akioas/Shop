

import Foundation

class MyCartViewModel: ObservableObject {
    
    @Published var cartData: MyCartData?
    @Published var basketCount = [Int : Int]() //[id : count]
    
    private let apiManager: APIManager = APIManager()
    
    func getData() {
        
        apiManager.fetch(screen: .myCart) { (result: Result<MyCartData, Error>) in
            switch result {
            case .success(let result):
                self.cartData = result
                self.getBasketCount()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getBasketCount() {
        if let ids = self.cartData?.basket?.compactMap( { $0.id } ) {
            self.basketCount = ids.reduce(into: [:]) {
                      counts, id in  counts[id, default: 0] += 1  }
        }
    }
}
