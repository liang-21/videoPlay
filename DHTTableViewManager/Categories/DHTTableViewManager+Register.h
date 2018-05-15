//
//  DHTTableViewManager+Register.h
//  Pods
//
//  Created by tripleCC on 12/14/16.
//
//

#import "DHTTableViewManager.h"

#define S(item) NSStringFromClass([item class])


@interface DHTTableViewManager (Register)
- (UITableView *)tdf_tableView;

/**
 移除所有元素，包括Item、Section
 */
- (void)removeAll;

/**
 添加section与其对应的items
 
 内部会自动对item进行注册，不需要调用registerItems
 
 分页列表类不要用这个，注册一次就行了
 这个方法主要针对详情页，item种类繁多的情况

 @param section section
 @param firstItem items
 */
- (void)addSection:(DHTTableViewSection *)section withLiteralItems:(DHTTableViewItem *)firstItem, ... NS_REQUIRES_NIL_TERMINATION;

- (void)addSection:(DHTTableViewSection *)section withItems:(NSArray <DHTTableViewItem *> *)items;

/**
 将items添加到section

 内部会自动对item进行注册，不需要调用registerItems
 
 分页列表类不要用这个，注册一次就行了
 这个方法主要针对详情页，item种类繁多的情况
 
 @param items items
 @param section section
 */
- (void)addItems:(NSArray *)items toSection:(DHTTableViewSection *)section;

/**
 注册所有已有item
 
 分页列表类不要用这个，注册一次就行了
 这个方法主要针对详情页，item种类繁多的情况
 
 在所有Item添加完毕后，调用此方法将会自动注册添加的Item类型
 */
- (void)registerAllItems;

/**
 注册item

 [xxxx  registerItems:@[S(DHTTableViewItem)]]
 
 @param items 注册的item数组
 */
- (void)registerItems:(NSArray <NSString *> *)items;

/**
 刷新item响应到界面

 @param item 刷新的item
 */
- (void)reloadDisplayedItem:(DHTTableViewItem *)item;


/**
 刷新多个item响应到界面

 @param items 需要刷新的items
 */
- (void)reloadDisplayedItems:(NSArray <DHTTableViewItem *> *)items;

/**
 删除item响应到界面
 
 @param item 删除的item
 */
- (void)deleteDisplayedItem:(DHTTableViewItem *)item;
@end
