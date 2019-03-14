//
//  SearchBarDelegateHandler.swift
//  FlickerSearch
//
//  Created by Huu Phuoc Tran on 1/5/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import UIKit

protocol SearchResultsProtocol {
  
  func search(byText text: String?)
  
}

class SearchBarDelegateHandler: NSObject, UISearchBarDelegate {
  
 private var viewModel :ViewModelFlicker!
  
  var delegate : SearchResultsProtocol?
  
  init(viewModel : ViewModelFlicker) {
    self.viewModel = viewModel
  }

  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
  }
  
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {

    guard let text = searchBar.text else {
      return
    }

    if text.count > 0 {
      guard let delegate = self.delegate else {
        return
      }
      delegate.search(byText: text)
    }
  }
  
}
