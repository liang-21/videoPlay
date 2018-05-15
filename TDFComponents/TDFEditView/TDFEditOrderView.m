//
//  TDFEditOrderView.m
//  RestApp
//
//  Created by happyo on 16/9/12.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFEditOrderView.h"
#import "TDFOrderItem.h"
#import "Masonry.h"

@interface TDFEditOrderView ()

@property (nonatomic, strong) UIImageView *igvOperate;

@property (nonatomic, strong) UIButton *btnAdd;

@property (nonatomic, strong) UIButton *btnDecrease;

@property (nonatomic, strong) UILabel *lblNum;

@property (nonatomic, strong) UILabel *lblMetric;

@property (nonatomic, strong) TDFOrderItem *model;

@end
@implementation TDFEditOrderView

- (void)initView
{
    [super initView];
    
    [self addSubview:self.igvOperate];
    [self.igvOperate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(119));
        make.height.equalTo(@(30));
        make.top.equalTo(self).with.offset(6);
        make.trailing.equalTo(self).with.offset(-6);
    }];
    
    [self addSubview:self.btnDecrease];
    [self.btnDecrease mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.igvOperate);
        make.top.equalTo(self.igvOperate);
        make.bottom.equalTo(self.igvOperate);
        make.width.equalTo(@(30));
    }];
    
    [self addSubview:self.btnAdd];
    [self.btnAdd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.igvOperate);
        make.top.equalTo(self.igvOperate);
        make.bottom.equalTo(self.igvOperate);
        make.width.equalTo(@(30));
    }];
    
    [self addSubview:self.lblNum];
    [self.lblNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.igvOperate.mas_centerX);
        make.leading.equalTo(self.btnDecrease.mas_trailing);
        make.top.equalTo(self.igvOperate);
        make.bottom.equalTo(self.igvOperate);
    }];
    
    [self addSubview:self.lblMetric];
    [self.lblMetric mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.igvOperate.mas_centerX);
        make.trailing.equalTo(self.btnAdd.mas_leading);
        make.top.equalTo(self.igvOperate);
        make.bottom.equalTo(self.igvOperate);
    }];
}

- (void)configureViewWithModel:(TDFOrderItem *)model
{
    [super configureViewWithModel:model];
    self.model = model;
    
    [self updateNumText];
    self.lblMetric.text = model.metric;
}

- (void)updateNumText
{
    self.lblNum.text = [NSString stringWithFormat:@"%li", (long)self.model.numValue];
    self.model.requestValue = @(self.model.numValue);
    [self checkShouldShowTips];
}

- (void)checkShouldShowTips
{
    if (!self.model.preValue) {
        self.model.isShowTip = NO;
        self.lblTip.hidden = YES;
        return ;
    }
    
    if ([self.model.preValue integerValue] == self.model.numValue) {
        self.model.isShowTip = NO;
        self.lblTip.hidden = YES;
    } else {
        self.model.isShowTip = YES;
        self.lblTip.hidden = NO;
    }
}

#pragma mark -- Actions --

- (void)addNumber
{
    if ([self shouldChangeValue:self.model.numValue + 1]) {
        self.model.numValue += 1;

        [self updateNumText];
    }
}

- (void)decreaseNumber
{
    if ([self shouldChangeValue:self.model.numValue - 1]) {
        self.model.numValue -= 1;
        
        [self updateNumText];
    }
}

- (BOOL)shouldChangeValue:(NSInteger)newValue
{
    if (self.model.filterBlock) {
        return self.model.filterBlock(newValue);
    }
    
    return YES;
}

#pragma mark -- Getters && Setters --

- (UIImageView *)igvOperate
{
    if (!_igvOperate) {
        _igvOperate = [[UIImageView alloc] init];
        _igvOperate.backgroundColor = [UIColor whiteColor];
        _igvOperate.image = [UIImage imageNamed:@"MuluSelect.png" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
        _igvOperate.contentMode = UIViewContentModeScaleAspectFill;
        _igvOperate.layer.masksToBounds =YES;
        _igvOperate.layer.cornerRadius =8;
    }
    
    return _igvOperate;
}

- (UIButton *)btnAdd
{
    if (!_btnAdd) {
        _btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnAdd addTarget:self action:@selector(addNumber) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnAdd;
}

- (UIButton *)btnDecrease
{
    if (!_btnDecrease) {
        _btnDecrease = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnDecrease addTarget:self action:@selector(decreaseNumber) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnDecrease;
}

- (UILabel *)lblNum
{
    if (!_lblNum) {
        _lblNum = [[UILabel alloc] init];
        _lblNum.font = [UIFont systemFontOfSize:15];
        _lblNum.textColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1];
        _lblNum.textAlignment = NSTextAlignmentRight;
    }
    
    return _lblNum;
}

- (UILabel *)lblMetric
{
    if (!_lblMetric) {
        _lblMetric = [[UILabel alloc] init];
        _lblMetric.font = [UIFont systemFontOfSize:15];
    }
    
    return _lblMetric;
}

@end
