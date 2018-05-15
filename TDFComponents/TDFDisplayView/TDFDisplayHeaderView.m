//
//  TDFDisplayHeaderView.m
//  Pods
//
//  Created by chaiweiwei on 2017/2/17.
//
//

#import "TDFDisplayHeaderView.h"
#import "Masonry.h"
#import <libextobjc/EXTScope.h>

@interface TDFDisplayHeaderView ()

@property (nonatomic,strong) UIView *alphaView;

@property (nonatomic,strong) UILabel *leftTitleLabel;
@property (nonatomic,strong) UILabel *rightTitleLabel;

@property (nonatomic, strong) TDFDisplayHeaderItem *model;

@end

@implementation TDFDisplayHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.alphaView];
        [self.alphaView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        [self addSubview:self.leftTitleLabel];
        [self.leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.top.equalTo(self.mas_top);
            make.bottom.equalTo(self.mas_bottom);
        }];
        [self addSubview:self.rightTitleLabel];
        [self.rightTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(215*[UIScreen mainScreen].bounds.size.width/375.0);
            make.right.equalTo(self.mas_right);
            make.top.equalTo(self.mas_top);
            make.bottom.equalTo(self.mas_bottom);
        }];
    }
    
    return self;
}

- (UILabel *)leftTitleLabel {
    if(!_leftTitleLabel) {
        _leftTitleLabel = [self createLabel];
    }
    return _leftTitleLabel;
}

- (UILabel *)rightTitleLabel {
    if(!_rightTitleLabel) {
        _rightTitleLabel = [self createLabel];
    }
    return _rightTitleLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.alphaView.layer.cornerRadius = self.frame.size.height/2.0;
}

- (UIView *)alphaView {
    if(!_alphaView) {
        _alphaView = [[UIView alloc] init];
        _alphaView.backgroundColor = [UIColor whiteColor];
        _alphaView.alpha = 0.4;
        _alphaView.layer.masksToBounds = YES;
    }
    return _alphaView;
}

- (UILabel *)createLabel{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1];
    return label;
}

- (void)configureViewWithModel:(TDFDisplayHeaderItem *)model {
    self.model = model;
    
    self.leftTitleLabel.text = model.titleArray[0];
    self.rightTitleLabel.text = model.titleArray[1];
}

@end
