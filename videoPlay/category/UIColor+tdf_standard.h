//
//  UIColor+tdf_standard.h
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/4.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (tdf_standard)

// ===================暗背景===================
/**
 #FFFFFF，正文
 */
+ (UIColor *)tdf_hex_FFFFFF;

/**
 #FFFFFF，80%，辅助正文
 */
+ (UIColor *)tdf_hex_FFFFFF_80;

/**
 #FFFFFF，50%，弱化正文、注释
 */
+ (UIColor *)tdf_hex_FFFFFF_50;

/**
 #FFFFFF，30%，占位文字
 */
+ (UIColor *)tdf_hex_FFFFFF_30;
// ===========================================

// ===================亮背景===================
/**
 #333333，正文
 */
+ (UIColor *)tdf_hex_333333;

/**
 #666666，辅助正文
 */
+ (UIColor *)tdf_hex_666666;

/**
 #999999，弱化正文、注释
 */
+ (UIColor *)tdf_hex_999999;

/**
 #CCCCCC，占位文字
 */
+ (UIColor *)tdf_hex_CCCCCC;
// ===========================================


/**
 #FF0033，醒目、错误
 */
+ (UIColor *)tdf_hex_FF0033;

/**
 #0088FF，醒目、动态、可编辑
 */
+ (UIColor *)tdf_hex_0088FF;

/**
 #00CC33，正确、正常
 */
+ (UIColor *)tdf_hex_00CC33;

/**
 #FF9900，等待、不确定
 */
+ (UIColor *)tdf_hex_FF9900;

@end

