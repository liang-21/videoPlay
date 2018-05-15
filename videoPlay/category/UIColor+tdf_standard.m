//
//  UIColor+tdf_standard.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/4.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "UIColor+tdf_standard.h"

#define TDFColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@implementation UIColor (tdf_standard)

+ (UIColor *)tdf_hex_FFFFFF
{
    return TDFColorFromRGB(0xFFFFFF);
}

+ (UIColor *)tdf_hex_FFFFFF_80
{
    return [TDFColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.8];
}

+ (UIColor *)tdf_hex_FFFFFF_50
{
    return [TDFColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.5];
}

+ (UIColor *)tdf_hex_FFFFFF_30
{
    return [TDFColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.3];
}

+ (UIColor *)tdf_hex_333333
{
    return TDFColorFromRGB(0x333333);
}

+ (UIColor *)tdf_hex_666666
{
    return TDFColorFromRGB(0x666666);
}

+ (UIColor *)tdf_hex_999999
{
    return TDFColorFromRGB(0x999999);
}

+ (UIColor *)tdf_hex_CCCCCC
{
    return TDFColorFromRGB(0xCCCCCC);
}

+ (UIColor *)tdf_hex_FF0033
{
    return TDFColorFromRGB(0xFF0033);
}

+ (UIColor *)tdf_hex_0088FF
{
    return TDFColorFromRGB(0x0088FF);
}

+ (UIColor *)tdf_hex_00CC33
{
    return TDFColorFromRGB(0x00CC33);
}

+ (UIColor *)tdf_hex_FF9900
{
    return TDFColorFromRGB(0xFF9900);
}

@end
