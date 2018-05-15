//
//  TDFSKDisplayedTextItem.h
//  DHTTableViewManager
//
//  Created by tripleCC on 12/10/16.
//  Copyright © 2016 tripleCC. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "TDFBaseEditItem.h"

// E:
//=================================
//  最多只能添加两次，最多只能添加两次，//
//  最多只能添加两次                 //
//=================================


UIKIT_EXTERN const CGFloat kTDFSKDisplayedTextCommonMargin;

@interface TDFSKDisplayedTextItem : DHTTableViewItem <TDFEditCommonPropertyProtocol>
/** 是否显示 */
@property (nonatomic, assign) BOOL shouldShow;

/** 文本 */
@property (copy, nonatomic) NSString *text;

/** 颜色 */
@property (strong, nonatomic) UIColor *textColor;

/** 对其方式 */
@property(nonatomic) NSTextAlignment textAlignment;

/** font */
@property (strong, nonatomic) UIFont *font;

/** 上间距 */
@property (assign, nonatomic) CGFloat topMargin;

/** 下边距 */
@property (assign, nonatomic) CGFloat bottomMargin;

/** 兼容*/
@property (assign, nonatomic) BOOL isNeedResetLeftMargin;

/** 左边距*/
@property (assign, nonatomic) CGFloat leftMargin;
/** 右边距*/
@property (assign, nonatomic) CGFloat rightMargin;

/** 展示下划线 */
@property (assign, nonatomic) BOOL showSplitLine;

/** 背景颜色 */
@property (strong, nonatomic) UIColor *backgroundColor;
//富文本
@property (nonatomic, strong)NSAttributedString *attributedTitle;
@end
