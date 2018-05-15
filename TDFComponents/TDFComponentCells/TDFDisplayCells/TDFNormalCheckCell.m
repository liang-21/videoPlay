//
//  TDFNormalCheckCell.m
//  TDFComponents
//
//  Created by doubanjiang on 2017/12/18.
//

#import "TDFNormalCheckCell.h"
#import "TDFNormalCheckItem.h"
#import <TDFStyleKit/UIColor+tdf_standard.h>
#import <Masonry/Masonry.h>

@interface TDFNormalCheckCell ()

@property (nonatomic, strong) UIButton *checkBtn;

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) TDFNormalCheckItem *item;


@end

@implementation TDFNormalCheckCell

- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self.contentView addSubview:self.checkBtn];
    [self.contentView addSubview:self.label];
    
    [self.checkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.offset(15);
    }];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.checkBtn.mas_right).offset(10);
        make.centerY.equalTo(self.checkBtn.mas_centerY);
    }];
}

- (void)configCellWithItem:(TDFNormalCheckItem *)item {
    self.item = item;
    [self.label setText:item.title];
    self.checkBtn.selected = item.isSelected;
}

+ (CGFloat)heightForCellWithItem:(DHTTableViewItem *)item {
    
    return 44.0f;
}

- (void)checkBtnSelected:(UIButton *)btn {
    btn.selected = !btn.selected;
    self.item.isSelected = btn.isSelected;
    if (self.item.checkBlock) {
        self.item.checkBlock();
    }
}

#pragma mark - Getter

- (UIButton *)checkBtn {
    if (!_checkBtn) {
        _checkBtn = [UIButton new];
        [_checkBtn setImage:[UIImage imageNamed:@"ico_loan_uncheck_gray"] forState:UIControlStateNormal];
        [_checkBtn setImage:[UIImage imageNamed:@"ico_loan_check_blue"] forState:UIControlStateSelected];
        [_checkBtn addTarget:self action:@selector(checkBtnSelected:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _checkBtn;
}

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        [_label setFont:[UIFont systemFontOfSize:15.0]];
        [_label setTextColor:[UIColor tdf_hex_333333]];
    }
    return _label;
}

@end
