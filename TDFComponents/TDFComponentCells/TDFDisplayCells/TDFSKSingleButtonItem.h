//
//  TDFSKSingleButtonItem.h
//  DHTTableViewManager
//
//  Created by tripleCC on 12/9/16.
//  Copyright © 2016 tripleCC. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "DHTTableViewItem.h"
#import "TDFSKButtonItemTransaction.h"
#import "TDFBaseEditItem.h"
// E:
//============================
//         确认提交           //
//============================


@interface TDFSKSingleButtonItem : DHTTableViewItem<TDFEditCommonPropertyProtocol>

/** 事务 */
@property (strong, nonatomic) TDFSKButtonItemTransaction *transaction;

/** 高度，默认76，按钮高度固定40 */
@property (assign, nonatomic) NSInteger cellHeight;

/** 是否显示 */
@property (nonatomic, assign) BOOL shouldShow;

/** 背景颜色 */
@property (strong, nonatomic) UIColor *backgroundColor;

@end
