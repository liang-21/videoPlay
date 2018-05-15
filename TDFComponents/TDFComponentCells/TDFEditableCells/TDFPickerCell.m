//
//  TDFPickerCell.m
//  RestApp
//
//  Created by happyo on 16/7/14.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFPickerCell.h"
#import "TDFEditButtonView.h"
#import "TDFPickerItem.h"
#import "Masonry.h"
#import "TDFBaseEditView+Relayout.h"
#import "NSBundle+Language.h"

@interface TDFPickerCell () 

@property (nonatomic, strong) TDFEditButtonView *buttonView;
@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) TDFPickerItem *item;

@end
@implementation TDFPickerCell

#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.buttonView];
    [self addSubview:self.selectButton];
    
    [self.buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
}

+ (CGFloat)heightForCellWithItem:(TDFPickerItem *)item
{
    CGFloat height = 0;
    
    if (item.shouldShow) {
        height = [TDFEditButtonView getHeightWithModel:item];
    }
    
    return height;
}

- (void)configCellWithItem:(TDFPickerItem *)item
{
    if (item.shouldShow) {
        self.hidden = NO;
    } else {
        self.hidden = YES;
        return ;
    }
    self.item = item;
    self.selectButton.hidden = !item.selectedBlock;
    
    [self.buttonView configureViewWithModel:item];
    
    if(item.backgroundColor) {
        self.backgroundColor = item.backgroundColor;
    }
    
    //如果需要重新布局、尤其是标题显示不够的时候
    if (item.needRelayout) {
        if ([NSBundle isEnglishLanguage]) {
            [self.buttonView relayoutAfterConfigureModel:item];
        }
    }
}

#pragma mark -- Setters && Getters --

- (TDFEditButtonView *)buttonView
{
    if (!_buttonView) {
        _buttonView = [[TDFEditButtonView alloc] initWithFrame:CGRectZero];
    }
    
    return _buttonView;
}


- (UIButton *)selectButton {
    if (!_selectButton) {
        _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_selectButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectButton;
}

- (void)clickButton {
    if (self.item.selectedBlock) {
        self.item.selectedBlock();
    }
}


@end
