//
//  ASCCardSelectBackgroundComponent.m
//  AssemblyComponent
//
//  Created by 黄河 on 2017/11/28.
//

#import "TDFCardSelectBackgroundCell.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "TDFCardSelectBackgroundView.h"
#import "TDFCardSelectBackgroundItem.h"
#import "Masonry.h"

@interface TDFCardSelectBackgroundCell ()

@property (nonatomic, strong)TDFCardSelectBackgroundView *backView;

@end

@implementation TDFCardSelectBackgroundCell
#pragma mark override

- (void)cellDidLoad {
    [self.contentView addSubview:self.backView];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
}

- (void)configCellWithItem:(TDFCardSelectBackgroundItem *)item {
    [self.backView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(item.inset);
    }];
    
    RACSignal *imageUrlSignal = [RACObserve(item, imageUrl) takeUntil:self.rac_prepareForReuseSignal];
    RACSignal *leftTitleSignal = [RACObserve(item, leftTitle) takeUntil:self.rac_prepareForReuseSignal];
    RACSignal *centerSignal = [RACObserve(item, centerTitle) takeUntil:self.rac_prepareForReuseSignal];
    __weak typeof(self)weakSelf = self;
    [[[[RACSignal merge:@[imageUrlSignal,leftTitleSignal,centerSignal]]
       takeUntil:self.rac_prepareForReuseSignal]
      throttle:0.01]
     subscribeNext:^(id  _Nullable x) {
         __strong typeof(weakSelf)strSelf = weakSelf;
         [strSelf.backView configViewWithItem:item];
    }];
    
}

+ (CGFloat)heightForCellWithItem:(TDFCardSelectBackgroundItem *)item {
    if (!item.shouldShow) {
        return 0;
    }
    if (item.hidden) {
        return 0;
    }
    return item.imageHeight + item.inset.top + item.inset.bottom;
}

- (TDFCardSelectBackgroundView *)backView {
    if (!_backView) {
        _backView = [[TDFCardSelectBackgroundView alloc] init];
        _backView.layer.cornerRadius = 5;
        _backView.clipsToBounds = YES;
    }
    return _backView;
}
@end
