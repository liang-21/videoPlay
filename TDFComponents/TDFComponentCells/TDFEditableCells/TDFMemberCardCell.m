//
//  TDFMemberCardCell.m
//  Pods
//
//  Created by 黄河 on 2017/6/5.
//
//

#import "TDFMemberCardCell.h"
#import "TDFMemberCardItem.h"
#import "TDFMemberCardView.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "Masonry.h"

@interface TDFMemberCardCell ()

@property (strong, nonatomic)TDFMemberCardItem *item;

@property (strong, nonatomic)TDFMemberCardView *memberCardView;

@end

@implementation TDFMemberCardCell

/**
 cell创建的时候调用，只调用一次，类似viewDidLoad
 */
- (void)cellDidLoad {
    [self addSubview:self.memberCardView];
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self layoutView];
}

- (void)layoutView {
    [self.memberCardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(10, 10, 0, 10));
    }];
}

/**
 用于获取cell的高度，item可以强转成对应的自定义item
 
 @param item cell对应的model
 @return cell的高度
 */
+ (CGFloat)heightForCellWithItem:(TDFMemberCardItem *)item {
    if (item.shouldShow) {
        return 220;
    }
    return 0;
}


/**
 根据item来更新cell，item可以强转成对应的自定义item，此时cell视图大小还未确定
 
 @param item cell对应的model
 */
- (void)configCellWithItem:(TDFMemberCardItem *)item {
    _item = item;
    @weakify(self);
    [[[[RACSignal merge:@[RACObserve(self.item, editStyle),RACObserve(self.item, shouldShow)]] takeUntil:self.rac_prepareForReuseSignal] throttle:0.01] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self.hidden = !self.item.shouldShow;
        [self.memberCardView configWithItem:self.item];
    }];
    
}

#pragma mark -- setter && getter
- (TDFMemberCardView *)memberCardView {
    if (!_memberCardView) {
        _memberCardView = [[TDFMemberCardView alloc] init];
    }
    return _memberCardView;
}

@end
