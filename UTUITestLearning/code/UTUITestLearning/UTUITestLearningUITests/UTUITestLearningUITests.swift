//
//  UTUITestLearningUITests.swift
//  UTUITestLearningUITests
//
//  Created by qufei on 2020/4/26.
//  Copyright © 2020 qufei. All rights reserved.
//

import XCTest

class UTUITestLearningUITests: XCTestCase {
    
    let app: XCUIApplication = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app.terminate()
    }

    func test01EnterRegisterView() throws {
        // UI tests must launch the application that they test.
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tabBarButtons = app.tabBars.buttons
        tabBarButtons["User"].tap()
        sleep(1)
        let signinButton = app.tables.buttons["Signin"]
        signinButton.tap()
        sleep(1)
        let registerButton = app.buttons["还没注册么？"]
        registerButton.tap()
        sleep(1)
        let confirmPwdTF = app.textFields["确认密码"].firstMatch
        XCTAssert(confirmPwdTF.placeholderValue == "确认密码", "Pass")
    }
    
    func test02EnterSigninView() {
        let tabBarButtons = app.tabBars.buttons
        tabBarButtons["User"].tap()
        sleep(1)
        let signinButton = app.tables.buttons["Signin"]
        signinButton.tap()
        let phoneNumTextField = app.textFields["请输入11位手机号"]
        phoneNumTextField.tap()
        phoneNumTextField.typeText("12345678900")
        let passwordTextField = app.textFields["请输入密码"]
        passwordTextField.tap()
        passwordTextField.typeText("111111")
        let siginButton = app.buttons["登录"]
        siginButton.tap()
    }
    
    func test03EnterSettingView() {
        self.enterUserView()
        sleep(1)
        let table = app.tables.firstMatch
        table.swipeUp()
        table.swipeDown()
        let cell = table.cells.element(boundBy: 2)
        cell.tap()
        sleep(2)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
            }
        }
    }
}

extension UTUITestLearningUITests {
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
