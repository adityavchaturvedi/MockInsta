//
//  MockInstaTests.swift
//  MockInstaTests
//
//  Created by Aditya Chaturvedi on 9/20/15.
//  Copyright © 2015 Aditya V Chaturvedi. All rights reserved.
//

import XCTest
import Foundation
import Alamofire
import SwiftyJSON

@testable import MockInsta

class MockInstaTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let deftime: NSTimeInterval = 10
        let expectation = expectationWithDescription("Waiting for Response")
        
        Alamofire.request(.GET, "https://api.instagram.com/v1/media/popular?client_id=c953ffadb974463f9f6813fc4fc91673")
            .responseJSON { _ , response, _ in
                XCTAssertEqual(response!.statusCode, 200)
                expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(deftime, handler: nil)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
