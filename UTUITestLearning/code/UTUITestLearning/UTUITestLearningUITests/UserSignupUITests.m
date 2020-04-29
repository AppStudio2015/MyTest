//
//  UserSignupUITests.m
//  UTUITestLearningUITests
//
//  Created by qufei on 2020/4/29.
//  Copyright © 2020 qufei. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UserSignupUITests : XCTestCase

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
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

/// 进入特定视图
/// @param seconds 停留时长
- (void)enterSpecificViewWaitSeconds:(unsigned int)seconds {
    sleep(seconds);
}

/// 等待数秒考虑到控件显示
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
