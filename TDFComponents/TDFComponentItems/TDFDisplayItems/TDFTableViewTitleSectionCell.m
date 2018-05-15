//
//  TDFTableViewTitleSectionCell.m
//  TDFComponents
//
//  Created by tripleCC on 2017/12/12.
//
#import "UITableViewCell+SeperatorLine.h"
#import "TDFTableViewTitleSectionCell.h"
#import "TDFTableViewTitleSectionItem.h"
#import "Masonry.h"

@interface TDFTableViewTitleSectionCell ()
@property (strong, nonatomic) UIView *titleContainerView;
@property (strong, nonatomic) UILabel *titleLabel;
@end

@implementation TDFTableViewTitleSectionCell
- (void)cellDidLoad {
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.tdf_showBottomLine = YES;
    
    [self.contentView addSubview:self.titleContainerView];
    [self.titleContainerView addSubview:self.titleLabel];
    [self.contentView addSubview:self.titleContainerView];
    [self.titleContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.tdf_bottomLineView.mas_top);
        make.height.equalTo(@28);
    }];
    [self.tdf_bottomLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.right.bottom.equalTo(self.titleContainerView).offset(-10);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFTableViewTitleSectionItem *)item {
    return item.cellHeight;
}

- (void)configCellWithItem:(TDFTableViewTitleSectionItem *)item {
    if (item.type != TDFTableViewTitleSectionItemTypeNormal) {
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(item.isOld ? @10 : @15);
            make.bottom.equalTo(self.titleContainerView).offset(item.type == TDFTableViewTitleSectionItemTypeTopMarginAndGray ? -5 : -10);
        }];
    }
    self.titleLabel.text = item.title;
    self.titleContainerView.backgroundColor = item.titleBackgroundColor;
}

- (UIView *)titleContainerView {
    if (!_titleContainerView) {
        _titleContainerView = [UIView new];
    }
    
    return _titleContainerView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    
    return _titleLabel;
}
@end
