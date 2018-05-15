//
//  TDFEditIntervalView.m
//  Pods
//
//  Created by guozhi on 2017/8/3.
//
//

static CGFloat const kTextFieldWidth = 80;
static CGFloat const kTextFieldHeight = 30;


#import "TDFEditIntervalView.h"
#import "TDFEditColorHelper.h"
#import "TDFIntervalItem.h"
#import "Masonry.h"
#import "TDFNumbericKeyboard.h"


@interface TDFEditIntervalView ()<UIKeyInput, UITextFieldDelegate>

/**
 左侧文本框
 */
@property (nonatomic, strong) UITextField *leftTextField;

/**
 右侧文本框
 */
@property (nonatomic, strong) UITextField *rightTextField;

/**
 文本框之间的横线
 */
@property (nonatomic, strong) UIView *lineView;

/**
 右侧的提示文案
 */
@property (nonatomic, strong) UILabel *rightLbl;

/**
 数据模型
 */
@property (nonatomic, strong) TDFIntervalItem *model;

/**
 记录键盘
 */
@property (nonatomic, strong) TDFNumbericKeyboard *keyboard;
/**
 记录当前操作的文本框
 */
@property (nonatomic, strong) UITextField *textField;

/**
 记录是否是第一次输入
 */
@property (nonatomic, assign) BOOL firstInput;



@end

@implementation TDFEditIntervalView


- (void)initView {
    [super initView];
    [self setUpChildViews];
    [self setUpConstraints];
    
}

- (void)setUpChildViews {
    [self addSubview:self.leftTextField];
    [self addSubview:self.lineView];
    [self addSubview:self.rightTextField];
    [self addSubview:self.rightLbl];
}

- (void)setUpConstraints {
    __weak typeof(self) wself = self;
    [self.rightLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(wself).offset(-10);
        make.centerY.equalTo(wself.lblTitle);
        make.width.lessThanOrEqualTo(@60);
        
    }];
    [self.rightTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(wself).offset(-10);
        make.centerY.equalTo(wself.lblTitle);
        make.width.equalTo(@(kTextFieldWidth));
        make.height.equalTo(@(kTextFieldHeight));
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(wself.rightTextField.mas_left).offset(-10);
        make.centerY.equalTo(wself.lblTitle);
        make.width.equalTo(@10);
        make.height.equalTo(@1);
    }];
    
    [self.leftTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(wself.lineView.mas_left).offset(-10);
        make.centerY.equalTo(wself.lblTitle);
        make.width.equalTo(@(kTextFieldWidth));
        make.height.equalTo(@(kTextFieldHeight));
    }];
}

- (void)configureViewWithModel:(TDFIntervalItem *)model {
    [super configureViewWithModel:model];
    self.model = model;
    _leftTextField.text = self.model.leftText;
    _rightTextField.text = self.model.rightText;
    
    if (self.model.leftPlaceholder) {
         _leftTextField.placeholder = self.model.leftPlaceholder;
    }
    if (self.model.leftAttributedPlaceholder.string) {
         _leftTextField.attributedPlaceholder = self.model.leftAttributedPlaceholder;
    }
    
    if (self.model.rightPlaceholder) {
        _rightTextField.placeholder = self.model.rightPlaceholder;
    }
    
    if (self.model.rightAttributedPlaceholder.string) {
        _rightTextField.attributedPlaceholder = self.model.rightAttributedPlaceholder;
    }
   
    
    BOOL isOne = self.model.type == TDFIntervalItemTypeOne;//是否是一个输入框
    self.leftTextField.hidden = isOne;
    self.lineView.hidden = isOne;
    
    __weak typeof(self) wself = self;
    if (self.model.promptText.length > 0) {//右侧提成文字有内容
        self.rightLbl.text = self.model.promptText;
        self.rightLbl.hidden = NO;
        [self.rightTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(wself.rightLbl.mas_left).offset(-10);
            make.centerY.equalTo(wself.lblTitle);
            make.width.equalTo(@(kTextFieldWidth));
            make.height.equalTo(@(kTextFieldHeight));
        }];
        
    } else {//右侧没有内容的时候
        self.rightLbl.hidden = YES;
        [self.rightTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(wself).offset(-10);
            make.centerY.equalTo(wself.lblTitle);
            make.width.equalTo(@(kTextFieldWidth));
            make.height.equalTo(@(kTextFieldHeight));
        }];

        
    }
    BOOL isEdit = model.editStyle == TDFEditStyleEditable;
    self.leftTextField.enabled = isEdit;
    self.rightTextField.enabled = isEdit;
    self.leftTextField.textColor = isEdit ? [TDFEditColorHelper hexBlueColor] : [TDFEditColorHelper cannotEditColor];
    self.rightTextField.textColor = isEdit ? [TDFEditColorHelper hexBlueColor] : [TDFEditColorHelper cannotEditColor];
    
    [self setUpTipShow];
}
/**
 设置文字
 */
- (void)setUpText {
    NSString *text = self.keyboard.content;
    if (self.model.isInputDecimal) {//如果可以输入小数
        if ([text containsString:@"."]) {//如果小数位大于2位
            NSString *lastText = [text componentsSeparatedByString:@"."].lastObject;
            if (lastText.length > 2) {
                [self resetPreText];
            }
        }
    } else {//如果不能输入小数
        if ([text containsString:@"."]) {
            [self resetPreText];
        }
    }
   
    if (text.doubleValue > self.model.maxValue) {//如果输入的大于最大值则取上一次输入的值
        [self resetPreText];
    }
    
    if (self.textField == self.leftTextField) {//如果是左边的输入框
        if (self.model.leftTextDidChangeBlock && !self.model.leftTextDidChangeBlock(self.keyboard.content)) {//如果block返回NO 取上次输入的值
            [self resetPreText];
        }
    }
    
    if (self.textField == self.rightTextField) {//如果是右边的输入框
        if (self.model.rightTextDidChangeBlock && !self.model.rightTextDidChangeBlock(self.keyboard.content)) {//如果block返回NO 取上次输入的值
            [self resetPreText];
        }
    }
   
    
    
    self.textField.text = self.keyboard.content;
    
    if (self.textField == self.leftTextField) {
        self.model.leftText = self.textField.text;
    }
    if (self.textField == self.rightTextField) {
        self.model.rightText = self.textField.text;
    }
    [self setUpTipShow];
}


/**
 重置上次输入的内容
 */
- (void)resetPreText {
    self.keyboard.content = self.textField.text;
}


/**
 设置未保存按钮的显示
 */
- (void)setUpTipShow {
    if ([self.model.leftPreText isEqualToString:self.model.leftText] && [self.model.rightPreText isEqualToString:self.model.rightText]) {
        self.model.isShowTip = NO;
        self.lblTip.hidden = YES;
    } else {
        self.model.isShowTip = YES;
        self.lblTip.hidden = NO;
    }
}


#pragma mark - <UIKeyInput>

/**
 点击数字调用这个

 @param text 点击的数字
 */
- (void)insertText:(NSString *)text {
    if (self.firstInput && self.model.shouldClearWhenBeginEditing) {//如果是第一次输入并且清空以前的值
        self.keyboard.content = text;
    }
    self.firstInput = NO;
    [self setUpText];
   
    
}


/**
 这个方法不可去掉不然闪退 如需要修改请慎重
 */
- (void)deleteBackward {
    [self setUpText];
    self.firstInput = NO;
}

- (BOOL)hasText {
    
    return YES;
}

#pragma mark - <UITextFieldDelegate>
// 是否允许用户输入文字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return NO;
}

// 文本框开始编辑的时候调用
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.firstInput = YES;
    self.textField = textField;
    self.keyboard.content = textField.text;
}

#pragma mark - setters && getters
- (UITextField *)leftTextField {
    if (!_leftTextField) {
        _leftTextField = [self createTextField];
    }
    return _leftTextField;
}

- (UITextField *)rightTextField {
    if (!_rightTextField) {
        _rightTextField = [self createTextField];
    }
    return _rightTextField;
}

- (BOOL)resignFirstResponder {
    [_leftTextField resignFirstResponder];
    [_rightTextField resignFirstResponder];
    return [super resignFirstResponder];
}

- (UITextField *)createTextField {
    UITextField *textField = [[UITextField alloc] init];
    textField.textColor = [TDFEditColorHelper hexBlueColor];
    textField.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    textField.font = [UIFont systemFontOfSize:15];
    textField.layer.cornerRadius = 5;
    textField.layer.borderWidth = 1;
    textField.layer.borderColor = [TDFEditColorHelper hex999999Color].CGColor;
    textField.layer.masksToBounds = YES;
    textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.inputView = self.keyboard;
    textField.delegate = self;
    return textField;
}

- (UILabel *)rightLbl {
    if (!_rightLbl) {
        _rightLbl = [[UILabel alloc] init];
        _rightLbl.font = [UIFont systemFontOfSize:15];
        _rightLbl.textColor = [TDFEditColorHelper hex333333Color];
    }
    return _rightLbl;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [TDFEditColorHelper hex333333Color];
    }
    return _lineView;
}

- (TDFNumbericKeyboard *)keyboard {
    if (!_keyboard) {
        _keyboard = [TDFNumbericKeyboard keyboardWithResponder:self title:self.lblTitle.text keyboardType:TDFNumbericKeyboardTypeFloat];
    }
    return _keyboard;
}


@end
