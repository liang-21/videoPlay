//
//  TDFMemberCardInfoCell.m
//  Pods
//
//  Created by 黄河 on 2017/3/13.
//
//

#import "TDFMemberCardInfoCell.h"
#import "TDFMemberCardInfoView.h"
#import "TDFMemberCardInfoItem.h"
#import "Masonry.h"
@interface TDFMemberCardInfoCell ()
@property (nonatomic, strong)TDFMemberCardInfoView *cardInfoView;
@end

@implementation TDFMemberCardInfoCell

#pragma mark --setter && getter

- (TDFMemberCardInfoView *)cardInfoView {
    if (!_cardInfoView) {
        _cardInfoView = [[TDFMemberCardInfoView alloc] init];
    }
    return _cardInfoView;
}

#pragma mark --delegate
// cell创建的时候调用，只调用一次，类似viewDidLoad
- (void)cellDidLoad {
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self addSubview:self.cardInfoView];
    [self.cardInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.bottom.equalTo(self);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(10);
    }];
    
}

// cell的高度，item可以强转成对应的自定义item
+ (CGFloat)heightForCellWithItem:(TDFMemberCardInfoItem *)item {
    return 238;
}

// 根据item来更新cell，item可以强转成对应的自定义item，此时cell视图大小还未确定
- (void)configCellWithItem:(TDFMemberCardInfoItem *)item {
    [self.cardInfoView configureViewWithModel:item];
}


@end
