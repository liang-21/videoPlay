//
//  LSWVideoViewController.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/4/9.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "LSWVideoViewController.h"
#import "Masonry.h"
#import "LSWVideoCollectionViewCell.h"
#import "SelVideoViewController.h"
#import "cbsNetWork.h"
#import "UIViewController+AlertMessage.h"
#import <YYModel/YYModel.h>
#import "LSWVideoModel.h"
#import "LSWCommentModel.h"

@interface LSWVideoViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) LSWVideoModel *videoModel;
@property (nonatomic, strong) NSArray<LSWVideoModel *> *videoList;
@property (nonatomic, strong) NSArray<LSWCommentModel *> *commentList;

@end

@implementation LSWVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self netWork];
    // Do any additional setup after loading the view.
}
- (void) setUI {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.allowsSelection = YES;
    collectionView.allowsMultipleSelection = NO;
    collectionView.alwaysBounceVertical = YES;
    collectionView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
    [collectionView registerClass:[LSWVideoCollectionViewCell class] forCellWithReuseIdentifier:identifierCollectionCell];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.videoList.count;
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LSWVideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierCollectionCell forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.cornerRadius = 7;
    cell.contentView.layer.cornerRadius = 7.0f;
    cell.contentView.layer.borderWidth = 0.7f;
    cell.contentView.layer.borderColor = [UIColor grayColor].CGColor;
    cell.contentView.layer.masksToBounds = YES;
    [cell configWithModel:[self.videoList objectAtIndex:indexPath.row]];
    
    

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([[UIScreen mainScreen] bounds].size.width/2-8, 150);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(4.0, 4.0, 4.0, 4.0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 20.0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.0;
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    SelVideoViewController *videoVC = [[SelVideoViewController alloc]init];
//    videoVC.model = [self.videoList objectAtIndex:indexPath.row];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"userId"] = @1;
    dic[@"videoId"] = @([self.videoList objectAtIndex:indexPath.row].tbVideoDTO.videoid);
    
    [[cbsNetWork sharedManager] requestWithMethod:GET WithPath:@"http://localhost:7100/tb/video/comment/@get" WithParams:dic WithSuccessBlock:^(NSDictionary *dic) {
        SelVideoViewController *videoVC = [[SelVideoViewController alloc]init];
        videoVC.model = [self.videoList objectAtIndex:indexPath.row];
        videoVC.hidesBottomBarWhenPushed = YES;
        self.commentList = [NSMutableArray yy_modelArrayWithClass:[LSWCommentModel class] json:[dic[@"result"] yy_modelToJSONString]];
        videoVC.commentList = [self.commentList mutableCopy];
        [self.navigationController pushViewController:videoVC animated:YES];
        
    } WithFailurBlock:^(NSError *error) {
        [self showAlert:@"网络请求失败" confirm:nil];
    }];
     self.hidesBottomBarWhenPushed=NO;
    
}





- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//}
- (void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void) netWork {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"userId"] = @1;
    [[cbsNetWork sharedManager] requestWithMethod:GET WithPath:@"http://localhost:7100/home/page/videos/@get" WithParams:dic WithSuccessBlock:^(NSDictionary *dic) {
        self.videoList = [NSMutableArray yy_modelArrayWithClass:[LSWVideoModel class] json:[dic[@"result"] yy_modelToJSONString]];
        [self setUI];
    } WithFailurBlock:^(NSError *error) {
        [self showAlert:@"网络请求失败" confirm:nil];
    }];
}










@end
