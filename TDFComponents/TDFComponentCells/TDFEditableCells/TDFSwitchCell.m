//
//  TDFSwitchCell.m
//  RestApp
//
//  Created by happyo on 16/7/15.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFSwitchCell.h"
#import "TDFEditSwitchView.h"
#import "TDFSwitchItem.h"
#import "Masonry.h"

@interface TDFSwitchCell ()

@property (nonatomic, strong) TDFEditSwitchView *switchView;

@end
@implementation TDFSwitchCell

#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.switchView];
    [self.switchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFSwitchItem *)item
{
    CGFloat height = 0;
    
    if (item.shouldShow) {
        height = [TDFEditSwitchView getHeightWithModel:item];
    }
    
    return height;
}

- (void)configCellWithItem:(TDFSwitchItem *)item
{
    if (item.shouldShow) {
        self.hidden = NO;
    } else {
        self.hidden = YES;
        return ;
    }
    
    [self.switchView configureViewWithModel:item];
}

#pragma mark -- Setters && Getters --

- (TDFEditSwitchView *)switchView
{
    if (!_switchView) {
        _switchView = [[TDFEditSwitchView alloc] initWithFrame:CGRectZero];
    }
    
    return _switchView;
}

@end
