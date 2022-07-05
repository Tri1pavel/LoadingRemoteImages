//
//  UIImageView+Extension.swift
//  LRI
//
//  Created by Development on 02.07.2022.
//

import Foundation
import UIKit

class ImageCache {
    static let shared = ImageCache()
    private let cache = NSCache<NSString, UIImage>()
    func getObject(forKey key: String) -> UIImage? {
        cache.object(forKey: NSString(string: key))
    }
    func setObject(_ object: UIImage, forKey key: String) {
        cache.setObject(object, forKey: NSString(string: key))
    }
}

extension UIImageView {
    
    func asyncImage(with urlString: String,
                    placeholder: UIImage? = UIImage(named: "placeholder"),
                    wasFetchedByCache: @escaping (UIImage, Bool) -> Void) {
        self.image = placeholder
        
        if let image = ImageCache.shared.getObject(forKey: urlString)  {
            // image was fecthed by cache in memory
            wasFetchedByCache(image, true)
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    ImageCache.shared.setObject(image, forKey: urlString)
                    // image was fecthed by api request
                    wasFetchedByCache(image, false)
                }
            }
        }
        task.resume()
    }

}
