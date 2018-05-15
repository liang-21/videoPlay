//
//  DHTTableViewSectionWithBtn.m
//  TDFComponents
//
//  Created by zishu on 2018/3/6.
//

#import "DHTTableViewSectionWithBtn.h"

@implementation DHTTableViewSectionWithBtn

+ (instancetype)sectionWithTitleHeader:(NSString *)title btnImageName:(NSString *)btnImageName
{
    DHTTableViewSection *section = [[self alloc] init];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 44)];
    sectionView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 36, screenWidth, 15)];
    lblTitle.font = [UIFont boldSystemFontOfSize:15];
    lblTitle.text = title;
    [sectionView addSubview:lblTitle];
    
    UIButton *sectionBtn = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth-31, 36, 18, 18)];
    [sectionBtn setBackgroundImage:[UIImage imageNamed:btnImageName inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
    [sectionBtn addTarget:section action:@selector(sectionBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [sectionView addSubview:sectionBtn];
    section.headerView = sectionView;
    section.headerHeight = 66;
    
    return section;
}

- (void)sectionBtnClick {
    if (self.sectionBtnBlock) {
        self.sectionBtnBlock();
    }
}
@end
