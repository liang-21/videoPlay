//
//  TDFTableViewNomalHeader.h
//  TDFIssueCenter
//
//  Created by chaiweiwei on 2017/4/27.
//  Copyright © 2017年 chaiweiwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDFTableViewViewProtocol.h"

@interface TDFTableViewNomalHeaderView : UITableViewHeaderFooterView<TDFTableViewCustomViewDelegate>
/**
 创建header

 @param content 内容
 @param icon 图标
 @return TDFTableViewNomalHeader
 */
+ (instancetype)headerWithContent:(NSString *)content
                             icon:(NSString *)icon;

/**
 创建header
 
 @param content 内容
 @param icon 图标
 @param rightIcon 右边副图标
 @return TDFTableViewNomalHeader
 */
+ (instancetype)headerWithContent:(NSString *)content
                             icon:(NSString *)icon
                        rightIcon:(NSString *)rightIcon;

/**
  创建header

 @param content 内容
 @param icon 图标
 @param buttonTitle 底部按钮
 @param linkCallBack 回调
 @return TDFTableViewNomalHeader
 */
+ (instancetype)headerWithContent:(NSString *)content
                             icon:(NSString *)icon
                  linkButtonTitle:(NSString *)buttonTitle
                     linkCallBack:(void (^)(void))linkCallBack;

/**
 创建带有标题的header

 @param title 标题
 @param titleColor 标题颜色
 @param content 内容
 @param icon 图标
 @param buttonTitle 底部按钮
 @param linkCallBack 回调
 @return TDFTableViewNomalHeader
 */
+ (instancetype)headerWithTitle:(NSString *)title
                     titleColor:(UIColor *)titleColor
                        content:(NSString *)content
                           icon:(NSString *)icon
                linkButtonTitle:(NSString *)buttonTitle
                   linkCallBack:(void (^)(void))linkCallBack;
@end
