//
//  LSWLoginViewController.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/7.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "LSWLoginViewController.h"
#import "LSWtextFieldBackground.h"
#import "LSWLoginInfoModel.h"
#import "UIColor+Hex.h"
#import "LSWVideoViewController.h"
#import <Masonry/Masonry.h>
#import "LSWRigistViewController.h"

@interface LSWLoginViewController ()
@property(nonatomic,strong)UITextField *name;
@property(nonatomic,strong)UITextField *password;
@property(nonatomic,strong)UIButton *loginButton;
@property(nonatomic,strong)UIButton *registerButton;
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic,strong)LSWtextFieldBackground *background;
@property(nonatomic,strong)LSWLoginInfoModel *info;
@property (nonatomic, strong) UIImageView *backimage;


@end

@implementation LSWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view insertSubview:self.backimage atIndex:0];
    self.view.contentMode=UIViewContentModeScaleAspectFill;
    UIVisualEffectView *visualEfView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    visualEfView.frame =self.view.bounds;
    [self.backimage addSubview:visualEfView];
    
    _background=[[LSWtextFieldBackground alloc]initWithFrame:CGRectMake(0,150,self.view.frame.size.width,100)];
    [_background setBackgroundColor:[UIColor whiteColor]];
    [[_background layer]setCornerRadius:5];
    [[_background layer]setMasksToBounds:YES];

    
    [self.view addSubview:_background];
    self.view.backgroundColor = [UIColor colorWithWhite:0.85 alpha:1];
    _name=[[UITextField alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,50)];
    _name.backgroundColor=[UIColor clearColor];
    _name.placeholder=@"账号";
    _name.layer.cornerRadius=5.0;
    [_background addSubview:_name];
    _password=[[UITextField alloc]initWithFrame:CGRectMake(0,50,self.view.frame.size.width,50)];
    _password.backgroundColor=[UIColor clearColor];
    _password.placeholder=@"密码";
    _password.layer.cornerRadius=5.0;
    _password.secureTextEntry=YES;
    [_background addSubview:_password];
    _registerButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_registerButton setFrame:CGRectMake(10,270,(self.view.frame.size.width-70)/2,40)];
    [_registerButton.layer setCornerRadius:20];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [_registerButton setBackgroundColor:[UIColor colorWithHexString:@"#EE82EE"]];
    [_registerButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(rigistAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    _loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginButton setFrame:CGRectMake(230,270,(self.view.frame.size.width-70)/2,40)];
    [_loginButton.layer setCornerRadius:20];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:[UIColor colorWithHexString:@"#EE82EE"]];
    [_loginButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    [self.view addSubview:_registerButton];
    
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.equalTo(@150);
    }];
}

-(void)loginAction{
    [self dismissModalViewControllerAnimated:YES];
}
- (void)rigistAction {
    LSWRigistViewController *vc = [[LSWRigistViewController alloc] init];
    [self presentViewController:vc animated:NO completion:nil];
}
- (UIImageView *) backimage{
    if (!_backimage) {
        _backimage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"topImage"]];
    }
    return _backimage;
}




@end
