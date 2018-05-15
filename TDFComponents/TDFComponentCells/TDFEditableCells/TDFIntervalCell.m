//  TDFIntervalCell.m
//  Pods
//
//  Created by guozhi on 2017/8/3.
//
//

#import "TDFIntervalCell.h"
#import "DHTTableViewCellProtocol.h"
#import "TDFEditIntervalView.h"
#import "TDFIntervalItem.h"
#import "Masonry.h"

@interface TDFIntervalCell ()<DHTTableViewCellDelegate>

@property (nonatomic, strong) TDFEditIntervalView *view;

@property (nonatomic, strong) TDFIntervalItem *item;

@end

@implementation TDFIntervalCell

#pragma mark - DHTTableViewCellDelegate
- (void)cellDidLoad {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    //区间控件
    self.view = [[TDFEditIntervalView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.view];
    //区间布局
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
}

- (void)configCellWithItem:(TDFIntervalItem *)item {
    self.item = item;
    self.hidden = !item.shouldShow;
    if (item.shouldShow) {
        [self.view configureViewWithModel:item];
    }
}

+ (CGFloat)heightForCellWithItem:(TDFIntervalItem *)item {
    CGFloat height = 0;
    
    if (item.shouldShow) {
        height = [TDFEditIntervalView getHeightWithModel:item];
    }
    
    return height;
}



@end
