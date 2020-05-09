//
//  RegisterModelTests.m
//  UTUITestLearningTests
//
//  Created by Qufei on 2020/4/28.
//  Copyright © 2020 qufei. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SignupModel.h"

#pragma mark - SignupModel

/// Signup Model Category for testing private methods
@interface SignupModel(UnitTest)

- (NSString * _Nullable)privateFunc01WithInputParameter:(NSString * _Nullable)parameter;

@end

#pragma mark - SignupModelTests

@interface SignupModelTests : XCTestCase

@end

@implementation SignupModelTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    SignupModel *model = [[SignupModel alloc] init];
    NSString * result = [model privateFunc01WithInputParameter:nil];
    XCTAssertTrue([result isEqualToString:@"Prviate func has no parameter"]);
}

- (void)testO1RequestSignupSuccess {
    
    XCTestExpectation* expectation = [self expectationWithDescription:@"RequestSignupSuccess"];
    
    dispatch_queue_t queue = dispatch_queue_create("group.queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_block_t block = dispatch_block_create(0, ^{
        [NSThread sleepForTimeInterval:1.0f];
        printf("=====block invoke=====\n");
        [expectation fulfill];
    });
    
    dispatch_async(queue, block);
    
    [self waitForExpectationsWithTimeout:3 handler:^(NSError * _Nullable error) {
        
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
