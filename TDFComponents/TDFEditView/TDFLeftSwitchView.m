//
//  TDFLeftSwitchView.m
//  Pods
//
//  Created by happyo on 2017/3/28.
//
//

#import "TDFLeftSwitchView.h"
#import "TDFLeftSwitchItem.h"
#import "Masonry.h"
#import "TDFEditColorHelper.h"

@interface TDFLeftSwitchView ()

@property (nonatomic, strong) UIButton *btnSwitch;

/**
 不可编辑的button
 */
@property (nonatomic, strong) UIImageView *igvStatic;

@property (nonatomic, strong) TDFLeftSwitchItem *model;

@property (nonatomic, strong) UILabel *lblSubTitle;

@end
@implementation TDFLeftSwitchView

- (void)initView
{
    [super initView];
    
    [self addSubview:self.btnSwitch];
    [self.btnSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(15);
        make.leading.equalTo(self).with.offset(10);
        make.height.equalTo(@(30));
        make.width.equalTo(@(50));
    }];
    
    [self addSubview:self.igvStatic];
    [self.igvStatic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.btnSwitch);
    }];

    
    [self.lblTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self.btnSwitch);
        make.height.equalTo(@(18));
        make.width.lessThanOrEqualTo(@(300));
    }];
    
    [self addSubview:self.lblSubTitle];
    [self.lblSubTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lblTitle.mas_bottom).with.offset(10);
        make.height.equalTo(@13);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
    }];
}

- (void)configureViewWithModel:(TDFLeftSwitchItem *)model
{
    [super configureViewWithModel:model];
    
    self.model = model;
    
    if (model.titleColor) {
        self.lblTitle.textColor = model.titleColor;
    }
    
    self.lblSubTitle.text = model.subTitle;
    
    if (model.subTitleColor) {
        self.lblSubTitle.textColor = model.subTitleColor;
    }
    
    [self checkShouldShowTip];

    if (model.editStyle == TDFEditStyleEditable) {
        self.btnSwitch.hidden = NO;
        self.igvStatic.hidden = YES;
    } else {
        self.btnSwitch.hidden = YES;
        self.igvStatic.hidden = NO;
    }
    
    self.btnSwitch.selected = self.model.isOn;
    
    if (self.model.isOn) {
        self.igvStatic.image = [UIImage imageNamed:@"edit_cell_swich_uneditable_on" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    } else {
        self.igvStatic.image = [UIImage imageNamed:@"edit_cell_swith_uneditable_off" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }

}

#pragma mark -- Actions --

- (void)switchValueChanged:(UIButton *)btnSwitch
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    
    if (self.model.filterBlock) {
        if (!self.model.filterBlock(!btnSwitch.selected)) {
            return ;
        }
    }
    
    self.btnSwitch.selected = !btnSwitch.selected;
    
    self.model.isOn = btnSwitch.selected;
    self.model.requestValue = self.model.isOn ? @(1) : @(0);
    
    [self checkShouldShowTip];
}

- (void)checkShouldShowTip
{
    if ([self.model.preValue isEqual:@(self.model.isOn)]) {
        self.model.isShowTip = NO;
        self.lblTip.hidden = YES;
    } else {
        self.model.isShowTip = YES;
        self.lblTip.hidden = NO;
    }
}

#pragma mark -- Setters && Getters --

- (UIButton *)btnSwitch
{
    if (!_btnSwitch) {
        _btnSwitch = [[UIButton alloc] initWithFrame:CGRectZero];
        [_btnSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventTouchUpInside];
        [_btnSwitch setImage:[UIImage imageNamed:@"edit_cell_swich_on" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateSelected];
        [_btnSwitch setImage:[UIImage imageNamed:@"edit_cell_swich_off" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
    }
    
    return _btnSwitch;
}

- (UIImageView *)igvStatic
{
    if (!_igvStatic) {
        _igvStatic = [[UIImageView alloc] initWithFrame:CGRectZero];
        _igvStatic.contentMode = UIViewContentModeScaleAspectFill;
    }

    return _igvStatic;
}


- (UILabel *)lblSubTitle
{
    if (!_lblSubTitle) {
        _lblSubTitle = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblSubTitle.font = [UIFont systemFontOfSize:13];
        _lblSubTitle.textColor = [TDFEditColorHelper hex333333Color];
        _lblSubTitle.textAlignment = NSTextAlignmentCenter;
    }
    
    return _lblSubTitle;
}



@end
