//
//  ASCCardSelectBackgroundView.m
//  AssemblyComponent
//
//  Created by 黄河 on 2017/11/28.
//

#import "TDFCardSelectBackgroundView.h"
#import "UIFont+tdf_standard.h"
#import "UIColor+tdf_standard.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"

@interface TDFCardSelectBackgroundView ()

@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UILabel *leftLabel;
@property (nonatomic, strong)UILabel *centerLabel;

@end

@implementation TDFCardSelectBackgroundView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configView];
    }
    return self;
}

- (void)configView {
    [self addSubview:self.imageView];
    [self addSubview:self.leftLabel];
    [self addSubview:self.centerLabel];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(18);
        make.top.equalTo(self).offset(17);
    }];
    [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.right.lessThanOrEqualTo(self);
    }];
}

- (void)configViewWithItem:(TDFCardSelectBackgroundItem *)item {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:item.imageUrl] placeholderImage:nil options:SDWebImageRefreshCached];
    self.leftLabel.text = item.leftTitle;
    self.centerLabel.text = item.centerTitle;
}

#pragma mark -- setter && getter

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UILabel *)leftLabel {
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.font = [UIFont tdf_15];
        _leftLabel.textColor = [UIColor tdf_hex_FFFFFF];
    }
    return _leftLabel;
}

- (UILabel *)centerLabel {
    if (!_centerLabel) {
        _centerLabel = [[UILabel alloc] init];
        _centerLabel.font = [UIFont tdf_28];
        _centerLabel.textColor = [UIColor tdf_hex_FFFFFF];
    }
    return _centerLabel;
}

@end
