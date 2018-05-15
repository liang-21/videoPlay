//
//  TDFOrderCell.m
//  RestApp
//
//  Created by happyo on 16/9/12.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFOrderCell.h"
#import "TDFOrderItem.h"
#import "TDFEditOrderView.h"
#import "Masonry.h"

@interface TDFOrderCell ()

@property (nonatomic, strong) TDFEditOrderView *orderView;

@end
@implementation TDFOrderCell

#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.orderView];
    
    [self.orderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)configCellWithItem:(TDFOrderItem *)item
{
    if (item.shouldShow) {
        self.hidden = NO;
    } else {
        self.hidden = YES;
        return ;
    }
    
    [self.orderView configureViewWithModel:item];
}

+ (CGFloat)heightForCellWithItem:(TDFOrderItem *)item
{
    CGFloat height = 0;
    
    if (item.shouldShow) {
        height = [TDFEditOrderView getHeightWithModel:item];
    }
    
    return height;
}

#pragma mark -- Setters && Getters --

- (TDFEditOrderView *)orderView
{
    if (!_orderView) {
        _orderView = [[TDFEditOrderView alloc] initWithFrame:CGRectZero];
    }
    
    return _orderView;
}


@end
