//
//  TDFShowSimpleCell.m
//  RestApp
//
//  Created by chaiweiwei on 2016/11/7.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import "TDFShowSimpleCell.h"
#import "TDFShowSimpleItem.h"
#import "Masonry.h"

@interface TDFShowSimpleCell()

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UILabel *rightLabel;

@property (nonatomic,strong) UIImageView *rightIcon;

@property (nonatomic,strong) TDFShowSimpleItem *model;

@end

@implementation TDFShowSimpleCell

- (void)cellDidLoad {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor =[UIColor whiteColor];
    view.alpha =0.6;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top).with.offset(1);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right);
    }];

    [self addSubview:self.rightIcon];
    [self.rightIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
        make.centerY.equalTo(self.mas_centerY);
        make.height.and.width.mas_equalTo(22);
    }];
    
    [self addSubview:self.rightLabel];
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.rightIcon.mas_left);
    }];
    
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.rightLabel.mas_left);
    }];
    
}

- (UIImageView *)rightIcon {
    if(!_rightIcon) {
        _rightIcon = [[UIImageView alloc] init];
        _rightIcon.image = [UIImage imageNamed:@"ico_next" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    return _rightIcon;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor =[UIColor clearColor];
        _titleLabel.textColor =[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
        _titleLabel.font =[UIFont systemFontOfSize:15];
        _titleLabel.numberOfLines=1;
        _titleLabel.textAlignment =NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UILabel *)rightLabel {
    if(!_rightLabel) {
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.backgroundColor =[UIColor clearColor];
        _rightLabel.font =[UIFont systemFontOfSize:11];
        _rightLabel.numberOfLines=1;
        _rightLabel.textAlignment =NSTextAlignmentRight;
    }
    return _rightLabel;
}

+ (CGFloat)heightForCellWithItem:(TDFShowSimpleItem *)item
{
    return 44;
}

- (void)configCellWithItem:(TDFShowSimpleItem *)item
{
    self.model = item;
    
    self.titleLabel.text = item.title;
    self.rightLabel.text = item.rightText;
    
    self.rightLabel.textColor = item.rightTextColor;
}
@end
