//
//  TDFDisplayCommonCell.m
//  RestApp
//
//  Created by happyo on 16/10/24.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFDisplayCommonCell.h"
#import "TDFDisplayCommonView.h"
#import "TDFDisplayCommonItem.h"
#import "Masonry.h"

@interface TDFDisplayCommonCell ()

@property (nonatomic, strong) TDFDisplayCommonView *displayView;

@end
@implementation TDFDisplayCommonCell

#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.displayView];
    [self.displayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFDisplayCommonItem *)item
{
    return 88;
}

- (void)configCellWithItem:(TDFDisplayCommonItem *)item
{
    [self.displayView configureViewWithModel:item];
}

#pragma mark -- Setters && Getters --

- (TDFDisplayCommonView *)displayView
{
    if (!_displayView) {
        _displayView = [[TDFDisplayCommonView alloc] initWithFrame:CGRectZero];
    }
    
    return _displayView;
}

@end
