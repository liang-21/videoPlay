//
//  TDFMemberCardView.m
//  Pods
//
//  Created by 黄河 on 2017/6/5.
//
//

#import "UIImageView+TDFRequest.h"
#import "TDFMemberCardView.h"
#import "UIColor+Hex.h"
#import "Masonry.h"

@interface TDFMemberCardView ()

@property (nonatomic, strong)UILabel *shopNameLabel;

@property (nonatomic, strong)UIButton *delButton;

@property (nonatomic, strong)UIView *centerView;

@property (nonatomic, strong)UILabel *nameLabel;

@property (nonatomic, strong)UILabel *discountLabel;

@property (nonatomic, strong)UIImageView *backImageView;

@property (nonatomic, strong)NSArray *dataArray;

@property (nonatomic, strong)TDFMemberCardItem *model;

@end

@implementation TDFMemberCardView

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
    
    self.shopNameLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.shopNameLabel];
    
    [self.delButton setBackgroundImage:[UIImage imageNamed:@"ico_uncheck" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil]
                              forState:UIControlStateNormal];
    [self.delButton setImage:[UIImage imageNamed:@"ico_check" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateSelected];
    self.delButton.userInteractionEnabled = NO;
//    [self.delButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.delButton];
    
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.font = [UIFont systemFontOfSize:48];
    [self.centerView addSubview:self.nameLabel];
    
    self.discountLabel.textColor = [UIColor whiteColor];
    self.discountLabel.font = [UIFont systemFontOfSize:18];
    [self.centerView addSubview:self.discountLabel];
    [self addSubview:self.centerView];
    
    [self layoutView];
}

- (void)layoutView {
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(21);
        make.centerY.equalTo(self.delButton.mas_centerY);
        make.right.right.lessThanOrEqualTo(self.delButton.mas_left).offset(8);
        
    }];
    [self.delButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(10);
        make.width.height.equalTo(@20);
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


- (void)configWithItem:(TDFMemberCardItem *)item {
    self.model = item;
    self.shopNameLabel.text = item.shopName;
    self.nameLabel.text = item.cardName;
    self.discountLabel.text = item.discountName;
    
    self.delButton.selected = item.selected;
    [self.backImageView tdf_imageRequstWithPath:item.imageUrl placeholderImage:[UIImage imageNamed:@"icon_member_card" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] urlModel:ImageUrlOrigin];
    
    int r=255;
    int g=255;
    int b=255;
    if (item.fontColor.length > 0) {
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

- (UILabel *)shopNameLabel {
    if (!_shopNameLabel) {
        _shopNameLabel = [[UILabel alloc] init];
    }
    return _shopNameLabel;
}

- (UIButton *)delButton {
    if (!_delButton) {
        _delButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _delButton;
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
@end
