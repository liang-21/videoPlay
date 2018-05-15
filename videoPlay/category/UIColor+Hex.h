//
//  UIColor+Hex.h
//  videoPlay
//
//  Created by 梁世伟 on 2018/4/9.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
+(UIColor *)colorWithHeX:(long)hexColor;
+(UIColor *)colorWithHeX:(long)hexColor alpha:(float)alpha;
+ (UIColor *)colorWithHexString: (NSString *)color;
+ (UIColor *)colorWithHexString: (NSString *)color alpha:(CGFloat)alpha;

@end
