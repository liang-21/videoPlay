//
//  TDFLeftSwitchItem.h
//  Pods
//
//  Created by happyo on 2017/3/28.
//
//

#import "TDFBaseEditItem.h"

@interface TDFLeftSwitchItem : TDFBaseEditItem

/**
 开关显示状态
 */
@property (nonatomic, assign) BOOL isOn;

/**
 开关点击的回调，return no 表示状态不改变
 */
@property (nonatomic, strong) BOOL (^filterBlock)(BOOL isOn);

@property (nonatomic, strong) UIColor *titleColor;

@property (nonatomic, strong) NSString *subTitle;

@property (nonatomic, strong) UIColor *subTitleColor;

@end
