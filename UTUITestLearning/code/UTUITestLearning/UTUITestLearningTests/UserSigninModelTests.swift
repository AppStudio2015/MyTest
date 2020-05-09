//
//  UserSigninModelTests.swift
//  UTUITestLearningTests
//
//  Created by qufei on 2020/4/30.
//  Copyright © 2020 qufei. All rights reserved.
//

import XCTest
@testable import UTUITestLearning

class UserSigninModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test01SigninSuccess() throws {
        // valid phone number: 13579246800
        let mobileNumber = "13579246800"
        // valid password: 123456
        let password = "123456"
        // expectedValue: True
        let expectedValue = true
        
        //
        let expectation: XCTestExpectation = self.expectation(description: "SigninSuccess")
        
        let signinModel = SigninModel()
        signinModel.signin(with: mobileNumber, password: password) { [weak self] (isSignedIn, accountInfo) -> (Void) in
            guard let strongSelf = self else {
                XCTAssert(true)
                return
            }
            
            XCTAssertEqual(expectedValue, isSignedIn)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func test02SigninFailure() throws {
        // valid phone number: 13579246800
        let mobileNumber = "13579246800"
        // invalid password: 1234567
        let password = "1234567"
        // expectedValue: False
        let expectedValue = false
        
        let expectation: XCTestExpectation = self.expectation(description: "SigninFailure")
        
        let signinModel = SigninModel()
        signinModel.signin(with: mobileNumber, password: password) { [weak self] (isSignedIn, accountInfo) -> (Void) in
            guard let strongSelf = self else {
                XCTAssert(true)
                return
            }
            
            XCTAssertEqual(expectedValue, isSignedIn)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 5) { (error) in
            print("Timeout!")
        }
    }
    
    func test03HandleSiginResonse() throws {
        // Construct Error
        let error: Error? = nil
        // Construct Data
        let data: Data = Data()
        // ExpectedValue
        let expectedValue: AccountInfo = AccountInfo(userId: "", userToken: "", phoneNumber: "", userName: "", userAvatar: "")
        
        let signingModel = SigninModel()
        signingModel.testHandleSigninResponseData(data, error: error)
        let testValue = AccountSession.default.accountInfo
        XCTAssertEqual(expectedValue, testValue)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
