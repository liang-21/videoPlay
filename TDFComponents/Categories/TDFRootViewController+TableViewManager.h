//
//  TDFRootViewController+TableViewManager.h
//  RestApp
//
//  Created by happyo on 16/10/21.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFRootViewController.h"
@class DHTTableViewManager;

@interface TDFRootViewController (TableViewManager)

@property (nonatomic, strong) UITableView *tbvBase;

@property (nonatomic, strong) DHTTableViewManager *manager;


/**
 配置默认的manager，就不用自己去写了
 */
- (void)configDefaultManager;

- (void)configDefaultManagerWithStyle:(UITableViewStyle)style;
@end
