//
//  TDFMessageCountAndBuyButtonView.m
//  Pods
//
//  Created by 黄河 on 2017/2/24.
//
//

#import "TDFMessageCountAndBuyButtonView.h"
#import <Masonry/Masonry.h>

@interface TDFMessageCountAndBuyButtonView ()
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UILabel *lbloverseas;

@property (nonatomic, strong) UILabel *lbldomestic;

@property (nonatomic, strong) UIView *lineView;

@end

@implementation TDFMessageCountAndBuyButtonView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configView];
    }
    return self;
}

#pragma mark -private method

- (void)configView {
    [self addSubview:self.label];
    [self addSubview:self.button];
    [self addSubview:self.lbloverseas];
    [self addSubview:self.lbldomestic];
    [self addSubview:self.lineView];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.height.equalTo(@30);
        make.width.equalTo(@100);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.height.equalTo(@42);
        make.right.equalTo(self.button.mas_left).offset(0);
    }];
    
    [self.lbldomestic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label.mas_bottom).offset(0);
        make.left.equalTo(self.label.mas_left).offset(0);
        make.right.equalTo(self.label.mas_right).offset(0);
        make.height.equalTo(@14);
    }];
    
    [self.lbloverseas mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lbldomestic.mas_bottom).offset(0);
        make.left.equalTo(self.label.mas_left).offset(0);
        make.right.equalTo(self.label.mas_right).offset(0);
        make.height.equalTo(@14);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.bottom.equalTo(self.mas_bottom).offset(-1);
        make.right.equalTo(self.mas_right).offset(0);
        make.left.equalTo(self.mas_left).offset(0);
    }];
}

- (void)buttonClick:(UIButton *)button {
    if (self.buttonClick) {
        self.buttonClick();
    }
}

#pragma mark --setter && getter

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:15];
        _label.text = @"剩余短信数量";
        _label.textColor = [UIColor blackColor];
    }
    return _label;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setBackgroundImage:[UIImage imageNamed:@"btn_full_r" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        _button.backgroundColor = [UIColor colorWithRed:55/255.0 green:172/255.0 blue:49/255.0 alpha:1];
        _button.layer.cornerRadius = 3;
        _button.titleLabel.font = [UIFont systemFontOfSize:13];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UILabel *)lbldomestic {
    if (!_lbldomestic) {
        _lbldomestic = [[UILabel alloc] init];
        _lbldomestic.font = [UIFont systemFontOfSize:11.];
        _lbldomestic.text = @"可发中国大陆：0条";
        _lbldomestic.textColor = [UIColor grayColor];
    }
    return _lbldomestic;
}

- (UILabel *)lbloverseas {
    if (!_lbloverseas) {
        _lbloverseas = [[UILabel alloc] init];
        _lbloverseas.font = [UIFont systemFontOfSize:11.];
        _lbloverseas.text = @"或可发其他国家和地区：0条";
        _lbloverseas.textColor = [UIColor grayColor];
    }
    return _lbloverseas;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineView;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.label.text = title;
}

- (void)setButtonTitle:(NSString *)buttonTitle {
    _buttonTitle = buttonTitle;
    [self.button setTitle:buttonTitle forState:UIControlStateNormal];
}

- (void)setButtonColor:(UIColor *)buttonColor {
    _buttonColor = buttonColor;
    self.button.backgroundColor = buttonColor;
}

- (void)setLbldomesticTitle:(NSString *)lbldomesticTitle {
    _lbldomesticTitle = lbldomesticTitle;
    self.lbldomestic.text = lbldomesticTitle;
}

- (void)setLbloverseasTitle:(NSString *)lbloverseasTitle {
    _lbloverseasTitle = lbloverseasTitle;
    self.lbloverseas.text = lbloverseasTitle;
}


@end
