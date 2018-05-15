//
//  DHTTableViewManager.h
//  EffetivePlan
//
//  Created by happyo on 16/7/12.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHTTableViewItem.h"
#import "DHTTableViewCellProtocol.h"
#import "DHTTableViewSection.h"

@protocol DHTTableViewManagerDelegate <UIScrollViewDelegate>


@end

@interface DHTTableViewManager : NSObject

/**
 UIScrollViewDelegate相关的manager不作处理，交给外面处理
 */
@property (nonatomic, weak) id<DHTTableViewManagerDelegate> delegate;

@property (nonatomic, readonly, strong) NSArray *sections;


- (instancetype)initWithTableView:(UITableView *)tableView;

- (void)registerCell:(NSString *)cellString withItem:(NSString *)itemString;

- (void)addSection:(DHTTableViewSection *)section;

- (void)removeSection:(DHTTableViewSection *)section;

- (void)insertSection:(DHTTableViewSection *)section
         aboveSection:(DHTTableViewSection *)baseSection;

- (void)insertSection:(DHTTableViewSection *)section
         belowSection:(DHTTableViewSection *)baseSection;

- (void)insertSection:(DHTTableViewSection *)section atIndex:(NSUInteger)index;

- (void)removeSectionAtIndex:(NSUInteger)index;

- (void)removeSectionWithIteamArry:(NSMutableArray*)arry;

- (void)removeLastSection;

- (void)removeAllSections;

- (void)reloadData;

- (void)reloadCellAtIndexPath:(NSIndexPath *)indexPath;

@end


