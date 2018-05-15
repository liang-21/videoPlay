//
//  LSWPersonalViewController.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/4/9.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "LSWPersonalViewController.h"
#import "SelVideoPlayer.h"
#import "SelPlayerConfiguration.h"
#import "AppDelegate.h"
#import <Masonry.h>
#import "LSWTextInputViewController.h"
#import "LSWTopImageCell.h"
#import "UIColor+Hex.h"

@interface LSWPersonalViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;

@end

@implementation LSWPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableview.backgroundColor=[UIColor colorWithRed:240.0f/255.0f green:240.0f/255.0f blue:240.0f/255.0f alpha:1.0];
     [self.tableview registerClass:[LSWTopImageCell class] forCellReuseIdentifier:@"UITableViewCellIdentifierKey5"];
    [self.tableview setSeparatorInset:UIEdgeInsetsZero];
    self.tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableview setLayoutMargins:UIEdgeInsetsZero];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.view addSubview:self.tableview];
    self.tableview.estimatedRowHeight = 0;
    self.tableview.estimatedSectionHeaderHeight = 0;
    self.tableview.estimatedSectionFooterHeight = 0;
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.top.equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }
    else if(section ==1){
        return 2;
    }
    else{
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellIdentifierKey5"];
    }else if(indexPath.section ==1){
        if (indexPath.row == 0) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"key"];
            cell.textLabel.text =@"我收藏的视频";
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        else{
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"key"];
            cell.textLabel.text =@"我关注的人的视频";
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    else{
        if (indexPath.row == 0) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"key"];
            cell.textLabel.text =@"设置";
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        else if(indexPath.row == 1){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"key"];
            cell.textLabel.text =@"用户协议";
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        else{
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"key"];
            cell.textLabel.text =@"联系我们";
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        
        return 130;
    }
    else{
        return 44;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    else{
        return 20;
    }
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
