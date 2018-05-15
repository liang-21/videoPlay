//
//  TDFTextfieldCell.m
//  RestApp
//
//  Created by happyo on 16/7/13.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFTextfieldCell.h"
#import "TDFTextfieldItem.h"
#import "TDFEditTextFieldView.h"
#import "Masonry.h"
#import "TDFBaseEditView+Relayout.h"
#import "UITableViewCell+SeperatorLine.h"

@interface TDFTextfieldCell () <UITextFieldDelegate>

@property (nonatomic, strong) TDFEditTextFieldView *textView;

@property (nonatomic, strong) TDFTextfieldItem *cellItem;

@end
@implementation TDFTextfieldCell


#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];

    [self addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFTextfieldItem *)item
{
    CGFloat height = 0;
    
    if (item.shouldShow) {
        height = [TDFEditTextFieldView getHeightWithModel:item];
    }
    
    return height;
}

- (void)configCellWithItem:(TDFTextfieldItem *)item
{
    self.cellItem = item;
    if (item.shouldShow) {
        self.hidden = NO;
    } else {
        self.hidden = YES;
        return ;
    }
    
    /***** 根据内容从新布局 *****/
    if (item.needRelayout) {
        [self.textView relayoutAfterConfigureModel:item];
    }
    
    [self.textView configureViewWithModel:item];
    
    if(item.backgroundColor) {
        self.backgroundColor = item.backgroundColor;
    }
    
    self.tdf_showBottomMargin = item.showBottomMargin;
}

- (void)cellDidEndDisplay
{
    if (self.cellItem.becomeFirst) {
        self.cellItem.becomeFirst = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.textView.txfValue becomeFirstResponder];
        });
    }
}


#pragma mark -- Setters && Getters --

- (TDFEditTextFieldView *)textView
{
    if (!_textView) {
        _textView = [[TDFEditTextFieldView alloc] initWithFrame:CGRectZero];
    }
    
    return _textView;
}

@end
