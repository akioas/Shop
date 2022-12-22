

import Foundation

class MyCartViewModel: ObservableObject {
    
    @Published var cartData: MyCartData?
    @Published var basketCountDict = [Int : Int]() //[id : count]
    @Published var basketItemsCount: Int?
    
    private let apiManager: APIManager = APIManager()
    
    func getData() {
        
        apiManager.fetch(screen: .myCart) { (result: Result<MyCartData, Error>) in
            switch result {
            case .success(let result):
                self.cartData = result
                self.getBasketIdCountDict()
                if let basket = result.basket {
                    Repository().setBasketItemsCount(count: basket.count)
                    self.basketItemsCount = basket.count
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getBasketIdCountDict() {
        if let ids = self.cartData?.basket?.compactMap( { $0.id } ) {
            self.basketCountDict = ids.reduce(into: [:]) {
                      counts, id in  counts[id, default: 0] += 1  }
        }
    }
    
    func getBasketItemsCount() -> Int? {
        Repository().getBasketItemsCount()
    }
}
