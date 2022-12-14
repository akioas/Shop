

import Foundation
import Combine

class FetchViewModel: ObservableObject {
    
    @Published var mainData: MainData?
    @Published var productDetailsData: ProductDetailsData?
    @Published var myCartData: MyCartData?
    
    @Published var str: String = ""
    
    var pub: AnyPublisher<(data: Data, response: URLResponse), URLError>? = nil
    var sub: Cancellable? = nil
    var data: Data? = nil
    var response: URLResponse? = nil
    
    private let baseURL = "https://run.mocky.io/v3/"
    
    enum Screen: String {
        case Main = "Main"
        case ProductDetails = "ProductDetails"
        case MyCart = "MyCart"
        
        var klass: AnyClass {
            return NSClassFromString(self.rawValue)!
        }
        var url: String {
            switch self {
            case .Main:
                return "654bd15e-b121-49ba-a588-960956b15175"
            case .ProductDetails:
                return "6c14c560-15c6-4248-b9d2-b4508df7d4f5"
            case .MyCart:
                return "53539a72-3c5f-4f30-bbb1-6ca10d42c149"
            }
        }
    }
    
    
    func getData(screen: Screen) {
        
        guard let url = URL(string: (baseURL + screen.url)) else {
            return
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        pub = URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
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
                self.str = mainData?.bestSeller.first?.title ?? ""
                print(self.str)
            }
            
        )
    }
  
}
