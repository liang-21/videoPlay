//
//  TDFIntervalItem.h
//  Pods
//
//  Created by guozhi on 2017/8/3.
//
//

typedef BOOL(^TDFIntervalItemBlock)(NSString *text);

#import "TDFBaseEditItem.h"

typedef NS_ENUM(NSInteger, TDFIntervalItemType) {
    TDFIntervalItemTypeOne,         // 默认一个输入框如果默认一个输入框 左边的文本框不显示 只用到右边的文本框
    TDFIntervalItemTypeTwo,            // 默认两个输入框
};

/**
 区间控件
 */
@interface TDFIntervalItem : TDFBaseEditItem

/**
 记录左边内容的初始值 这个值不会随着内容的改变而改变 
 默认是@""
 */
@property (nonatomic, copy) NSString *leftPreText;

/**
 左侧输入框的值 这个值和文本框的内容时刻保持统一 如果文本框初始值是2 然后输入了一个3 这时leftText则变成23
 默认是@""
 */
@property (nonatomic, copy) NSString *leftText;

/**
 记录右边内容的初始值 这个值不会随着内容的改变而改变
 默认是@""
 */
@property (nonatomic, copy) NSString *rightPreText;

/**
 右侧输入框的值 这个值和文本框的内容时刻保持统一 如果文本框初始值是2 然后输入了一个3 这时rightText则变成23
 默认是@""
 */
@property (nonatomic, copy) NSString *rightText;

/**
 提示文字 控件右边的提示文字 如果设置就显示 不设置就不显示 
 默认@“”
 */
@property (nonatomic, copy) NSString *promptText;

/**
 输入框类型
 默认是一个输入框
 */
@property (nonatomic, assign) TDFIntervalItemType type;

/**
 可以输入的最大数 整数最大可以输入6位 小数最大可以输入2位 如果输入位数过多显示不下 建议整数最大位数6位 小数2位
 maxValue 可以输入的最大的数 如果超过则不能输入
 默认是999999.99
 如果设置了limitInteger limitDecimal 则maxValue优先级高
 */
@property (nonatomic, assign) double maxValue;

/**
 是否可以输入小数
 默认是可以输入小数的
 如果不可以输入小数 则limitDecimal无效
 */
@property (nonatomic, assign) BOOL isInputDecimal;

/**
 限制整数位
 默认是6
 例： limitInteger = 3 则整数位最大只能输入999  整数位最大只能输入6位 如果需要具体的数字使用maxValue 如果同时设置了maxValue和limitInteger 则maxValue优先级高
 */
@property (nonatomic, assign) int limitInteger;

/**
 限制小数位
 默认是2
 例： limitDecimal = 2 则小数位最大只能输入99  整数位最大只能输入6位 如果需要具体的数字使用maxValue 如果同时设置了maxValue和limitInteger 则maxValue优先级高
 */
@property (nonatomic, assign) int limitDecimal;

/**
 是否在编辑的时候清除textField的值
 默认clear YES clear
 例：文本框默认的值是100 现在点击点击文本框弹出键盘出入了一个2 如果是YES 文本框的值变成2 如果是NO 则变成1002 
 */
@property (nonatomic) BOOL shouldClearWhenBeginEditing;

/**
 default is nil. string is drawn 70% gray
 */
@property (nonatomic,copy)   NSString *leftPlaceholder;

/**
 default is nil. string is drawn 70% gray
 */
@property (nonatomic,copy)   NSString *rightPlaceholder;

/**
 
 */
@property (nonatomic,copy)   NSAttributedString  *leftAttributedPlaceholder;

/**
 
 */
@property (nonatomic,copy)   NSAttributedString  *rightAttributedPlaceholder;



/**
 左侧输入框改变时的回调 这个block是有返回值的 如果返回为NO 则输入的文本的值不改变如果现在文本是@“123” 这是输入了一个@“4” 如果返回的是YES 则是1234 NO 则是 123
 */
@property (nonatomic, copy) TDFIntervalItemBlock leftTextDidChangeBlock;

/**
 右侧输入框改变时的回调 这个block是有返回值的 如果返回为NO 则输入的文本的值不改变如果现在文本是@“123” 这是输入了一个@“4” 如果返回的是YES 则是1234 NO 则是 123
 */
@property (nonatomic, copy) TDFIntervalItemBlock rightTextDidChangeBlock;


@end
