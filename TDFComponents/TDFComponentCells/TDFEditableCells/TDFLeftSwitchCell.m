//
//  TDFLeftSwitchCell.m
//  Pods
//
//  Created by happyo on 2017/3/28.
//
//

#import "TDFLeftSwitchCell.h"
#import "TDFLeftSwitchView.h"
#import "TDFLeftSwitchItem.h"
#import "Masonry.h"
#import "NSString+TDF_Empty.h"

@interface TDFLeftSwitchCell ()

@property (nonatomic, strong) TDFLeftSwitchView *switchView;

@end
@implementation TDFLeftSwitchCell

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

+ (CGFloat)heightForCellWithItem:(TDFLeftSwitchItem *)item
{
    CGFloat height = 0;
    
    if (item.shouldShow) {
        height = [TDFLeftSwitchView getHeightWithModel:item] + 16 + ([item.subTitle isNotEmpty] ? 16 : 0);
    }
    
    return height;
}

- (void)configCellWithItem:(TDFLeftSwitchItem *)item
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

- (TDFLeftSwitchView *)switchView
{
    if (!_switchView) {
        _switchView = [[TDFLeftSwitchView alloc] initWithFrame:CGRectZero];
    }
    
    return _switchView;
}
@end
