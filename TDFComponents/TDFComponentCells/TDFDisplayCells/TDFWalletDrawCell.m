//
//  TDFWalletDrawCell.m
//  TDFComponents
//
//  Created by chaiweiwei on 2017/10/11.
//

#import "TDFWalletDrawCell.h"
#import "TDFWalletDrawItem.h"
#import "UIColor+tdf_standard.h"
#import "Masonry.h"
#import "TDFNumbericKeyboard.h"
#import "ReactiveObjC.h"
#import "NSObject+AlertMessage.h"
#import "UIColor+Hex.h"
@interface TDFWalletDrawCell ()<UITextFieldDelegate>

@property (nonatomic,strong) TDFWalletDrawItem *item;
@property (nonatomic,strong) UIButton *drawButton;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) UILabel *limitMoneyLabel;
@property (nonatomic,strong) UILabel *unitLabel;
@property (nonatomic,strong) UILabel *tipLabel;

@end

@implementation TDFWalletDrawCell

- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.top.equalTo(self.contentView.mas_top).with.offset(15);
    }];
    
    [self.contentView addSubview:self.drawButton];
    [self.drawButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.top.equalTo(self.contentView.mas_top).with.offset(15);
        make.height.mas_equalTo(18);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor tdf_hex_CCCCCC];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right);
        make.top.equalTo(self.contentView.mas_top).with.offset(100);
    }];
    
    [self.contentView addSubview:self.unitLabel];
    [self.unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.bottom.equalTo(lineView.mas_top).with.offset(-15);
        make.height.mas_offset(28);
    }];
    
    [self.contentView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.unitLabel.mas_right).with.offset(20);
        make.height.mas_offset(28);
        make.bottom.equalTo(lineView.mas_top).with.offset(-13);
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
    }];
    
    [self.contentView addSubview:self.limitMoneyLabel];
    [self.limitMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.top.equalTo(lineView.mas_bottom);
    }];
    
    [self.contentView addSubview:self.tipLabel];
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.centerY.equalTo(self.limitMoneyLabel.mas_centerY);
    }];

       UIView *line = [[UIView   alloc]init];
        line.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        [self.contentView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.bottom.equalTo(self.contentView);
            make.height.mas_equalTo(@0.5);
        }];

    
    
}

- (UILabel *)tipLabel {
    if(!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.textColor = [UIColor tdf_hex_999999];
        _tipLabel.font = [UIFont systemFontOfSize:13];
    }
    return _tipLabel;
}

- (UILabel *)unitLabel {
    if(!_unitLabel) {
        _unitLabel = [[UILabel alloc] init];
        _unitLabel.textColor = [UIColor tdf_hex_333333];
        _unitLabel.font = [UIFont systemFontOfSize:28];
        [_unitLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh
                                      forAxis:UILayoutConstraintAxisHorizontal];
        [_unitLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh
                                                    forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _unitLabel;
}

+ (CGFloat)heightForCellWithItem:(TDFWalletDrawItem *)item
{
    return 145;
}

- (void)configCellWithItem:(TDFWalletDrawItem *)item
{
    self.item = item;
    
    self.titleLabel.text = [NSString stringWithFormat:@"提现金额（%@）",item.charUnit];
    self.textField.placeholder = item.placeholder;
    self.unitLabel.text = item.signUtil;
    [self.textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.unitLabel.mas_right).with.offset(item.signUtil?20:0);
    }];
    self.tipLabel.text = item.transferTime;
    self.limitMoneyLabel.text = [NSString stringWithFormat:@"可用余额：%@%@",item.limitMoney,item.charUnit];
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor tdf_hex_333333];
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (UIButton *)drawButton {
    if(!_drawButton) {
        _drawButton = [[UIButton alloc] init];
        [_drawButton setTitleColor:[UIColor tdf_hex_0088FF] forState:UIControlStateNormal];
        [_drawButton setTitle:@"全部提现" forState:UIControlStateNormal];
        _drawButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_drawButton addTarget:self action:@selector(drawAllAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _drawButton;
}

- (UITextField *)textField {
    if(!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.delegate = self;
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.font = [UIFont systemFontOfSize:22];
        _textField.textColor = [UIColor tdf_hex_333333];
        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _textField.textAlignment = NSTextAlignmentLeft;
        TDFNumbericKeyboard *keyboard = [TDFNumbericKeyboard keyboardWithResponder:_textField title:@"提现金额" keyboardType:TDFNumbericKeyboardTypeFloat];
        _textField.inputView = keyboard;
        
        @weakify(self);
        [[_textField rac_signalForSelector:@selector(insertText:) fromProtocol:@protocol(UIKeyInput)] subscribeNext:^(RACTuple * _Nullable x) {
            @strongify(self);
            [self changeTextFieldFont];
            
            if([_textField.text containsString:@"."]) {
                NSString *floatValueStr = [_textField.text componentsSeparatedByString:@"."].lastObject;
                if(floatValueStr.length > 2) {
                    _textField.text = [_textField.text substringToIndex:(_textField.text.length - 1)];
                }
            }
            //纠正用户输入不完整
            _textField.text = [self resetZeroPreFixWithText:_textField.text];
            _textField.text = [self fixPointTextValue:_textField.text];
            
            [self dealWithMoneyAvailableUIWithText:_textField.text];
        }];
        
        [[_textField rac_signalForSelector:@selector(deleteBackward) fromProtocol:@protocol(UIKeyInput)] subscribeNext:^(RACTuple * _Nullable x) {
            @strongify(self);
            [self changeTextFieldFont];
            [self dealWithMoneyAvailableUIWithText:_textField.text];
        }];
    }
    return _textField;
}

- (void)changeTextFieldFont {
    if(self.textField.text.length <= 0) {
        //ipod适配 placeholder与text的字体大小不一样 对齐方式不同
        self.textField.font = [UIFont systemFontOfSize:22];
        [self.textField mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_offset(28);
        }];
    }else {
        //ipod适配 placeholder与text的字体大小不一样 对齐方式不同
        self.textField.font = [UIFont systemFontOfSize:40];
        [self.textField mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_offset(40);
        }];
    }
}

- (UILabel *)limitMoneyLabel {
    if(!_limitMoneyLabel) {
        _limitMoneyLabel = [[UILabel alloc] init];
        _limitMoneyLabel.font = [UIFont systemFontOfSize:13];
        _limitMoneyLabel.textColor = [UIColor tdf_hex_666666];
    }
    return _limitMoneyLabel;
}

- (void)drawAllAction {
    double usableMoney = self.item.limitMoney.doubleValue-self.item.poundage.doubleValue;
    if(usableMoney < 0) {
        usableMoney = 0;
    }
    self.textField.text = [NSString stringWithFormat:@"%.2f",usableMoney];
    [self changeTextFieldFont];
    [self dealWithMoneyAvailableUIWithText:self.textField.text];
    !self.item.drawAllActionCallBack?:self.item.drawAllActionCallBack();
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    //不支持模拟器系统键盘
    [self TDF_showAlert:@"不支持模拟器系统键盘"];
    return NO;
}

- (NSString *)resetZeroPreFixWithText:(NSString *)text {
    if(text.length > 1 && ![text containsString:@"."] && [text hasPrefix:@"0"]) {
        return [text substringFromIndex:1];
    }
    return text;
}

- (NSString *)fixPointTextValue:(NSString *)text {
    if([text hasPrefix:@"."]) {
        return [@"0" stringByAppendingString:text];
    }
    return text;
}

- (void)dealWithMoneyAvailableUIWithText:(NSString *)text {
    
    double value = text.doubleValue;
    if (value == 0) {
        self.limitMoneyLabel.textColor = [UIColor tdf_hex_666666];
        !self.item.drawAvailableCallBack?:self.item.drawAvailableCallBack(NO,text);
        self.limitMoneyLabel.text = [NSString stringWithFormat:@"可用余额：%@%@",self.item.limitMoney,self.item.charUnit];
    }else if(value > [NSString stringWithFormat:@"%.2f",self.item.limitMoney.doubleValue-self.item.poundage.doubleValue].doubleValue) {
        self.limitMoneyLabel.textColor = [UIColor tdf_hex_FF0033];
        self.limitMoneyLabel.text = @"输入金额超过可提现金额";
        !self.item.drawAvailableCallBack?:self.item.drawAvailableCallBack(NO,text);
    }else {
        self.limitMoneyLabel.textColor = [UIColor tdf_hex_666666];
        !self.item.drawAvailableCallBack?:self.item.drawAvailableCallBack(YES,text);
        self.limitMoneyLabel.text = [NSString stringWithFormat:@"可用余额：%@%@",self.item.limitMoney,self.item.charUnit];
    }
}

@end

