//
//  RegisterView.m
//  UTUITestLearning
//
//  Created by qufei on 2020/4/26.
//  Copyright © 2020 qufei. All rights reserved.
//

#import "RegisterView.h"
#import "UTUITestLearning-Swift.h"

@interface RegisterView()<ObjcNibLoable>

@end

@implementation RegisterView

#pragma mark - Lifecycle

+ (instancetype)registerView {
    NSString *nibName = NSStringFromClass(RegisterView.class);
    return [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] lastObject];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutNibView];
    }
    
    return self;
}

//- (instancetype)initWithCoder:(NSCoder *)coder {
//    self = [super initWithCoder:coder];
//    if (self) {
//        [self layoutNibView];
//    }
//    return self;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark - Setters and Getters
- (void)setRegisterButton:(UIButton *)registerButton {
    if (_registerButton == nil) {
        registerButton.layer.cornerRadius = 6;
        registerButton.layer.masksToBounds = YES;
        _registerButton = registerButton;
    }
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - Target Actions

- (IBAction)didClickRegisterButton:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(registerViewDidClickRegister:)]) {
        [self.delegate registerViewDidClickRegister:self];
    }
}

#pragma mark - Private Methods

#pragma mark - Public Methods

#pragma mark - ObjcNibLoable

- (void)layoutNibView {
    UIView *nibView = [self loadNib];
    if (nibView) {
        nibView.frame = self.bounds;
        [self addSubview:nibView];
    }
}

//- (UIView * _Nullable)loadNib {
//    NSBundle *bundle = [NSBundle bundleForClass:self.class];
//    NSString *nibName = NSStringFromClass(self.class);
//
//    if (nibName) {
//        UINib *nib = [UINib nibWithNibName:nibName bundle:bundle];
//        UIView *view = [nib instantiateWithOwner:nib options:nil].firstObject;
//        return view;
//    }
//    return nil;
//}

- (UIView * _Nullable)loadNib {
    NSString *nibName = NSStringFromClass(self.class);
    
    if (nibName) {
        
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] lastObject];
        return view;
    }
    return nil;
}

@end
