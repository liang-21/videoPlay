//
//  TDFMemberLevelNomalCell.m
//  Pods
//
//  Created by wuwangwo on 2017/8/17.
//
//

#import "TDFMemberLevelNomalCell.h"
#import "TDFMemberLevelNomalItem.h"
#import "Masonry.h"

@interface TDFMemberLevelNomalCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) TDFMemberLevelNomalItem *item;
@end

@implementation TDFMemberLevelNomalCell

-(void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    UIView *view =[[UIView alloc] init];
    view.backgroundColor =[UIColor whiteColor];
    view.alpha =0.6;
    [self addSubview:view];
    [self addSubview:self.titleLabel];
    [self addSubview:self.descLabel];
    [self addSubview:self.iconImageView];
    [self addSubview:self.lineView];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.width.mas_equalTo(47);
        make.height.mas_equalTo(54);
        make.top.equalTo(self.mas_top).with.offset(15);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(10);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(20);
        make.top.equalTo(self.mas_top).with.offset(15);
    }];
    
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.bottom.equalTo(self.mas_bottom).with.offset(-10);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.height.mas_equalTo(1/[UIScreen mainScreen].scale);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

+(CGFloat)heightForCellWithItem:(TDFMemberLevelNomalItem *)item
{
    NSString *text = item.subtitle;
    CGSize size = [text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-82, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
    size.height += 46;
    if(size.height < 84) {
        size.height = 84;
    }
    return ceil(size.height);
}

-(void)configCellWithItem:(TDFMemberLevelNomalItem *)item
{
    self.titleLabel.text = item.title;
    self.descLabel.text = item.desc;
    self.iconImageView.image = [UIImage imageNamed:item.iconImage];
}

- (UIImageView *)iconImageView {
    if(!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}

-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1];
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (UILabel *)descLabel {
    if(!_descLabel) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.font = [UIFont systemFontOfSize:13];
        _descLabel.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1];
        _descLabel.numberOfLines = 0;
    }
    return _descLabel;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1];
    }
    return _lineView;
}

@end
