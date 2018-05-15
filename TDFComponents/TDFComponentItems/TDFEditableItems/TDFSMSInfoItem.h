//
//  TDFSMSInfoItem.h
//  Pods
//
//  Created by 黄河 on 2017/7/14.
//
//

#import "DHTTableViewItem.h"

@interface TDFSMSInfoItem : DHTTableViewItem

@property (nonatomic, assign) BOOL hide;

@property (nonatomic, assign) int domestic;

@property (nonatomic, assign) int overseas;

@property (nonatomic, copy) void(^purchaseBlock)();
@end
