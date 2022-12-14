

import Foundation

struct MainData: Decodable {
    var homeStore: [HomeStore]
    var bestSeller: [BestSeller]
}

struct HomeStore: Decodable {
    var id: Int
    var isNew: Bool?
    var title: String
    var subtitle: String
    var picture: String
    var isBuy: Bool
}

struct BestSeller: Decodable {
    var id: Int
    var isFavorites: Bool
    var title: String
    var priceWithoutDiscount: Int
    var discountPrice: Int
    var picture: String
}
