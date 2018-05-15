//
//  TDFImageManagerView.m
//  RestApp
//
//  Created by happyo on 16/10/26.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFImageManagerView.h"
#import "TDFImageManagerItem.h"
#import "UIImageView+TDFRequest.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface TDFImageManagerView ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIButton *btnDelete;

@property (nonatomic, strong) TDFImageManagerItem *model;

@end
@implementation TDFImageManagerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        //
        [self initViews];
    }
    
    return self;
}

- (void)initViews
{
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.bottom.equalTo(self).with.offset(-10);
        make.leading.equalTo(self).with.offset(10);
        make.trailing.equalTo(self).with.offset(-10);
    }];
    
    [self addSubview:self.btnDelete];
    [self.btnDelete mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView);
        make.trailing.equalTo(self.imageView);
        make.width.equalTo(@(22));
        make.height.equalTo(@(22));
    }];

}

- (void)configureViewWithModel:(TDFImageManagerItem *)model
{
    self.model = model;
    [self layoutIfNeeded];
    if (model.isOldUrl) {
        [self.imageView tdf_imageRequstWithPath:model.downloadUrl placeholderImage:model.placeholderImage urlModel:model.urlModel];
    } else {
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.downloadUrl]];
    }
    self.btnDelete.hidden = model.hidenDeleteIcon;
}

- (void)btnDeleteClicked
{
    if (self.model.btnDeleteClicked) {
        self.model.btnDeleteClicked();
    }
}

#pragma mark -- Getters && Setters --

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _imageView;
}

- (UIButton *)btnDelete
{
    if (!_btnDelete) {
        _btnDelete = [[UIButton alloc] initWithFrame:CGRectZero];
        [_btnDelete setBackgroundImage:[UIImage imageNamed:@"deleteImage_icon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        [_btnDelete addTarget:self action:@selector(btnDeleteClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnDelete;
}

@end
