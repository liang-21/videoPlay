//
//  TDFBusinessPayDetailCell.m
//  Pods
//
//  Created by happyo on 2016/11/25.
//
//

#import "TDFBusinessPayDetailCell.h"
#import "TDFBusinessPayDetailItem.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "NSString+TDF_Empty.h"
#import "UIColor+Hex.h"

#import "NSString+TDF_Empty.h"

@interface TDFBusinessPayDetailCell ()

@property (nonatomic, strong) UILabel *lblOpenTime;

@property (nonatomic, strong) UILabel *lblNumber;

//@property (nonatomic, strong) UILabel *lblMember;

//@property (nonatomic, strong) UILabel *lblNotMember;

@property (nonatomic, strong) UILabel *lblNoCheckout;

@property (nonatomic, strong) UILabel *lblAcount;

@property (nonatomic, strong) UILabel *lblOutSide;

@property (nonatomic, strong) UIImageView *igvIcon;

@property (nonatomic, strong) UIView *rightView;

@property (nonatomic, strong) UIImageView *igvTypeOne;

@property (nonatomic, strong) UIImageView *igvTypeTwo;

@property (nonatomic, strong) UIImageView *igvTypeThree;

@end

@implementation TDFBusinessPayDetailCell

#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
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
    
    CGFloat labelHeight = 12;
    self.lblOpenTime = [self getCommonLabelInstance];
    [self addSubview:self.lblOpenTime];
    [self.lblOpenTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).with.offset(10);
        make.centerY.equalTo(self);
        make.width.equalTo(@(46));
        make.height.equalTo(@(labelHeight));
    }];
    
    self.lblNumber = [self getCommonLabelInstance];
    [self addSubview:self.lblNumber];
    [self.lblNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.lblOpenTime.mas_trailing).with.offset(10);
        make.centerY.equalTo(self);
//        make.width.equalTo(@(58));
        make.height.equalTo(@(labelHeight));
    }];
    
    [self addSubview:self.lblOutSide];
    [self.lblOutSide mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.lblNumber.mas_trailing).with.offset(10);
        make.centerY.equalTo(self);
        make.width.equalTo(@(28));
        make.height.equalTo(@(labelHeight));
    }];
    
    self.lblOutSide.layer.cornerRadius = 4;
    self.lblOutSide.layer.masksToBounds = YES;
    
//    self.lblMember = [self getCommonLabelInstance];
//    [self addSubview:self.lblMember];
//    [self.lblMember mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(self.lblNumber.mas_trailing).with.offset(10);
//        make.centerY.equalTo(self);
//        make.width.equalTo(@(100));
//        make.height.equalTo(@(labelHeight));
//    }];
//    
//    [self addSubview:self.lblNotMember];
//    [self.lblNotMember mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.lblMember);
//    }];
    
    [self addSubview:self.rightView];
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self).with.offset(-25);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.width.equalTo(@(100));
    }];

    self.lblAcount = [self getCommonLabelInstance];
    self.lblAcount.textAlignment = NSTextAlignmentRight;
    [self.rightView addSubview:self.lblAcount];
    [self.lblAcount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.rightView);
        make.centerY.equalTo(self.rightView);
        make.width.equalTo(@(100));
        make.height.equalTo(@(labelHeight));
    }];
    
    [self.rightView addSubview:self.igvTypeOne];
    [self.igvTypeOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.lblAcount.mas_leading).with.offset(-8);
        make.centerY.equalTo(self.rightView);
        make.width.equalTo(@(20));
        make.height.equalTo(@(20));
    }];
    
    [self.rightView addSubview:self.igvTypeTwo];
    [self.igvTypeTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.igvTypeOne.mas_leading).with.offset(-5);
        make.centerY.equalTo(self.rightView);
        make.width.equalTo(@(20));
        make.height.equalTo(@(20));
    }];
    
    [self.rightView addSubview:self.igvTypeThree];
    [self.igvTypeThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.igvTypeTwo.mas_leading).with.offset(-5);
        make.centerY.equalTo(self.rightView);
        make.width.equalTo(@(20));
        make.height.equalTo(@(20));
    }];
    
    [self addSubview:self.lblNoCheckout];
    [self.lblNoCheckout mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.trailing.equalTo(self).with.offset(-25);
        make.width.equalTo(@(40));
        make.height.equalTo(@(labelHeight));
    }];
    
    [self addSubview:self.igvIcon];
    [self.igvIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self).with.offset(-6);
        make.centerY.equalTo(self);
        make.width.equalTo(@(8));
        make.height.equalTo(@(13));
    }];
}


+ (CGFloat)heightForCellWithItem:(TDFBusinessPayDetailItem *)item
{
    return 45;
}

- (void)configCellWithItem:(TDFBusinessPayDetailItem *)item
{
//    self.model = item;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMMddHHmmss";
    NSDate *date = [dateFormatter dateFromString:item.openDate];
    
    dateFormatter.dateFormat = @"HH:mm";
    self.lblOpenTime.text = [dateFormatter stringFromDate:date];
    self.lblNumber.text = [item.tabelNum isNotEmpty] ? item.tabelNum : item.orderCode;
    
//    if (item.memberName && ![item.memberName isEqualToString:@""]) {
//        self.lblMember.hidden = NO;
//        self.lblNotMember.hidden = YES;
//        self.lblMember.text = item.memberName;
//    } else {
//        self.lblMember.hidden = YES;
//        self.lblNotMember.hidden = NO;
//    }
    
    if ([item.orderStatus isEqualToString:@"4"]) { // 如果已结账
        self.rightView.hidden = NO;
        self.lblNoCheckout.hidden = YES;
        
        self.lblAcount.text = item.formatAccount;
        [self.lblAcount sizeToFit];
        [self.lblAcount mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(self.lblAcount.frame.size.width));
        }];
        
        [self configurePayTypeWithImageList:item.payTypeImageList];
    } else {
        self.rightView.hidden = YES;
        self.lblNoCheckout.hidden = NO;
    }
    
    if (item.orderFrom >= 100) {
        self.lblOutSide.hidden = NO;
    }else {
        self.lblOutSide.hidden = YES;
    }
}

- (void)configurePayTypeWithImageList:(NSArray *)payTypeImageList
{
    self.igvTypeOne.hidden = YES;
    self.igvTypeTwo.hidden = YES;
    self.igvTypeThree.hidden = YES;
    NSInteger count = payTypeImageList.count; // 为了按顺序显示
    if (count == 1) {
        [self.igvTypeOne sd_setImageWithURL:[NSURL URLWithString:payTypeImageList[0]]];
        self.igvTypeOne.hidden = NO;
    } else if (count == 2) {
        [self.igvTypeOne sd_setImageWithURL:[NSURL URLWithString:payTypeImageList[1]]];
        [self.igvTypeTwo sd_setImageWithURL:[NSURL URLWithString:payTypeImageList[0]]];
        self.igvTypeOne.hidden = NO;
        self.igvTypeTwo.hidden = NO;
    } else if (count == 3) {
        [self.igvTypeOne sd_setImageWithURL:[NSURL URLWithString:payTypeImageList[2]]];
        [self.igvTypeTwo sd_setImageWithURL:[NSURL URLWithString:payTypeImageList[1]]];
        [self.igvTypeThree sd_setImageWithURL:[NSURL URLWithString:payTypeImageList[0]]];
        self.igvTypeOne.hidden = NO;
        self.igvTypeTwo.hidden = NO;
        self.igvTypeThree.hidden = NO;
    }
}

#pragma mark -- Setters && Getters --

- (UILabel *)getCommonLabelInstance
{
    UILabel *commonLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    commonLabel.font = [UIFont systemFontOfSize:12];
    commonLabel.textColor = [UIColor colorWithRed:51.0/255 green:51.0/255 blue:51.0/255 alpha:1];
    
    return commonLabel;
}

//- (UILabel *)lblNotMember
//{
//    if (!_lblNotMember) {
//        _lblNotMember = [[UILabel alloc] initWithFrame:CGRectZero];
////        _lblNotMember.textColor = [UIColor colorWithRed:153/255 green:153/255 blue:153/255 alpha:1];
//        _lblNotMember.textColor = [UIColor redColor];
//        _lblNotMember.text = @"非会员";
//        _lblNotMember.font = [UIFont systemFontOfSize:12];
//    }
//    
//    return _lblNotMember;
//}

- (UILabel *)lblNoCheckout
{
    if (!_lblNoCheckout) {
        _lblNoCheckout = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblNoCheckout.font = [UIFont systemFontOfSize:12];
        _lblNoCheckout.textColor = [UIColor redColor];
        _lblNoCheckout.text = NSLocalizedString(@"未结账", nil);
        _lblNoCheckout.textAlignment = NSTextAlignmentRight;
    }
    
    return _lblNoCheckout;
}

- (UIImageView *)igvIcon
{
    if (!_igvIcon) {
        _igvIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
        _igvIcon.image = [UIImage imageNamed:@"business_flow_cell_icon_right" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    
    return _igvIcon;
}

- (UIView *)rightView
{
    if (!_rightView) {
        _rightView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    
    return _rightView;
}

- (UIImageView *)igvTypeOne
{
    if (!_igvTypeOne) {
        _igvTypeOne = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    
    return _igvTypeOne;
}

- (UIImageView *)igvTypeTwo
{
    if (!_igvTypeTwo) {
        _igvTypeTwo = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    
    return _igvTypeTwo;
}

- (UIImageView *)igvTypeThree
{
    if (!_igvTypeThree) {
        _igvTypeThree = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    
    return _igvTypeThree;
}

- (UILabel *)lblOutSide
{
    if (!_lblOutSide) {
        _lblOutSide = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblOutSide.backgroundColor = [UIColor colorWithRed:0.00 green:0.53 blue:0.80 alpha:1.00];
        _lblOutSide.font = [UIFont systemFontOfSize:12];
        _lblOutSide.textColor = [UIColor whiteColor];
        _lblOutSide.textAlignment = NSTextAlignmentCenter;
        _lblOutSide.text = @"外卖";
        _lblOutSide.hidden = YES;
    }
    
    return _lblOutSide;
}

@end
