//
//  UIViewController+TableViewManager.m
//  TDFComponents
//
//  Created by tripleCC on 2017/11/7.
//
#import <Masonry/Masonry.h>
#import <objc/runtime.h>
#import "DHTTableViewManager.h"
#import "UIViewController+TableViewManager.h"

static const void *tbvBaseKey = &tbvBaseKey;
static const void *managerKey = &managerKey;


@implementation UIViewController (TableViewManager)

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
    self.tbvBase.contentInset = UIEdgeInsetsMake(0, 0, 88, 0);
    self.tbvBase.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tbvBase.backgroundColor = [UIColor clearColor];
    self.tbvBase.estimatedRowHeight = 0;
    self.tbvBase.estimatedSectionHeaderHeight = 0;
    self.tbvBase.estimatedSectionFooterHeight = 0;
    
    [self.view addSubview:self.tbvBase];
    self.manager = [[DHTTableViewManager alloc] initWithTableView:self.tbvBase];
    [self.tbvBase mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(self.view);
    }];
}

- (void)configDefaultManager
{
    [self configDefaultManagerWithStyle:UITableViewStylePlain];
}

\
@end
