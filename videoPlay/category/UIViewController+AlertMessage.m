//
//  UIAlertController+AlertMessage.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/4.
//  Copyright © 2018年 梁世伟. All rights reserved.
//
#import <objc/runtime.h>
#import "UIViewController+AlertMessage.h"

@interface UIAlertController (Window)

- (void)show;
- (void)show:(BOOL)animated;

@end

@interface UIAlertController (Private)
@property (nonatomic, strong) UIWindow *alertWindow;

@end

@implementation UIAlertController (Private)

@dynamic alertWindow;

- (void)setAlertWindow:(UIWindow *)alertWindow {
    objc_setAssociatedObject(self, @selector(alertWindow), alertWindow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIWindow *)alertWindow {
    return objc_getAssociatedObject(self, @selector(alertWindow));
}
@end

@implementation UIAlertController (Window)

- (void)show {
    [self show:YES];
}

- (void)show:(BOOL)animated {
    self.alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.alertWindow.rootViewController = [[UIViewController alloc] init];
    
    id<UIApplicationDelegate> delegate = [UIApplication sharedApplication].delegate;
    // Applications that does not load with UIMainStoryboardFile might not have a window property:
    if ([delegate respondsToSelector:@selector(window)]) {
        // we inherit the main window's tintColor
        // 设置->通用->辅助功能->增强对比度->加深颜色  会造成按钮文字无法显示
        //        self.alertWindow.tintColor = delegate.window.tintColor;
    }
    
    // window level is above the top window (this makes the alert, if it's a sheet, show over the keyboard)
    UIWindow *topWindow = [UIApplication sharedApplication].windows.lastObject;
    self.alertWindow.windowLevel = topWindow.windowLevel + 1;
    
    [self.alertWindow makeKeyAndVisible];
    [self.alertWindow.rootViewController presentViewController:self animated:animated completion:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    self.alertWindow.hidden = YES;
    self.alertWindow = nil;
}

@end

@implementation UIAlertController (AlertMessage)
- (void)hideAnimated:(BOOL)animated afterDelay:(NSTimeInterval)delay {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:animated completion:nil];
    });
}
@end

@implementation UIViewController (AlertMessage)
- (UIAlertController *)showTipAlertWithMessage:(NSString *)message {
    UIAlertController *avc = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"提示", nil)
                                                                 message:message
                                                          preferredStyle:UIAlertControllerStyleAlert];
    [avc show];
    return avc;
}


- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle cancelTitle:(NSString *)cancelTitle confirm:(void(^)(void))confirmBlock cancel:(void (^)(void))cancelBlock{
    UIAlertController *avc = [UIAlertController alertControllerWithTitle:title
                                                                 message:message
                                                          preferredStyle:UIAlertControllerStyleAlert];
    [avc addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        if (cancelBlock) {
            
            cancelBlock();
        }
    }]];
    
    [avc addAction:[UIAlertAction actionWithTitle:confirmTitle
                                            style:UIAlertActionStyleDefault
                                          handler:^(UIAlertAction * _Nonnull action) {
                                              if (confirmBlock) {
                                                  
                                                  confirmBlock();
                                              }
                                          }]];
    [avc show];
}

- (void)showMessage:(NSString *)message confirmTitle:(NSString *)confirmTitle cancelTitle:(NSString *)cancelTitle confirm:(void(^)(void))confirmBlock cancel:(void (^)(void))cancelBlock {
    [self showAlertWithTitle:NSLocalizedString(@"提示", nil) message:message confirmTitle:confirmTitle cancelTitle:cancelTitle confirm:confirmBlock cancel:cancelBlock];
}

/**
 弹出提示框 类似原来的UIAlertView
 默认标题 提示
 默认按钮 取消 确认
 默认信息 message是空的可自定义文字
 
 @param message 提示信息
 @param confirm 点击确认回调 如果不需要传nil
 @param cancel 点击取消回调 如果不需要传nil
 */
- (void)showMessage:(NSString *)message confirm:(void(^)(void))confirmBlock cancel:(void (^)(void))cancelBlock {
    
    [self showMessage:message buttonTitle:NSLocalizedString(@"确认", nil) confirm:confirmBlock cancel:cancelBlock];
}

- (void)showAlert:(NSString *)message confirm:(void(^)(void))code {
    
    [self showAlert:message buttonTitle:NSLocalizedString(@"我知道了", nil) confirm:code];
}

- (void)showMessage:(NSString *)message buttonTitle:(NSString *)title confirm:(void (^)(void))confirmBlock cancel:(void (^)(void))cancelBlock {
    
    UIAlertController *avc = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"提示", nil)
                                                                 message:message
                                                          preferredStyle:UIAlertControllerStyleAlert];
    [avc addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        if (cancelBlock) {
            
            cancelBlock();
        }
    }]];
    
    [avc addAction:[UIAlertAction actionWithTitle:title
                                            style:UIAlertActionStyleDefault
                                          handler:^(UIAlertAction * _Nonnull action) {
                                              if (confirmBlock) {
                                                  
                                                  confirmBlock();
                                              }
                                          }]];
    [avc show];
}

- (void)showAlert:(NSString *)message buttonTitle:(NSString *)title confirm:(void (^)(void))code {
    
    UIAlertController *avc = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"提示", nil)
                                                                 message:message
                                                          preferredStyle:UIAlertControllerStyleAlert];
    [avc addAction:[UIAlertAction actionWithTitle:title
                                            style:UIAlertActionStyleDefault
                                          handler:^(UIAlertAction * _Nonnull action) {
                                              if (code) {
                                                  code();
                                              }
                                          }]];
    [avc show];
}

@end

