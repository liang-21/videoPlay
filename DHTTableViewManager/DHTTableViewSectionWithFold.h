//
//  DHTTableViewSectionWithFold.h
//  Pods
//
//  Created by 刘红琳 on 2017/6/3.
//
//

#import "DHTTableViewSection.h"

@interface DHTTableViewSectionWithFold : DHTTableViewSection

@property (nonatomic, assign) BOOL isDown;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *header;

@property (nonatomic, copy) NSString *isSelectedCount;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, copy) void (^didSelectBlock)(BOOL isDown);

+ (instancetype)sectionWithTitleHeader:(NSString *)title andIsDown:(BOOL)isDown;

- (void)sectionWithTitleHeader:(NSString *)title andIsSelected:(BOOL)isSelected andIsDown:(BOOL)isDown;

@end
