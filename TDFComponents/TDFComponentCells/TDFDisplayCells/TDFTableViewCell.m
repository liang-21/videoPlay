//
//  TDFTableViewCell.m
//  Pods
//
//  Created by chaiweiwei on 2017/4/28.
//
//

#import "TDFTableViewCell.h"
#import "TDFTableViewItem.h"
#import "Masonry.h"
#import "UITableViewCell+SeperatorLine.h"

@interface TDFTableViewCell()

@property (strong,nonatomic) TDFTableViewItem *model;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleTextLabel;
@property (nonatomic, strong) UILabel *reasonLabel;
@property (nonatomic,strong) UIButton *selectIcon;
@property (nonatomic,strong) UIButton *bigButton;
@end

@implementation TDFTableViewCell

#pragma mark - DHTTableViewCellDelegate

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.accessoryView.frame;
    frame.origin.x = [UIScreen mainScreen].bounds.size.width - (frame.size.width + self.model.accessoryInsets.right);
    self.accessoryView.frame = frame;
    
    frame = self.imageView.frame;
    frame.origin.x = self.model.imageInsets.left;
    self.imageView.frame = frame;
}

- (void)cellDidLoad {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.subtitleTextLabel];
    [self.contentView addSubview:self.reasonLabel];
    [self.contentView addSubview:self.selectIcon];
    [self.contentView addSubview:self.bigButton];
    
    [self.bigButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFTableViewItem *)item {
    
    if(!item.shouldShow) {
        return 0;
    }
    switch (item.style) {
        case TDFTableViewCellStyleDefault:
        case TDFTableViewCellStyleValue1:
        case TDFTableViewCellStyleValue2:
//<<<<<<< HEAD
//            return 48;
//        case TDFTableViewCellStyleSubtitle:
//        case TDFTableViewCellStyleAllAbove:
//        {
//=======
            return item.cellHeightForStyleExceptSubtitle;
        case TDFTableViewCellStyleSubtitle:
        case TDFTableViewCellStyleAllAbove:
        {
//>>>>>>> develop
            CGSize titleSize = [item.title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
            
            CGFloat width = [UIScreen mainScreen].bounds.size.width-20;
            if(item.accessoryType == TDFTableViewCellAccessoryDisclosureIndicator) {
                width -= 30;
            }
            CGSize subtitleSize = [item.subtitle boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
            return 14 + 14 + 10 + titleSize.height + subtitleSize.height;
        }
        default:
            return 0;
    }
}

- (void)configCellWithItem:(TDFTableViewItem *)item {
    
    self.contentView.hidden = !item.shouldShow;
    if (!item.shouldShow) return;
    
    self.model = item;

    self.titleLabel.numberOfLines = item.numLineOfTitle;
    
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:item.contentViewAlpha];

    switch (self.model.seperatorType) {
        case TDFTableViewCellSeperatorLineTypeAlphaLine:
        {
            self.tdf_showBottomMargin = YES;
        }
            break;
        case TDFTableViewCellSeperatorLineTypeLeftMargin:
        {
            self.tdf_showBottomLine = YES;
        }
            break;
    }
    
    if(item.contentViewAlpha <= 0) {
        self.tdf_showBottomLine = YES;
    }
    
    if (item.attributedTitle &&  item.attributedTitle.length > 0) {
        self.titleLabel.attributedText = item.attributedTitle;
    }else {
        self.titleLabel.text = item.title;
        self.titleLabel.textColor = item.titleColor;
        self.titleLabel.font = item.titleFont;
    }
    
    self.subtitleTextLabel.text = item.subtitle;
    self.subtitleTextLabel.textColor = item.subtitleColor;
    self.subtitleTextLabel.font = item.subtitleFont;
    
    self.reasonLabel.text = item.reason;
    self.reasonLabel.textColor = item.reasonColor;
    self.reasonLabel.font = item.reasonFont;
    
    self.imageView.image = item.image;
    
    self.subtitleTextLabel.textAlignment = NSTextAlignmentLeft;
    self.subtitleTextLabel.numberOfLines = 1;
    
    [self remakeConstraintsWithItem:item];
    [self updateConstraints:item];
    
    [self updateViewsStyle:item];
}

- (void)setTdf_showBottomLine:(BOOL)tdf_showBottomLine {
    
    if (tdf_showBottomLine) {
        if ([self tdf_bottomLineView].superview) return;
        
        [self.contentView addSubview:[self tdf_bottomLineView]];
        [[self tdf_bottomLineView] mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.left.equalTo(self).offset(self.model.seperatoInsets.left);
            make.right.equalTo(self).offset(-self.model.seperatoInsets.right);
            make.height.equalTo(@0.5);
        }];
    } else {
        [super setTdf_showBottomLine:tdf_showBottomLine];
    }
}

#pragma mark - Method

- (void)remakeConstraintsWithItem:(TDFTableViewItem *)item {
    CGFloat leftOffset = item.imageInsets.left;
    if(self.imageView.image) {
        leftOffset = self.imageView.image.size.width + item.imageInsets.left + item.imageInsets.right;
    }
    
    switch (item.style) {
        case TDFTableViewCellStyleDefault:{
            self.subtitleTextLabel.hidden = YES;
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).with.offset(leftOffset);
                make.centerY.equalTo(self.mas_centerY);
                make.right.equalTo(self.mas_right).with.offset(-10);
            }];
        }
            break;
        case TDFTableViewCellStyleValue1:
            self.subtitleTextLabel.lineBreakMode = NSLineBreakByTruncatingHead;
            self.subtitleTextLabel.textAlignment = NSTextAlignmentRight;
        case TDFTableViewCellStyleValue2:{
            self.subtitleTextLabel.hidden = NO;
            
            [self.subtitleTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.mas_centerY);
                make.right.equalTo(self.mas_right).with.offset(-10);
                make.width.greaterThanOrEqualTo(@(ceil(item.greaterThanOrEqualOfSubtitleWidth)));
            }];
            
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).with.offset(leftOffset);
                make.centerY.equalTo(self.mas_centerY);
                make.right.equalTo(self.subtitleTextLabel.mas_left).with.offset(-5);
            }];
            
        }
            break;
        case TDFTableViewCellStyleSubtitle:{
            self.subtitleTextLabel.hidden = NO;
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).with.offset(leftOffset);
                make.top.equalTo(self.mas_top).with.offset(14);
                make.right.equalTo(self.mas_right).with.offset(-10);
            }];
            [self.subtitleTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).with.offset(leftOffset);
                make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
                make.right.equalTo(self.mas_right).with.offset(-10);
            }];
            self.subtitleTextLabel.numberOfLines = 0;
        }
            break;
        case TDFTableViewCellStyleAllAbove: {
            self.subtitleTextLabel.hidden = NO;
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).with.offset(leftOffset);
                make.top.equalTo(self.mas_top).with.offset(14);
                make.right.equalTo(self.mas_right).with.offset(-10);
            }];
            [self.subtitleTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).with.offset(leftOffset);
                make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
                make.right.equalTo(self.mas_right).with.offset(-10);
            }];
            self.subtitleTextLabel.numberOfLines = 0;
            [self.reasonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.contentView);
                make.right.mas_offset(-10.0);
            }];
        }
            break;
    }
    
    [self layoutIfNeeded];
}

- (void)updateViewsStyle:(TDFTableViewItem *)item {
    self.selectIcon.selected = item.isSelected;
    if (item.disable && !item.userCustomFontOrColorWhenDisable) {
        self.titleLabel.textColor =  RGBA(153, 153, 153, 1);
        self.subtitleTextLabel.textColor = RGBA(153, 153, 153, 1);
        
    }else {
        if (!item.attributedTitle || item.attributedTitle.length == 0) {
             self.titleLabel.textColor = item.titleColor;
        }
        self.subtitleTextLabel.textColor =  item.subtitleColor;
    }
    
    UIImage *disableIcon;
    if(item.isSelected && item.disable) {
        disableIcon = [UIImage imageNamed:@"food_cell_icon_selected_diable" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }else {
        disableIcon = [UIImage imageNamed:@"food_cell_icon_selected" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    
    [self.selectIcon setImage:disableIcon forState:UIControlStateSelected];
    
    if(!item.isSelected && item.disable) {
        disableIcon = [UIImage imageNamed:@"food_cell_icon_unselected_diable" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }else {
        disableIcon = [UIImage imageNamed:@"food_cell_icon_unSelected" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    [self.selectIcon setImage:disableIcon forState:UIControlStateNormal];
}

- (void)updateConstraints:(TDFTableViewItem *)item {
    
    self.selectIcon.hidden = YES;
    self.bigButton.hidden = YES;
    
    switch (item.accessoryType) {
        case TDFTableViewCellAccessoryNone:{
            self.accessoryType = UITableViewCellAccessoryNone;
            self.accessoryView = nil;
        }
            break;
        case TDFTableViewCellAccessoryDisclosureIndicator:{
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_next_alpha" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil]];
        }
        case TDFTableViewCellAccessoryCustomAccessoryView: {
            if(self.model.accessoryView) {
                self.accessoryView = self.model.accessoryView;
            }
            
            CGFloat accessoryViewWidth = CGRectGetWidth(self.accessoryView.frame);
            CGFloat offset = accessoryViewWidth + item.accessoryInsets.left + item.accessoryInsets.right;
            
            switch (item.style) {
                case TDFTableViewCellStyleDefault:{
                    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.right.equalTo(self.mas_right).with.offset(-offset);
                    }];
                }
                    break;
                case TDFTableViewCellStyleValue1:
                case TDFTableViewCellStyleValue2:{
                    
                    [self.subtitleTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.right.equalTo(self.mas_right).with.offset(-offset);
                    }];
                }
                    break;
                case TDFTableViewCellStyleSubtitle:{
                    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.right.equalTo(self.mas_right).with.offset(-offset);
                    }];
                    [self.subtitleTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.right.equalTo(self.mas_right).with.offset(-offset);
                    }];
                }
                    break;
            }
        }
            break;
        case TDFTableViewCellAccessoryCircleSelect:{
            self.selectIcon.hidden = NO;
            self.bigButton.hidden = NO;
            
            self.imageView.image = nil;
            
            self.accessoryType = UITableViewCellAccessoryNone;
            self.accessoryView = nil;
            
            [self.selectIcon mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.mas_centerY);
                make.left.equalTo(self.mas_left).with.offset(10);
                make.height.and.width.mas_equalTo(18);
            }];
            switch (item.style) {
                case TDFTableViewCellStyleDefault:
                case TDFTableViewCellStyleValue1:
                case TDFTableViewCellStyleValue2:{
                    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.left.equalTo(self.mas_left).with.offset(38);
                    }];
                }
                    break;
                case TDFTableViewCellStyleSubtitle:{
                    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.left.equalTo(self.mas_left).with.offset(38);
                    }];
                    [self.subtitleTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.left.equalTo(self.mas_left).with.offset(38);
                    }];
                }
                    break;
                case TDFTableViewCellStyleAllAbove:
                {
                    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.left.equalTo(self.mas_left).with.offset(38);
                    }];
                    [self.subtitleTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.left.equalTo(self.mas_left).with.offset(38);
                    }];
                    
                    [self.reasonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerY.equalTo(self.contentView);
                        make.right.mas_offset(-10.0);
                    }];
                }
                    break;
            }
            
        }
            break;
    }
}

- (void)bigButtonAction {
    if (self.model.disable) {
        return;
    }
    self.selectIcon.selected = !self.selectIcon.isSelected;
    self.model.selected = !self.model.isSelected;
    if(self.model.didSelectRowBlock) {
        self.model.didSelectRowBlock(self.selectIcon.isSelected);
    }
}

#pragma mark - Get Set

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                     forAxis:UILayoutConstraintAxisHorizontal];
        
    }
    return _titleLabel;
}

- (UILabel *)reasonLabel {
    if(!_reasonLabel) {
        _reasonLabel = [[UILabel alloc] init];
    }
    return _reasonLabel;
}

- (UILabel *)subtitleTextLabel {
    if(!_subtitleTextLabel) {
        _subtitleTextLabel = [[UILabel alloc] init];
    }
    return _subtitleTextLabel;
}

- (UIButton *)selectIcon {
    if(!_selectIcon) {
        _selectIcon = [[UIButton alloc] init];
        [_selectIcon setImage:[UIImage imageNamed:@"food_cell_icon_unSelected" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        [_selectIcon setImage:[UIImage imageNamed:@"food_cell_icon_selected" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateSelected];
    }
    return _selectIcon;
}

- (UIButton *)bigButton {
    if(!_bigButton) {
        _bigButton = [[UIButton alloc] init];
        _bigButton.backgroundColor = [UIColor clearColor];
        [_bigButton addTarget:self action:@selector(bigButtonAction) forControlEvents:UIControlEventTouchUpInside];
        _bigButton.hidden = YES;
    }
    return _bigButton;
}

@end

