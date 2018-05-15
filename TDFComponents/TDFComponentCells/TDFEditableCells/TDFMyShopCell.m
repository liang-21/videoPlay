//
//  TDFMyShopCell.m
//
//  Created by doubanjiang on 2017/12/12.
//

#import "TDFMyShopCell.h"
#import "TDFMyShopItem.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <TDFOldBaseUtil/UIColor+Hex.h>
#import "UITableViewCell+SeperatorLine.h"

@interface TDFMyShopCell ()

@property (nonatomic, strong) UIImageView *iconImgV;

@property (nonatomic, strong) UIImageView *rightArrowV;

@property (nonatomic, strong) UIImageView *workingImage;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *subtitleTextLabel;

@property (nonatomic, strong) UILabel *rightL;

@end

@implementation TDFMyShopCell

- (void)cellDidLoad {
    self.tdf_showBottomLine = YES;
    [self configLayout];
}

- (void)configCellWithItem:(TDFMyShopItem *)item {
    self.subtitleTextLabel.textColor = item.subTitleColor;
    self.iconImgV.layer.cornerRadius = item.imageCornerRadius;
    [self.iconImgV sd_setImageWithURL:[NSURL URLWithString:item.imgUrl] placeholderImage:[UIImage imageNamed:item.defultimgName]];
    self.titleLabel.text = item.title;
    self.rightL.hidden = !item.showRightLabel;
    self.rightArrowV.hidden = !item.showRightIcon;
    self.rightL.textColor = item.rightLabelTextColor;
    self.rightL.text = item.rightTitle;
    self.workingImage.hidden = !item.showWorkingImage;
    [self updateViewWithItem:item];
}

- (void) updateViewWithItem:(TDFMyShopItem *)item
{
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgV.mas_right).offset(15);
        make.top.equalTo(self.contentView.mas_top).offset(item.topDistance);
        make.right.equalTo(self.rightL.mas_left).with.offset(-10);
    }];
    
    if (item.subTitle) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:item.subTitle];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        [paragraphStyle setLineSpacing:2.0];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,item.subTitle.length)];
        [self.subtitleTextLabel setAttributedText:attributedString];
        [self.subtitleTextLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    }
    if (!item.subTitle) {
        self.subtitleTextLabel.attributedText = item.attributedText;
    }
    
    if (!item.showRightLabel && item.showRightIcon) {
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).with.offset(-25);
        }];
        
        [self.subtitleTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.titleLabel);
        }];
    }
    if (!item.showRightLabel && !item.showRightIcon) {
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        }];
        
        [self.subtitleTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.titleLabel);
        }];
    }
}

+ (CGFloat)heightForCellWithItem:(TDFMyShopItem *)item {
    CGSize titleSize = [item.title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    CGFloat width = [UIScreen mainScreen].bounds.size.width-58-33-94;
    if(!item.showRightLabel && item.showRightIcon) {
        width = width+58;
    }
    if (item.showRightLabel && item.showRightIcon) {
//        width = width+58+33;
    }
    CGSize subtitleSize = [item.subTitle boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
    return 14 + 14 + 10 + titleSize.height + subtitleSize.height;
}

- (void)configLayout {
    
    [self.contentView addSubview:self.iconImgV];
    [self.contentView addSubview:self.rightArrowV];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.subtitleTextLabel];
    [self.contentView addSubview:self.rightL];
    [self.contentView addSubview:self.workingImage];
    
    [self.iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(@64);
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    [self.rightArrowV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@7.5);
        make.height.mas_equalTo(@13);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [self.rightL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-33);
        make.centerY.equalTo(self.iconImgV.mas_centerY);
        make.height.mas_equalTo(@18);
        make.width.mas_equalTo(@58);
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgV.mas_right).offset(15);
        make.top.equalTo(self.contentView.mas_top).offset(14);
        make.right.equalTo(self.rightL.mas_left).with.offset(-10);
    }];

    [self.subtitleTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(5);
        make.right.equalTo(self.titleLabel);
    }];
    
    [self.workingImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-33);
        make.top.equalTo(self.contentView.mas_top).offset(14);
        make.height.mas_equalTo(@16);
        make.width.mas_equalTo(@41);
    }];
}

#pragma mark - Getter

- (UIImageView *)iconImgV {
    if (!_iconImgV) {
        _iconImgV = [UIImageView new];
        _iconImgV.layer.masksToBounds = true;
        _iconImgV.layer.cornerRadius = 5;
    }
    return _iconImgV;
}

- (UIImageView *)rightArrowV {
    if (!_rightArrowV) {
        _rightArrowV = [UIImageView new];
        [_rightArrowV setImage:[UIImage imageNamed:@"icon_arrow_right_eleinvoice"]];
        _rightArrowV.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _rightArrowV;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh
                                       forAxis:UILayoutConstraintAxisHorizontal];
        [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh
                                                     forAxis:UILayoutConstraintAxisHorizontal];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#333333 "];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    return _titleLabel;
}

- (UILabel *)subtitleTextLabel {
    if(!_subtitleTextLabel) {
        _subtitleTextLabel = [[UILabel alloc] init];
        _subtitleTextLabel.numberOfLines = 0;
        _subtitleTextLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        _subtitleTextLabel.font = [UIFont systemFontOfSize:13];
    }
    return _subtitleTextLabel;
}


- (UILabel *)rightL {
    if (!_rightL) {
        _rightL = [UILabel new];
        [_rightL setFont:[UIFont systemFontOfSize:13]];
        _rightL.textAlignment = NSTextAlignmentRight;
    }
    return _rightL;
}

- (UIImageView *)workingImage {
    if (!_workingImage) {
        _workingImage = [UIImageView new];
        [_workingImage setImage:[UIImage imageNamed:@"ico_koubei_working"]];
        _workingImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _workingImage;
}
@end
