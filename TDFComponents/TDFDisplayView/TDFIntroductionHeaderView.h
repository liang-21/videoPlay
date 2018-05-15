//
//  TDFIntroductionHeaderView.h
//  RestApp
//
//  Created by happyo on 16/10/21.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDFIntroductionHeaderView : UIView

- (instancetype)initWithImageIcon:(UIImage *)icon description:(NSString *)description detailBlock:(void (^)())detailBlock;

- (instancetype)initWithImageIcon:(UIImage *)icon description:(NSString *)description;


+ (instancetype)headerViewWithIcon:(UIImage *)icon description:(NSString *)description;

+ (instancetype)headerViewWithIcon:(UIImage *)icon description:(NSString *)description badgeIcon:(UIImage *)badgeIcon;
+ (instancetype)headerViewWithIcon:(UIImage *)icon description:(NSString *)description badgeIcon:(UIImage *)badgeIcon detailBlock:(void (^)())detailBlock;

+ (instancetype)headerViewWithIcon:(UIImage *)icon description:(NSString *)description badgeIcon:(UIImage *)badgeIcon detailTitle:(NSString *)detailTitle detailBlock:(void (^)())detailBlock;

- (instancetype)initWithImageIcon:(UIImage *)icon description:(NSString *)description detailBlock:(void (^)())detailBlock shouldLimitLineNumber:(BOOL)shouldLimitLineNumber;
- (void)changeBackAlpha:(CGFloat)alpha;

@end
