//
//  TDFRootViewController+TableViewManager.m
//  RestApp
//
//  Created by happyo on 16/10/21.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFRootViewController+TableViewManager.h"
#import <objc/runtime.h>
#import "DHTTableViewManager.h"

static const void *tbvBaseKey = &tbvBaseKey;
static const void *managerKey = &managerKey;

@implementation TDFRootViewController (TableViewManager)

@dynamic tbvBase;
@dynamic manager;

- (UITableView *)tbvBase
{
    return objc_getAssociatedObject(self, &tbvBaseKey);
}

- (void)setTbvBase:(UITableView *)tbvBase
{
    objc_setAssociatedObject(self, &tbvBaseKey, tbvBase, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (DHTTableViewManager *)manager
{
    return objc_getAssociatedObject(self, &managerKey);
}

- (void)setManager:(DHTTableViewManager *)manager
{
    objc_setAssociatedObject(self, &managerKey, manager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)configDefaultManagerWithStyle:(UITableViewStyle)style {
    self.tbvBase = [[UITableView alloc] initWithFrame:self.view.bounds style:style];
    self.tbvBase.contentInset = UIEdgeInsetsMake(0, 0, 64, 0);
    self.tbvBase.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tbvBase.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.tbvBase];
    
    self.manager = [[DHTTableViewManager alloc] initWithTableView:self.tbvBase];
}

- (void)configDefaultManager
{
    
    self.tbvBase = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tbvBase.contentInset = UIEdgeInsetsMake(0, 0, 64, 0);
    self.tbvBase.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tbvBase.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.tbvBase];
    
    self.manager = [[DHTTableViewManager alloc] initWithTableView:self.tbvBase];
}

@end
