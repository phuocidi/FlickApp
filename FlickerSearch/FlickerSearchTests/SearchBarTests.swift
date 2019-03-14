//
//  SearchBarTests.swift
//  FlickerSearchTests
//
//  Created by Huu Phuoc Tran on 1/8/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import XCTest
import UIKit
import Foundation
@testable import FlickerSearch


class SearchBarTests: XCTestCase {
  
  var mock: UISearchBarDelegateHandlerMock!
  var dataSourceDelegate: SearchBarDelegateHandler!
  var searchBar : UISearchBar!

    override func setUp() {
      /* Variables stored in the XCTestCase must be optionals so they can be set to "nil" in tearDown().*/
      searchBar = UISearchBar()
      
      searchBar.text = "Kitten"
      
      mock = UISearchBarDelegateHandlerMock()
      
      dataSourceDelegate = SearchBarDelegateHandler(viewModel: ViewModelFlicker())

      searchBar.delegate = dataSourceDelegate

      dataSourceDelegate.delegate = mock
    }
  
  func testSearchBarTextDidEndEditing(){
    dataSourceDelegate.searchBarTextDidEndEditing(searchBar)
    print(mock.data)
    XCTAssert(mock.data == "Kitten", "Correct")
  }

    override func tearDown() {
      /* Variables stored in the XCTestCase must be optionals so they can be set to "nil" in tearDown().*/

      searchBar = nil
      mock = nil
      dataSourceDelegate = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
