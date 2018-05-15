//
//  TDFOfficialAccountsListCell.m
//  Pods
//
//  Created by happyo on 2017/2/13.
//
//

#import "TDFOfficialAccountsListCell.h"
#import "TDFOfficialAccountsListItem.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "NSString+TDF_Empty.h"

@interface TDFOfficialAccountsListCell ()

@property (nonatomic, strong) UIImageView *igvIcon;

@property (nonatomic, strong) UILabel *lblTitle;

@property (nonatomic, strong) UILabel *lblDetail;

@property (nonatomic, strong) UIImageView *igvArrow;

@end
@implementation TDFOfficialAccountsListCell

#pragma mark -- DHTTableViewCellDelegate --
- (void)cellDidLoad
{
    self.backgroundColor = [UIColor clearColor];
    
    UIView *alphaView = [[UIView alloc] initWithFrame:CGRectZero];
    alphaView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    
    [self addSubview:alphaView];
    [alphaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.bottom.equalTo(self).with.offset(-1);
    }];
    
    [self addSubview:self.igvIcon];
    [self.igvIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).with.offset(15);
        make.centerY.equalTo(self);
        make.height.equalTo(@(60));
        make.width.equalTo(@(60));
    }];
    
    [self addSubview:self.lblDetail];
    [self.lblDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self).with.offset(-28);
        make.height.equalTo(@(11));
        make.centerY.equalTo(self);
        make.width.equalTo(@100);
    }];
    
    [self addSubview:self.lblTitle];
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.igvIcon.mas_trailing).with.offset(15);
        make.centerY.equalTo(self);
        make.height.equalTo(@(18));
        make.trailing.equalTo(self.lblDetail.mas_leading);
    }];
    
    [self addSubview:self.igvArrow];
    [self.igvArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self).with.offset(-10);
        make.centerY.equalTo(self);
        make.height.equalTo(@(15));
        make.width.equalTo(@(15));
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFOfficialAccountsListItem *)item
{
    return 88;
}

- (void)configCellWithItem:(TDFOfficialAccountsListItem *)item
{
    if ([item.imageUrlStr isNotEmpty]) {
        if ([item.imageUrlStr hasPrefix:@"http"] || [item.imageUrlStr hasPrefix:@"https"] || [item.imageUrlStr containsString:@"://"] ) {
            [self.igvIcon sd_setImageWithURL:[NSURL URLWithString:item.imageUrlStr]];
        }else {
            self.igvIcon.image = [UIImage imageNamed:item.imageUrlStr];
        }
    } else {
        self.igvIcon.image = [UIImage imageNamed:@"img_nopic_user" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    self.lblTitle.text = item.title;
    self.lblDetail.text = item.detail;
    
    [self.lblDetail sizeToFit];
    CGFloat width = self.lblDetail.frame.size.width;
    [self.lblDetail mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width));
    }];
}

#pragma mark -- Getters && Setters --

- (UIImageView *)igvIcon
{
    if (!_igvIcon) {
        _igvIcon = [[UIImageView alloc] init];
        _igvIcon.layer.cornerRadius = 30;
        _igvIcon.layer.masksToBounds = YES;
    }
    
    return _igvIcon;
}

- (UILabel *)lblTitle
{
    if (!_lblTitle) {
        _lblTitle = [[UILabel alloc] init];
        _lblTitle.font = [UIFont systemFontOfSize:18];
        _lblTitle.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    }
    
    return _lblTitle;
}

- (UILabel *)lblDetail
{
    if (!_lblDetail) {
        _lblDetail = [[UILabel alloc] init];
        _lblDetail.font = [UIFont systemFontOfSize:11];
        _lblDetail.textColor = [UIColor colorWithRed:0/255.0 green:136/255.0 blue:204/255.0 alpha:1];
        _lblDetail.textAlignment = NSTextAlignmentRight;
    }
    
    return _lblDetail;
}

- (UIImageView *)igvArrow
{
    if (!_igvArrow) {
        _igvArrow = [[UIImageView alloc] init];
        _igvArrow.image = [UIImage imageNamed:@"edit_cell_arrow_right" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    
    return _igvArrow;
}


@end

