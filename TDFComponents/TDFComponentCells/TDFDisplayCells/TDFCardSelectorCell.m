//
//  TDFCardSelectorCell.m
//  RestApp
//
//  Created by tripleCC on 2017/5/15.
//  Copyright © 2017年 杭州迪火科技有限公司. All rights reserved.
//
#import <Masonry/Masonry.h>
#import <TDFCategories/TDFCategories.h>
#import "UITableViewCell+SeperatorLine.h"
#import "TDFCardSelectorItemProtocol.h"
#import "TDFCardSelectorCell.h"

@interface TDFCardSelectorCell()
@property (strong, nonatomic) UILabel *contentTitleLabel;
@property (strong, nonatomic) UIButton *selectButton;
@end

@implementation TDFCardSelectorCell

- (void)cellDidLoad {
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.tdf_showBottomMargin = YES;
    [self.contentView addSubview:self.selectButton];
    [self.contentView addSubview:self.contentTitleLabel];
    [self layoutPageSubviews];
}

- (void)layoutPageSubviews {
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.centerY.equalTo(self.contentView);
        make.height.width.equalTo(@22);
    }];
    [self.contentTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.selectButton.mas_right).offset(10);
        make.centerY.equalTo(self.contentView);
        make.right.lessThanOrEqualTo(self.contentView).offset(10);
    }];
}

- (void)configCellWithItem:(DHTTableViewItem <TDFCardSelectorItemProtocol> *)item {
    self.selectButton.selected = item.selected;
    self.contentTitleLabel.text = item.displayedTitle;
}

+ (CGFloat)heightForCellWithItem:(DHTTableViewItem *)item {
    return 65;
}

- (UILabel *)contentTitleLabel {
    if (_contentTitleLabel == nil) {
        _contentTitleLabel = [[UILabel alloc] init];
        _contentTitleLabel.font = [UIFont systemFontOfSize:15];
        _contentTitleLabel.textColor = [UIColor tdf_colorWithRGB:0x333333];
    }
    
    return _contentTitleLabel;
}


- (UIButton *)selectButton {
    if (_selectButton == nil) {
        _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectButton.userInteractionEnabled = NO;
        _selectButton.adjustsImageWhenHighlighted = NO;
        [_selectButton setImage:[UIImage imageNamed:@"ico_check" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateSelected];
        [_selectButton setImage:[UIImage imageNamed:@"ico_uncheck" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
    }
    
    return _selectButton;
}
@end
