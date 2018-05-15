//
//  DHTTableViewSectionWithDel.h
//  Pods
//
//  Created by wuwangwo on 2017/8/17.
//
//

#import "DHTTableViewSection.h"

@interface DHTTableViewSectionWithDel : DHTTableViewSection

@property (nonatomic, copy) void (^delSectionBlock)();

+ (instancetype)sectionWithTitleHeader:(NSString *)title;

@end
