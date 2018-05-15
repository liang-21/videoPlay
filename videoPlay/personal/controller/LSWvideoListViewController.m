//
//  LSWvideoListViewController.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/9.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "LSWvideoListViewController.h"

@interface LSWvideoListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;

@end

@implementation LSWvideoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        //        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    
    return _tableview;
}
@end
