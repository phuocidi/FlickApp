//
//  ImageCache.swift
//  FlickerSearch
//
//  Created by Huu Phuoc Tran on 1/3/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import UIKit

class ImageCache {
  
  static let shared = ImageCache()
  private let session: URLSession
  
  
  private let cache: NSCache<NSString,UIImage> = NSCache()
  
  private init(session: URLSession = .shared) {
    self.session = session
  }
  
  func addImage(key:NSString, image:UIImage) {
    self.cache.setObject(image, forKey: key)
  }
  func getImage(key:NSString) -> UIImage? {
    return self.cache.object(forKey: key)
  }
  
  func fetchImage(url:URL, callback:@escaping (_ image:UIImage?)->()) {
    
    let aImage = getImage(key: url.absoluteString as NSString)
    
    if aImage != nil{
      
      DispatchQueue.main.async {
        callback(aImage)
      }
      
    }else{
      session.dataTask(with: url) { (data, response, error) in
        
        guard
          let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
          let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
          let data = data, error == nil,
          let image = UIImage(data: data)
          else {
            DispatchQueue.main.async {
              callback(nil)
            }
            return
        }
        self.addImage(key: url.absoluteString as NSString, image: image)
        DispatchQueue.main.async {
          callback(image)
        }
        }.resume()
      
    }
  }
}
