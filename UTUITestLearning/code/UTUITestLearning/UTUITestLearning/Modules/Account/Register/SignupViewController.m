//
//  SignupViewController.m
//  UTUITestLearning
//
//  Created by qufei on 2020/4/26.
//  Copyright © 2020 qufei. All rights reserved.
//

#import "SignupViewController.h"
#import "SignupView.h"

@interface SignupViewController ()<SignupViewDelegate>

/// 注册视图
@property (nonatomic, strong, nonnull) SignupView *signupView;

@end

@implementation SignupViewController

#pragma mark - Lifecycle

- (void)loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view = self.signupView;
}

#pragma mark - Setters and Getters

/// 注册视图
- (SignupView * _Nonnull)signupView {
    if (_signupView) {
        return _signupView;
    }
    
//    _registerView = [[SignupView alloc] initWithFrame:self.view.bounds];
//    _registerView = [[[NSBundle mainBundle] loadNibNamed:@"SignupView" owner:self options:nil] lastObject];
    _signupView = [SignupView registerView];
    _signupView.delegate = self;
    
    return _signupView;
}

#pragma mark - Private Methods

#pragma mark - Public Methods

#pragma mark - RegiserViewDelegate

- (void)signupViewDidClickSignup:(SignupView *)signupView {
    [self dismissViewControllerAnimated:YES completion:^{
        // Finished
    }];
}

@end
