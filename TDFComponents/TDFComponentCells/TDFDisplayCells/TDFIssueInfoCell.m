//
//  TDFIssueInfoCell.m
//  Pods
//
//  Created by chaiweiwei on 2017/4/27.
//
//

#import "TDFIssueInfoCell.h"
#import "TDFIssueInfoItem.h"
#import "Masonry.h"
#import "TDFShapeButton.h"

@interface TDFIssueInfoCell()

@property (nonatomic,strong) UIImageView *topIcon;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UILabel *contentLabel;

@property (nonatomic,strong) TDFIssueInfoItem *model;

@end

@implementation TDFIssueInfoCell

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
    
    [self addSubview:self.topIcon];
    [self.topIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.top.equalTo(self.mas_top).with.offset(10);
        make.width.and.height.mas_equalTo(20);
    }];
    
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.topIcon.mas_right).with.offset(10);
        make.top.equalTo(self.mas_top).with.offset(10);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(20);
    }];
    
    [self addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(8);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.bottom.equalTo(self.mas_bottom).with.offset(-28);
    }];
    
    TDFShapeButton *btn = [[TDFShapeButton alloc] init];
    btn.shapeType = TDFButtonShapeTypeHorizontal;
    btn.userInteractionEnabled = NO;
    btn.space = 3;
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn setTitleColor:RGBA(0, 136, 204, 1) forState:UIControlStateNormal];
    [btn setTitle:NSLocalizedString(@"查看详情",nil) forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"display_view_header_blue_arrow" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
    [self addSubview:btn];
    
    CGSize titleSize = [btn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:btn.titleLabel.font}];
    CGFloat width = titleSize.width+10;
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(28);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.width.mas_offset(width);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFIssueInfoItem *)item
{
    NSMutableAttributedString *attributedString =  [[NSMutableAttributedString alloc] initWithString:item.content];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,item.content.length)];

    CGSize size = [item.content boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    return 64 + size.height;
}

- (void)configCellWithItem:(TDFIssueInfoItem *)item
{
    self.model = item;
    
    switch (item.infoType) {
        case TDFIssueInfoTypCustom:{
            self.topIcon.image = [UIImage imageNamed:item.topIconName];
        }
            break;
        case TDFIssueInfoTypProcess:
        case TDFIssueInfoTypeWaiting:{
            self.topIcon.image = [UIImage imageNamed:@"icon_waiting" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
        }
            break;
        case TDFIssueInfoTypeSuccess:{
            self.topIcon.image = [UIImage imageNamed:@"icon_success" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
        }
            break;
        case TDFIssueInfoTypeFail:{
            self.topIcon.image = [UIImage imageNamed:@"icon_fail" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
        }
            break;
    }
    
    self.titleLabel.text = item.title;
    
    NSMutableAttributedString *attributedString =  [[NSMutableAttributedString alloc] initWithString:item.content];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, item.content.length)];
    [self.contentLabel setAttributedText:attributedString];
}

#pragma mark - Get Set 

- (UIImageView *)topIcon {
    if(!_topIcon) {
        _topIcon = [[UIImageView alloc] init];
    }
    return _topIcon;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textColor = RGBA(51, 51, 51, 1);
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if(!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:11];
        _contentLabel.textColor = RGBA(51, 51, 51, 1);
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

@end
