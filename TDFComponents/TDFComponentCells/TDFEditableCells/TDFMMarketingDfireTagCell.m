//
//  TDFMMarketingDfireTagCell.m
//  Pods
//
//  Created by 黄河 on 2017/7/19.
//
//

#import "TDFMMarketingDfireTagCell.h"
#import "TDFMMarketingDfireTagItem.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <Masonry/Masonry.h>
#import "UIColor+Hex.h"

@interface TDFMMarketingDfireTagCell ()

@property (nonatomic, strong) UIView        *showView;

@property (nonatomic, strong) UILabel       *nameLabel;

@property (nonatomic, strong) UILabel       *valueLabel;

@property (nonatomic, strong) UILabel       *tagLabel;

@end

@implementation TDFMMarketingDfireTagCell

- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    [self.showView addSubview:self.nameLabel];
    [self.showView addSubview:self.tagLabel];
    [self.showView addSubview:self.valueLabel];
    [self.contentView addSubview:self.showView];
    [self configLayout];
}

- (void)configLayout {
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 1, 0));
    }];
    
    [self.showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.showView);
    }];
    
    [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(6);
        make.centerY.equalTo(self.nameLabel);
        make.width.equalTo(@40);
        make.right.lessThanOrEqualTo(self.showView);
    }];
    
    [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self.showView);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
        make.right.lessThanOrEqualTo(self.showView);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFMMarketingDfireTagItem *)item {
    return 81;
}

- (void)configCellWithItem:(TDFMMarketingDfireTagItem *)item {
    RAC(self.nameLabel, text) = [RACObserve(item, nickName) takeUntil:self.rac_prepareForReuseSignal];
    RAC(self.valueLabel, text) = [[RACObserve(item, mobile) takeUntil:self.rac_prepareForReuseSignal] map:^id _Nullable(id  _Nullable value) {
        return [NSString stringWithFormat:@"手机：%@", value];
    }];
    [[RACObserve(item, isReceiveCard) takeUntil:self.rac_prepareForReuseSignal] subscribeNext:^(id  _Nullable x) {
        self.tagLabel.text = [x intValue] == 1 ? @"已领卡" : @"未领卡";
        self.tagLabel.backgroundColor = [UIColor colorWithHeX:[x intValue] == 1 ? 0x07AD1f : 0xCC0000];
    }];
}

#pragma mark - setter && getter

- (UIView *)showView {
    if (!_showView) {
        _showView = [[UIView alloc] init];
    }
    return _showView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor colorWithHeX:0x333333];
        _nameLabel.font = [UIFont systemFontOfSize:15];
    }
    return _nameLabel;
}

- (UILabel *)valueLabel {
    if (!_valueLabel) {
        _valueLabel = [[UILabel alloc] init];
        _valueLabel.textColor = [UIColor colorWithHeX:0x333333];
        _valueLabel.font = [UIFont systemFontOfSize:13];
    }
    return _valueLabel;
}

- (UILabel *)tagLabel {
    if (!_tagLabel) {
        _tagLabel = [[UILabel alloc] init];
        _tagLabel.font = [UIFont systemFontOfSize:10];
        _tagLabel.textColor = [UIColor whiteColor];
        _tagLabel.layer.cornerRadius = 3;
        _tagLabel.clipsToBounds = YES;
        _tagLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _tagLabel;
}
@end
