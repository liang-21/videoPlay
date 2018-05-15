//
//  TDFSKDoubleButtonItem.h
//  DHTTableViewManager
//
//  Created by tripleCC on 12/9/16.
//  Copyright © 2016 tripleCC. All rights reserved.
//

#import "DHTTableViewItem.h"
#import "TDFSKButtonItemTransaction.h"

// E:
//============================
//      确认   |   删除       //
//============================


@interface TDFSKDoubleButtonItem : DHTTableViewItem
/** 左事务 */
@property (strong, nonatomic) TDFSKButtonItemTransaction *leftTransaction;

/** 右事务 */
@property (strong, nonatomic) TDFSKButtonItemTransaction *rightTransaction;

/** 高度，默认76，按钮高度固定40 */
@property (assign, nonatomic) NSInteger cellHeight;

@end
