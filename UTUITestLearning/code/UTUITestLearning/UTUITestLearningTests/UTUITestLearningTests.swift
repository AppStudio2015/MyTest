//
//  UTUITestLearningTests.swift
//  UTUITestLearningTests
//
//  Created by qufei on 2020/4/26.
//  Copyright © 2020 qufei. All rights reserved.
//

import XCTest
@testable import UTUITestLearning

class UTUITestLearningTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        let userModel = UserModel()
//        userModel.testFileprivateFunc()
        let settingModel = UserModel.defaultSettingModel()
        switch settingModel {
        case .section0(let models):
            guard let datas = models else {
                XCTAssertFalse(false)
                return
            }
            XCTAssertTrue(datas.count > 0)
            break
        default:
            XCTAssertFalse(false)
            break
        }
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

//extension UserModel {
//    func privateFunc() -> Void {
//
//    }
//}

