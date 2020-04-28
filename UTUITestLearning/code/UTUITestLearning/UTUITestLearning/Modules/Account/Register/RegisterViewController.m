//
//  RegisterViewController.m
//  UTUITestLearning
//
//  Created by qufei on 2020/4/26.
//  Copyright © 2020 qufei. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"

@interface RegisterViewController ()<RegisterViewDelegate>

@property (nonatomic, strong, nonnull) RegisterView *registerView;

@end

@implementation RegisterViewController

- (void)loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view = self.registerView;
}

#pragma mark - Setters and Getters

- (RegisterView * _Nonnull)registerView {
    if (_registerView) {
        return _registerView;
    }
    
//    _registerView = [[RegisterView alloc] initWithFrame:self.view.bounds];
//    _registerView = [[[NSBundle mainBundle] loadNibNamed:@"RegisterView" owner:self options:nil] lastObject];
    _registerView = [RegisterView registerView];
    _registerView.delegate = self;
    
    return _registerView;
}

#pragma mark - Private Methods

#pragma mark - Public Methods

#pragma mark - RegiserViewDelegate

- (void)registerViewDidClickRegister:(RegisterView *)registerView {
    [self dismissViewControllerAnimated:YES completion:^{
        // Finished
    }];
}

@end
