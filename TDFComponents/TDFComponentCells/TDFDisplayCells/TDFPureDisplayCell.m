//
//  TDFPureDisplayCell.m
//  TDFComponents
//
//  Created by 刘红琳 on 2017/11/15.
//

#import "TDFPureDisplayCell.h"
#import "TDFPureDisplayItem.h"
#import "UIColor+Hex.h"
#import "Masonry.h"

@interface TDFPureDisplayCell()
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *subTitleLabel;
@property (nonatomic, strong) UIImageView *rightIcon;

@end

@implementation TDFPureDisplayCell
- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    
    [self.contentView addSubview:self.rightIcon];
    [self.rightIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-15.4);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(8, 13));
    }];
    
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        make.top.equalTo(self).with.offset(12);
        make.right.equalTo(self.rightIcon.mas_left).offset(-10);
    }];
    
    [self addSubview:self.subTitleLabel];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(self.titleLabel);
        make.bottom.equalTo(self).with.offset(-12);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFPureDisplayItem *)item {
    return 64;
}

- (void)configCellWithItem:(TDFPureDisplayItem *)item {
    self.titleLabel.text = item.title;
    self.subTitleLabel.text = item.subTitle;
    self.subTitleLabel.textColor = item.subTextColor;
}


#pragma mark -- Setters && Getters --

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel
{
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _subTitleLabel.font = [UIFont systemFontOfSize:13];
        _subTitleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _subTitleLabel;
}

- (UIImageView *)rightIcon {
    if(!_rightIcon) {
        _rightIcon = [[UIImageView alloc] init];
        _rightIcon.image = [UIImage imageNamed:@"icon_next_alpha"];
    }
    return _rightIcon;
}

@end
