//
//  TDFMineEleInvoiceCell.m
//  Pods
//
//  Created by Arlen on 2017/6/17.
//
//

#import "TDFMineEleInvoiceCell.h"
#import "TDFMineEleInvoiceItem.h"
#import "Masonry.h"
#import "UIColor+Hex.h"

@interface TDFMineEleInvoiceCell ()

@property (nonatomic, strong) TDFMineEleInvoiceItem *item;

@property (nonatomic, strong) UIImageView *backgroundImageView; //背景图片

@property (nonatomic, strong) UILabel *titleLabel;          //标题
@property (nonatomic, strong) UILabel *validTitleLabel;     //有效期至
@property (nonatomic, strong) UILabel *validTimeLabel;      //有效期时间

@property (nonatomic, strong) UILabel *beLeftAvailableLabel;    //剩余可用
@property (nonatomic, strong) UILabel *containPackageLabel;     //包含套餐
@property (nonatomic, strong) UILabel *packageNoteLabel;        //套餐注解

@property (nonatomic, strong) UIButton *leftButton;             //左侧按钮
@property (nonatomic, strong) UILabel *useDetailLabel;          //使用详情
@property (nonatomic, strong) UIImageView *leftRightIcon;       //左侧向右箭头

@property (nonatomic, strong) UIButton *rightButton;            //右侧按钮
@property (nonatomic, strong) UILabel *buyPackageLabel;         //购买加餐包
@property (nonatomic, strong) UIImageView *rightRightIcon;      //右侧向右箭头



@end

@implementation TDFMineEleInvoiceCell

- (void)cellDidLoad {
    
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.backgroundImageView];         //背景图片
    [self.contentView addSubview:self.titleLabel];                  //标题
    [self.contentView addSubview:self.validTitleLabel];             //有效期标题
    [self.contentView addSubview:self.validTimeLabel];              //有效期时间
    [self.contentView addSubview:self.beLeftAvailableLabel];        //剩余可用
    [self.contentView addSubview:self.containPackageLabel];         //包含套餐
    [self.contentView addSubview:self.packageNoteLabel];            //注：
    
    [self.contentView addSubview:self.leftButton];          //左侧按钮
    [self.leftButton addSubview:self.useDetailLabel];       //使用详情
    [self.leftButton addSubview:self.leftRightIcon];        //左侧icon
    
    [self.contentView addSubview:self.rightButton];         //右侧按钮
    [self.rightButton addSubview:self.buyPackageLabel];     //购买加餐包
    [self.rightButton addSubview:self.rightRightIcon];      //右侧icon
    
}

- (void)layoutSubviews {
    
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.contentView).offset(-10);
        make.left.top.equalTo(self.contentView).offset(10);
    }];
    
    //标题
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backgroundImageView.mas_left).offset(10);
        make.top.equalTo(self.backgroundImageView.mas_top).offset(14);
        make.height.equalTo(@13);
    }];
    
    //有效期时间
    [self.validTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backgroundImageView.mas_right).offset(-10);
        make.centerY.height.equalTo(self.titleLabel);
    }];
    
    //有效期标题
    [self.validTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.validTimeLabel.mas_left);
        make.centerY.height.equalTo(self.validTimeLabel);
    }];
    
    //剩余可用
    [self.beLeftAvailableLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.backgroundImageView.mas_top).offset(54);
        make.height.equalTo(@20);
    }];
    
    //包含套餐
    [self.containPackageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.height.equalTo(@11);
        make.top.equalTo(self.backgroundImageView.mas_top).offset(89);
    }];
    
    //注：
    [self.packageNoteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.height.equalTo(self.containPackageLabel);
        make.top.equalTo(self.backgroundImageView.mas_top).offset(105);
    }];

    //左侧按钮
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backgroundImageView.mas_left);
        make.right.equalTo(self.backgroundImageView.mas_centerX);
        make.bottom.equalTo(self.self.backgroundImageView.mas_bottom);
        make.top.equalTo(self.backgroundImageView.mas_top).offset(132);
    }];
    [self.useDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.leftButton);
        make.centerX.equalTo(self.leftButton.mas_centerX).offset(-5.5);
        make.height.equalTo(@11);
    }];
    [self.leftRightIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.useDetailLabel.mas_right).offset(5);
        make.size.mas_equalTo(CGSizeMake(5, 10));
        make.centerY.equalTo(self.useDetailLabel);
    }];
    
    
    //右侧按钮
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftButton.mas_right);
        make.right.equalTo(self.backgroundImageView.mas_right);
        make.top.bottom.equalTo(self.leftButton);
    }];
    [self.buyPackageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rightButton);
        make.centerX.equalTo(self.rightButton.mas_centerX).offset(-5.5);
        make.height.equalTo(@11);
    }];
    
    [self.rightRightIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buyPackageLabel.mas_right).offset(5);
        make.size.mas_equalTo(CGSizeMake(5, 10));
        make.centerY.equalTo(self.buyPackageLabel);
    }];
    
}



+ (CGFloat)heightForCellWithItem:(TDFMineEleInvoiceItem *)item
{
    if (!item.shouldShow) return 0;
    return 190;
}

- (void)configCellWithItem:(TDFMineEleInvoiceItem *)item {
    
    self.item = item;
    
    self.contentView.hidden = !item.shouldShow;
    if (!item.shouldShow) return;

    
    self.containPackageLabel.hidden  =   !self.item.type;
    
    [self setEleInvoiceNumberOfPackage];    //设置电子发票数量
    [self setEleInvoiceValidTime];          //设置电子发票有效期
    
    if (item.buyPackageTitle) {
        self.buyPackageLabel.text   =   item.buyPackageTitle;
    }
    
}

//设置电子发票数量
- (void)setEleInvoiceNumberOfPackage {
    
    self.beLeftAvailableLabel.attributedText = [self beLeftNumber:self.item.remainNum];
    
    if (self.item.type == TDFMineEleInvoiceTypeNone) return;
    
    self.containPackageLabel.text   =   [NSString stringWithFormat:@"（包含套餐内%@张，加餐包内%@张）",self.item.containPackageNum,self.item.snackPackageNum];
}

//设置电子发票有效期
- (void)setEleInvoiceValidTime {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.item.validUntil.doubleValue / 1000];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY.MM.dd"];
    
    NSString *dateString = [formatter stringFromDate:date];
    self.validTimeLabel.text    =   dateString;
}

//修改电子发票数量的字体样式
- (NSAttributedString *)beLeftNumber:(NSString *)number {
    NSString *string = [NSString stringWithFormat:@"剩余可用%@张",number];
    NSRange rang = [string rangeOfString:number];
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:string];
    [attStr setAttributes:@{NSFontAttributeName :[UIFont systemFontOfSize:20] , NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#CC0000"]} range:rang];
    return attStr;
}




#pragma mark --- lazy
- (UIImageView *)backgroundImageView  {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.image = [UIImage imageNamed:@"mine_electronicInvoice" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    return _backgroundImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:11];
        _titleLabel.text = @"我的电子发票";
    }
    return _titleLabel;
}

- (UILabel *)validTimeLabel {
    if (!_validTimeLabel) {
        _validTimeLabel = [[UILabel alloc] init];
        _validTimeLabel.font = [UIFont systemFontOfSize:11];
        _validTimeLabel.textColor = [UIColor colorWithHexString:@"F6A623"];
    }
    return _validTimeLabel;
}

- (UILabel *)validTitleLabel {
    if (!_validTitleLabel) {
        _validTitleLabel = [[UILabel alloc] init];
        _validTitleLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        _validTitleLabel.font = [UIFont systemFontOfSize:11];
        _validTitleLabel.text = @"有效期至";
    }
    return _validTitleLabel;
}

- (UILabel *)beLeftAvailableLabel {
    if (!_beLeftAvailableLabel) {
        _beLeftAvailableLabel = [[UILabel alloc] init];
        _beLeftAvailableLabel.font = [UIFont systemFontOfSize:15];
    }
    return _beLeftAvailableLabel;
}

- (UILabel *)containPackageLabel {
    if (!_containPackageLabel) {
        _containPackageLabel = [[UILabel alloc] init];
        _containPackageLabel.font = [UIFont systemFontOfSize:11];
        _containPackageLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    }
    return _containPackageLabel;
}

- (UILabel *)packageNoteLabel {
    if (!_packageNoteLabel) {
        _packageNoteLabel = [[UILabel alloc] init];
        _packageNoteLabel.font = [UIFont systemFontOfSize:11];
        _packageNoteLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        _packageNoteLabel.text = @"注：套餐内余量到期后清零，加餐包内余量可跨套餐使用";
    }
    return _packageNoteLabel;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton addTarget:self action:@selector(clickLeftButton) forControlEvents:UIControlEventTouchUpInside];

    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton addTarget:self action:@selector(clickRightButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

- (UILabel *)useDetailLabel {
    if (!_useDetailLabel) {
        _useDetailLabel = [[UILabel alloc] init];
        _useDetailLabel.text = @"使用详情";
        _useDetailLabel.font = [UIFont systemFontOfSize:11];
        _useDetailLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    }
    return _useDetailLabel;
}

- (UIImageView *)leftRightIcon {
    if (!_leftRightIcon) {
        _leftRightIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_arrow_right_eleinvoice" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil]];
    }
    return _leftRightIcon;
}


- (UILabel *)buyPackageLabel {
    if (!_buyPackageLabel) {
        _buyPackageLabel = [[UILabel alloc] init];
        _buyPackageLabel.font = [UIFont systemFontOfSize:11];
        _buyPackageLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        _buyPackageLabel.text = @"购买加餐包";
    }
    return _buyPackageLabel;
}

- (UIImageView *)rightRightIcon {
    if (!_rightRightIcon) {
        _rightRightIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_arrow_right_eleinvoice" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil]];
    }
    return _rightRightIcon;
}


- (void)clickRightButton {
    if (self.item.buyPackageBlock) {
        self.item.buyPackageBlock();
    }
}
- (void)clickLeftButton {
    if (self.item.useDetailBlock) {
        self.item.useDetailBlock();
    }
}

@end





















