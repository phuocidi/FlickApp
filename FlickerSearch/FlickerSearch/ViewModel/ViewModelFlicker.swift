//
//  ViewModelFlicker.swift
//  FlickerSearch
//
//  Created by Huu Phuoc Tran on 1/3/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import Foundation

class ViewModelFlicker {
  
  
  var searchText : String? // last searched term of user for lazy loading
  var numberOfPhotos: Int { return photos.count }
  private var tmpPhotoCount: Int  = 0                  // tmp count for lazy loading

  private lazy var apiHandler = APIHandler(session: URLSession.shared)
  private var photos: [Photo] = [] {
    didSet {
      didUpdatePhotos?(photos)
    }
  }
  
  var query: String = "" {
    didSet {
      page = page + 1
      getSearchedImage(withText: query, andPage: page, andPageSize:50)
    }
  }
  
  private var mutablePhotos: NSMutableArray = NSMutableArray()
  private var page: Int = 0
  
  private var resetPhotos: Bool = false {
    didSet {
      if resetPhotos {
        mutablePhotos.removeAllObjects()
        photos.removeAll()
        page = 0
      }
    }
  }
  
  var didUpdatePhotos: (([Photo]) -> ())?
  var didHappenError: ((_ aError :String) -> ())?
  var didStartSearch: (() -> ())?
  var didEndSearch: (() -> ())?
  

  func getSearchedImage(withText text: String, andPage page: Int, andPageSize pageSize:Int){

    didStartSearch?()
    
    guard !text.isEmpty else {
      photos = []
      didEndSearch?()
      return
    }
    
    guard let urlEncodedText = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
      return
    }
    
    let strUrl = apiHandler.api(method: ApiConfig.FlickrSearchMethod, api_key: ApiConfig.FlickrKey, parameters: "text=\(urlEncodedText)&page=\(page)&safe_search=1&per_page=\(pageSize)")
    
    let url = URL(string: strUrl)
    guard let urlUnwrapped = url else { return  }

    apiHandler.photoSearch(withUrl: urlUnwrapped) { [unowned self] (data, response, error) in
      self.handleError(error: error?.localizedDescription)
      if let dataUnwrapped = data {
        self.parseData(dataUnwrapped: dataUnwrapped)
      }else{
        self.handleError(error: "Data is nil")
      }
    }
}
  
  func parseData(dataUnwrapped : Data){
    do{
      let jsonDecoder = JSONDecoder()
      var model : Root?
      
      model = try jsonDecoder.decode(Root.self, from: dataUnwrapped)
      self.mutablePhotos.addObjects(from: (model?.photos?.photo)!)
      self.photos = self.mutablePhotos as! [Photo]
      self.didEndSearch?()
    }catch{
      self.didHappenError?(error.localizedDescription)
      self.didEndSearch?()
    }
  }
  
  func handleError(error : String?){
    if let error = error {
      self.didHappenError?(error)
      self.didEndSearch?()
    }
  }
  
  func photo(at index: Int) -> Photo? {
    guard index < photos.count else { return nil }
    return photos[index]
  }
  
}

extension ViewModelFlicker : SearchResultsProtocol{
  
  func search(byText text: String?) {
    tmpPhotoCount = 0
    resetPhotos = true
    
    if let text = text {
      searchText = text
      query = text
    }
    else {
      guard let searchText = searchText else { return }
      query = searchText
    }
  }
}
