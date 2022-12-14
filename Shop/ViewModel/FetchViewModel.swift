

import Foundation
import Combine

class FetchViewModel: ObservableObject {
    
    @Published var mainData: MainData?
    @Published var productDetailsData: ProductDetailsData?
    @Published var myCartData: MyCartData?
    
    private let baseURL = "https://run.mocky.io/v3/"
    
    enum Screen: String {
        case main = "654bd15e-b121-49ba-a588-960956b15175"
        case productDetails = "6c14c560-15c6-4248-b9d2-b4508df7d4f5"
        case myCart = "53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    }
    
    
    var pub: AnyPublisher<(data: Data, response: URLResponse), URLError>? = nil
    var sub: Cancellable? = nil
    
    var data: Data? = nil
    var response: URLResponse? = nil
    func getData(screen: Screen) {
        
        guard let url = URL(string: (baseURL + screen.rawValue)) else {
            return
        }
        var request = URLRequest(url: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        pub = URLSession.shared.dataTaskPublisher(for: url)
            .print("Result")
            .eraseToAnyPublisher()
        sub = pub?.sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    fatalError(error.localizedDescription)
                }
            },
            receiveValue: { [self] in self.data = $0.data; response = $0.response;
                self.mainData = try? decoder.decode(MainData.self, from: $0.data)
                print(self.mainData)
            }
        )
        
        
        
        
        
    }
    
    
    
}
