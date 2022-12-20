

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

class MainInfo {
    let brandList = ["Samsung", "Xiaomi"]
    let priceList = ["$0 - $300", "$300 - $500", "$500 - $1,000",
                             "$1,000 - $5,000", "$5,000 - $10,000"]
    let sizeList = ["4.5 to 5.5 inches"]
}
