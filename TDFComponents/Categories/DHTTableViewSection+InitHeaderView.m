//
//  DHTTableViewSection+InitHeaderView.m
//  RestApp
//
//  Created by happyo on 16/9/12.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "DHTTableViewSection+InitHeaderView.h"

@implementation DHTTableViewSection (InitHeaderView)

+ (instancetype)sectionWithItemHeader:(NSString *)title
{
    DHTTableViewSection *section = [[DHTTableViewSection alloc] init];
    
    CGFloat headerHeight = 41;
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, headerHeight)];
    sectionView.backgroundColor = [UIColor clearColor];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 200, 18)];
    lblTitle.center = CGPointMake(sectionView.center.x, lblTitle.center.y);
    lblTitle.font = [UIFont systemFontOfSize:11];
    lblTitle.backgroundColor = [UIColor whiteColor];
    lblTitle.textColor = [UIColor darkGrayColor];
    lblTitle.textAlignment = NSTextAlignmentCenter;
    lblTitle.text = title;
    lblTitle.layer.cornerRadius=8;
    lblTitle.layer.masksToBounds=YES;
    lblTitle.layer.borderWidth=1;
    lblTitle.layer.borderColor=[[UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:0.3] CGColor];

//    
//    UIView *spliteTopView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
//    spliteTopView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    
    UIView *spliteBottomView = [[UIView alloc] initWithFrame:CGRectMake(10, 40, screenWidth - 20, 1)];
    spliteBottomView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    
    [sectionView addSubview:lblTitle];
//    [sectionView addSubview:spliteTopView];
    [sectionView addSubview:spliteBottomView];
    
    section.headerView = sectionView;
    section.headerHeight = headerHeight;
    
    return section;
}

@end
