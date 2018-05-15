//
//  TDFEleInvUnusualCell.m
//  Pods
//
//  Created by Arlen on 2017/6/19.
//
//

#import "TDFEleInvUnusualCell.h"
#import "TDFEleInvUnusualItem.h"
#import "Masonry.h"
#import "UIColor+Hex.h"

@interface TDFEleInvUnusualCell ()

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *lblTitle;
@property (nonatomic, strong) UILabel *lblSubTitle;
@property (nonatomic, strong) UIButton *buyButton;
@property (nonatomic, strong) UIImageView *nextSetupIcon;
@property (nonatomic, strong) TDFEleInvUnusualItem *item;

@end


@implementation TDFEleInvUnusualCell


- (void)cellDidLoad {
    
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle =   UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.icon];            //icon
    [self.contentView addSubview:self.lblTitle];        //标题
    [self.contentView addSubview:self.lblSubTitle];     //副标题
    [self.contentView addSubview:self.buyButton];       //购买
    [self.contentView addSubview:self.nextSetupIcon];   //按钮右侧
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.height.equalTo(@1);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
}


//根据失败原因获取高度
+ (float)getHeihghtByItem:(TDFEleInvUnusualItem *)item {
    float width = [UIApplication sharedApplication].keyWindow.frame.size.width;
    CGSize size = CGSizeMake(width - 40, 1000);
    NSDictionary *att = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
    CGRect rect = [item.errryMessage boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:att context:nil];
    return rect.size.height + 145;
}


+ (CGFloat)heightForCellWithItem:(TDFEleInvUnusualItem *)item
{
    if (item.unusualType == TDFEleInvUnusualTypeNone) return 0;
    
    float failedHeight = [self getHeihghtByItem:item];      //失败情况下，需要根据失败的原因自动设置高度
    
    float height[6] = {0,174,174,192,150,failedHeight};      //根据枚举值进行排序。每个状态对应的高度
    return height[item.unusualType];
}

- (void)configCellWithItem:(TDFEleInvUnusualItem *)item
{
    self.contentView.hidden = item.unusualType == TDFEleInvUnusualTypeNone ? YES : NO;
    if (item.unusualType == TDFEleInvUnusualTypeNone) return;
    
    self.item  = item;
    [self setTextByUnusualType:item.unusualType];       //根据类型设置对应的文本设置对应的文本
    [self setTextColorByUnusualType:item.unusualType];  //根据类型设置字体颜色
    [self setIconByUnusualType:item.unusualType];       //根据类型设置icon
}


- (void)setTextByUnusualType:(TDFEleInvUnusualType)unusualType {
    if (unusualType == TDFEleInvUnusualTypeNone) {
        return;
    }
    NSString *titleText     = nil;
    NSString *subTitleText  = nil;
    NSString *buttonTitle   = nil;
    switch (unusualType) {
        case TDFEleInvUnusualTypeExpired:
        {
            titleText       = @"当前套餐已过期";
            subTitleText    = @"电子发票功能已关闭。购买新套餐后电子发票功能将会自动开启。";
            buttonTitle     =   @"立即购买新套餐";
            self.buyButton.hidden = NO;
            self.nextSetupIcon.hidden   =   NO;
        }
            break;
        case TDFEleInvUnusualTypeReconsideration:
        {
            titleText       =   @"企业税务信息重新审核中";
            subTitleText    =   [NSString stringWithFormat:@"提交时间：%@ (2个工作日内完成审核)。审核期间电子发票功能自动关闭，审核通过后将自动开启。",self.item.submitTime];
            buttonTitle     =   @"查看我的企业税务信息";
            self.buyButton.hidden = NO;
            self.nextSetupIcon.hidden   =   NO;
        }
            break;
            
        case TDFEleInvUnusualTypeNoneMargin:
        {
            titleText       =   @"当前可用余量为0";
            subTitleText    =   @"电子发票功能已关闭。购买加餐包后电子发票功能将会自动开启";
            buttonTitle     =   @"立即购买加餐包";
            self.buyButton.hidden = NO;
            self.nextSetupIcon.hidden   =   NO;
        }
            break;
            
        case TDFEleInvUnusualTypeManuallyClosed:
        {
            titleText       = @"已关闭电子发票功能";
            subTitleText    = [NSString stringWithFormat:@"关闭时间：%@ \n 可通过打开 “开通电子发票功能”开关再次开启",self.item.manualClosedTime];
            self.buyButton.hidden = YES;
            self.nextSetupIcon.hidden   =   YES;
        }
            break;
        case TDFEleInvUnusualTypeAuditfailure:
        {
            titleText       = @"企业税务信息审核失败";
            subTitleText    = [NSString stringWithFormat:@"失败原因：%@",self.item.errryMessage];
            buttonTitle     =   @"修改我的企业税务信息";
            self.buyButton.hidden       = NO;
            self.nextSetupIcon.hidden   =   NO;
        }
            break;

        
        default:
            break;
    }
    self.lblTitle.text      =   titleText;
    self.lblSubTitle.text   =   subTitleText;
    [self.buyButton setTitle:buttonTitle forState:0];

}

//设置文本颜色
- (void)setTextColorByUnusualType:(TDFEleInvUnusualType)unusualType {
    if (unusualType == TDFEleInvUnusualTypeNone) {
        return;
    }
    //重新审核的字体颜色
    if (unusualType == TDFEleInvUnusualTypeReconsideration) {
        self.lblTitle.textColor     = [UIColor colorWithHexString:@"F6A623"];
        self.lblSubTitle.textColor  = [UIColor colorWithHexString:@"F6A623"];
    }
    else    //其他的类型的字体颜色
    {
        self.lblTitle.textColor     =   [UIColor colorWithHexString:@"CC0000"];
        self.lblSubTitle.textColor  =   [UIColor colorWithHexString:@"CC0000"];
    }
}

//设置icon
- (void)setIconByUnusualType:(TDFEleInvUnusualType)unusualType {

    if (unusualType == TDFSeperationStyleNone) {
        return;
    }
    //根据枚举值设置对应的icon
    NSArray *imageNames = @[@"",@"bill_status_warn",@"bill_status_warn",@"bill_status_waiting",@"bill_status_warn",@"bill_status_warn"];
    self.icon.image = [UIImage imageNamed:imageNames[unusualType]];
}








#pragma mark --- 布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
    //icon
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_top).offset(20);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    //标题
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_top).offset(60);
        make.height.equalTo(@25);
    }];
    
    //副标题
    [self.lblSubTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lblTitle.mas_bottom).offset(15);
        make.left.equalTo(self.contentView.mas_left).offset(20);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
    }];
    
    //购买按钮
    [self.buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX).offset(7.5);
        make.height.equalTo(@13);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    //向右箭头
    [self.nextSetupIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buyButton.mas_right).offset(5);
        make.centerY.equalTo(self.buyButton);
        make.size.mas_equalTo(CGSizeMake(6, 10));
    }];
}


- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
    }
    return _icon;
}

- (UILabel *)lblTitle {
    if (!_lblTitle) {
        _lblTitle = [[UILabel alloc] init];
        _lblTitle.text = @"当前可用余量为0";
        _lblTitle.font = [UIFont systemFontOfSize:20];
        _lblTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _lblTitle;
}

- (UILabel *)lblSubTitle {
    if (!_lblSubTitle) {
        _lblSubTitle = [[UILabel alloc] init];
        _lblSubTitle.text           = @"";
        _lblSubTitle.textAlignment  =   NSTextAlignmentCenter;
        _lblSubTitle.font           = [UIFont systemFontOfSize:14];
        _lblSubTitle.numberOfLines  = 0;
        _lblSubTitle.lineBreakMode  =   NSLineBreakByCharWrapping;
    }
    return _lblSubTitle;
}

- (UIButton *)buyButton {
    if (!_buyButton) {
        _buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buyButton setTitle:@"立即购买加餐包" forState:0];
        [_buyButton setTitleColor:[UIColor colorWithHexString:@"#0088CC"] forState:0];
        _buyButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_buyButton addTarget:self action:@selector(clickBuyButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buyButton;
}

- (UIImageView *)nextSetupIcon {
    if (!_nextSetupIcon) {
        _nextSetupIcon = [[UIImageView alloc] init];
        _nextSetupIcon.image = [UIImage imageNamed:@"display_view_header_blue_arrow" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    return _nextSetupIcon;
}

- (void)clickBuyButton {
    if (self.item.clickBack) {
        self.item.clickBack(self.item.unusualType);
    }
}

@end






