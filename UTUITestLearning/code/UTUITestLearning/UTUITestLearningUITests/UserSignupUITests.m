//
//  UserSignupUITests.m
//  UTUITestLearningUITests
//
//  Created by qufei on 2020/4/29.
//  Copyright © 2020 qufei. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UserSignupUITests : XCTestCase

@property (nonatomic, strong) XCUIApplication *app;

/// 进入指定界面
- (void)enterSpecificViewWaitSeconds:(unsigned int)seconds;

/// 等待方法
/// @param element 等待出现的元素
/// @param seconds 耗时（秒）
/// @param visible 是否显示
- (void)waitElement:(XCUIElement *)element sencods:(NSTimeInterval)seconds untilVisible:(BOOL)visible;

@end

@implementation UserSignupUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = YES;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    _app = [[XCUIApplication alloc] init];
    [self launchAppWaitSeconds:1];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExameple {
    [self expectationForPredicate:[NSPredicate predicateWithFormat:@"self.count = 1"]
              evaluatedWithObject:self.app.tables
                          handler:nil];
    [self waitForExpectationsWithTimeout:2.0 handler:nil];
}

- (void)testEnterSignupScreen {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    // Given
    NSInteger expectedTextFieldCount = 3;
    // When
    XCUIElement *tabBar = [[[_app tabBars] buttons][@"User"] firstMatch];
    if (tabBar) {
        [tabBar tap];
    }
    
    XCUIElement *signinBtn = [[_app buttons][@"Signin"] firstMatch];
    if (signinBtn) {
        [signinBtn tap];
    }
    
    XCUIElement *signupBtn = [[_app buttons][@"还没注册么？"] firstMatch];
    if (signupBtn) {
        [signupBtn tap];
    }
    
    // Then
    XCUIElementQuery *elementQuery = [_app textFields];
    XCTAssertNotNil(elementQuery, @"TextFields should not be nil.");
    // 下面的判断注意
//    NSInteger count = [elementQuery count];
//    XCTAssertEqual(count, expectedTextFieldCount, @"Pass!");
    
    XCUIElement *textField1 = [[elementQuery elementMatchingType:XCUIElementTypeTextField identifier:@"请输入11位手机号"] firstMatch];
    XCTAssertTrue([[textField1 placeholderValue] isEqualToString:@"请输入11位手机号"], @"Phone number.");
    XCUIElement *textField2 = [elementQuery elementMatchingType:XCUIElementTypeTextField identifier:@"密码（至少8位）"];
    XCTAssertTrue( [[textField2 placeholderValue] isEqualToString:@"密码（至少8位）"], @"Password.");
    XCUIElement *textField3 = [elementQuery elementMatchingType:XCUIElementTypeTextField identifier:@"确认密码"];
    XCTAssertTrue([[textField3 placeholderValue] isEqualToString:@"确认密码"], @"Confirm password.");
}

#pragma mark - Utils

/// 启动应用
/// @param seconds 停留时长
- (void)launchAppWaitSeconds:(unsigned int)seconds {
    [_app launch];
    sleep(seconds);
}

/// 进入特定视图
/// @param seconds 停留时长
- (void)enterSpecificViewWaitSeconds:(unsigned int)seconds {
    sleep(seconds);
}

/// 等待数秒到控件显示
/// @param element 要显示的控件
/// @param seconds 等待时长
/// @param visible 是否显示
- (void)waitElement:(XCUIElement *)element sencods:(NSTimeInterval)seconds untilVisible:(BOOL)visible {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"exists == %ld", visible ? 1 : 0];
    [self expectationForPredicate:predicate evaluatedWithObject:element handler:nil];
    [self waitForExpectationsWithTimeout:seconds handler:^(NSError * _Nullable error) {
        //NSString *message = @"Failed to find \(element) after 30 seconds.";
        //[self recordFailureWithDescription:message inFile:__FILE__ atLine:__LINE__ expected:YES];
    }];
}

@end
