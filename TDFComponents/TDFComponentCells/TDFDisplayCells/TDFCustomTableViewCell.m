//
//  TDFCustomTableViewCell.m
//  Pods
//
//  Created by chaiweiwei on 2017/7/25.
//
//

#import "TDFCustomTableViewCell.h"
#import <Masonry/Masonry.h>
#import "TDFCustomTableViewItem.h"
#import "UITableViewCell+SeperatorLine.h"

@interface TDFCustomTableViewCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UILabel *borderTipLabel;
@property (nonatomic, strong) UIImageView *rightIcon;

@end

@implementation TDFCustomTableViewCell

- (void)cellDidLoad {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
    
    self.tdf_showBottomMargin = YES;
    
    [self.contentView addSubview:self.rightIcon];
    [self.rightIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(8, 13));
    }];

    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [self.contentView addSubview:self.borderTipLabel];
    [self.borderTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).with.offset(5);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(16);
    }];
    
    [self.contentView addSubview:self.subtitleLabel];
    [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.rightIcon.mas_left).with.offset(-8);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.borderTipLabel.mas_right).with.offset(5);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFCustomTableViewItem *)item {
    return 44;
}

- (void)configCellWithItem:(TDFCustomTableViewItem *)item {
    self.titleLabel.text = item.title;
    self.subtitleLabel.text = item.subtitle;
    self.borderTipLabel.text = item.borderTip;
    
    self.titleLabel.font = item.titleFont;
    self.subtitleLabel.font = item.subtitleFont;
    self.borderTipLabel.font = item.borderTipFont;
    
    self.titleLabel.textColor = item.titleColor;
    self.subtitleLabel.textColor = item.subtitleColor;
    self.borderTipLabel.textColor = item.borderTipColor;
    self.borderTipLabel.backgroundColor = item.borderTipBgColor;
    
    CGSize size = [item.borderTip sizeWithAttributes:@{NSFontAttributeName:item.subtitleFont}];
    [self.borderTipLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(size.width + 10);
    }];
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh
                                       forAxis:UILayoutConstraintAxisHorizontal];
        [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh
                                                     forAxis:UILayoutConstraintAxisHorizontal];

    }
    return _titleLabel;
}

- (UILabel *)subtitleLabel {
    if(!_subtitleLabel) {
        _subtitleLabel = [[UILabel alloc] init];
        _subtitleLabel.textAlignment = NSTextAlignmentRight;
    }
    return _subtitleLabel;
}

- (UILabel *)borderTipLabel {
    if(!_borderTipLabel) {
        _borderTipLabel = [[UILabel alloc] init];
        _borderTipLabel.layer.masksToBounds = YES;
        _borderTipLabel.layer.cornerRadius = 3;
        _borderTipLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _borderTipLabel;
}

- (UIImageView *)rightIcon {
    if(!_rightIcon) {
        _rightIcon = [[UIImageView alloc] init];
        _rightIcon.image = [UIImage imageNamed:@"icon_next_alpha" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    return _rightIcon;
}
@end
