//
//  LSWPublishViewController.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/4/9.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "LSWPublishViewController.h"
#import "Masonry.h"
#import "LSWPublishCell.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface LSWPublishViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableview;

@end

@implementation LSWPublishViewController
static NSString *cellIdentifier=@"UITableViewCellIdentifierKey1";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubview];
    [self.tableview registerClass:[LSWPublishCell class] forCellReuseIdentifier:@"UITableViewCellIdentifierKey1"];
}

#pragma setSubview

- (void)setSubview {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSWPublishCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellIdentifierKey1"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 350;
}

#pragma set get


- (UITableView *)tableView {
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    
    return _tableview;
}


@end
