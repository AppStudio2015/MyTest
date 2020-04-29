//
//  RegisterModel.h
//  UTUITestLearning
//
//  Created by qufei on 2020/4/26.
//  Copyright © 2020 qufei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 用户注册模型
@interface SignupModel : NSObject

/// 公有实例示例方法
- (void)publicFunc01;

/// 公有实例示例方法
/// @param parameter 参数
- (NSString * _Nullable)publicFunc02WithInputParameter:(NSString * _Nullable)parameter;

@end

NS_ASSUME_NONNULL_END
