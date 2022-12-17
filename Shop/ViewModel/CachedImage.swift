
import SwiftUI
import Combine
import UIKit


class UrlImageModel: ObservableObject {
    
    @Published var image: UIImage?
    private var url: URL?
    private var cancellable: AnyCancellable?
    private var imageCache = ImageCache.getImageCache()
    
    init(url: URL?) {
        self.url = url
        loadImage()
    }
    
    func loadImage() {
        if loadImageFromCache() {
            return
        }
        
        loadImageFromUrl()
    }
    
    func loadImageFromCache() -> Bool {
        guard let url = url else {
            return false
        }
        
        guard let cacheImage = imageCache[url] else {
            return false
        }
        
        image = cacheImage
        return true
    }
    
    func loadImageFromUrl() {
        guard let url = url else {
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .handleEvents(receiveOutput: { [unowned self] image in
                guard let image = image else {return}
                self.imageCache[url] = image
            })
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
}

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


struct LAsyncImage: View {
    
    private var url: URL?
    @ObservedObject var image: UrlImageModel
    init(url: URL?) {
        self.url = url
        image = UrlImageModel(url: url)
        
    }
    
    var body: some View {
        if let image = image.image {
            Image(uiImage: image)
                .resizable()
        } else {
            ProgressView()
        }
        
    }
    
    
}
