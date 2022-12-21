

import Foundation

struct MyCartData: Decodable {
    var basket: [Basket]?
    var delivery: String
    var id: String
    var total: Int
}

struct Basket: Decodable {
    var id: Int
    var images: String
    var price: Int
    var title: String
}

class Repository {
    static let shared = Repository()
    var basketItemsCount: Int?
}
