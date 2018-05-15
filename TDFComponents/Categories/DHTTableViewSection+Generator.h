//
//  DHTTableViewSection+Factory.h
//  Pods
//
//  Created by tripleCC on 12/14/16.
//
//

#import "DHTTableViewSection.h"

@interface DHTTableViewSection (Generator)
/**
 根据视图创建section
 默认高度48
 
 @param header 视图
 @return section
 */
+ (instancetype)sectionWithHeader:(UIView *)header;


/**
 创建头尾无高度section

 @return section
 */
+ (instancetype)minSection;

/**
 创建头部无高度section

 @return section
 */
+ (instancetype)minHeaderSection;

/**
 创建尾部无高度section

 @return section
 */
+ (instancetype)minFooterSection;

+ (instancetype)topMarginSeparatorSection;
+ (instancetype)separatorSection;

- (void)showSeparator:(BOOL)show;
@end
