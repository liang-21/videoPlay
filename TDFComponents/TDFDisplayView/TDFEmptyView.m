//
//  TDFEmptyView.m
//  TDFIssueCenter
//
//  Created by chaiweiwei on 2017/4/28.
//  Copyright © 2017年 chaiweiwei. All rights reserved.
//

#import "TDFEmptyView.h"
#import <Masonry/Masonry.h>
#import "UIColor+tdf_standard.h"

@interface TDFEmptyView()

@property (strong,nonatomic) UILabel *emptyLabel;
@property (strong,nonatomic) UIImageView *emptyImageView;
@property (strong,nonatomic) UIButton *centerButton;
@property (copy,nonatomic) void (^click)(void);
@end

@implementation TDFEmptyView

+ (instancetype)emptyViewWithContent:(NSString *)content {
    TDFEmptyView *emptyView = [[TDFEmptyView alloc] init];
    emptyView.content = content;
    return emptyView;
}

+ (instancetype)emptyViewWithContent:(NSString *)content emptyImage:(UIImage *)emptyImage{
    TDFEmptyView *emptyView = [[TDFEmptyView alloc] init];
    emptyView.content = content;
    emptyView.emptyImage = emptyImage;
    return emptyView;
}

+ (instancetype)emptyViewWithContent:(NSString *)content centerButtonTitle:(NSString *)title click:(void (^)(void))block{
    TDFEmptyView *emptyView = [TDFEmptyView emptyViewWithContent:content];
    [emptyView.centerButton setTitle:title forState:UIControlStateNormal];
    emptyView.centerButton.hidden = NO;
    emptyView.click = block;
    return emptyView;
}

- (instancetype)init {
    if(self = [super init]) {
        [self addSubview:self.emptyImageView];
        [self.emptyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 100));
            make.centerX.equalTo(self.mas_centerX);
            make.bottom.equalTo(self.mas_centerY).offset(-50);
        }];
        
        [self addSubview:self.emptyLabel];
        [self.emptyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(15);
            make.right.equalTo(self.mas_right).with.offset(-15);
            make.center.equalTo(self);
        }];
        
        [self addSubview:self.centerButton];
        [self.centerButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.emptyLabel.mas_bottom).with.offset(35);
            make.centerX.equalTo(self.mas_centerX);
            make.width.mas_equalTo(140);
            make.height.mas_equalTo(35);
        }];
    }
    return self;
}

- (void)clickAction{
    !self.click?:self.click();
}

- (UILabel *)emptyLabel {
    if(!_emptyLabel) {
        _emptyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _emptyLabel.font = [UIFont systemFontOfSize:15];
        _emptyLabel.textColor = [UIColor tdf_hex_999999];
        _emptyLabel.textAlignment = NSTextAlignmentCenter;
        _emptyLabel.numberOfLines=0;
    }
    return _emptyLabel;
}

- (UIButton *)centerButton {
    if(!_centerButton) {
        _centerButton = [[UIButton alloc] init];
        _centerButton.backgroundColor = [UIColor tdf_hex_0088FF];
        [_centerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _centerButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _centerButton.layer.masksToBounds = YES;
        _centerButton.layer.cornerRadius = 6;
        _centerButton.hidden = YES;
        [_centerButton addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerButton;
}

- (UIImageView *) emptyImageView
{
    if (!_emptyImageView) {
        _emptyImageView = [[UIImageView alloc] init];
    }
    return _emptyImageView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.emptyLabel.text = self.content;
    self.emptyImageView.image = self.emptyImage;
}

- (void)setContent:(NSString *)content {
    _content = content;
    self.emptyLabel.text = content;
}

- (void)setEmptyImage:(UIImage *)emptyImage {
    _emptyImage = emptyImage;
    self.emptyImageView.image = emptyImage;
}

@end
