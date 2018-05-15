//
//  LSWTextInputViewController.h
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/4.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSWTextInputViewController : UIViewController
typedef NS_ENUM(NSInteger, TDFTextInputNavigationStyle) {
    TDFTextInputNavigationStyleCancel,
    TDFTextInputNavigationStyleNone,
};

@property (nonatomic, copy) void(^saveContentBlock)(NSString *str);

@property (nonatomic, copy) void(^buttonClickBlock)(void);

@property (copy, nonatomic) NSString *savedContent;

@property (nonatomic, assign) BOOL isShowButton;

@property (nonatomic, assign) BOOL isHideNumberLable;

@property (nonatomic, assign) NSUInteger limitation;

@property (nonatomic, copy) NSString *navTitle;

@property (nonatomic, copy) NSString *buttonTitle;

@property (nonatomic, copy) NSString *placeHolderContent;


@property (nonatomic ,assign) TDFTextInputNavigationStyle NavigationStyle;

@end
