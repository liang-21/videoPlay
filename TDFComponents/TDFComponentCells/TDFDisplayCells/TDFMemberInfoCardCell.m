//
//  TDFMemberInfoCardCell.m
//  TDFMemberPod
//
//  Created by 黄河 on 2017/4/25.
//  Copyright © 2017年 黄河. All rights reserved.
//

#import "TDFMemberInfoCardCell.h"
#import "TDFMemberInfoCardGroupView.h"
#import "Masonry.h"
@interface TDFMemberInfoCardCell ()

@property (nonatomic, strong)TDFMemberInfoCardGroupView *groupView;

@end

@implementation TDFMemberInfoCardCell

/**
 cell创建的时候调用，只调用一次，类似viewDidLoad
 */
- (void)cellDidLoad {
    [self addSubview:self.groupView];
    self.backgroundColor = [UIColor clearColor];
    [self layoutView];
}

- (void)layoutView {
    [self.groupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

/**
 用于获取cell的高度，item可以强转成对应的自定义item
 
 @param item cell对应的model
 @return cell的高度
 */
+ (CGFloat)heightForCellWithItem:(TDFMemberInfoCardItem *)item {
    if (item.shouldShow) {
        return 220;
    }
    return 0;
}


/**
 根据item来更新cell，item可以强转成对应的自定义item，此时cell视图大小还未确定
 
 @param item cell对应的model
 */
- (void)configCellWithItem:(TDFMemberInfoCardItem *)item {
    if (item.shouldShow) {
        self.groupView.hidden = NO;
        [self.groupView configWithItem:item];
    }else {
        self.groupView.hidden = YES;
    }
}

#pragma mark -- setter && getter
- (TDFMemberInfoCardGroupView *)groupView {
    if (!_groupView) {
        _groupView = [[TDFMemberInfoCardGroupView alloc] init];
    }
    return _groupView;
}

@end
