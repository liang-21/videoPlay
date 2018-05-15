//
//  TDFActionHeadItem.h
//  Pods
//
//  Created by 刘红琳 on 2017/7/4.
//
//

#import "DHTTableViewItem.h"

@interface TDFActionHeadItem : DHTTableViewItem
/** 是否显示 */
@property (nonatomic, assign) BOOL shouldShow;

@property (copy,nonatomic) NSString *title;
/** 是否显示底部线 */
@property (assign, nonatomic) BOOL isHideLine;
@end
