//
//  TestSingleton.swift
//  FlickerSearchTests
//
//  Created by Huu Phuoc Tran on 1/9/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import XCTest

class TestSingleton: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
/*to test both instances should be equal*/
  func testSingleton() {
    let object1 = ImageCache.shared
    let object2 = ImageCache.shared
    let otherReferenceToMyFirstObject = object2

    XCTAssert(object1 === otherReferenceToMyFirstObject) // passes
  }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
