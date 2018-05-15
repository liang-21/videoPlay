//
//  DHTTableViewSection.h
//  EffetivePlan
//
//  Created by happyo on 16/7/12.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHTTableViewItem.h"

@interface DHTTableViewSection : NSObject

@property (nonatomic, readonly, strong) NSArray *items;

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) UIView *footerView;

@property (nonatomic, assign) CGFloat headerHeight;

@property (nonatomic, assign) CGFloat footerHeight;

+ (instancetype)section;

+ (instancetype)sectionWithTitle:(NSString *)title;

+ (instancetype)sectionWithClearHeader:(CGFloat)height;

+ (instancetype)sectionWithTitleHeader:(NSString *)title;

+ (instancetype)sectionWithTitleHeader:(NSString *)title font:(CGFloat)font;

+ (instancetype)sectionWithTitle:(NSString *)title font:(UIFont *)font textColor:(UIColor *)textColor;

+ (instancetype)sectionWithTipsStr:(NSString *)title;

- (void)addItem:(DHTTableViewItem *)item;

- (void)addItems:(NSArray<DHTTableViewItem *> *)items;

- (void)insertItem:(DHTTableViewItem *)item atIndex:(NSUInteger)index;

- (void)insertItem:(DHTTableViewItem *)item aboveItem:(DHTTableViewItem *)baseItem;

- (void)insertItem:(DHTTableViewItem *)item belowItem:(DHTTableViewItem *)baseItem;

- (void)insertItems:(NSArray *)items atIndexes:(NSIndexSet *)indexes;

- (void)removeItem:(DHTTableViewItem *)item;

- (void)removeItemAtIndex:(NSUInteger)index;

- (void)removeLastItem;

- (void)removeAllItems;

- (void)setItems:(NSArray *)items;


@end
