//
//  DHTTableViewSection+Factory.m
//  Pods
//
//  Created by tripleCC on 12/14/16.
//
//
#import "TDFBaseEditItem.h"
#import "DHTTableViewSection+Generator.h"

@implementation DHTTableViewSection (Generator)
+ (instancetype)minSection {
    DHTTableViewSection *section = [self section];
    // http://stackoverflow.com/questions/17699831/how-to-change-height-of-grouped-uitableview-header
    section.footerHeight = CGFLOAT_MIN;
    section.headerHeight = CGFLOAT_MIN;
    return section;
}

+ (instancetype)minFooterSection {
    DHTTableViewSection *section = [self section];
    section.footerHeight = CGFLOAT_MIN;
    return section;
}

+ (instancetype)minHeaderSection {
    DHTTableViewSection *section = [self section];
    section.headerHeight = CGFLOAT_MIN;
    return section;
}

+ (instancetype)sectionWithHeader:(UIView *)header {
    DHTTableViewSection *section = [self section];
    section.headerView = header;
    section.headerHeight = 48;
    return section;
}

+ (instancetype)topMarginSeparatorSection {
    DHTTableViewSection *section = [self section];
    UIView *headerContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 36)];
    headerContainerView.backgroundColor = [UIColor clearColor];
    UIView *headerLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 35, [UIScreen mainScreen].bounds.size.width, 1)];
    headerLineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    [headerContainerView addSubview:headerLineView];
    section.headerView = headerContainerView;
    section.headerHeight = 36;
    
    UIView *footerLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1)];
    footerLineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    section.footerView = footerLineView;
    section.footerHeight = 1;

    return section;
}

- (void)showSeparator:(BOOL)show {
    self.headerView.hidden = !show;
    self.footerView.hidden = !show;
}

+ (instancetype)separatorSection {
    DHTTableViewSection *section = [self section];
    UIView *headerLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1)];
    headerLineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    section.headerView = headerLineView;
    section.headerHeight = 1;
    
    UIView *footerLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1)];
    footerLineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    section.footerView = footerLineView;
    section.footerHeight = 1;
    
    return section;
}
@end
