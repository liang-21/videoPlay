//
//  SelVideoViewController.m
//  SelVideoPlayer
//
//  Created by zhuku on 2018/1/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SelVideoViewController.h"
#import "SelVideoPlayer.h"
#import "SelPlayerConfiguration.h"
#import "AppDelegate.h"
#import <Masonry.h>
#import "LSWVideoCommentCell.h"
#import "LSWCommentCell.h"
#import "LSWTextInputViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface SelVideoViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic, strong) SelVideoPlayer *player;
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) UIView *footerview;

@end

@implementation SelVideoViewController
static NSString *cellIdentifier2=@"UITableViewCellIdentifierKey2";
static NSString *cellIdentifier3=@"UITableViewCellIdentifierKey3";

#pragma lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    if ([[UIDevice currentDevice].systemVersion floatValue] > 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
     [self.tableview registerClass:[LSWVideoCommentCell class] forCellReuseIdentifier:@"UITableViewCellIdentifierKey2"];
     [self.tableview registerClass:[LSWCommentCell class] forCellReuseIdentifier:@"UITableViewCellIdentifierKey3"];
//    self.tableview.tableFooterView = [self setFooterView];
     [self setUI];
    self.tableview.estimatedRowHeight = 185;
    self.tableview.rowHeight = UITableViewAutomaticDimension;
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    
    // handleNavigationTransition:为系统私有API,即系统自带侧滑手势的回调方法，我们在自己的手势上直接用它的回调方法
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    panGesture.delegate = self; // 设置手势代理，拦截手势触发
    [self.view addGestureRecognizer:panGesture];
    
    // 一定要禁止系统自带的滑动手势
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 当当前控制器是根控制器时，不可以侧滑返回，所以不能使其触发手势
    if(self.navigationController.childViewControllers.count == 1)
    {
        return NO;
    }
    
    return YES;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     [self setUI];
    [self.tableview registerClass:[LSWVideoCommentCell class] forCellReuseIdentifier:@"UITableViewCellIdentifierKey2"];
     [self.tableview registerClass:[LSWCommentCell class] forCellReuseIdentifier:@"UITableViewCellIdentifierKey3"];
    [self.tableview reloadData];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    self.tabBarController.tabBar.hidden = YES;
}

- (void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
//    self.tabBarController.tabBar.hidden = NO;
    [_player _deallocPlayer];
}

#pragma setUI
- (void) setUI{
    [self.view addSubview:self.player];
    [self.view addSubview:self.tableview];
    [self.view addSubview:self.footerview];
    [self configLayout];
}

- (void) configLayout {
    [self.footerview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.equalTo(@44);
        make.right.equalTo(self.view);
    }];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.footerview.mas_top).offset(-5);
        make.top.equalTo(self.player.mas_bottom).offset(0);
    }];
}


#pragma delegate datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }
    else{
        return self.commentList.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellIdentifierKey2"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        LSWVideoCommentCell* cell1 =(LSWVideoCommentCell *)cell;
        [cell1 configWithModel:self.model];
        cell = cell1;
        
   
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellIdentifierKey3"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        LSWCommentCell *cell2 = (LSWCommentCell *)cell;
        [cell2 configWithModel:[self.commentList objectAtIndex:indexPath.row]];
        cell = cell2;
    }
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section ==0) {
//        return 145;
////        return [tableView fd_heightForCellWithIdentifier:@"UITableViewCellIdentifierKey2" cacheByIndexPath:indexPath configuration:^(id cell) {
////            [(LSWVideoCommentCell *)cell configWithModel:self.model];
////        }];
//    }
//    else{
////        return [tableView fd_heightForCellWithIdentifier:@"UITableViewCellIdentifierKey3" configuration:^(id cell) {
////            [(LSWCommentCell *)cell configWithModel:[self.commentList objectAtIndex:indexPath.row]];
////        }];
//        return 140;
//    }
//}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }
    else{
        return 0;
    }
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    if (section == 1) {
//        return [self setFooterView];
//    }
//    return nil;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 1) {
        return 44;
    }
    return 0.000001;
}

#pragma action
- (void) PushToTextView {
    LSWTextInputViewController *vc = [[LSWTextInputViewController alloc] init];
    vc.navTitle = @"填写内容";
    vc.limitation = 140;
    vc.placeHolderContent = @"请填写内容~";
    [self.navigationController pushViewController:vc animated:NO];
}



#pragma set
- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    
    return _tableview;
}

- (SelVideoPlayer *)player {
    if (!_player) {
        SelPlayerConfiguration *configuration = [[SelPlayerConfiguration alloc]init];
        configuration.shouldAutoPlay = YES;
        configuration.supportedDoubleTap = YES;
        configuration.shouldAutorotate = YES;
        configuration.repeatPlay = YES;
        configuration.statusBarHideState = SelStatusBarHideStateFollowControls;
        configuration.sourceUrl = [NSURL URLWithString:@"http://120.25.226.186:32812/resources/videos/minion_02.mp4"];
        configuration.videoGravity = SelVideoGravityResizeAspect;
        
        CGFloat width = self.view.frame.size.width;
        _player = [[SelVideoPlayer alloc]initWithFrame:CGRectMake(0, 0, width, 300) configuration:configuration];
        __weak __typeof(self) weakSelf = self;
        _player.buttonClickBlock = ^{
            [weakSelf setUI];
            [weakSelf.tableview registerClass:[LSWVideoCommentCell class] forCellReuseIdentifier:@"UITableViewCellIdentifierKey2"];
            [weakSelf.tableview reloadData];
        };
    }
    return _player;
}


- (UIView *)footerview {
    if (!_footerview) {
        _footerview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        _footerview.backgroundColor = [UIColor whiteColor];
        _footerview.layer.borderColor = [UIColor grayColor].CGColor;
        _footerview.layer.borderWidth = 0.5;
        
        UIButton *textButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [textButton.layer setCornerRadius:20.0];
        [textButton setTitle:@"说点什么" forState:UIControlStateNormal];
        textButton.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        [textButton setTintColor:[UIColor grayColor]];
        [textButton addTarget:self action:@selector(PushToTextView) forControlEvents:UIControlEventTouchUpInside];
        
        [_footerview addSubview:textButton];
        [textButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_footerview.mas_left).offset(40);
            make.right.equalTo(_footerview.mas_right).offset(-40);
            make.top.equalTo(_footerview.mas_top).offset(2);
            make.centerY.equalTo(_footerview);
            make.height.equalTo(@40);
        }];
    }
    return _footerview;
}



@end
