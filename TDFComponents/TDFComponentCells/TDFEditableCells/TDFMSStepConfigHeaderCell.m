//
//  TDFMSStepConfigHeaderCell.m
//  TDFComponents
//
//  Created by 黄河 on 2017/12/6.
//

#import "TDFMSStepConfigHeaderCell.h"
#import "TDFMSStepConfigHeaderItem.h"
#import "TDFMSStepConfigHeaderView.h"
#import "ReactiveObjC.h"
#import "UIColor+tdf_standard.h"
#import "Masonry.h"

@interface TDFMSStepConfigHeaderCell ()

@property (nonatomic, strong)TDFMSStepConfigHeaderView *configView;

@end

@implementation TDFMSStepConfigHeaderCell

- (void)cellDidLoad {
    self.backgroundColor = [UIColor whiteColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.configView];
    [self.configView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFMSStepConfigHeaderItem *)item {
    if (item.hide) {
        return 0;
    }
    return 64;
}

- (void)configCellWithItem:(TDFMSStepConfigHeaderItem *)item {
    RACSignal *dataSignal = [RACObserve(item, dataArray) takeUntil:self.rac_prepareForReuseSignal] ;
    RACSignal *stepSignal = [RACObserve(item, step) takeUntil:self.rac_prepareForReuseSignal];
    __weak typeof(self) weakSelf = self;
    [[[[RACSignal merge:@[dataSignal, stepSignal]]
       takeUntil:self.rac_prepareForReuseSignal]
      throttle:0.01]
     subscribeNext:^(id  _Nullable x) {
        [weakSelf.configView configViewWithItem:item];
    }];
}

- (TDFMSStepConfigHeaderView *)configView {
    if (!_configView) {
        _configView = [[TDFMSStepConfigHeaderView alloc] init];
    }
    return _configView;
}

@end
