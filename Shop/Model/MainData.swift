

import Foundation

struct MainData: Decodable {
    var homeStore: [HomeStoreData]
    var bestSeller: [BestSellerData]
}

struct HomeStoreData: Decodable {
    var id: Int
    var isNew: Bool?
    var title: String
    var subtitle: String
    var picture: String
    var isBuy: Bool
}

struct BestSellerData: Decodable {
    var id: Int
    var isFavorites: Bool
    var title: String
    var priceWithoutDiscount: Int
    var discountPrice: Int
    var picture: String
}
