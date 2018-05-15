//
//  TDFMenuListCell.m
//  Pods
//
//  Created by tripleCC on 2017/6/26.
//
//
#import <Masonry/Masonry.h>
#import <TDFCategories/TDFCategories.h>
#import "UIImageView+WebCache.h"
#import "UITableViewCell+SeperatorLine.h"
#import "TDFMenuListCell.h"
#import "TDFMenuListItem.h"

@interface TDFMenuListCell ()
@property (strong, nonatomic) UIImageView *contentImageView;
@property (strong, nonatomic) UIImageView *statusImageView;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *detailLabel;
@end

@implementation TDFMenuListCell

- (void)cellDidLoad {
    self.tdf_showBottomMargin = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    
    [self.contentView addSubview:self.contentImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.detailLabel];
    [self.contentView addSubview:self.arrowImageView];
    [self addSubview:self.statusImageView];
    
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(@15);
        make.width.height.equalTo(@60);
    }];
    [self.statusImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentImageView);
        make.right.equalTo(self.contentView).offset(-10);
        make.size.equalTo(self.contentImageView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentImageView.mas_right).offset(15);
        make.top.equalTo(self.contentView).offset(15);
        make.right.lessThanOrEqualTo(self.contentView).offset(-15);
    }];

    
}

- (void)updateConstraints {
    
    [self.arrowImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-10.f);
        make.width.and.height.equalTo(@22.0f);
        make.centerY.equalTo(self.contentView);
    }];
    
    CGFloat offset = self.arrowImageView.hidden ? -15.0f : -30.0f;
    
    [self.detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.right.equalTo(self.contentView).offset(offset);
    }];
    
    [super updateConstraints];
}

- (void)configCellWithItem:(TDFMenuListItem *)item {
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:item.imageURL]];
    
    self.statusImageView.image = item.statusImage;
    self.titleLabel.text = item.title;
    self.titleLabel.font = item.titleFont;
    self.detailLabel.text = item.detail;
    self.detailLabel.font = item.detailFont;
    self.arrowImageView.hidden = item.statusImage;
    
    switch (item.status) {
        case TDFMenuFunctionStatusWillCome:
            self.contentView.alpha = 0.7;
            break;
        default:
            break;
    }
    
    [self setNeedsUpdateConstraints];
    [self setNeedsLayout];
}

+ (CGFloat)heightForCellWithItem:(TDFMenuListItem *)item {
    
    CGFloat detailWidth = [UIScreen mainScreen].bounds.size.width - 15 * 3 - 60;
    
    if (!item.statusImage) {
        detailWidth = [UIScreen mainScreen].bounds.size.width - 60 - 60;
    }
    
    return [item.detail tdf_heightForFont:item.detailFont width:detailWidth] + 15 * 2 + 10 + item.titleFont.lineHeight;
}


- (UIImageView *)contentImageView {
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] init];
    }
    
    return _contentImageView;
}


- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_next" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil]];
    }
    return _arrowImageView;
}

- (UIImageView *)statusImageView {
    if (!_statusImageView) {
        _statusImageView = [[UIImageView alloc] init];
    }
    
    return _statusImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor tdf_colorWithRGB:0x333333];
    }
    
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textColor = [UIColor tdf_colorWithRGB:0x666666];
        _detailLabel.numberOfLines = 0;
    }
    
    return _detailLabel;
}
@end
