//
//  DHTTableViewManager.m
//  EffetivePlan
//
//  Created by happyo on 16/7/12.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTTableViewManager.h"
#import "DHTTableViewSection.h"
#import "TDFSectionItemProtocol.h"

@interface DHTTableViewManager () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *mutableSections;

@property (nonatomic, strong) NSMutableDictionary *registerCells;

@end
@implementation DHTTableViewManager

- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self) {
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        self.tableView = tableView;
    }
    
    return self;
}

#pragma mark -- Public Methods --

- (void)registerCell:(NSString *)cellString withItem:(NSString *)itemString
{
    self.registerCells[itemString] = cellString;
}

- (void)addSection:(DHTTableViewSection *)section
{
    [self.mutableSections addObject:section];
}

- (void)removeSection:(DHTTableViewSection *)section
{
    [self.mutableSections removeObject:section];
}

- (void)insertSection:(DHTTableViewSection *)section
         aboveSection:(DHTTableViewSection *)baseSection {
    NSAssert([self.mutableSections containsObject:baseSection], @"baseSection is't in this manager!");
    NSUInteger index = [self.mutableSections indexOfObject:baseSection];
    [self insertSection:section atIndex:index];
}

- (void)insertSection:(DHTTableViewSection *)section
         belowSection:(DHTTableViewSection *)baseSection; {
    NSAssert([self.mutableSections containsObject:baseSection], @"baseSection is't in this manager!");
    NSUInteger index = [self.mutableSections indexOfObject:baseSection];
    [self insertSection:section atIndex:index + 1];
}

- (void)insertSection:(DHTTableViewSection *)section atIndex:(NSUInteger)index
{
    [self.mutableSections insertObject:section atIndex:index];
}

- (void)removeSectionAtIndex:(NSUInteger)index
{
    [self.mutableSections removeObjectAtIndex:index];
}

- (void)removeLastSection
{
    [self.mutableSections removeLastObject];
}

- (void)removeAllSections
{
    [self.mutableSections removeAllObjects];
}

- (void)removeSectionWithIteamArry:(NSMutableArray*)arry
{
    [self.mutableSections removeObjectsInArray:arry];
}


- (void)reloadData
{
    [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
}

#pragma mark -- Private Methods --

- (Class)classForCellAtIndexPath:(NSIndexPath *)indexPath
{
    DHTTableViewItem *item = [self itemAtIndexPath:indexPath];
    
    NSString *cellString = self.registerCells[NSStringFromClass(item.class)];
    
    Class cellClass = NSClassFromString(cellString);
    
    NSAssert(cellClass, @"can't find reusable cell for item %@ at indexPath %@", item, indexPath);
    
    return cellClass;
}

- (DHTTableViewItem *)itemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.mutableSections.count > indexPath.section) {
        DHTTableViewSection *section = self.mutableSections[indexPath.section];
        if ([section.items count] > indexPath.row) {
            DHTTableViewItem *item = section.items[indexPath.row];
            item.indexPath = indexPath;
            [self setupPositionForItem:item inSection:section];
            
            return item;
        }
    }
    return nil;
}

- (void)setupPositionForItem:(DHTTableViewItem *)item inSection:(DHTTableViewSection *)section {
    DHTTableViewItemPosition position = DHTTableViewItemPositionAny;
    
    if (![item conformsToProtocol:@protocol(TDFSectionItemProtocol)]) {
        DHTTableViewItem *nextItem = nil;
        if (item.indexPath.row + 1 <= section.items.count - 1) {
            nextItem = section.items[item.indexPath.row + 1];
        }
        
        DHTTableViewItem *previousItem = nil;
        if (item.indexPath.row - 1 >= 0) {
            previousItem = section.items[item.indexPath.row - 1];
        }
        
        BOOL nextItemConforms = [nextItem conformsToProtocol:@protocol(TDFSectionItemProtocol)];
        BOOL previousItemConforms = [previousItem conformsToProtocol:@protocol(TDFSectionItemProtocol)];
        if (nextItemConforms || previousItemConforms) {
            
            if ((nextItemConforms && previousItemConforms) ||
                (previousItemConforms && item.indexPath.row == section.items.count - 1)) {
                position = DHTTableViewItemPositionSingle;
            } else if (nextItemConforms) {
                position = DHTTableViewItemPositionLast;
            } else if (previousItemConforms) {
                position = DHTTableViewItemPositionFirst;
            }
        } else {
            
            if (section.items.count > 1 && item.indexPath.row == 0) {
                position = DHTTableViewItemPositionFirst;
            } else if (section.items.count == 1 && item.indexPath.row == 0) {
                position = DHTTableViewItemPositionSingle;
            } else if (section.items.count > 1 && item.indexPath.row == section.items.count - 1) {
                position = DHTTableViewItemPositionLast;
            }
        }
    }
    item.position = position;
}

#pragma mark -- UITableViewDataSource --

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.mutableSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.mutableSections.count > section){
        DHTTableViewSection *tableSection = self.mutableSections[section];
        NSInteger numOfRows = tableSection.items.count;
        
        return numOfRows;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class cellClass = [self classForCellAtIndexPath:indexPath];
    NSString *cellIdentifier = [NSString stringWithUTF8String:object_getClassName(cellClass)];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        if ([cell respondsToSelector:@selector(cellDidLoad)]) {
            [cell performSelector:@selector(cellDidLoad)];
        }
    }
    
    if ([cell respondsToSelector:@selector(configCellWithItem:)]) {
        [cell performSelector:@selector(configCellWithItem:) withObject:[self itemAtIndexPath:indexPath]];
    }
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(cellWillDisplay)]) {
        
        [cell performSelector:@selector(cellWillDisplay)];
        
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(cellDidEndDisplay)]) {
        
        [cell performSelector:@selector(cellDidEndDisplay)];
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellHeight = 0;
    Class cellClass = [self classForCellAtIndexPath:indexPath];
    
    if ([cellClass conformsToProtocol:@protocol(DHTTableViewCellDelegate)]) {
        cellHeight = [cellClass heightForCellWithItem:[self itemAtIndexPath:indexPath]];
    }
    
    return cellHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.mutableSections.count > section) {
        DHTTableViewSection *tableSection = self.mutableSections[section];
        
        return tableSection.headerView;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (self.mutableSections.count > section){
        DHTTableViewSection *tableSection = self.mutableSections[section];
        
        return tableSection.footerView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.mutableSections.count > section)
    {
        DHTTableViewSection *tableSection = self.mutableSections[section];
        
        if (tableSection.headerHeight) {
            return tableSection.headerHeight;
        }
        
        return 0;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.mutableSections.count > section) {
        DHTTableViewSection *tableSection = self.mutableSections[section];
        
        if (tableSection.footerHeight) {
            return tableSection.footerHeight;
        }
        
        return 0;
    }
    return 0;
}

#pragma mark -- UITableViewDelegate --

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    DHTTableViewItem *item = [self itemAtIndexPath:indexPath];
    
    if (item.selectedBlock) {
        
        item.selectedBlock();
        
    }
}

#pragma mark -- UIScrollViewDelegate --

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // Forward to UIScrollView delegate
    //
    if ([self.delegate conformsToProtocol:@protocol(UIScrollViewDelegate)] && [self.delegate respondsToSelector:@selector(scrollViewDidScroll:)])
        [self.delegate scrollViewDidScroll:self.tableView];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    // Forward to UIScrollView delegate
    //
    if ([self.delegate conformsToProtocol:@protocol(UIScrollViewDelegate)] && [self.delegate respondsToSelector:@selector(scrollViewDidZoom:)])
        [self.delegate scrollViewDidZoom:self.tableView];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // Forward to UIScrollView delegate
    //
    if ([self.delegate conformsToProtocol:@protocol(UIScrollViewDelegate)] && [self.delegate respondsToSelector:@selector(scrollViewWillBeginDragging:)])
        [self.delegate scrollViewWillBeginDragging:self.tableView];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    // Forward to UIScrollView delegate
    //
    if ([self.delegate conformsToProtocol:@protocol(UIScrollViewDelegate)] && [self.delegate respondsToSelector:@selector(scrollViewWillEndDragging:withVelocity:targetContentOffset:)])
        [self.delegate scrollViewWillEndDragging:self.tableView withVelocity:velocity targetContentOffset:targetContentOffset];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    // Forward to UIScrollView delegate
    //
    if ([self.delegate conformsToProtocol:@protocol(UIScrollViewDelegate)] && [self.delegate respondsToSelector:@selector(scrollViewDidEndDragging:willDecelerate:)])
        [self.delegate scrollViewDidEndDragging:self.tableView willDecelerate:decelerate];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    // Forward to UIScrollView delegate
    //
    if ([self.delegate conformsToProtocol:@protocol(UIScrollViewDelegate)] && [self.delegate respondsToSelector:@selector(scrollViewWillBeginDecelerating:)])
        [self.delegate scrollViewWillBeginDecelerating:self.tableView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // Forward to UIScrollView delegate
    //
    if ([self.delegate conformsToProtocol:@protocol(UIScrollViewDelegate)] && [self.delegate respondsToSelector:@selector(scrollViewDidEndDecelerating:)])
        [self.delegate scrollViewDidEndDecelerating:self.tableView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // Forward to UIScrollView delegate
    //
    if ([self.delegate conformsToProtocol:@protocol(UIScrollViewDelegate)] && [self.delegate respondsToSelector:@selector(scrollViewDidEndScrollingAnimation:)])
        [self.delegate scrollViewDidEndScrollingAnimation:self.tableView];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    // Forward to UIScrollView delegate
    //
    if ([self.delegate conformsToProtocol:@protocol(UIScrollViewDelegate)] && [self.delegate respondsToSelector:@selector(viewForZoomingInScrollView:)])
        return [self.delegate viewForZoomingInScrollView:self.tableView];
    
    return nil;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    // Forward to UIScrollView delegate
    //
    if ([self.delegate conformsToProtocol:@protocol(UIScrollViewDelegate)] && [self.delegate respondsToSelector:@selector(scrollViewWillBeginZooming:withView:)])
        [self.delegate scrollViewWillBeginZooming:self.tableView withView:view];
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    // Forward to UIScrollView delegate
    //
    if ([self.delegate conformsToProtocol:@protocol(UIScrollViewDelegate)] && [self.delegate respondsToSelector:@selector(scrollViewDidEndZooming:withView:atScale:)])
        [self.delegate scrollViewDidEndZooming:self.tableView withView:view atScale:scale];
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    // Forward to UIScrollView delegate
    //
    if ([self.delegate conformsToProtocol:@protocol(UIScrollViewDelegate)] && [self.delegate respondsToSelector:@selector(scrollViewShouldScrollToTop:)])
        return [self.delegate scrollViewShouldScrollToTop:self.tableView];
    return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    // Forward to UIScrollView delegate
    //
    if ([self.delegate conformsToProtocol:@protocol(UIScrollViewDelegate)] && [self.delegate respondsToSelector:@selector(scrollViewDidScrollToTop:)])
        [self.delegate scrollViewDidScrollToTop:self.tableView];
}


#pragma mark -- Setters && Getters --

- (NSArray *)sections
{
    return self.mutableSections;
}

- (NSMutableArray *)mutableSections
{
    if (!_mutableSections) {
        _mutableSections = [NSMutableArray array];
    }
    
    return _mutableSections;
}

- (NSMutableDictionary *)registerCells
{
    if (!_registerCells) {
        _registerCells = [NSMutableDictionary dictionary];
    }
    
    return _registerCells;
}

- (void)reloadCellAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}



@end
