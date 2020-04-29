//
//  SignupView.h
//  UTUITestLearning
//
//  Created by qufei on 2020/4/26.
//  Copyright © 2020 qufei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SignupView;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - RegisterViewDelegate

/// 注册视图代理
@protocol SignupViewDelegate<NSObject>

@optional

/// 注册点击回调
/// @param signupView  注册视图
- (void)signupViewDidClickSignup:(SignupView *)signupView;

@end


#pragma mark - RegisterView

/// 注册视图
@interface SignupView : UIView

/// 手机号输入框
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;

/// 密码输入框
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

/// 确认密码输入框
@property (weak, nonatomic) IBOutlet UITextField *confirmPwdTextField;

/// 注册按钮
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

/// 代理
@property (nonatomic, weak) id<SignupViewDelegate> delegate;

#pragma mark - Initialization

/// 类实例化方法
+ (instancetype _Nullable)registerView;

@end

NS_ASSUME_NONNULL_END
