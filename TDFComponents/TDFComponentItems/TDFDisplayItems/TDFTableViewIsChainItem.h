//
//  TDFTableViewIsChainItem.h
//  Pods
//
//  Created by 刘红琳 on 2017/5/17.
//
//

#import "DHTTableViewItem.h"

@interface TDFTableViewIsChainItem : DHTTableViewItem
/** 是否显示 */
@property (nonatomic, assign) BOOL shouldShow;

@property (copy,nonatomic) NSString *title;
/** 是否显示右侧删除按钮 */
@property (assign, nonatomic) BOOL isDelete;
/** 是否显示底部线 */
@property (assign, nonatomic) BOOL isHideLine;
/** 是否连锁 */
@property (assign, nonatomic) BOOL isChain;
/** 背景颜色 */
@property (copy, nonatomic) UIColor *bgViewColor;
@property (nonatomic, copy) void (^didSelectRowBlock)(void);
@end
