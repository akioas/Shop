

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var bestSeller: [BestSellerData]?
    @Published var homeStore: [HomeStoreData]?
    
    private let apiManager: APIManager = APIManager()
    
    func getData() {
        
        apiManager.fetch(screen: .main) { (result: Result<MainData, Error>) in
            switch result {
            case .success(let result):
                self.homeStore = result.homeStore.sorted(by: {$0.id < $1.id})
                self.bestSeller = result.bestSeller.sorted(by: {$0.id < $1.id})
            case .failure(let error):
                print(error)
            }
        }
    }
}
