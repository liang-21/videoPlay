//
//  TDFCircleCheckItem.h
//  Pods
//
//  Created by chaiweiwei on 2017/5/2.
//
//

#import "TDFBaseEditItem.h"

@interface TDFCircleCheckItem : TDFBaseEditItem

/**
 开关显示状态
 */
@property (assign, getter=isCheck) BOOL check;

/**
 开关点击的回调，return no 表示状态不改变
 */
@property (nonatomic, strong) BOOL (^filterBlock)(BOOL isCheck);

@end
