//
//  RegisterView.h
//  UTUITestLearning
//
//  Created by qufei on 2020/4/26.
//  Copyright © 2020 qufei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RegisterView;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - RegisterViewDelegate
@protocol RegisterViewDelegate<NSObject>

@optional

- (void)registerViewDidClickRegister:(RegisterView *)registerView;

@end


#pragma mark - RegisterView

@interface RegisterView : UIView

/// 手机号输入框
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;

/// 密码输入框
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

/// 确认密码输入框
@property (weak, nonatomic) IBOutlet UITextField *confirmPwdTextField;

/// 注册按钮
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

/// 代理
@property (nonatomic, weak) id<RegisterViewDelegate> delegate;

#pragma mark - Initialization

+ (instancetype _Nullable)registerView;

@end

NS_ASSUME_NONNULL_END
