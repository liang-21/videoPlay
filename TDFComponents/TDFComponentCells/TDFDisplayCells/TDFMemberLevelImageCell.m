//
//  TDFMemberLevelImageCell.m
//  Pods
//
//  Created by wuwangwo on 2017/8/17.
//
//

#import "TDFMemberLevelImageCell.h"
#import "TDFMemberLevelImageItem.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface TDFMemberLevelImageCell ()
@property (nonatomic,strong) UIImageView *cardImageView;
@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UILabel *leftTagLabel;
@property (nonatomic,strong) UILabel *topTitleLabel;
@property (nonatomic,strong) UILabel *bottomTitleLabel;

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) TDFMemberLevelImageItem *item;
@end

@implementation TDFMemberLevelImageCell

-(void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    UIView *view =[[UIView alloc] init];
    view.backgroundColor =[UIColor whiteColor];
    view.alpha =0.6;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.width.mas_equalTo(47);
        make.height.mas_equalTo(54);
        make.top.equalTo(self.mas_top).with.offset(15);
    }];
    
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.height.mas_equalTo(54);
        make.top.equalTo(self.mas_top).with.offset(15);
    }];
    
    [self addSubview:self.cardImageView];
    [self.cardImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.height.mas_equalTo((SCREEN_WIDTH-20)*229.0f/355.0f);
        make.top.equalTo(self.iconImageView.mas_bottom).with.offset(15);
    }];
    
    [self.cardImageView addSubview:self.leftTagLabel];
    [self.leftTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cardImageView.mas_top).with.offset(15);
        make.left.equalTo(self.cardImageView.mas_left).with.offset(15);
        make.right.equalTo(self.cardImageView.mas_right).with.offset(-15);
        make.height.equalTo(@60);
    }];
    
    [self.cardImageView addSubview:self.topTitleLabel];
    [self.topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.cardImageView.mas_centerX);
        make.centerY.equalTo(self.cardImageView.mas_centerY).with.offset(-10);
        make.width.equalTo(self.cardImageView.mas_width);
        make.height.mas_equalTo(((SCREEN_WIDTH-20)*229.0f/355.0f)/4);
    }];
    
    [self.cardImageView addSubview:self.bottomTitleLabel];
    [self.bottomTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topTitleLabel.mas_bottom);
        make.centerX.equalTo(self.cardImageView.mas_centerX);
        make.width.equalTo(self.cardImageView.mas_width);
        make.height.equalTo(@60);
    }];
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.height.mas_equalTo(1/[UIScreen mainScreen].scale);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

+(CGFloat)heightForCellWithItem:(TDFMemberLevelImageItem *)item
{
    CGFloat height = 94+(SCREEN_WIDTH-20)*229.0f/355.0f;
    return ceil(height);
}

-(void)configCellWithItem:(TDFMemberLevelImageItem *)item
{
    int r=255;
    int g=255;
    int b=255;
    if (item.fontColor.length > 0) {
        NSArray* colors=[item.fontColor componentsSeparatedByString:@","];
        r=((NSString*)[colors objectAtIndex:1]).intValue;
        g=((NSString*)[colors objectAtIndex:2]).intValue;
        b=((NSString*)[colors objectAtIndex:3]).intValue;
    }
    [self.leftTagLabel setTextColor:[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]];
    [self.topTitleLabel setTextColor:[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]];
    [self.bottomTitleLabel setTextColor:[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]];
    
    self.titleLabel.text = item.title;
    self.iconImageView.image = [UIImage imageNamed:item.iconImage];
    self.leftTagLabel.text = item.leftTag;
    self.topTitleLabel.text = item.topTitle;
    self.bottomTitleLabel.text = item.bottomTitle;
    [self.cardImageView sd_setImageWithURL:[NSURL URLWithString:item.bgImageNamePath] placeholderImage:[UIImage imageNamed:item.bgDefultImageName]];
    
    [self layoutIfNeeded];
}

- (UIView *)lineView {
    if(!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1];
    }
    return _lineView;
}

- (UIImageView *)iconImageView {
    if(!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}

- (UIImageView *)cardImageView {
    if(!_cardImageView) {
        _cardImageView = [[UIImageView alloc] init];
        _cardImageView.image = [UIImage imageNamed:@"icon_member_card" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
        _cardImageView.layer.masksToBounds = YES;
        _cardImageView.layer.cornerRadius = 5;
    }
    return _cardImageView;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1];
    }
    return _titleLabel;
}

- (UILabel *)leftTagLabel {
    if(!_leftTagLabel) {
        _leftTagLabel = [[UILabel alloc] init];
        _leftTagLabel.font = [UIFont systemFontOfSize:18];
        _leftTagLabel.textColor = [UIColor whiteColor];
        _leftTagLabel.numberOfLines = 1;
    }
    return _leftTagLabel;
}

- (UILabel *)topTitleLabel {
    if(!_topTitleLabel) {
        _topTitleLabel = [[UILabel alloc] init];
        _topTitleLabel.font = [UIFont boldSystemFontOfSize:48];
        _topTitleLabel.textColor = [UIColor whiteColor];
        _topTitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _topTitleLabel;
}

- (UILabel *)bottomTitleLabel {
    if(!_bottomTitleLabel) {
        _bottomTitleLabel = [[UILabel alloc] init];
        _bottomTitleLabel.font = [UIFont systemFontOfSize:18];
        _bottomTitleLabel.textColor = [UIColor colorWithRed:1 green:0.8 blue:0.1 alpha:1];
        _bottomTitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _bottomTitleLabel;
}

@end
