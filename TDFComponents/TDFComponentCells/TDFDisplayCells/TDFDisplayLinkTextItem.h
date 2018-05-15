//
//  TDFDisplayLinkTextItem.h
//  TDFElectronicWalletModule
//
//  Created by chaiweiwei on 2017/11/29.
//

#import "DHTTableViewItem.h"
#import "TDFBaseEditItem.h"

@interface TDFDisplayLinkTextItem : DHTTableViewItem<TDFEditCommonPropertyProtocol>
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

/** 展示下划线 */
@property (assign, nonatomic) BOOL showSplitLine;

/** 背景颜色 */
@property (strong, nonatomic) UIColor *backgroundColor;

@property (copy,nonatomic) NSString *linkText;

@property (copy,nonatomic) void (^linkActionCallback)(void);

@end
