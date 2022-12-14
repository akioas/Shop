
import Foundation

struct ProductDetailsData: Decodable {
    var CPU: String
    var camera: String
    var capacity: [String]
    var color: [String]?
    var id: String
    var images: [String]
    var isFavorites: Bool
    var price: Int
    var rating: Double
    var sd: String
    var ssd: String
    var title: String
}
