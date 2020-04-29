//
//  SignupModel.m
//  UTUITestLearning
//
//  Created by qufei on 2020/4/26.
//  Copyright © 2020 qufei. All rights reserved.
//

#import "SignupModel.h"

@implementation SignupModel

#pragma mark - Public Methods

- (void)publicFunc01 {
    NSLog(@"%s", __FUNCTION__);
}

- (NSString *)publicFunc02WithInputParameter:(NSString *)parameter {
    NSString *tmpStr = nil;
    if (parameter) {
        tmpStr = [NSString stringWithFormat:@"Public func has parameter %@.", parameter];
    } else {
        tmpStr = @"Public func has no parameter.";
    }
    
    return tmpStr;
}

#pragma mark - Private Methods

/// 私有实例示例方法
/// @param parameter 参数
- (NSString * _Nullable)privateFunc01WithInputParameter:(NSString * _Nullable)parameter {
    NSString *tmpStr = nil;
    if (parameter) {
        tmpStr = [NSString stringWithFormat:@"Prviate func has parameter %@", parameter];
    } else {
        tmpStr = @"Prviate func has no parameter";
    }
    
    return tmpStr;
}

@end
