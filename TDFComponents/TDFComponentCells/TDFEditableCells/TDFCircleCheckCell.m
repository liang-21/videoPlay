//
//  TDFCircleCheckCell.m
//  Pods
//
//  Created by chaiweiwei on 2017/5/2.
//
//

#import "TDFCircleCheckCell.h"
#import "TDFCircleCheckView.h"
#import "TDFSwitchItem.h"
#import "Masonry.h"

@interface TDFCircleCheckCell()

@property (nonatomic, strong) TDFCircleCheckView *checkView;

@end

@implementation TDFCircleCheckCell

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.checkView];
    [self.checkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFSwitchItem *)item
{
    CGFloat height = 0;
    
    if (item.shouldShow) {
        height = [TDFCircleCheckView getHeightWithModel:item];
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
    
    [self.checkView configureViewWithModel:item];
}

#pragma mark -- Setters && Getters --

- (TDFCircleCheckView *)checkView
{
    if (!_checkView) {
        _checkView = [[TDFCircleCheckView alloc] initWithFrame:CGRectZero];
    }
    
    return _checkView;
}


@end
