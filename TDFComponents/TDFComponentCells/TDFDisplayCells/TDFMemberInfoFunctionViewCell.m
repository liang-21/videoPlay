//
//  TDFMemberInfoFunctionViewCell.m
//  TDFMemberPod
//
//  Created by 黄河 on 2017/4/24.
//  Copyright © 2017年 黄河. All rights reserved.
//

#import "TDFMemberInfoFunctionViewCell.h"
#import "TDFMemberInfoFunctionView.h"
#import "TDFMemberInfoFunctionItem.h"
#import "Masonry.h"
@interface TDFMemberInfoFunctionViewCell ()
@property (nonatomic, strong)TDFMemberInfoFunctionView *funcView;
@end

@implementation TDFMemberInfoFunctionViewCell

#pragma mark --DHTTableViewCellDelegate

/**
 cell创建的时候调用，只调用一次，类似viewDidLoad
 */
- (void)cellDidLoad {
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self addSubview:self.funcView];
    [self.funcView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

/**
 用于获取cell的高度，item可以强转成对应的自定义item
 
 @param item cell对应的model
 @return cell的高度
 */
+ (CGFloat)heightForCellWithItem:(TDFMemberInfoFunctionItem *)item {
    
    if (item.shouldShow) {
        return 95 * ((item.dataArray.count - 1)/4 + 1);
    }
    return 0;
}


/**
 根据item来更新cell，item可以强转成对应的自定义item，此时cell视图大小还未确定
 
 @param item cell对应的model
 */
- (void)configCellWithItem:(TDFMemberInfoFunctionItem *)item {
    if (item.shouldShow) {
        self.funcView.hidden = NO;
        [self.funcView configWithModel:item];
    }else {
        self.funcView.hidden = YES;
    }
    
}

#pragma mark -- setter&&getter
- (TDFMemberInfoFunctionView *)funcView {
    if (!_funcView) {
        _funcView = [[TDFMemberInfoFunctionView alloc] init];
    }
    return _funcView;
}

@end
