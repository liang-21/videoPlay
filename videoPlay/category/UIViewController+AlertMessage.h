//
//  UIAlertController+AlertMessage.h
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/4.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIViewController (AlertMessage)
- (void)hideAnimated:(BOOL)animated afterDelay:(NSTimeInterval)delay;
@end

@interface UIViewController (AlertMessage)
- (UIAlertController *)showTipAlertWithMessage:(NSString *)message;

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle cancelTitle:(NSString *)cancelTitle confirm:(void(^)(void))confirmBlock cancel:(void (^)(void))cancelBlock;

/// 用来替换 AlertBox 的 show Alert
- (void)showAlert:(NSString *)message confirm:(void(^)(void))code;
- (void)showAlert:(NSString *)message buttonTitle:(NSString *)title confirm:(void(^)(void))code;


/// 用来替换 AlertBox 的 show message
- (void)showMessage:(NSString *)message confirmTitle:(NSString *)confirmTitle cancelTitle:(NSString *)cancelTitle confirm:(void(^)(void))confirmBlock cancel:(void (^)(void))cancelBlock;

/**
 弹出提示框 类似原来的UIAlertView
 默认标题 提示
 默认按钮 取消 确认
 默认信息 message是空的可自定义文字
 
 @param message 提示信息
 @param confirm 点击确认回调 如果不需要传nil
 @param cancel 点击取消回调 如果不需要传nil
 */
- (void)showMessage:(NSString *)message confirm:(void(^)(void))confirmBlock cancel:(void (^)(void))cancelBlock;

/**
 弹出提示框 类似原来的UIAlertView
 默认标题 提示
 默认按钮 取消
 默认信息 message是空的可自定义文字
 
 @param message 提示信息
 @param buttonTitle 自定义确认按钮
 @param confirm 点击确认回调 如果不需要传nil
 @param cancel 点击取消回调 如果不需要传nil
 */
- (void)showMessage:(NSString *)message buttonTitle:(NSString *)title confirm:(void(^)(void))confirmBlock cancel:(void (^)(void))cancelBlock;

@end

