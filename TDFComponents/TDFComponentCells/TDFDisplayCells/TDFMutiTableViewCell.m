//
//  TDFMutiTableViewCell.m
//  TDFComponents
//
//  Created by chaiweiwei on 2017/10/21.
//

#import "TDFMutiTableViewCell.h"
#import "TDFMutiTableViewItem.h"
#import "Masonry.h"
#import "UITableViewCell+SeperatorLine.h"
#import "UILabel+AttributedText.h"

@interface TDFMutiTableViewCell()

@property (strong,nonatomic) TDFMutiTableViewItem *model;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleTextLabel;
@property (nonatomic, strong) UILabel *titleLabel2;
@property (nonatomic, strong) UILabel *subtitleTextLabel2;

@property (nonatomic, strong) UIImageView *rightIocn;
@end

@implementation TDFMutiTableViewCell

#pragma mark - DHTTableViewCellDelegate

- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.titleLabel];
    
    [self.contentView addSubview:self.subtitleTextLabel];
    
    [self.contentView addSubview:self.titleLabel2];
    
    [self.contentView addSubview:self.subtitleTextLabel2];
    
    [self.contentView addSubview:self.rightIocn];
}

+ (CGFloat)heightForCellWithItem:(TDFMutiTableViewItem *)item
{
    return item.cellHeight;
}

- (void)configCellWithItem:(TDFMutiTableViewItem *)item
{
    self.model = item;
    
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
    
    self.titleLabel.text = item.title;
    self.titleLabel.textColor = item.titleColor;
    self.titleLabel.font = item.titleFont;
    
    self.titleLabel2.textColor = item.titleColor2;
    self.titleLabel2.font = item.titleFont2;
    self.titleLabel2.text = item.title2;
    if(item.titleAtt2) {
        self.titleLabel2.attributedText = item.titleAtt2;
    }
    
    self.subtitleTextLabel.textColor = item.subtitleColor;
    self.subtitleTextLabel.font = item.subtitleFont;
    self.subtitleTextLabel.text = item.subtitle;
    if(item.subtitleAtt) {
        self.subtitleTextLabel.attributedText = item.subtitleAtt;
    }
    
    self.subtitleTextLabel2.textColor = item.subtitleColor2;
    self.subtitleTextLabel2.font = item.subtitleFont2;
    self.subtitleTextLabel2.text = item.subtitle2;
    if(item.subtitleAtt2) {
        self.subtitleTextLabel2.attributedText = item.subtitleAtt2;
    }
    
    self.rightIocn.hidden = !item.showRight;
    
    [self makeConstraintsWithItem:item];
}

- (void)setTdf_showBottomLine:(BOOL)tdf_showBottomLine {
    
    if (tdf_showBottomLine) {
        if ([self tdf_bottomLineView].superview)
        {
            [[self tdf_bottomLineView] mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self);
                make.left.equalTo(self).offset(self.model.seperatoInsets.left);
                make.right.equalTo(self).offset(-self.model.seperatoInsets.right);
                make.height.equalTo(@1);
            }];
            return;
        }
        
        [self.contentView addSubview:[self tdf_bottomLineView]];
        [[self tdf_bottomLineView] mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.left.equalTo(self).offset(self.model.seperatoInsets.left);
            make.right.equalTo(self).offset(-self.model.seperatoInsets.right);
            make.height.equalTo(@1);
        }];
    } else {
        [super setTdf_showBottomLine:tdf_showBottomLine];
    }
}

#pragma mark - Method

- (void)makeConstraintsWithItem:(TDFMutiTableViewItem *)item {
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.top.equalTo(self.mas_top).with.offset(15);
    }];
    
    [self.titleLabel2 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).with.offset(5);
        if(!item.showRight) {
            make.right.equalTo(self.mas_right).with.offset(-10);
        }else {
            make.right.equalTo(self.mas_right).with.offset(-30);
        }
        make.top.equalTo(self.titleLabel.mas_top);
    }];
    
    [self.subtitleTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.bottom.equalTo(self.mas_bottom).with.offset(-15);
    }];
    
    [self.subtitleTextLabel2 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.subtitleTextLabel.mas_right).with.offset(5);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.top.equalTo(self.subtitleTextLabel.mas_top);
    }];
    
    [self.rightIocn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
}


#pragma mark - Get Set

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

- (UILabel *)subtitleTextLabel {
    if(!_subtitleTextLabel) {
        _subtitleTextLabel = [[UILabel alloc] init];
        _subtitleTextLabel.numberOfLines = 0;
    }
    return _subtitleTextLabel;
}

- (UILabel *)titleLabel2 {
    if(!_titleLabel2) {
        _titleLabel2 = [[UILabel alloc] init];
        _titleLabel2.textAlignment = NSTextAlignmentRight;
    }
    return _titleLabel2;
}

- (UILabel *)subtitleTextLabel2 {
    if(!_subtitleTextLabel2) {
        _subtitleTextLabel2 = [[UILabel alloc] init];
        _subtitleTextLabel2.textAlignment = NSTextAlignmentRight;
    }
    return _subtitleTextLabel2;
}

- (UIImageView *)rightIocn {
    if(!_rightIocn) {
        _rightIocn = [[UIImageView alloc] init];
        _rightIocn.image = [UIImage imageNamed:@"icon_right_gray"];
        _rightIocn.hidden = YES;
    }
    return _rightIocn;
}

@end

