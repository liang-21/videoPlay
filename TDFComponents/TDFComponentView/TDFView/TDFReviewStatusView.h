//
//  TDFReviewStatusView.h
//  Pods
//
//  Created by chaiweiwei on 2017/7/13.
//
//

#import <UIKit/UIKit.h>
#import "TDFTableViewViewProtocol.h"
#import "TDFReviewStatusItem.h"

@interface TDFReviewStatusView : UIView<TDFTableViewCustomViewDelegate>

/**
 创建状态类型的headerView

 @param type 状态
 @param title 标题
 @param subtitle 副标题
 @param buttomTitle 底部文案
 @return TDFReviewStatusView
 */
+ (instancetype)headerWithStyle:(TDFReviewStatusType)type
                          title:(NSString *)title
                        subitle:(NSString *)subtitle
                    buttomTitle:(NSString *)buttomTitle;
/**
 创建状态类型的headerView
 
 @param type 状态
 @param title 标题
 @param subtitle 副标题
 @param buttomTitle 底部文案
 @param buttonTitle 底部跳转按钮
 @param linkCallBack 回调
 @return TDFReviewStatusView
 */
+ (instancetype)headerWithStyle:(TDFReviewStatusType)type
                          title:(NSString *)title
                        subitle:(NSString *)subtitle
                    buttomTitle:(NSString *)buttomTitle
                linkButtonTitle:(NSString *)buttonTitle
                   linkCallBack:(void (^)(void))linkCallBack;
/**
 创建状态类型的headerView
 
 @param type 状态
 @param title 标题
 @param subtitle 副标题
 @param buttomTitle 底部文案
 @param buttonTitle 底部跳转按钮
 @param linkCallBack 回调
 @param buttonList 扩展按钮数组
 @return TDFReviewStatusView
 */
+ (instancetype)headerWithStyle:(TDFReviewStatusType)type
                          title:(NSString *)title
                        subitle:(NSString *)subtitle
                    buttomTitle:(NSString *)buttomTitle
                linkButtonTitle:(NSString *)buttonTitle
                   linkCallBack:(void (^)(void))linkCallBack
                     buttonList:(NSArray<TDFReviewButtonItem *> *)buttonList;
/**
 创建状态类型的headerView
 
 @param type 状态
 @param title 标题
 @param subtitle 副标题
 @param buttomTitle 底部文案
 @param buttonTitle 底部跳转按钮
 @param linkCallBack 回调
 @param extendContent 扩展文案 类似警告
 @param extendContentColor 扩展文案颜色 默认灰色
 @return TDFReviewStatusView
 */
+ (instancetype)headerWithStyle:(TDFReviewStatusType)type
                          title:(NSString *)title
                        subitle:(NSString *)subtitle
                    buttomTitle:(NSString *)buttomTitle
                linkButtonTitle:(NSString *)buttonTitle
                   linkCallBack:(void (^)(void))linkCallBack
                  extendContent:(NSString *)extendContent
             extendContentColor:(UIColor *)extendContentColor;

@end
