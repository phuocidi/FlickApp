//
//  FlickerSearchUITests.swift
//  FlickerSearchUITests
//
//  Created by Huu Phuoc Tran on 1/2/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import XCTest

class FlickerSearchUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  /*This Ui test case programmatically enters text in searchbar and press enter*/
    func testSearchBar() {
      
      let app = XCUIApplication()
      let searchSearchField = app.navigationBars["FlickerSearch.View"].searchFields["Search"]
      searchSearchField.tap()
      searchSearchField.tap()
      searchSearchField.typeText("Kitten")
      app.buttons["Search"].tap()
      
  }
}
