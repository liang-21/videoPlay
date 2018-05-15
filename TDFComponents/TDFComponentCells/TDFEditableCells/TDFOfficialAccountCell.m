//
//  TDFOfficialAccountCell.m
//  Pods
//
//  Created by 黄河 on 2017/7/17.
//
//

#import "TDFOfficialAccountCell.h"
#import "TDFOfficialAccountItem.h"
#import <Masonry/Masonry.h>
#import "UIColor+Hex.h"
#import <TDFOldBaseUtil/UIImageView+TDFRequest.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface TDFOfficialAccountCell ()

@property (nonatomic, strong)UIImageView    *selectImageView;

@property (nonatomic, strong)UIImageView    *iconImageView;

@property (nonatomic, strong)UILabel        *nameLabel;

@property (nonatomic, strong)UILabel        *shopCountLabel;

@property (nonatomic, strong)TDFOfficialAccountItem *item;
@end

@implementation TDFOfficialAccountCell

- (void)cellDidLoad {
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.selectImageView];
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.shopCountLabel];
    [self configLayout];
}

- (void)configLayout {
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 1, 0));
    }];
    [self.selectImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(self.selectImageView.mas_width);
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.selectImageView.mas_right).offset(10);
        make.centerY.equalTo(self.contentView);
        make.width.height.equalTo(@60);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.shopCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.greaterThanOrEqualTo(self.nameLabel.mas_right);
        make.right.equalTo(self.contentView).offset(-10);
        make.centerY.equalTo(self.contentView);
    }];
}

+ (CGFloat)heightForCellWithItem:(DHTTableViewItem *)item {
    return 89;
}

- (void)configCellWithItem:(TDFOfficialAccountItem *)item {
    @weakify(self);
    RAC(self.nameLabel, text) = [RACObserve(item, officialAccountName) takeUntil:self.rac_prepareForReuseSignal];
    [[RACObserve(item, isSelect)
        takeUntil:self.rac_prepareForReuseSignal]
        subscribeNext:^(id  _Nullable x) {
            @strongify(self);
            self.selectImageView.highlighted = [x boolValue];
        }];
    [[RACObserve(item, shopNameCount)
        takeUntil:self.rac_prepareForReuseSignal]
        subscribeNext:^(id  _Nullable x) {
            @strongify(self);
            self.shopCountLabel.text = [NSString stringWithFormat:@"共计绑定%ld家门店",[x longValue]];
        }];
    [[RACObserve(item, headerImageUrl)
        takeUntil:self.rac_prepareForReuseSignal]
        subscribeNext:^(id  _Nullable x) {
            [self.iconImageView tdf_imageRequstWithPath:x
                                       placeholderImage:[UIImage imageNamed:@"img_nopic_user" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil]
                                               urlModel:ImageUrlOrigin];
        }];
}

#pragma mark -- setter && getter

- (UIImageView *)selectImageView {
    if (!_selectImageView) {
        _selectImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_select_empty" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] highlightedImage:[UIImage imageNamed:@"icon_select_filled" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil]];
    }
    return _selectImageView;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.cornerRadius = 30;
        _iconImageView.clipsToBounds = YES;
    }
    return _iconImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor colorWithHeX:0x333333];
        _nameLabel.font = [UIFont systemFontOfSize:18];
    }
    return _nameLabel;
}

- (UILabel *)shopCountLabel {
    if (!_shopCountLabel) {
        _shopCountLabel = [[UILabel alloc] init];
        _shopCountLabel.textColor = [UIColor colorWithHeX:0x0088CC];
        _shopCountLabel.font = [UIFont systemFontOfSize:11];
    }
    return _shopCountLabel;
}

@end
