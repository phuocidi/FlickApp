//
//  InitializationTests.swift
//  FlickerSearchTests
//
//  Created by Huu Phuoc Tran on 1/9/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import XCTest
import UIKit

class InitializationTests: XCTestCase {

  
  /* Variables stored in the XCTestCase must be optionals so they can be set to "nil" in tearDown().*/
  
  var apiHandler: APIHandler!
  var session : URLSession!
  
  var customCollectionView : CustomCollectionView!
  var viewModel : ViewModelFlicker!
  
  var viewController: UIViewController!

  
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      session = URLSession.shared
      apiHandler = APIHandler(session: session)
      
      viewModel = ViewModelFlicker()
      customCollectionView = CustomCollectionView(frame: UIScreen.main.bounds, viewModel: viewModel)
    }
  
  func testViewControllerInit(){
    
    //1
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
    viewController = navigationController.topViewController
    
    //2
    UIApplication.shared.keyWindow!.rootViewController = viewController
    
    //3
    assert(navigationController.view != nil, "navigationController.view  is nil")

    assert(viewController.view != nil, "viewController.view is nil")

  }
  
  
  func testCustomCollectionViewInit(){
    assert(customCollectionView != nil, "customCollectionView variable is nil")
  }
  
  func testViewModelInit(){
    assert(viewModel != nil, "viewModel variable is nil")
  }
  
  func testSessionInit(){
    assert(session != nil, "session variable is nil")
  }
  
  func testHttpClientInit(){
    assert(apiHandler != nil, "apiHandler variable is nil")
  }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
      /* Variables stored in the XCTestCase must be optionals so they can be set to "nil" in tearDown().*/
      
      apiHandler = nil
      session = nil
      customCollectionView = nil
      viewModel = nil
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
