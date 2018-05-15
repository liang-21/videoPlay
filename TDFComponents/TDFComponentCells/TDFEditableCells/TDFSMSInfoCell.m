//
//  TDFSMSInfoCell.m
//  Pods
//
//  Created by 黄河 on 2017/7/14.
//
//

#import "TDFSMSInfoCell.h"
#import "TDFSMSInfoItem.h"
#import "TDFMessageCountAndBuyButtonView.h"
#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface TDFSMSInfoCell ()

@property (nonatomic, strong)TDFMessageCountAndBuyButtonView *buttonView;

@property (nonatomic, strong)TDFSMSInfoItem *item;

@end

@implementation TDFSMSInfoCell

- (void)cellDidLoad {
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.buttonView];
    [self.buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(0);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.equalTo(self.contentView).offset(0);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFSMSInfoItem *)item {
    if (item.hide) {
        return 0;
    }
    return 85;
}

- (void)configCellWithItem:(TDFSMSInfoItem *)item {
    self.item = item;
    @weakify(self);
    [[RACObserve(self.item, domestic) takeUntil:self.rac_prepareForReuseSignal] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self.buttonView.lbldomesticTitle = [NSString stringWithFormat:@"可发中国大陆：%d条",[x intValue]];
    }];
    
    [[RACObserve(self.item, overseas) takeUntil:self.rac_prepareForReuseSignal] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self.buttonView.lbloverseasTitle = [NSString stringWithFormat:@"或可发其他国家和地区：%d条",[x intValue]];
    }];
    
    
    RACSignal *hideSignal = [RACObserve(_item, hide) takeUntil:self.rac_prepareForReuseSignal];
    
    [[[RACSignal merge:@[hideSignal]] throttle:0.1] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        BOOL hide = self.item.hide;
        self.hidden = hide;
        self.buttonView.hidden = hide;
    }];
}

#pragma mark -- setter && getter
- (TDFMessageCountAndBuyButtonView *)buttonView {
    if (!_buttonView) {
        _buttonView = [[TDFMessageCountAndBuyButtonView alloc] init];
        _buttonView.hidden = YES;
        _buttonView.backgroundColor = [UIColor clearColor];
        _buttonView.buttonTitle = @"购买短信条数";
        _buttonView.title = @"剩余短信数量";
        @weakify(self);
        self.buttonView.buttonClick = ^{
            @strongify(self);
            if (self.item.purchaseBlock) {
                self.item.purchaseBlock();
            }
        };
    }
    return _buttonView;
}
@end
