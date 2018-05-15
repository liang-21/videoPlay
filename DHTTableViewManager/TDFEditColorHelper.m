//
//  TDFEditColorHelper.m
//  Pods
//
//  Created by happyo on 2016/12/14.
//
//

#import "TDFEditColorHelper.h"

@implementation TDFEditColorHelper

+ (UIColor *)cannotEditColor
{
    return [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
}

+ (UIColor *)placeHolderColor
{
    return [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1];
}

+ (UIColor *)hex333333Color
{
    return [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
}

+ (UIColor *)hex666666Color
{
    return [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
}

+ (UIColor *)hex999999Color
{
    return [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
}

+ (UIColor *)hexBlueColor
{
    return [UIColor colorWithRed:0/255.0 green:136/255.0 blue:204/255.0 alpha:1];
}

@end
