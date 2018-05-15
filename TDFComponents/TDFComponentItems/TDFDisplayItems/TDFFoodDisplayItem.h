//
//  TDFFoodDisplayItem.h
//  Pods
//
//  Created by happyo on 2016/11/28.
//
//

#import "DHTTableViewItem.h"

@interface TDFFoodDisplayItem : DHTTableViewItem

@property (nonatomic, strong) NSString *foodId;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) void (^deleteBlock)(NSString *foodId);

@end
