//
//  UITableViewCell+SeperatorLine.h
//  DHTTableViewManager
//
//  Created by tripleCC on 12/9/16.
//  Copyright © 2016 tripleCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHTTableViewItem.h"

@interface UITableViewCell (SeperatorLine)
//@property (weak, nonatomic, readonly) UITableView *tdf_tableView;

/** 显示上分割线 */
@property (assign, nonatomic) BOOL tdf_showTopLine;
@property (strong, nonatomic, readonly) UIView *tdf_topLineView;

/** 显示下分割线 */
@property (assign, nonatomic) BOOL tdf_showBottomLine;
@property (strong, nonatomic, readonly) UIView *tdf_bottomLineView;

/** 显示下间隔 */
@property (assign, nonatomic) BOOL tdf_showBottomMargin;

- (void)tdf_updateSeperatorWithItem:(DHTTableViewItem *)item;
@end
