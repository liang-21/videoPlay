//
//  UIColor+Hex.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/4/9.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)
+(UIColor *)colorWithHeX:(long)hexColor{
    
    return [UIColor colorWithHeX:hexColor alpha:1.0f];
}
+(UIColor *)colorWithHeX:(long)hexColor alpha:(float)alpha{
    
    float red = ((float)((hexColor &0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor &0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor &0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
+ (UIColor *) colorWithHexString: (NSString *)color
{
    
    return [UIColor colorWithHexString:color alpha:1];
    
}

+ (UIColor *) colorWithHexString: (NSString *)color alpha:(CGFloat)alpha{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
    
}
@end
