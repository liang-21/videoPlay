//
//  TDFTableWithTwoBtnWithImageCell.m
//  TDFComponents
//
//  Created by 刘红琳 on 2017/11/15.
//

#import "TDFTableWithTwoBtnWithImageCell.h"
#import "TDFTableWithTwoBtnWithImageItem.h"
#import "UIImageView+WebCache.h"
#import "UIColor+Hex.h"
#import "Masonry.h"

@interface TDFTableWithTwoBtnWithImageCell()
@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *subTitleLabel;
@property (strong, nonatomic) UIButton *rightBtn;
@property (strong, nonatomic) UIButton *nextRightBtn;
@property (nonatomic, strong) UIView *lineView;
@property (strong, nonatomic) TDFTableWithTwoBtnWithImageItem *model;
@end

@implementation TDFTableWithTwoBtnWithImageCell
- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.subTitleLabel];
    [self addSubview:self.nextRightBtn];
    [self addSubview:self.rightBtn];
    [self addSubview:self.titleLabel];
    [self addSubview:self.lineView];
    
    [self.nextRightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).with.offset(-14);
        make.height.equalTo(@(30));
        make.width.equalTo(@(30));
    }];
    
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.nextRightBtn.mas_left).with.offset(-5);
        make.height.equalTo(@(30));
        make.width.equalTo(@(30));
    }];
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.equalTo(self);
        make.height.equalTo(@(0.5));
        make.right.equalTo(self);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFTableWithTwoBtnWithImageItem *)item {
    switch (item.cellStyle) {
        case TDFTableWithTwoBtnWithImageStyleDefault:
            return 44;
        case DFTableWithTwoBtnWithImageStyleSubtitle:case DFTableWithTwoBtnWithImageStyleSubtitleWithIcon:case DFTableWithTwoBtnWithImageStyleDefaultWithIcon:
            return 64;
    }
    return 44;
}

- (void)configCellWithItem:(TDFTableWithTwoBtnWithImageItem *)item {
    self.model = item;
    self.iconImageView.image = item.iconImage;
    self.titleLabel.text = item.title;
    if(item.titleAttributedString) {
        self.titleLabel.attributedText = item.titleAttributedString;
    }
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:item.iconURL] placeholderImage:item.iconImage];
    self.subTitleLabel.text = item.subTitle;
    
    [self.rightBtn setImage:item.rightImage forState:UIControlStateNormal];
    [self.nextRightBtn setImage:item.nextRightImage forState:UIControlStateNormal];
    [self remakeConstraints];
}

- (void)remakeConstraints {
    switch (self.model.cellStyle) {
        case TDFTableWithTwoBtnWithImageStyleDefault:{
            self.subTitleLabel.hidden = YES;
            self.iconImageView.hidden = YES;
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).with.offset(15);
                make.centerY.equalTo(self);
                make.right.equalTo(self.rightBtn.mas_left).offset(-10);
            }];
        }
            break;
        case DFTableWithTwoBtnWithImageStyleSubtitle:{
            self.subTitleLabel.hidden = NO;
            self.iconImageView.hidden = YES;
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).with.offset(15);
                make.top.equalTo(self.mas_top).with.offset(12);
                make.right.equalTo(self.rightBtn.mas_left).offset(-10);
            }];
            [self.subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.titleLabel);
                make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
                make.right.equalTo(self.mas_right).with.offset(-10);
            }];
        }
            break;
        case DFTableWithTwoBtnWithImageStyleSubtitleWithIcon: {
            self.subTitleLabel.hidden = NO;
            self.iconImageView.hidden = NO;
            
            [self.iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@15);
                make.centerY.equalTo(self);
                make.width.height.equalTo(@44);
            }];
            
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.iconImageView.mas_right).with.offset(15);
                make.top.equalTo(self.mas_top).with.offset(12);
                make.right.equalTo(self.rightBtn.mas_left).offset(-10);
            }];
            [self.subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.titleLabel);
                make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
                make.right.equalTo(self.mas_right).with.offset(-10);
            }];
            
            [self layoutLineView];
        }
            break;
            
        case DFTableWithTwoBtnWithImageStyleDefaultWithIcon:{
            self.subTitleLabel.hidden = YES;
            self.iconImageView.hidden = NO;
            
            [self.iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@15);
                make.centerY.equalTo(self);
                make.width.height.equalTo(@44);
            }];
            
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.iconImageView.mas_right).with.offset(15);
                make.centerY.equalTo(self);
                make.right.equalTo(self.rightBtn.mas_left).offset(-10);
            }];
            
            [self layoutLineView];
        }
            break;
        default:
            break;
    }
    
    [self layoutIfNeeded];
}

- (void) layoutLineView
{
    if (self.model.isLastItem) {
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.left.equalTo(self);
            make.height.equalTo(@(0.5));
            make.right.equalTo(self);
        }];
    }else{
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.left.equalTo(self.iconImageView.mas_right).with.offset(15);
            make.height.equalTo(@(0.5));
            make.right.equalTo(self);
        }];
    }
}

#pragma mark -- Setters && Getters --

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UIButton *)rightBtn
{
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [_rightBtn addTarget:self action:@selector(rightBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

- (UIButton *)nextRightBtn
{
    if (!_nextRightBtn) {
        _nextRightBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [_nextRightBtn addTarget:self action:@selector(nextRightBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextRightBtn;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        _iconImageView.layer.cornerRadius = 6;
        _iconImageView.layer.masksToBounds = true;
    }
    return _iconImageView;
}

- (UILabel *)subTitleLabel
{
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _subTitleLabel.font = [UIFont systemFontOfSize:13];
        _subTitleLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        _subTitleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _subTitleLabel;
}

#pragma mark ----btnClickMethod----
- (void)rightBtnClicked
{
    if (self.model.rightBlock) {
        self.model.rightBlock();
    }
}

- (void)nextRightBtnClicked
{
    if (self.model.nextRightBlock) {
        self.model.nextRightBlock();
    }
}

- (UIView *)lineView {
    
    if (!_lineView) {
        
        _lineView = [UIView new];
        
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
    }
    return _lineView;
}

@end

