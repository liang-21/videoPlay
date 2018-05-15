//
//  TDFKBMGTicketHeaderCell.m
//  TDFComponents
//
//  Created by 黄河 on 2017/12/27.
//

#import "TDFKBMGTicketHeaderCell.h"
#import "TDFKBMGTicketHeaderItem.h"
#import "ReactiveObjC.h"
#import "UIImageView+WebCache.h"
#import "UIColor+tdf_standard.h"
#import "UIFont+tdf_standard.h"
#import "UITableViewCell+SeperatorLine.h"
#import "Masonry.h"

@interface TDFKBMGTicketHeaderCell ()

@property (nonatomic, strong)UIImageView *headerImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *detailLabel;
@end

@implementation TDFKBMGTicketHeaderCell

- (void)cellDidLoad {
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self addSubview:self.headerImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.detailLabel];
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(37.2);
        make.centerX.equalTo(self);
        make.width.height.equalTo(@30);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.headerImageView.mas_bottom).offset(20);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
    }];
}

- (void)configCellWithItem:(TDFKBMGTicketHeaderItem *)item {
    RACSignal *headerSignal = [RACObserve(item, headerUrl) takeUntil:self.rac_prepareForReuseSignal];
    RACSignal *titleSignal = [RACObserve(item, title) takeUntil:self.rac_prepareForReuseSignal];
    RACSignal *descSignal = [RACObserve(item, desc) takeUntil:self.rac_prepareForReuseSignal];
    @weakify(self);
    [[[RACSignal merge:@[headerSignal, titleSignal,descSignal]] takeUntil:self.rac_prepareForReuseSignal] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        if ([item.headerUrl hasPrefix:@"http://"] || [item.headerUrl hasPrefix:@"https://"]) {
            [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:item.headerUrl]];
        }else {
            self.headerImageView.image = [UIImage imageNamed:item.headerUrl];
        }
        self.titleLabel.text = item.title;
        self.detailLabel.text = item.desc;
        self.tdf_showBottomLine = item.showBottomLine;
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFKBMGTicketHeaderItem *)item {
    return 177;
}

#pragma mark -- setter && getter
- (UIImageView *)headerImageView {
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] init];
    }
    return _headerImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont tdf_17];
        _titleLabel.textColor = [UIColor tdf_hex_333333];
        
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.font = [UIFont tdf_13];
        _detailLabel.textColor = [UIColor tdf_hex_666666];
    }
    return _detailLabel;
}

@end
