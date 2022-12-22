

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
    let defaults = UserDefaults()
    let key = "basketItemsCount"
    func getBasketItemsCount() -> Int? {
        defaults.integer(forKey: key)
    }
    func setBasketItemsCount(count: Int) {
        defaults.set(count, forKey: key)
    }
}
