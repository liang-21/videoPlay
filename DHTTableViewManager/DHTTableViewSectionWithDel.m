//
//  DHTTableViewSectionWithDel.m
//  Pods
//
//  Created by wuwangwo on 2017/8/17.
//
//

#import "DHTTableViewSectionWithDel.h"

@interface DHTTableViewSectionWithDel ()

@property (nonatomic, strong) UIButton *delButton;

@end

@implementation DHTTableViewSectionWithDel

+ (instancetype)sectionWithTitleHeader:(NSString *)title
{
    DHTTableViewSectionWithDel *section = [[self alloc] init];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 44)];
    sectionView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, screenWidth, 15)];
    lblTitle.font = [UIFont boldSystemFontOfSize:15];
    lblTitle.text = title;
    [sectionView addSubview:lblTitle];
    
    UIButton *delButton = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth-31, 13, 18, 18)];
    [delButton setBackgroundImage:[UIImage imageNamed:@"icon_delete_universe" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
    [delButton addTarget:section action:@selector(delButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [sectionView addSubview:delButton];
    
    section.headerView = sectionView;
    section.headerHeight = 44;
    
    return section;
}

- (void)delButtonClick {
    if (self.delSectionBlock) {
        self.delSectionBlock();
    }
}

@end
