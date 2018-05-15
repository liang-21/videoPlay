//
//  TDFStaticLabelView.m
//  RestApp
//
//  Created by happyo on 16/10/20.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import "TDFStaticLabelView.h"
#import "TDFStaticLabelItem.h"
#import "Masonry.h"

@interface TDFStaticLabelView ()

@property (nonatomic, strong) UILabel *lblValue;

@property (nonatomic, strong) TDFStaticLabelItem *model;

@end
@implementation TDFStaticLabelView

- (void)initView
{
    [super initView];
    
    [self addSubview:self.lblValue];
    [self.lblValue mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.lblTitle.mas_trailing);
        make.trailing.equalTo(self).with.offset(-10);
        make.height.equalTo(@(15));
        make.top.equalTo(self).with.offset(15);
    }];
}

- (void)configureViewWithModel:(TDFStaticLabelItem *)model
{
    [super configureViewWithModel:model];
    
    self.model = model;
    self.lblValue.text = self.model.textValue;
    self.lblValue.textColor = [self getPlaceholderColorWithModel:self.model];
    self.lblTip.hidden = !model.isShowTip;
}

#pragma mark -- Setters && Getters --

- (UILabel *)lblValue
{
    if (!_lblValue) {
        _lblValue = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblValue.textAlignment = NSTextAlignmentRight;
        _lblValue.font = [UIFont systemFontOfSize:15];
    }
    
    return _lblValue;
}

@end
