//
//  AnimationTextField.h
//  登陆界面的动画
//
//  Created by zhangjiang on 15/6/12.
//  Copyright (c) 2015年 张江. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    AnimationFieldTypeBound,
    AnimationFieldTypeUp,
    AnimationFieldTypeShake
}AnimationFieldType;

@interface AnimationTextField : UIView
/**
 *  输入框文字颜色
 */
@property(strong,nonatomic) UIColor *textColor;
/**
 *  占位符
 */
@property (copy,nonatomic)NSString *placeStr;
/**
 *  占位符颜色
 */
@property(strong,nonatomic) UIColor *placeholderColor;
/**
 *  占位符字体，和textField字体大小相同
 */
@property(strong,nonatomic) UIFont *placeholderFont;
/**
 *  文字对齐方式
 */
@property (assign,nonatomic)NSTextAlignment textAlignment;
/**
 *  输入的文字类容
 */
@property (copy,nonatomic,readonly)NSString *textInput;
/**
 *  动画类型
 */
@property (assign,nonatomic)AnimationFieldType animationType;




@end
