//
//  UserScreenUITests.swift
//  UTUITestLearningUITests
//
//  Created by qufei on 2020/5/7.
//  Copyright © 2020 qufei. All rights reserved.
//

import XCTest

class UserScreenUITests: XCTestCase {
    
    let app: XCUIApplication = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        self.launchApp()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

    }

    func testEnterUserScreen() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // Given
        let expectedTableCellCount: Int = 10
        
        // when
        self.enterUserView()
        sleep(1)
        let table = app.tables.firstMatch
        sleep(1)
        // Then
        XCTAssertNotNil(table, "TableView Should not be nil.")
        table.swipeUp()
        table.swipeDown()
        let tableCellCount: Int = table.cells.count
        XCTAssertEqual(tableCellCount, expectedTableCellCount)
    }
}

// MARK: - Utils

extension UserScreenUITests {
    fileprivate func launchApp() {
        app.launch()
    }
    
    fileprivate func terminateApp() {
        app.terminate()
    }
    
    fileprivate func enterUserView() {
        let tabBarButtons = app.tabBars.buttons
        tabBarButtons["User"].tap()
    }
}
