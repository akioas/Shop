

import Foundation
import Combine


class APIManager {
    
    private let baseURL = "https://run.mocky.io/v3/"
    
    enum Screen: String {
        case main = "654bd15e-b121-49ba-a588-960956b15175"
        case productDetails = "6c14c560-15c6-4248-b9d2-b4508df7d4f5"
        case myCart = "53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    }
    
    private var subscriber = Set<AnyCancellable>()
    private let decoder: JSONDecoder
    init() {
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetch<T: Decodable>(screen: Screen, completion: @escaping (Result<T, Error>) -> Void )  {
        guard let url = URL(string: (baseURL + screen.rawValue)) else {
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
        
            .sink { (resultCompletion) in
                switch resultCompletion {
                case .failure(let error):
                    print(error)
                    completion(.failure(error))
                case .finished:
                    return
                }
            } receiveValue: { (result) in
                completion(.success(result))
            }
            .store(in: &subscriber)
    }
}
