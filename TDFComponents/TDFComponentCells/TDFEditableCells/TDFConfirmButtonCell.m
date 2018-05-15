//
//  TDFConfirmButtonCell.m
//  TDFLoginModule
//
//  Created by doubanjiang on 2017/5/27.
//  Copyright © 2017年 doubanjiang. All rights reserved.
//

#import "TDFConfirmButtonCell.h"
#import "TDFConfirmButtonItem.h"
#import <Masonry/Masonry.h>

@interface TDFConfirmButtonCell ()

@property (nonatomic ,strong) UIButton *confirmBtn;

@property (nonatomic ,strong) TDFConfirmButtonItem *item;

@property (nonatomic ,strong) UILabel *tipsLabel;

@end

@implementation TDFConfirmButtonCell

- (void)cellDidLoad {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];

    [self configLayout];
}

- (void)configLayout {

    [self.contentView addSubview:self.confirmBtn];
    
    [self.contentView addSubview:self.tipsLabel];
    
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.offset(10);
        make.right.offset(-10);
        make.top.offset(15);
        make.height.mas_equalTo(46);
    }];
    
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.confirmBtn.mas_left);
        make.right.equalTo(self.confirmBtn.mas_right);
        make.top.equalTo(self.confirmBtn.mas_bottom);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFConfirmButtonItem *)item {

    
    if (item.hide) {
        
        return 0;
    }
    
    CGFloat height = 66;
    
    if (item.detail) {
        
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        UILabel *lblHeight = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screenWidth - 20, 0)];
        lblHeight.font = [UIFont systemFontOfSize:11];
        lblHeight.numberOfLines = 0;
        lblHeight.text = item.detail;
        lblHeight.preferredMaxLayoutWidth = screenWidth - 20;
        
        
        
        [lblHeight sizeToFit];
        height += lblHeight.frame.size.height + 15;
    }
    
    return height;
}

- (void)configCellWithItem:(TDFConfirmButtonItem *)item {

    _item = item;
    
    if (item.hide) {
        
        self.hidden = true;
    }else {
        
        self.hidden = false;
    }
    
    if (item.detail) {
        
        self.tipsLabel.text = item.detail;
        
        if (item.detailColor) {
            
            self.tipsLabel.textColor = item.detailColor;
        }
        [self.tipsLabel sizeToFit];
        
        [self.tipsLabel mas_updateConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.confirmBtn.mas_bottom).offset(10);
        }];
    }
    
    if ((item.btnBgColor)) {
        
        self.confirmBtn.backgroundColor = item.btnBgColor;
    }
    
    [self.confirmBtn setTitle:item.title forState:UIControlStateNormal];
}

- (void)confirmBtnDidTap:(UIButton *)btn {

    if (_item.callBack) {
        
        _item.callBack();
    }
}

#pragma mark - Getter

- (UIButton *)confirmBtn {

    if (!_confirmBtn) {
        
        _confirmBtn = [UIButton new];
        _confirmBtn .layer.cornerRadius = 5;
        _confirmBtn .layer.masksToBounds = YES;
        [_confirmBtn setBackgroundColor:[UIColor colorWithRed:204/255.0 green:0/255.0 blue:0/255.0 alpha:1]];
        [_confirmBtn setTitle:@"hehe" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_confirmBtn addTarget:self action:@selector(confirmBtnDidTap:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}

- (UILabel *)tipsLabel {

    if (!_tipsLabel) {
        
        _tipsLabel = [UILabel new];
        
        _tipsLabel.textColor = [UIColor colorWithWhite:1 alpha:0.7];
        
        _tipsLabel.font = [UIFont systemFontOfSize:11];
        
        _tipsLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
        
        _tipsLabel.numberOfLines = 0;
    }
    return _tipsLabel;
}

@end
