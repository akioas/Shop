

import Foundation

class MyCartViewModel: ObservableObject {
    
    @Published var cartData: MyCartData?
    @Published var basketCount = [Int : Int]()
    
    private let apiManager: APIManager = APIManager()
    
    func getData() {
        
        apiManager.fetch(screen: .myCart) { (result: Result<MyCartData, Error>) in
            switch result {
            case .success(let result):
                self.cartData = result
                /*
                var ids = [Int]()

                if let items = result.basket {
                    for item in items {
                        ids.append(item.id)
                    }
                }
                for id in ids {
                    for newId in ids {
                        if id == newId {
                            self.basketCount[id] = (self.basketCount[id] ?? 0) + 1
                        }
                    }
                }
                 */
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
