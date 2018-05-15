//
//  TDFSearchBar.h
//  Pods
//
//  Created by happyo on 2016/12/6.
//
//

#import <UIKit/UIKit.h>
@class TDFSearchBarNew;

@protocol TDFSearchBarNewDelegate <NSObject>

@optional

- (void)searchBarSearchButtonClicked:(TDFSearchBarNew *)searchBar;                     // called when keyboard search button pressed
- (void)searchBarCancelButtonClicked:(TDFSearchBarNew *)searchBar __TVOS_PROHIBITED;   // called when cancel button pressed

//- (void)searchBarResultsListButtonClicked:(TDFSearchBar *)searchBar NS_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED; // called when search results button pressed
//- (void)searchBarBookmarkButtonClicked:(TDFSearchBar *)searchBar __TVOS_PROHIBITED; // called when bookmark button pressed
//- (void)searchBar:(TDFSearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope NS_AVAILABLE_IOS(3_0);
//- (BOOL)searchBarShouldBeginEditing:(TDFSearchBar *)searchBar;                      // return NO to not become first responder
//- (void)searchBarTextDidBeginEditing:(TDFSearchBar *)searchBar;                     // called when text starts editing
//- (BOOL)searchBarShouldEndEditing:(TDFSearchBar *)searchBar;                        // return NO to not resign first responder
//- (void)searchBarTextDidEndEditing:(TDFSearchBar *)searchBar;                       // called when text ends editing
//- (void)searchBar:(TDFSearchBar *)searchBar textDidChange:(NSString *)searchText;   // called when text changes (including clear)
//- (BOOL)searchBar:(TDFSearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_AVAILABLE_IOS(3_0); // called before text changes

@end

@interface TDFSearchBarNew : UIView

@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) NSString *placeholder;

@property (nonatomic, strong) NSString *rightButtonTitle;

@property (nonatomic, weak) id<TDFSearchBarNewDelegate> delegate;

@end
