//
//  TDFBaseEditCell.m
//  RestApp
//
//  Created by happyo on 16/10/6.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFBaseEditCell.h"
#import "TDFBaseEditView.h"
#import "TDFBaseEditItem.h"
#import "Masonry.h"

@interface TDFBaseEditCell ()

@property (nonatomic, strong) TDFBaseEditView *baseEditView;

@end
@implementation TDFBaseEditCell

#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.baseEditView];
    
    [self.baseEditView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)configCellWithItem:(TDFBaseEditItem *)item
{
    if (item.shouldShow) {
        self.hidden = NO;
    } else {
        self.hidden = YES;
        return ;
    }
    
    [self.baseEditView configureViewWithModel:item];
}

+ (CGFloat)heightForCellWithItem:(TDFBaseEditItem *)item
{
    CGFloat height = 0;
    
    if (item.shouldShow) {
        height = [TDFBaseEditView getHeightWithModel:item];
    }
    
    return height;
}

#pragma mark -- Setters && Getters --

- (TDFBaseEditView *)baseEditView
{
    if (!_baseEditView) {
        _baseEditView = [[TDFBaseEditView alloc] initWithFrame:CGRectZero];
    }
    
    return _baseEditView;
}

@end
