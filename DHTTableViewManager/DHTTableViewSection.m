//
//  DHTTableViewSection.m
//  EffetivePlan
//
//  Created by happyo on 16/7/12.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTTableViewSection.h"

@interface DHTTableViewSection ()

@property (nonatomic, readwrite, strong) NSMutableArray *mutableItems;

@end
@implementation DHTTableViewSection

+ (instancetype)section
{
    DHTTableViewSection *section = [[self alloc] init];

    return section;
}

+ (instancetype)sectionWithClearHeader:(CGFloat)height {
    DHTTableViewSection *section = [DHTTableViewSection section];
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    section.headerView = view;
    section.headerHeight = height;
    return section;
}

+ (instancetype)sectionWithTitle:(NSString *)title {
    DHTTableViewSection *section = [DHTTableViewSection section];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 66)];
    view.backgroundColor = [UIColor clearColor];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 36, CGRectGetWidth([UIScreen mainScreen].bounds) - 20, 20)];
    lbl.font = [UIFont boldSystemFontOfSize:15];
    lbl.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [view addSubview:lbl];
    lbl.text = title;
    section.headerView = view;
    section.headerHeight = 66;
    section.footerHeight = CGFLOAT_MIN;
    return section;
}

+ (instancetype)sectionWithTitleHeader:(NSString *)title
{
    DHTTableViewSection *section = [[self alloc] init];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 44)];
    sectionView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];

    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, screenWidth, 15)];
    lblTitle.font = [UIFont boldSystemFontOfSize:15];
    lblTitle.text = title;
    
    UIView *spliteTopView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 1)];
    spliteTopView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    
    UIView *spliteBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 43, screenWidth, 1)];
    spliteBottomView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    
    [sectionView addSubview:lblTitle];
    [sectionView addSubview:spliteTopView];
    [sectionView addSubview:spliteBottomView];
    
    section.headerView = sectionView;
    section.headerHeight = 44;
    
    return section;
}


+(instancetype)sectionWithTitleHeader:(NSString *)title font:(CGFloat)font
{
    DHTTableViewSection *section = [[self alloc] init];
	
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 48)];
    sectionView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 14, screenWidth, 21)];
    lblTitle.font = [UIFont boldSystemFontOfSize:font];
    lblTitle.text = title;
    
    UIView *spliteTopView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 1)];
    spliteTopView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    
    UIView *spliteBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 47, screenWidth, 1)];
    spliteBottomView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    
    [sectionView addSubview:lblTitle];
    [sectionView addSubview:spliteTopView];
    [sectionView addSubview:spliteBottomView];
    
    section.headerView = sectionView;
    section.headerHeight = 48;
    
    return section;
}

+(instancetype)sectionWithTipsStr:(NSString *)title
{
    DHTTableViewSection *section = [[self alloc] init];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 48)];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, screenWidth-20, 20)];
    lblTitle.numberOfLines = 0;
    lblTitle.font = [UIFont systemFontOfSize:11];
    lblTitle.textColor = [UIColor grayColor];
    lblTitle.text = title;
    
    lblTitle.preferredMaxLayoutWidth = screenWidth-20;
    
    [lblTitle sizeToFit];
    
    [sectionView addSubview:lblTitle];
    
    CGRect secFrame = sectionView.frame;
    
    secFrame.size.height = lblTitle.frame.origin.y +lblTitle.frame.size.height+10;
    
    [sectionView setFrame:secFrame];
    
    section.headerView = sectionView;
    
    section.headerHeight = sectionView.frame.size.height;
    
    return section;
}

+(instancetype)sectionWithTitle:(NSString *)title font:(UIFont *)font textColor:(UIColor *)textColor {
    DHTTableViewSection *section = [[self alloc] init];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 48)];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, screenWidth-20, 20)];
    lblTitle.numberOfLines = 0;
    lblTitle.font = font;
    lblTitle.textColor = textColor;
    lblTitle.text = title;
    
    lblTitle.preferredMaxLayoutWidth = screenWidth-20;
    
    [lblTitle sizeToFit];
    
    [sectionView addSubview:lblTitle];
    
    CGRect secFrame = sectionView.frame;
    
    secFrame.size.height = lblTitle.frame.origin.y +lblTitle.frame.size.height+10;
    
    [sectionView setFrame:secFrame];
    
    section.headerView = sectionView;
    
    section.headerHeight = sectionView.frame.size.height;
    
    return section;
}


- (void)addItem:(DHTTableViewItem *)item
{
    [self.mutableItems addObject:item];
}

- (void)addItems:(NSArray<DHTTableViewItem *> *)items
{
    [self.mutableItems addObjectsFromArray:items];
}

- (void)insertItem:(DHTTableViewItem *)item aboveItem:(DHTTableViewItem *)baseItem {
    NSAssert([self.mutableItems containsObject:baseItem], @"baseItem is't in this section");
    if ([self.mutableItems containsObject:baseItem]) {
        NSInteger index = [self.mutableItems indexOfObject:baseItem];
        [self insertItem:item atIndex:index];
    }
}

- (void)insertItem:(DHTTableViewItem *)item belowItem:(DHTTableViewItem *)baseItem {
    NSAssert([self.mutableItems containsObject:baseItem], @"baseItem is't in this section");
    if ([self.mutableItems containsObject:baseItem]) {
        NSInteger index = [self.mutableItems indexOfObject:baseItem];
        [self insertItem:item atIndex:index + 1];
    }
}

- (void)insertItem:(DHTTableViewItem *)item atIndex:(NSUInteger)index
{
    [self.mutableItems insertObject:item atIndex:index];
}

- (void)insertItems:(NSArray *)items atIndexes:(NSIndexSet *)indexes
{
    [self.mutableItems insertObjects:items atIndexes:indexes];
}

- (void)removeItem:(DHTTableViewItem *)item
{
    [self.mutableItems removeObject:item];
}

- (void)removeItemAtIndex:(NSUInteger)index
{
    [self.mutableItems removeObjectAtIndex:index];
}

- (void)removeLastItem
{
    [self.mutableItems removeLastObject];
}

- (void)removeAllItems
{
    [self.mutableItems removeAllObjects];
}

- (NSArray *)items
{
    return self.mutableItems;
}

- (NSMutableArray *)mutableItems
{
    if (!_mutableItems) {
        _mutableItems = [NSMutableArray array];
    }
    
    return _mutableItems;
}

- (void)setItems:(NSArray *)items {
    
    self.mutableItems = [NSMutableArray arrayWithArray:items];
}


@end
