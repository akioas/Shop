

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var bestSeller: [BestSeller]?
    @Published var homeStore: [HomeStore]?
    
    private let apiManager: APIManager = APIManager()
    
    func getData() {
        
        apiManager.fetch(screen: .main) { (result: Result<MainData, Error>) in
            switch result {
            case .success(let result):
                self.homeStore = result.homeStore
                self.bestSeller = result.bestSeller
            case .failure(let error):
                print(error)
            }
        }
    }
}
