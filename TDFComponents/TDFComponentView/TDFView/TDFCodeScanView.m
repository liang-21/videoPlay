//
//  TDFCodeScanView.m
//  TDFLoginModule
//
//  Created by doubanjiang on 2017/5/31.
//  Copyright © 2017年 doubanjiang. All rights reserved.
//

#import "TDFCodeScanView.h"
#import "TDFCodeScanItem.h"
#import "Masonry.h"

@interface TDFCodeScanView ()

@property (nonatomic ,strong) UIButton *scanBtn;

@property (nonatomic ,strong) UIButton *detailBtn;

@property (nonatomic ,strong) TDFCodeScanItem *model;

@end

@implementation TDFCodeScanView

- (void)initView {

    [super initView];
    
    [self addSubview:self.scanBtn];
    [self addSubview:self.detailBtn];
    
    [self.txfValue mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.lblTitle.mas_trailing);
        make.trailing.equalTo(self).with.offset(-40);
        make.height.equalTo(@(15));
        make.top.equalTo(self).with.offset(15);
    }];

    [self.scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self.mas_right).offset(-10);
        make.width.height.mas_equalTo(25);
        make.centerY.equalTo(self.lblTitle.mas_centerY);
    }];
    
    [self.detailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.lblDetail.mas_top);
        make.left.equalTo(self.lblDetail.mas_left);
    }];
    
    self.lblDetail.hidden = true;
}

- (void)configureViewWithModel:(TDFCodeScanItem *)model {

    [super configureViewWithModel:model];
    
    self.model = model;
    
    self.detailBtn.hidden = model.hideDetailBtn;
    self.scanBtn.hidden = model.hideScanBtn;
    
    if (model.hideScanBtn) {
        
         [self.detailBtn setAttributedTitle:[[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"忘记密码",nil) attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0/255.0 green:136/255.0 blue:204/255.0 alpha:1]}] forState:UIControlStateNormal];
        self.detailBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 58, 0, -58);
        
        [self.txfValue mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.right.offset(-10);
        }];
        
        [self layoutIfNeeded];
    }
}

- (void)detailBtnDidTouch:(UIButton *)btn {

    if (self.model.detailCallBack) {
        
        self.model.detailCallBack();
    }
}

- (void)scanBtnDidTouch:(UIButton *)btn {

    if (self.model.scanCallBack) {
        
        self.model.scanCallBack();
    }
}

#pragma mark - Getter

- (UIButton *)scanBtn {

    if (!_scanBtn) {
        
        _scanBtn = [UIButton new];
        [_scanBtn setBackgroundImage:[UIImage imageNamed:@"login_scan" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        [_scanBtn addTarget:self action:@selector(scanBtnDidTouch:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scanBtn;
}

- (UIButton *)detailBtn {

    if (!_detailBtn) {
        
        _detailBtn = [UIButton new];
        _detailBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        _detailBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_detailBtn setTitle:NSLocalizedString(@"如何获取激活码   ",nil) forState:UIControlStateNormal];
        [_detailBtn setAttributedTitle:[[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"如何获取激活码   ",nil) attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0/255.0 green:136/255.0 blue:204/255.0 alpha:1]}] forState:UIControlStateNormal];
        [_detailBtn addTarget:self action:@selector(detailBtnDidTouch:) forControlEvents:UIControlEventTouchUpInside];
        [_detailBtn setImage:[UIImage imageNamed:@"login_blue_rightArrow" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        
        [_detailBtn.titleLabel sizeToFit];
        
        _detailBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 98, 0, -98);
        _detailBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -6, 0, 6);
    }
    return _detailBtn;
}

@end
