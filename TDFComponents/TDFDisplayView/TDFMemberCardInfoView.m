//
//  TDFMemberCardInfoView.m
//  Pods
//
//  Created by 黄河 on 2017/3/10.
//
//

#import "TDFMemberCardInfoView.h"
#import "UIImageView+WebCache.h"
#import "UIColor+Hex.h"
#import "Masonry.h"

@interface TDFMemberCardInfoDataLabelView ()

@property (nonatomic, strong)UILabel *titleLabel;

@property (nonatomic, strong)UILabel *dataLabel;

@end

@implementation TDFMemberCardInfoDataLabelView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configView];
    }
    return self;
}

- (void)configView {
    [self addSubview:self.titleLabel];
    [self addSubview:self.dataLabel];
    [self layoutView];
}

- (void)layoutView {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
    }];
    [self.dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.bottom.equalTo(self);
    }];
}
#pragma mark -- setter && getter

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:11];
    }
    return _titleLabel;
}

- (UILabel *)dataLabel {
    if (!_dataLabel) {
        _dataLabel = [[UILabel alloc] init];
        _dataLabel.textColor = [UIColor whiteColor];
        _dataLabel.font = [UIFont systemFontOfSize:11];
    }
    return _dataLabel;
}

- (void)setDataDictionary:(NSDictionary *)dataDictionary {
    _dataDictionary = dataDictionary;
    self.titleLabel.text = dataDictionary[@"title"];
    self.dataLabel.text = dataDictionary[@"detail"];
}

@end

@interface TDFMemberCardInfoDataView ()
@property (nonatomic, strong)NSMutableArray *viewArray;
@end

@implementation TDFMemberCardInfoDataView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    //设置虚线颜色
    CGContextSetStrokeColorWithColor(currentContext, [UIColor colorWithHexString:@"#FFFFFF"].CGColor);
    //设置虚线宽度
    CGContextSetLineWidth(currentContext, 1);
    //设置虚线绘制起点
    CGContextMoveToPoint(currentContext, self.bounds.size.width * 1/3.0, 0);
    //设置虚线绘制终点
    CGContextAddLineToPoint(currentContext,self.bounds.size.width * 1/3.0 , self.frame.size.height);
    
    CGContextMoveToPoint(currentContext, self.bounds.size.width * 2/3.0, 0);
    //设置虚线绘制终点
    CGContextAddLineToPoint(currentContext,self.bounds.size.width * 2/3.0 , self.frame.size.height);

    //设置虚线排列的宽度间隔:下面的arr中的数字表示先绘制3个点再绘制1个点
    CGFloat arr[] = {5,1};
    //下面最后一个参数“2”代表排列的个数。
    CGContextSetLineDash(currentContext, 0, arr, 2);
    CGContextDrawPath(currentContext, kCGPathStroke);
}

#pragma mark -- setter && getter

- (NSMutableArray *)viewArray {
    if (!_viewArray) {
        _viewArray = [NSMutableArray array];
    }
    return _viewArray;
}
- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    for (int i = 0; i < dataArray.count; i ++) {
        TDFMemberCardInfoDataLabelView *labelView ;
        if (i < self.viewArray.count) {
            labelView = self.viewArray[i];
        }else {
            labelView = [[TDFMemberCardInfoDataLabelView alloc] init];
            [self.viewArray addObject:labelView];
            [self addSubview:labelView];
        }
        [labelView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.centerX.equalTo(self.mas_centerX).multipliedBy(1/3.0 +2/3.0 * i);
        }];
        labelView.dataDictionary = dataArray[i];
    }
}

@end

@interface TDFMemberCardInfoView ()

@property (nonatomic, strong)TDFMemberCardInfoDataView *dataView;

@property (nonatomic, strong)UILabel *shopNameLabel;

@property (nonatomic, strong)UIButton *upButton;

@property (nonatomic, strong)UIView *centerView;

@property (nonatomic, strong)UILabel *nameLabel;

@property (nonatomic, strong)UILabel *discountLabel;

@property (nonatomic, strong)UIImageView *backImageView;

@property (nonatomic, strong)NSArray *dataArray;

@property (nonatomic, strong)TDFMemberCardInfoItem *model;

@property (nonatomic, strong)UILabel *upgradeTimeLabel;
@end

@implementation TDFMemberCardInfoView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configView];
    }
    return self;
}

- (void)configView {
    self.layer.cornerRadius = 3;
    self.layer.masksToBounds = YES;
    [self addSubview:self.backImageView];
    
    [self addSubview:self.dataView];
    self.shopNameLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.shopNameLabel];
    
    self.upButton.layer.cornerRadius = 3;
    self.upButton.layer.borderWidth = 1;
    self.upButton.titleLabel.font = [UIFont systemFontOfSize:13];
    self.upButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.upButton.backgroundColor = [UIColor colorWithHexString:@"#CC0000"];
    [self.upButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.upButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.upButton];
    
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.font = [UIFont systemFontOfSize:48];
    [self.centerView addSubview:self.nameLabel];
    
    self.discountLabel.textColor = [UIColor whiteColor];
    self.discountLabel.font = [UIFont systemFontOfSize:18];
    [self.centerView addSubview:self.discountLabel];
    [self addSubview:self.centerView];
    
    self.upgradeTimeLabel.textColor = [UIColor colorWithHexString:@"#FFFFFF" alpha:0.8];
    self.upgradeTimeLabel.font = [UIFont systemFontOfSize:9];
    [self addSubview:self.upgradeTimeLabel];
    [self layoutView];
}

- (void)layoutView {
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.dataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.height.equalTo(@56);
    }];
    
    [self.shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(21);
        make.centerY.equalTo(self.upButton.mas_centerY);
        make.right.right.lessThanOrEqualTo(self.upButton.mas_left).offset(8);

    }];
    [self.upButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(10);
        make.width.greaterThanOrEqualTo(@70);
    }];
    
    [self.upgradeTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.upButton.mas_right);
        make.top.equalTo(self.upButton.mas_bottom).offset(10);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.centerView);
    }];
    [self.discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom);
        make.bottom.equalTo(self.centerView);
        make.centerX.equalTo(self.nameLabel);
    }];
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}


- (void)configureViewWithModel:(TDFMemberCardInfoItem *)model {
    self.model = model;
    self.dataView.dataArray = model.cardInfoArray;
    self.shopNameLabel.text = model.shopName;
    self.nameLabel.text = model.cardName;
    self.discountLabel.text = model.discountName;
    [self.upButton setTitle:model.upStatus==1?@"取消升级":@"升级" forState:UIControlStateNormal];
    if (model.upStatus == 1) {
        self.upgradeTimeLabel.text = model.upgradeTimeMessage;
    }else {
        self.upgradeTimeLabel.text = nil;
    }
    [self.backImageView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"icon_member_card" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    
    int r=255;
    int g=255;
    int b=255;
    if (model.fontColor.length > 0) {
        NSArray* colors=[self.model.fontColor componentsSeparatedByString:@","];
        r=((NSString*)[colors objectAtIndex:1]).intValue;
        g=((NSString*)[colors objectAtIndex:2]).intValue;
        b=((NSString*)[colors objectAtIndex:3]).intValue;
    }
    UIColor *textColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    self.shopNameLabel.textColor = textColor;
    self.nameLabel.textColor = textColor;
    self.discountLabel.textColor = textColor;
}

- (void)buttonClick:(UIButton *)button {
    if (self.model.filterBlock) {
        self.model.filterBlock();
    }
}

#pragma mark -- setter && getter
- (TDFMemberCardInfoDataView *)dataView {
    if (!_dataView) {
        _dataView = [[TDFMemberCardInfoDataView alloc] init];
    }
    return _dataView;
}

- (UILabel *)shopNameLabel {
    if (!_shopNameLabel) {
        _shopNameLabel = [[UILabel alloc] init];
    }
    return _shopNameLabel;
}

- (UIButton *)upButton {
    if (!_upButton) {
        _upButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _upButton;
}

- (UILabel *)discountLabel {
    if (!_discountLabel) {
        _discountLabel = [[UILabel alloc] init];
    }
    return _discountLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
    }
    return _nameLabel;
}

- (UIView *)centerView {
    if (!_centerView) {
        _centerView = [[UIView alloc] init];
    }
    return _centerView;
}

- (UIImageView *)backImageView {
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] init];
    }
    return _backImageView;
}

- (UILabel *)upgradeTimeLabel {
    if (!_upgradeTimeLabel) {
        _upgradeTimeLabel = [[UILabel alloc] init];
    }
    return _upgradeTimeLabel;
}

@end
