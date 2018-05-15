//
//  TDFButtonView.m
//  TDFComponents
//
//  Created by guozhi on 2017/10/24.
//

#import "TDFButtonView.h"
#import "TDFButtonItem.h"
#import "UIColor+RGB.h"
#import "Masonry.h"

@interface TDFButtonView ()
/** <#注释#> */
@property (nonatomic, strong) UIButton *btn;
/** <#注释#> */
@property (nonatomic, strong) TDFButtonItem *item;
@end

@implementation TDFButtonView

- (instancetype)init {
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    [self addSubview:self.btn];
    __weak typeof(self) wself = self;
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(wself);
    }];
}

- (void)configureViewWithModel:(TDFButtonItem *)model {
    self.item = model;
    if (self.item.style == TDFButtonItemStyleDel) {
        [self.btn setTitleColor:[UIColor tdf_colorWithRGB:0xFF0033] forState:UIControlStateNormal];
        [self.btn setBackgroundColor:[UIColor tdf_colorWithRGB:0xFFFFFF]];
        [self.btn setTitle:self.item.title forState:UIControlStateNormal];
    }
    
}

+ (CGFloat)getHeightWithModel:(TDFBaseEditItem *)model {
    return 44;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_btn setTitleColor:[UIColor tdf_colorWithRGB:0xFF0033] forState:UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btn setBackgroundColor:[UIColor tdf_colorWithRGB:0xFFFFFF]];
        _btn.layer.borderWidth = 0.5;
        _btn.layer.borderColor = [UIColor tdf_colorWithRGB:0xCCCCCC].CGColor;
    }
    return _btn;
}

- (void)btnClick:(UIButton *)btn {
    if (self.item.buttonClickEvent) {
        self.item.buttonClickEvent();
    }
    
}
@end
