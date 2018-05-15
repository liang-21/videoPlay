//
//  DHTTableViewSectionWithBtn.h
//  TDFComponents
//
//  Created by zishu on 2018/3/6.
//

#import "DHTTableViewSection.h"

@interface DHTTableViewSectionWithBtn : DHTTableViewSection
@property (nonatomic, copy) void (^sectionBtnBlock)(void);

+ (instancetype)sectionWithTitleHeader:(NSString *)title btnImageName:(NSString *)btnImageName;

@end
