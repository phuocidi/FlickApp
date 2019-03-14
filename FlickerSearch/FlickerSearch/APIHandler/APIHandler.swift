//
//  APIHandler.swift
//  FlickerSearch
//
//  Created by Huu Phuoc Tran on 1/3/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import Foundation
typealias CompletionBlock = (Data?, URLResponse?, Error?) -> ()

class APIHandler{
  
  private let session: URLSession
  init(session: URLSession = .shared) {
    self.session = session
  }
  
  func photoSearch(withUrl url: URL, completionBlock : @escaping CompletionBlock) {
    
    session.dataTask(with: url) { (data, response, error) in
      DispatchQueue.main.async {
        completionBlock(data, response, error)
      }
      }.resume()
  }
  
  func api(method: String, api_key: String, parameters: String) -> String {
    assert(method.count > 0 && api_key.count > 0 && parameters.count>0, "check parameters count please")
    return "\(ApiConfig.FlickerUrl)?method=\(method)&api_key=\(api_key)&\(parameters)&format=json&nojsoncallback=1"
  }  
}
