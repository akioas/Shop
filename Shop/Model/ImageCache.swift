import UIKit

class ImageCache {
    var cache = NSCache<NSURL, UIImage>()
    private static var imageCache = ImageCache()
    
    subscript(_ key: URL) -> UIImage? {
        get { cache.object(forKey: key as NSURL) }
        set { newValue == nil ? cache.removeObject(forKey: key as NSURL) : cache.setObject(newValue!, forKey: key as NSURL) }
    }
    
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}
