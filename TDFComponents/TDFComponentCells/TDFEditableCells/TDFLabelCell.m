//
//  TDFLabelCell.m
//  RestApp
//
//  Created by happyo on 16/8/4.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFLabelCell.h"
#import "TDFLabelItem.h"
#import "TDFEditLabelView.h"
#import "Masonry.h"
#import "TDFBaseEditView+Relayout.h"

@interface TDFLabelCell ()

@property (nonatomic, strong) TDFEditLabelView *labelView;

@property (nonatomic, strong) TDFLabelItem *model;

@end
@implementation TDFLabelCell

#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.labelView];
    
    [self.labelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)configCellWithItem:(TDFLabelItem *)item
{
    self.model = item;
    
    if (item.shouldShow) {
        self.hidden = NO;
    } else {
        self.hidden = YES;
        return ;
    }
    
    [self.labelView configureViewWithModel:item];
    
    //如果标题长度过长、尤其是在英文状态下，需要重新布局
    if (item.needRelayout) {
        [self.labelView relayoutAfterConfigureModel:item];
    }
}

+ (CGFloat)heightForCellWithItem:(TDFLabelItem *)item
{
    CGFloat height = 0;
    
    if (item.shouldShow) {
        height = [TDFEditLabelView getHeightWithModel:item];
    }
    
    return height;
}

- (void)cellDidEndDisplay
{
    if (self.model.becomeFirst) {
        self.model.becomeFirst = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.labelView.lblText becomeFirstResponder];
        });
    }
}

#pragma mark -- Setters && Getters --

- (TDFEditLabelView *)labelView
{
    if (!_labelView) {
        _labelView = [[TDFEditLabelView alloc] initWithFrame:CGRectZero];
    }
    
    return _labelView;
}

@end
