//
//  UIViewController+TableViewManager.h
//  TDFComponents
//
//  Created by tripleCC on 2017/11/7.
//

#import <UIKit/UIKit.h>
@class DHTTableViewManager;
@interface UIViewController (TableViewManager)

@property (nonatomic, strong) UITableView *tbvBase;

@property (nonatomic, strong) DHTTableViewManager *manager;


/**
 配置默认的manager，就不用自己去写了
 */
- (void)configDefaultManager;

- (void)configDefaultManagerWithStyle:(UITableViewStyle)style;
@end
