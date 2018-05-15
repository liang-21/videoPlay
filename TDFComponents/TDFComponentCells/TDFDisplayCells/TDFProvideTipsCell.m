//
//  TDFProvideTipsCell.m
//  TDFComponents
//
//  Created by doubanjiang on 2017/12/18.
//

#import "TDFProvideTipsCell.h"
#import "TDFProvideTipsItem.h"
#import <TDFCategories/UIColor+RGB.h>
#import <TDFStyleKit/UIColor+tdf_standard.h>
#import <Masonry/Masonry.h>
#import "ReactiveObjC.h"

@interface TDFProvideTipsCell ()

@property (nonatomic, strong) UIView *leftLineView;

@property (nonatomic, strong) UIView *rightLineView;

@property (nonatomic, strong) UILabel *centerLabel;

@end

@implementation TDFProvideTipsCell

- (void)cellDidLoad {
    self.selectionStyle =UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.centerLabel];
    [self.contentView addSubview:self.leftLineView];
    [self.contentView addSubview:self.rightLineView];
    
    [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
    [self.leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerLabel.mas_centerY);
        make.height.mas_equalTo(1);
        make.right.equalTo(self.centerLabel.mas_left).offset(-10);
        make.left.offset(60);
    }];
    [self.rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerLabel.mas_centerY);
        make.height.equalTo(self.leftLineView.mas_height);
        make.left.equalTo(self.centerLabel.mas_right).offset(10);
        make.right.offset(-60);
    }];
}

- (void)configCellWithItem:(TDFProvideTipsItem *)item {
    @weakify(self);
    RACSignal *title = [RACObserve(item, text) takeUntil:self.rac_prepareForReuseSignal];
    RACSignal *hid = [RACObserve(item, hide) takeUntil:self.rac_prepareForReuseSignal];
    [[[RACSignal merge:@[title,hid]] takeUntil:self.rac_prepareForReuseSignal] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self.centerLabel.text = item.text;
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFProvideTipsItem *)item {
    if (item.hide) {
        return 0;
    }
    return 44.0f;
}

#pragma mark - Getter

- (UIView *)leftLineView {
    if (!_leftLineView) {
        _leftLineView = [UIView new];
        [_leftLineView setBackgroundColor:[UIColor tdf_hex_CCCCCC]];
    }
    return _leftLineView;
}

- (UIView *)rightLineView {
    if (!_rightLineView) {
        _rightLineView = [UIView new];
        [_rightLineView setBackgroundColor:[UIColor tdf_hex_CCCCCC]];
    }
    return _rightLineView;
}

- (UILabel *)centerLabel {
    if (!_centerLabel) {
        _centerLabel = [UILabel new];
        [_centerLabel setText:NSLocalizedString(@"以上方案由二维火提供", nil)];
        [_centerLabel setTextColor:[UIColor tdf_hex_CCCCCC]];
        [_centerLabel setFont:[UIFont systemFontOfSize:13]];
        _centerLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _centerLabel;
}

@end
