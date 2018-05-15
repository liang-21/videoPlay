//
//  TDFStaticLabelCell.m
//  RestApp
//
//  Created by happyo on 16/10/20.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import "TDFStaticLabelCell.h"
#import "TDFStaticLabelView.h"
#import "TDFStaticLabelItem.h"
#import "Masonry.h"

@interface TDFStaticLabelCell ()

@property (nonatomic, strong) TDFStaticLabelView *labelView;

@end
@implementation TDFStaticLabelCell

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

+ (CGFloat)heightForCellWithItem:(TDFStaticLabelItem *)item
{
    CGFloat height = 0;
    
    if (item.shouldShow) {
        height = [TDFStaticLabelView getHeightWithModel:item];
    }
    
    return height;
}

- (void)configCellWithItem:(TDFStaticLabelItem *)item
{
    if (item.shouldShow) {
        self.hidden = NO;
    } else {
        self.hidden = YES;
        return ;
    }
    
    [self.labelView configureViewWithModel:item];
}


#pragma mark -- Setters && Getters --

- (TDFStaticLabelView *)labelView
{
    if (!_labelView) {
        _labelView = [[TDFStaticLabelView alloc] initWithFrame:CGRectZero];
    }
    
    return _labelView;
}

@end
