//
//  UISearchBarDelegateHandlerMock.swift
//  FlickerSearchTests
//
//  Created by Huu Phuoc Tran on 1/8/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import XCTest
import Foundation
@testable import FlickerSearch

class UISearchBarDelegateHandlerMock: SearchResultsProtocol {
  var data: String!
  func search(byText text: String?) {
    self.data = "Kitten"
  }

}
