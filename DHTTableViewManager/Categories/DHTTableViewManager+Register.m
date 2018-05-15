//
//  DHTTableViewManager+Register.m
//  Pods
//
//  Created by tripleCC on 12/14/16.
//
//

#import "DHTTableViewManager+Register.h"

@implementation DHTTableViewManager (Register)
- (void)removeAll {
    for (DHTTableViewSection *section in self.sections) {
        [section removeAllItems];
    }
    [self removeAllSections];
}

- (void)addItems:(NSArray *)items toSection:(DHTTableViewSection *)section {
    [section addItems:items];
    
    NSMutableArray *itemsClass = [NSMutableArray array];
    for (DHTTableViewItem *item in items) {
        [itemsClass addObject:S([item class])];
    }
    [self registerItems:itemsClass];
}

- (void)addSection:(DHTTableViewSection *)section withItems:(NSArray <DHTTableViewItem *> *)items {
    NSMutableArray *itemsClass = [NSMutableArray array];
    for (DHTTableViewItem *item in items) {
        [itemsClass addObject:S([item class])];
    }
    [self registerItems:itemsClass];
    [section addItems:items];
    [self addSection:section];
}

- (void)addSection:(DHTTableViewSection *)section withLiteralItems:(DHTTableViewItem *)firstItem, ...{
    NSCParameterAssert(firstItem != nil);
    
    NSMutableArray *items = [NSMutableArray array];
    
    va_list args;
    va_start(args, firstItem);
    for (id currentItem = firstItem; currentItem != nil; currentItem = va_arg(args, id)) {
        [items addObject:currentItem];
    }
    va_end(args);
    
    [self addSection:section withItems:items];
}

- (void)registerAllItems {
    NSMutableArray *itemsClass = [NSMutableArray array];
    for (DHTTableViewSection *section in self.sections) {
        for (DHTTableViewItem *item in section.items) {
            [itemsClass addObject:S([item class])];
        }
    }
    [self registerItems:itemsClass];
}

- (void)registerItems:(NSArray <NSString *> *)items {
    NSString *realItem = nil;
    for (NSString *item in items) {
        if ([item hasSuffix:@"Item"]) {
            realItem = [item stringByReplacingOccurrencesOfString:@"Item" withString:@""];
        }
        NSString *cell = [realItem stringByAppendingString:@"Cell"];
        NSString *item = [realItem stringByAppendingString:@"Item"];
        
        NSAssert(NSClassFromString(cell) && NSClassFromString(item), @"can't find cell %@ or item %@", cell, item);
        
        [self registerCell:cell withItem:item];
        
        __weak;
    }
}

- (void)reloadDisplayedItem:(DHTTableViewItem *)item {
    NSCParameterAssert(item.indexPath);
    
    UITableView *tableView = [self valueForKey:@"tableView"];
    [tableView reloadRowsAtIndexPaths:@[item.indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)reloadDisplayedItems:(NSArray<DHTTableViewItem *>*)items {
    UITableView *tableView = [self valueForKey:@"tableView"];
    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    [items enumerateObjectsUsingBlock:^(DHTTableViewItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [indexPaths addObject:obj.indexPath];
    }];
    [tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
}

- (void)deleteDisplayedItem:(DHTTableViewItem *)item {
    NSCParameterAssert(item.indexPath);
    
    UITableView *tableView = [self valueForKey:@"tableView"];
    [tableView deleteRowsAtIndexPaths:@[item.indexPath] withRowAnimation:UITableViewRowAnimationNone];
}




@end
