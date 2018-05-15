//
//  TDFAddImageView.m
//  RestApp
//
//  Created by happyo on 16/10/27.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFAddImageView.h"
#import "Masonry.h"

@interface TDFAddImageView ()

@property (nonatomic, strong) UIImageView *igvIcon;

@property (nonatomic, strong) UILabel *lblTitle;

@property (nonatomic, strong) UIButton *btnBackground;

@end
@implementation TDFAddImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    
    return self;
}

- (void)initViews
{
    [self addSubview:self.igvIcon];
    [self.igvIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(50);
        make.centerX.equalTo(self);
        make.height.equalTo(@(44));
        make.width.equalTo(@(44));
    }];
    
    [self addSubview:self.lblTitle];
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.igvIcon.mas_bottom).with.offset(6);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.height.equalTo(@(21));
    }];
    
    [self addSubview:self.btnBackground];
    [self.btnBackground mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.bottom.equalTo(self).with.offset(-10);
        make.leading.equalTo(self).with.offset(10);
        make.trailing.equalTo(self).with.offset(-10);
    }];
    
    [self borderLine:self.btnBackground];
}

- (void)borderLine:(UIView*)view
{
    CALayer *layer = [view layer];
    [layer setMasksToBounds:YES];
    [layer setBorderWidth:1];
    UIColor* color = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.1];
    [layer setBorderColor:[color CGColor]];
}


- (void)btnClicked
{
    if (self.delegate) {
        [self.delegate addImageViewClicked:self];
    }
}

#pragma mark -- Getters && Setters --

- (UIImageView *)igvIcon
{
    if (!_igvIcon) {
        _igvIcon = [[UIImageView alloc] init];
        _igvIcon.image = [UIImage imageNamed:@"addImage_icon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    
    return _igvIcon;
}

- (UILabel *)lblTitle
{
    if (!_lblTitle) {
        _lblTitle = [[UILabel alloc] init];
        _lblTitle.font = [UIFont systemFontOfSize:17];
        _lblTitle.text = NSLocalizedString(@"添加图片", nil);
        _lblTitle.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
        _lblTitle.textAlignment = NSTextAlignmentCenter;
    }
    
    return _lblTitle;
}

- (UIButton *)btnBackground
{
    if (!_btnBackground) {
        _btnBackground = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnBackground addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnBackground;
}

@end
