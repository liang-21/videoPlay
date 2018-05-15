//
//  TDFTextInputViewController.h
//  TDFKouBeiGoodsModule_Example
//
//  Created by 梁世伟 on 2017/12/18.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import <TDFCore/TDFCore.h>

@interface TDFTextInputViewController : TDFRootViewController

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

