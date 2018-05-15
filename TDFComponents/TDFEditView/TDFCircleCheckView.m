//
//  TDFCircleCheckView.m
//  Pods
//
//  Created by chaiweiwei on 2017/5/2.
//
//

#import "TDFCircleCheckView.h"
#import "TDFCircleCheckItem.h"
#import "Masonry.h"
#import "TDFEditColorHelper.h"

@interface TDFCircleCheckView()

@property (nonatomic, strong) UIButton *btnCheck;

@property (nonatomic, strong) TDFCircleCheckItem *model;

@end

@implementation TDFCircleCheckView

- (void)initView
{
    [super initView];
    
    [self addSubview:self.btnCheck];
    [self.btnCheck mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self).with.offset(-10);
        make.centerY.equalTo(self.lblTitle);
        make.height.equalTo(@(38));
        make.width.equalTo(@38);
    }];
    
}

- (void)configureViewWithModel:(TDFCircleCheckItem *)model
{
    [super configureViewWithModel:model];
    
    self.model = model;
    
    [self checkShouldShowTip];
    
    self.btnCheck.selected = self.model.isCheck;
    
    if (model.editStyle == TDFEditStyleEditable) {
        [self.btnCheck setImage:[UIImage imageNamed:@"food_cell_icon_selected" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateSelected];
        [self.btnCheck setImage:[UIImage imageNamed:@"food_cell_icon_unSelected" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        [self.btnCheck setTitle:nil forState:UIControlStateNormal];
        [self.btnCheck mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@38);
        }];
    } else {
        [self.btnCheck setImage:nil forState:UIControlStateSelected];
        [self.btnCheck setImage:nil forState:UIControlStateNormal];
        if (self.model.isCheck) {
            [self.btnCheck setTitle:@"已选择" forState:UIControlStateNormal];
        } else {
            [self.btnCheck setTitle:@"未选择" forState:UIControlStateNormal];
        }
        [self.btnCheck mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@50);
        }];
    }
}

- (UIButton *)btnCheck
{
    if (!_btnCheck) {
        _btnCheck = [[UIButton alloc] initWithFrame:CGRectZero];
        [_btnCheck addTarget:self action:@selector(checkValueChanged:) forControlEvents:UIControlEventTouchUpInside];
        [_btnCheck setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1] forState:UIControlStateNormal];
        _btnCheck.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _btnCheck.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    
    return _btnCheck;
}

- (void)checkValueChanged:(UIButton *)btnCheck
{
    if(self.model.editStyle == TDFEditStyleUnEditable) {
        return;
    }
    
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    
    if (self.model.filterBlock) {
        if (!self.model.filterBlock(!btnCheck.selected)) {
            return ;
        }
    }
    
    self.btnCheck.selected = !btnCheck.selected;
    
    self.model.check = btnCheck.selected;
    self.model.requestValue = self.model.isCheck ? @(1) : @(0);
    
    [self checkShouldShowTip];
}

- (void)checkShouldShowTip
{
    if ([self.model.preValue isEqual:@(self.model.isCheck)]) {
        self.model.isShowTip = NO;
        self.lblTip.hidden = YES;
    } else {
        self.model.isShowTip = YES;
        self.lblTip.hidden = NO;
    }
}

@end
