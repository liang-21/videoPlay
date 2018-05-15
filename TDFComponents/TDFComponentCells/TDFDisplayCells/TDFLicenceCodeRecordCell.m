//
//  TDFLicenceCodeRecordCell.m
//  TDFLoginModule
//
//  Created by doubanjiang on 2017/6/6.
//  Copyright © 2017年 doubanjiang. All rights reserved.
//

#import "TDFLicenceCodeRecordCell.h"
#import "TDFLicenceCodeRecorditem.h"
#import "Masonry.h"
#import "TDFDataCenter.h"
//#import "ColorHelper.h"

@interface TDFLicenceCodeRecordCell ()

@property (nonatomic ,strong) UILabel *titleL;

@property (nonatomic ,strong) UILabel *dateL;

@property (nonatomic ,strong) UILabel *moneyL;

@property (nonatomic ,strong) UILabel *codeL;

@property (nonatomic ,strong) UILabel *statusL;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *voucherL;

@property (nonatomic, strong) UILabel *voucherNumL;

@end

@implementation TDFLicenceCodeRecordCell


- (void)cellDidLoad {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.7];
    
    [self configlayout];
}

- (void)configlayout {
    [self.contentView addSubview:self.voucherL];
    [self.contentView addSubview:self.voucherNumL];
    [self.contentView addSubview:self.titleL];
    [self.contentView addSubview:self.dateL];
    [self.contentView addSubview:self.moneyL];
    [self.contentView addSubview:self.codeL];
    [self.contentView addSubview:self.statusL];
    [self.contentView addSubview:self.lineView];
    
    
    [self.dateL mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.offset(10);
        make.bottom.offset(0);
        make.height.equalTo(@30);
    }];
    
    [self.voucherL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.dateL.mas_left);
        make.top.offset(0);
        make.right.equalTo(self.dateL.mas_right);
        make.height.equalTo(@30);
    }];
    
    [self.voucherNumL mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.dateL.mas_right).offset(20);
        make.top.offset(0);
        make.height.equalTo(@30);
    }];
    
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.dateL.mas_left);
        make.top.equalTo(self.voucherL.mas_bottom).offset(0);
        make.right.equalTo(self.dateL.mas_right);
        make.height.equalTo(@30);
    }];
    
    [self.moneyL mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.dateL.mas_right).offset(20);
        make.top.equalTo(self.voucherL.mas_bottom).offset(0);
        make.height.equalTo(@30);
    }];
    
    [self.codeL mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.moneyL.mas_left);
        make.bottom.offset(0);
        make.height.equalTo(@30);
    }];
    
    [self.statusL mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(60);
        make.centerY.equalTo(self.titleL.mas_centerY);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.offset(0);
        make.right.offset(0);
        make.bottom.offset(0);
        make.height.mas_equalTo(1);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFLicenceCodeRecorditem *)item {

    return 90;
}

- (void)configCellWithItem:(TDFLicenceCodeRecorditem *)item {

    
    self.titleL.text = item.title;
    self.dateL.text = item.date;
    self.voucherL.text = item.voucher;
    self.voucherNumL.text = [NSString stringWithFormat:@"%@%.2f",TDFCurrencyCharacter,(long)item.voucherNum/100.0];
    self.codeL.text = [NSString stringWithFormat:@"激活码：%@",item.licenceCode];
    self.moneyL.text = [NSString stringWithFormat:@"%@%.2f",TDFCurrencyCharacter,(long)item.money/100.0];
    self.statusL.backgroundColor = item.status?[UIColor colorWithRed:0 green:170/255.0 blue:34/255.0 alpha:1]:[UIColor colorWithRed:204/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    self.statusL.text = item.status?@"已使用":@"未使用";
}

#pragma mark - Getter

- (UILabel *)titleL {

    if (!_titleL) {
        
        _titleL = [UILabel new];
        _titleL.font = [UIFont boldSystemFontOfSize:15];
    }
    return _titleL;
}

- (UILabel *)voucherL {
    
    if (!_voucherL) {
        
        _voucherL = [UILabel new];
        _voucherL.font = [UIFont boldSystemFontOfSize:15];
    }
    return _voucherL;
}



- (UILabel *)dateL {

    if (!_dateL) {
        
        _dateL = [UILabel new];
        _dateL.font = [UIFont systemFontOfSize:13];
        _dateL.textColor = [UIColor darkGrayColor];
        _dateL.text = @"20xx-xx-xx xx:xx";
        [_dateL sizeToFit];
    }
    return _dateL;
}

- (UILabel *)moneyL {

    if (!_moneyL) {
        
        _moneyL = [UILabel new];
        _moneyL.textColor = [UIColor colorWithRed:0 green:170/255.0 blue:34/255.0 alpha:1];
        _moneyL.font = [UIFont systemFontOfSize:13];
    }
    return _moneyL;
}

- (UILabel *)voucherNumL {
    
    if (!_voucherNumL) {
        
        _voucherNumL = [UILabel new];
        _voucherNumL.textColor = [UIColor blackColor];
        _voucherNumL.font = [UIFont systemFontOfSize:13];
    }
    return _voucherNumL;
}

- (UILabel *)codeL {

    if (!_codeL) {
        
        _codeL = [UILabel new];
        _codeL.font = [UIFont systemFontOfSize:13];
        _codeL.textColor = [UIColor darkGrayColor];

    }
    return _codeL;
}

- (UILabel *)statusL {

    if (!_statusL) {
        
        _statusL = [UILabel new];
        _statusL.font = [UIFont systemFontOfSize:12];
        _statusL.textColor = [UIColor whiteColor];
        _statusL.backgroundColor = [UIColor blackColor];
        _statusL.text = @"未使用";
        _statusL.layer.cornerRadius = 6;
        _statusL.layer.masksToBounds = YES;
        _statusL.backgroundColor = [UIColor colorWithRed:0 green:170/255.0 blue:34/255.0 alpha:1];
        _statusL.textAlignment = NSTextAlignmentCenter;
        [_statusL sizeToFit];
    }
    return _statusL;
}

- (UIView *)lineView {

    if (!_lineView) {
        
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor blackColor];
    }
    return _lineView;
}
@end
