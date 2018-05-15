//
//  DHTTableViewItem.h
//  EffetivePlan
//
//  Created by happyo on 16/7/12.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DHTTableViewItemPosition) {
    DHTTableViewItemPositionSingle,
    DHTTableViewItemPositionFirst,
    DHTTableViewItemPositionLast,
    DHTTableViewItemPositionAny,
};

@interface DHTTableViewItem : NSObject

+ (instancetype)item;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) void (^selectedBlock)();

@property (assign, nonatomic) DHTTableViewItemPosition position;
@end
