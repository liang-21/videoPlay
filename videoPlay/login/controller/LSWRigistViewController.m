//
//  LSWRigistViewController.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/7.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "LSWRigistViewController.h"
#import "LSWLoginInfoModel.h"
#import "LSWtextFieldBackground.h"
#import "cbsNetWork.h"
#import "AnimationTextField.h"
#import "UIColor+Hex.h"
#import <Masonry/Masonry.h>


@interface LSWRigistViewController ()
@property (nonatomic, strong) UIImageView *backimage;
@property (nonatomic, strong) UITextField *userNameTextFidld;
@property (nonatomic, strong) UITextField *passwordTextFidld;
@property (nonatomic, strong) UITextField *sexTextFidld;
@property (nonatomic, strong) UITextField *ageTextFidld;
@property (nonatomic, strong) UIButton *rigistButton;


@property(nonatomic,strong)LSWLoginInfoModel *info;

@end

@implementation LSWRigistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self.view insertSubview:self.backimage atIndex:0];
    self.view.contentMode=UIViewContentModeScaleAspectFill;
    UIVisualEffectView *visualEfView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    visualEfView.frame =self.view.bounds;
    [self.backimage addSubview:visualEfView];
    
    
    

}


- (void) setUI {
    [self.view addSubview:self.userNameTextFidld];
    [self.view addSubview:self.passwordTextFidld];
    [self.view addSubview:self.rigistButton];
    [self layout];
}

- (void) layout {
    [self.userNameTextFidld mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.height.equalTo(@60);
        make.width.equalTo(@(self.view.frame.size.width));
    }];
    [self.passwordTextFidld mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userNameTextFidld);
        make.top.equalTo(self.userNameTextFidld.mas_bottom).offset(20);
        make.height.equalTo(@60);
        make.width.equalTo(@(self.view.frame.size.width));
    }];
//    [self.sexTextFidld mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.userNameTextFidld);
//        make.top.equalTo(self.passwordTextFidld.mas_bottom).offset(80);
//        make.height.equalTo(@60);
//        make.width.equalTo(@(self.view.frame.size.width));
//    }];
//    [self.ageTextFidld mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.userNameTextFidld);
//        make.top.equalTo(self.sexTextFidld.mas_bottom).offset(80);
//        make.height.equalTo(@60);
//        make.width.equalTo(@(self.view.frame.size.width));
//        }];
//    
    [self.rigistButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.height.equalTo(@44);
        make.top.equalTo(self.passwordTextFidld.mas_bottom).offset(60);
    }];
}

#pragma action
- (void)rigistButtonTapped {
    
}

#pragma lazy
- (UITextField *)userNameTextFidld {
    if (!_userNameTextFidld) {
        _userNameTextFidld = [[UITextField alloc] initWithFrame:CGRectZero];
        _userNameTextFidld.borderStyle = UITextBorderStyleRoundedRect;
        _userNameTextFidld.backgroundColor = [UIColor clearColor];
        _userNameTextFidld.placeholder = @"请输入用户名";
    }
    return _userNameTextFidld;
}
- (UITextField *)passwordTextFidld {
    if (!_passwordTextFidld) {
        _passwordTextFidld = [[UITextField alloc] initWithFrame:CGRectZero];
        _passwordTextFidld.borderStyle = UITextBorderStyleRoundedRect;
        _passwordTextFidld.layer.borderWidth = 0.5;
        _passwordTextFidld.layer.borderColor= [[UIColor grayColor]CGColor ];
        _passwordTextFidld.backgroundColor = [UIColor clearColor];
        _passwordTextFidld.secureTextEntry = YES;
        _passwordTextFidld.placeholder = @"请输入密码";
    }
    return _passwordTextFidld;
}
- (UIButton *) rigistButton {
    if (!_rigistButton) {
        _rigistButton = [[UIButton alloc] init];
        [_rigistButton setTitle:@"注册" forState:UIControlStateNormal];
        [_rigistButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _rigistButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _rigistButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
       _rigistButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _rigistButton.layer.borderWidth = 0.5;
        _rigistButton.layer.borderColor = [[UIColor grayColor]CGColor];
        [_rigistButton addTarget:self action:@selector(rigistButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rigistButton;
}
- (UIImageView *) backimage{
    if (!_backimage) {
        _backimage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"topImage"]];
    }
    return _backimage;
}






@end
