//
//  FlickerSearchTests.swift
//  FlickerSearchTests
//
//  Created by Huu Phuoc Tran on 1/2/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import UIKit
import XCTest
import Foundation

//MARK: Test
class APIHandlerTests: XCTestCase {
  
  /* Variables stored in the XCTestCase must be optionals so they can be set to "nil" in tearDown().*/

  var apiHandler: APIHandler!
  var session : URLSession!

  override func setUp() {
    super.setUp()
    session = URLSession.shared
    apiHandler = APIHandler(session: session)
}
  
  override func tearDown() {
    super.tearDown()
    /* Variables stored in the XCTestCase must be optionals so they can be set to "nil" in tearDown().*/

    apiHandler = nil
    session = nil
    
  }
  
  func testAPICall() {
    
    let expectation = XCTestExpectation(description: "Testing the API Call, when there is no error and data and response both are not nil ")
    let urlEncodedText = "kitten"
    let page = 3
    let pageSize = 4
    
    let strUrl = apiHandler.api(method: ApiConfig.FlickrSearchMethod, api_key: ApiConfig.FlickrKey, parameters: "text=\(urlEncodedText)&page=\(page)&safe_search=1&per_page=\(pageSize)")
    
    apiHandler.photoSearch(withUrl: URL(string: strUrl)!)
    {
      (data, response, error) in
      if (data != nil) && (response != nil) && (error == nil) {
        expectation.fulfill()
      }
    }
    
    wait(for: [expectation], timeout: 10)
  }
  
  func testAsyncAPITestingForErrorResponseAndData(){
    
    let urlEncodedText = "kitten"
    let page = 3
    let pageSize = 4
    let strUrl = apiHandler.api(method: ApiConfig.FlickrSearchMethod, api_key: ApiConfig.FlickrKey, parameters: "text=\(urlEncodedText)&page=\(page)&safe_search=1&per_page=\(pageSize)")

    
    guard let jsonURL = URL(string: strUrl) else { return }
    
    let testExpectation = expectation(description: "Test error response and data")
    
    let dataTask = URLSession.shared.dataTask(with: jsonURL){
      (imgData, response, apiErr) in
      
      var flag = 0
      
      if apiErr == nil {
        flag += 1
      }
      
      if let httpResponse = response as? HTTPURLResponse {
        if httpResponse.statusCode == 200 {
          flag += 1
        }
      }
      
      if imgData != nil {
        flag += 1
      }
      
      if flag == 3 {
        testExpectation.fulfill()
      }
      
    }
    dataTask.resume()
    
    wait(for: [testExpectation], timeout: 4)
  }
  
  
  func testAPIPageSize() {
    
    let expectation = XCTestExpectation(description: "Testing the lazy load page size Call")
    let urlEncodedText = "kitten"
    let page = 3
    let pageSize = 4
    let strUrl = apiHandler.api(method: ApiConfig.FlickrSearchMethod, api_key: ApiConfig.FlickrKey, parameters: "text=\(urlEncodedText)&page=\(page)&safe_search=1&per_page=\(pageSize)")
    
    apiHandler.photoSearch(withUrl: URL(string: strUrl)!)
    {
      (data, response, error) in
      if data != nil {
        
        do{
          let jsonDecoder = JSONDecoder()
          var model : Root?
          
          model = try jsonDecoder.decode(Root.self, from: data!)
          XCTAssertEqual(model?.photos?.photo?.count, 4)
          expectation.fulfill()
          
        }catch{
        }
        
      }
    }
    wait(for: [expectation], timeout: 10)
  }
}
