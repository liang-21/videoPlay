//
//  TDFTableWithTwoBtnWithTitleCell.m
//  TDFComponents
//
//  Created by 刘红琳 on 2017/11/14.
//

#import "TDFTableWithTwoBtnWithTitleCell.h"
#import "TDFTableWithTwoBtnWithTitleItem.h"
#import "UIColor+Hex.h"
#import "Masonry.h"

@interface TDFTableWithTwoBtnWithTitleCell()
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *subTitleLabel;
@property (strong, nonatomic) UIButton *rightBtn;
@property (strong, nonatomic) UIButton *nextRightBtn;
@property (strong, nonatomic) TDFTableWithTwoBtnWithTitleItem *model;
@end

@implementation TDFTableWithTwoBtnWithTitleCell

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    
    [self addSubview:self.nextRightBtn];
    [self addSubview:self.rightBtn];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        make.top.equalTo(self).with.offset(12);
        make.right.equalTo(self.rightBtn.mas_left).offset(-10);
    }];
    
    [self addSubview:self.subTitleLabel];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        make.right.equalTo(self.titleLabel);
        make.bottom.equalTo(self).with.offset(-12);
    }];
    
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
}

+ (CGFloat)heightForCellWithItem:(TDFTableWithTwoBtnWithTitleItem *)item {
    return 64;
}

- (void)configCellWithItem:(TDFTableWithTwoBtnWithTitleItem *)item {
    self.model = item;
    self.titleLabel.text = item.title;
    self.subTitleLabel.text = item.subTitle;
    [self.rightBtn setTitle:item.rightText forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:item.rightTextColor forState:UIControlStateNormal];
    [self.nextRightBtn setTitle:item.nextRightText forState:UIControlStateNormal];
    [self.nextRightBtn setTitleColor:item.nextRightTextColor forState:UIControlStateNormal];
    [self updateBtnSizeWithTitle];
}

- (void) updateBtnSizeWithTitle
{
    CGSize nextRightSize = [self.model.nextRightText boundingRectWithSize:CGSizeMake(MAXFLOAT,18) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Arial" size:13] } context:nil].size;
    [self.nextRightBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).with.offset(-15);
        make.height.equalTo(@(18));
        make.width.equalTo(@(nextRightSize.width+5));
        
    }];
    CGSize rightBtnSize = [self.model.rightText boundingRectWithSize:CGSizeMake(MAXFLOAT,18) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Arial" size:13] } context:nil].size;
    
    [self.rightBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.nextRightBtn.mas_left).with.offset(-20);
        make.height.equalTo(@(18));
        make.width.equalTo(@(rightBtnSize.width +5));
    }];
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
        _subTitleLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        _subTitleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _subTitleLabel;
}

- (UIButton *)rightBtn
{
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [_rightBtn addTarget:self action:@selector(rightBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _rightBtn;
}

- (UIButton *)nextRightBtn
{
    if (!_nextRightBtn) {
        _nextRightBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [_nextRightBtn addTarget:self action:@selector(nextRightBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        _nextRightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _nextRightBtn;
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

@end
