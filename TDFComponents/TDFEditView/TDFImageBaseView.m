//
//  TDFImageBaseCell.m
//  RestApp
//
//  Created by 小龙虾 on 2017/7/17.
//  Copyright © 2017年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFImageBaseView.h"
#import "TDFCardBgImageBaseItem.h"
#import "UIImageView+WebCache.h"
#import <Masonry/Masonry.h>
#import "ColorHelper.h"

@interface TDFImageBaseView ()
/***背景view**/
@property (nonatomic, strong) UIView *bgView;
/***背景图片**/
@property (nonatomic, strong) UIImageView *defaultImg;
/**显示图片**/
@property (nonatomic, strong) UIImageView *showImg;
/***添加按钮**/
@property (nonatomic, strong) UIButton *addBtn;
/***移除按钮**/
@property (nonatomic, strong) UIButton *deletBtn;
/***添加按钮说明文字**/
@property (nonatomic, strong) UILabel *addlbl;
/***底部说明文字**/
@property (nonatomic, strong) UILabel *bottomlbl;
@end
@implementation TDFImageBaseView

-(instancetype)initWithModel:(TDFCardBgImageBaseItem *)item
{
    self = [super init];
    if (self) {
        [self cellDidLoad];
        [self configwithModle:item];
    }
    return self;
}

-(void)cellDidLoad
{
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.defaultImg];
    [self.bgView addSubview:self.addlbl];
    [self.bgView addSubview:self.bottomlbl];
    [self.bgView addSubview:self.addBtn];
    [self.bgView addSubview:self.showImg];
    [self.bgView addSubview:self.deletBtn];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(0);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width-20);
    }];
    [self.defaultImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView.mas_centerX);
        make.centerY.equalTo(self.bgView.mas_centerY);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(40);
    }];
    
    [self.addlbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView.mas_centerX);
        make.centerY.equalTo(self.bgView.mas_centerY).offset(35);
        make.width.equalTo(self.bgView.mas_width);
        make.height.mas_equalTo(20);
    }];
    
    [self.bottomlbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-10);
        make.height.mas_equalTo(15);
    }];
    
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bgView);
    }];
    
    [self.showImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bgView);
    }];
    
    [self.deletBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgView.mas_right);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
}

-(void)configwithModle:(TDFCardBgImageBaseItem *)item
{
    if (item.titleForAddImageButton.length > 0) {
        self.addlbl.text = item.titleForAddImageButton;
    }
    
    if (item.descTitleValue.length > 0) {
        self.bottomlbl.text = item.descTitleValue;
    }
    
    if (item.cardImage) {
        [self.showImg setImage:item.cardImage];
        self.addBtn.userInteractionEnabled = NO;
        self.deletBtn.hidden = NO;
    }else{
        self.addBtn.userInteractionEnabled = YES;
        self.deletBtn.hidden = YES;
    }
}

-(UIView *)bgView
{
    if (!_bgView) {
        self.bgView = [[UIView alloc] init];
        self.bgView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.2];
        self.bgView.layer.cornerRadius = 2;
    }
    return _bgView;
}

-(UIImageView *)defaultImg
{
    if (!_defaultImg) {
        self.defaultImg = [[UIImageView alloc] init];
        [self.defaultImg setImage:[UIImage imageNamed:@"icon_add_image" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil]];
    }
    return _defaultImg;
}

-(UILabel *)addlbl
{
    if (!_addlbl) {
        self.addlbl = [[UILabel alloc] init];
        [self.addlbl setText:@"添加图片"];
        [self.addlbl setFont:[UIFont systemFontOfSize:20]];
        [self.addlbl setTextColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1]];
        [self.addlbl setTextAlignment:NSTextAlignmentCenter];
    }
    return _addlbl;
}

-(UILabel *)bottomlbl
{
    if (!_bottomlbl) {
        self.bottomlbl = [[UILabel alloc] init];
        [self.bottomlbl setFont:[UIFont systemFontOfSize:12]];
        [self.bottomlbl setTextColor:[ColorHelper getTipColor3]];
        self.bottomlbl.alpha = 0.8;
    }
    return _bottomlbl;
}

-(UIButton *)addBtn
{
    if (!_addBtn) {
        self.addBtn = [[UIButton alloc] init];
        [self.addBtn addTarget:self action:@selector(clickEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBtn;
}

-(UIImageView *)showImg
{
    if (!_showImg) {
        self.showImg = [[UIImageView alloc] init];
        self.showImg.layer.masksToBounds = YES;
    }
    return _showImg;
}

-(UIButton *)deletBtn
{
    if (!_deletBtn) {
        self.deletBtn = [[UIButton alloc] init];
        self.deletBtn.userInteractionEnabled = YES;
        [self.deletBtn addTarget:self action:@selector(clickEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.deletBtn setBackgroundImage:[UIImage imageNamed:@"ico_remove" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        self.deletBtn.layer.masksToBounds = YES;
        self.deletBtn.layer.cornerRadius = 10.0;
    }
    return _deletBtn;
}

-(void)clickEvent:(UIButton *)sender
{
    if (sender == self.addBtn) {
        self.btnBlock(1, self.tag);
    }else{
        self.btnBlock(0, self.tag);
    }
}


@end
