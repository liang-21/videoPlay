//
//  TDFVerificationCodeView.m
//  Pods
//
//  Created by 刘红琳 on 2017/3/6.
//
//

#import "TDFVerificationCodeView.h"
#import "TDFVerificationCodeItem.h"
#import "Masonry.h"
#import "TDFCategories.h"
@interface TDFVerificationCodeView()
@property (nonatomic, strong) UIButton *btnVerificationCode;
@property (nonatomic, strong) TDFVerificationCodeItem *model;
@property (nonatomic, assign) NSInteger timingNumber;
@property (nonatomic, strong) NSTimer *timer;
@end
@implementation TDFVerificationCodeView

- (void)initView
{
    [super initView];
    [self addSubview:self.btnVerificationCode];
    [self.btnVerificationCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-11);
        make.height.equalTo(@(30));
        make.width.equalTo(@120);
        make.top.equalTo(self).with.offset(5);
    }];
}

- (void)configureViewWithModel:(TDFVerificationCodeItem *)model
{
    [super configureViewWithModel:model];
    self.model = model;
    self.buttonConfirm = model.filterBlock;
    if (model.OrResetTimer) {
        [self initOrResetTimer];
    }
}

- (UIButton *)btnVerificationCode
{
    if (!_btnVerificationCode) {
        _btnVerificationCode = [[UIButton alloc] initWithFrame:CGRectZero];
        [_btnVerificationCode addTarget:self action:@selector(btnVerificationCodeClicked) forControlEvents:UIControlEventTouchUpInside];
        [_btnVerificationCode setTitle:@"获得验证码"forState:UIControlStateNormal];
        _btnVerificationCode.userInteractionEnabled = YES;
        _btnVerificationCode.backgroundColor = [UIColor tdf_colorWithRGB:0xcc0000];
        [_btnVerificationCode setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btnVerificationCode.layer.masksToBounds = YES;
        _btnVerificationCode.layer.cornerRadius = 5;
        _btnVerificationCode.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _btnVerificationCode;
}

#pragma mark -- Actions --

- (void)btnVerificationCodeClicked
{
    if (self.buttonConfirm) {
         self.buttonConfirm();
    }
}

- (void)initOrResetTimer
{
    self.timingNumber = 60;
    [self.btnVerificationCode setTitle:[NSString stringWithFormat:@"(%lds)重新获取",(long)self.timingNumber ] forState:UIControlStateNormal];
    self.btnVerificationCode.backgroundColor = [UIColor tdf_colorWithRGB:0x999999];
    self.btnVerificationCode.userInteractionEnabled = NO;
    if (self.timer) {
        [self timerInvalidate];
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(timerFireMethod)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)timerFireMethod
{
    self.timingNumber--;
    [self.btnVerificationCode setTitle:[NSString stringWithFormat:@"(%lds)重新获取",(long)self.timingNumber ] forState:UIControlStateNormal];
    self.btnVerificationCode.backgroundColor = [UIColor tdf_colorWithRGB:0x999999];
    if (self.timingNumber<0) {
        [self.timer invalidate];
         [self.btnVerificationCode setTitle:@"获得验证码"forState:UIControlStateNormal];
        self.btnVerificationCode.userInteractionEnabled = YES;
         self.btnVerificationCode.backgroundColor = [UIColor tdf_colorWithRGB:0xcc0000];
    }
}

- (void)timerInvalidate
{
    [self.timer invalidate];
    self.timer = nil;
}

@end
