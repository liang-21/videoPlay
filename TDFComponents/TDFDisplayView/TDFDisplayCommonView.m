//
//  TDFDisplayCommonView.m
//  RestApp
//
//  Created by happyo on 16/10/24.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFDisplayCommonView.h"
#import "TDFDisplayCommonItem.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
@interface TDFDisplayCommonView ()

@property (nonatomic, strong) UIImageView *igvIcon;

@property (nonatomic, strong) UILabel *lblTitle;

@property (nonatomic, strong) UILabel *lblDescription;

@property (nonatomic ,strong) UIImageView *icoPwV;

@property (nonatomic, strong) UIButton *btnBack;

@property (nonatomic, strong) TDFDisplayCommonItem *model;

@end
@implementation TDFDisplayCommonView

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
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor whiteColor];
    view.alpha = 0.7;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.bottom.equalTo(self).with.offset(-1);
    }];
    
    [self addSubview:self.btnBack];
    [self.btnBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self addSubview:self.igvIcon];
    [self.igvIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).with.offset(15);
        make.top.equalTo(self).with.offset(18);
        make.width.equalTo(@(54));
        make.height.equalTo(@(54));
    }];
    
    [self addSubview:self.lblTitle];
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(21);
        make.leading.equalTo(self.igvIcon.mas_trailing).with.offset(15);
        make.trailing.equalTo(self).with.offset(-25);
        make.height.equalTo(@(18));
    }];
    
    [self addSubview:self.lblDescription];
    [self.lblDescription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lblTitle.mas_bottom).with.offset(10);
        make.leading.equalTo(self.lblTitle);
        make.trailing.equalTo(self.lblTitle);
    }];
    
    [self addSubview:self.icoPwV];
    [self.icoPwV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-5);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
    }];
}

- (void)configureViewWithModel:(TDFDisplayCommonItem *)model
{
    self.model = model;
    
    self.igvIcon.image = model.iconImage;
    self.lblTitle.text = model.title;
    self.lblDescription.text = model.detail;
        
    self.icoPwV.hidden = !(model.isLock||model.isModuleRecharge);
    
    self.icoPwV.image = [UIImage imageNamed:model.isLock?@"ico_pw_w":@"ico_pw_red"];
    
    if (model.detail.length == 0) {
        [self.lblTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.leading.equalTo(self.igvIcon.mas_trailing).with.offset(16);
            make.trailing.equalTo(self).with.offset(-25);
            make.height.equalTo(@(18));
        }];
    }
    [self.igvIcon sd_setImageWithURL:[NSURL URLWithString:model.iconURL]  placeholderImage:model.iconImage];
}

- (void)viewClicked
{
    if (self.model.clickedBlock) {
        self.model.clickedBlock();
    }
}

#pragma mark -- Getters && Setters --

- (UIImageView *)igvIcon
{
    if (!_igvIcon) {
        _igvIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    
    return _igvIcon;
}

- (UILabel *)lblTitle
{
    if (!_lblTitle) {
        _lblTitle = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblTitle.font = [UIFont systemFontOfSize:18];
        _lblTitle.textColor =  [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    }
    
    return _lblTitle;
}

- (UILabel *)lblDescription
{
    if (!_lblDescription) {
        _lblDescription = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblDescription.font = [UIFont systemFontOfSize:13];
        _lblDescription.textColor =  [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        _lblDescription.numberOfLines = 2;
    }
    
    return _lblDescription;
}

- (UIImageView *)icoPwV {
    
    if (!_icoPwV) {
        
        _icoPwV = [UIImageView new];
        
        _icoPwV.image = [UIImage imageNamed:@"ico_pw_w" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    return _icoPwV;
}

- (UIButton *)btnBack
{
    if (!_btnBack) {
        _btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnBack.backgroundColor = [UIColor clearColor];
        [_btnBack addTarget:self action:@selector(viewClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnBack;
}

@end
