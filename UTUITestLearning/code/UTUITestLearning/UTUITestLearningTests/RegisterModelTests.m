//
//  RegisterModelTests.m
//  UTUITestLearningTests
//
//  Created by Qufei on 2020/4/28.
//  Copyright © 2020 qufei. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RegisterModel.h"

@interface RegisterModel(UnitTest)

- (NSString * _Nullable)privateFunc01WithInputParameter:(NSString * _Nullable)parameter;

@end

@interface RegisterModelTests : XCTestCase

/// 进入指定界面
- (void)enterSpecificViewWaitSeconds:(unsigned int)seconds;

/// 等待方法
/// @param element 等待出现的元素
/// @param seconds 耗时（秒）
/// @param visible 是否显示
- (void)waitElement:(XCUIElement *)element sencods:(NSTimeInterval)seconds untilVisible:(BOOL)visible;

@end

@implementation RegisterModelTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    RegisterModel *model = [[RegisterModel alloc] init];
    NSString * result = [model privateFunc01WithInputParameter:nil];
    XCTAssertTrue([result isEqualToString:@"Prviate func has no parameter"]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

/// 进入群组导航
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
