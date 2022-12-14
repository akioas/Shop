

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var viewData: MainData?
    
    private let apiManager: APIManager = APIManager()
    
    func getData() {
        
        apiManager.fetch(screen: .Main) { (result: Result<MainData, Error>) in
            switch result {
            case .success(let result):
                self.viewData = result
            case .failure(let error):
                print(error)
            }
        }
    }
}
