//
//  TDFTableWithTwoBtnWithTitleItem.h
//  TDFComponents
//
//  Created by 刘红琳 on 2017/11/14.
//

#import "DHTTableViewItem.h"

//有两个带标题右侧按钮的cell
@interface TDFTableWithTwoBtnWithTitleItem : DHTTableViewItem

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;

/*
 右侧按钮标题及标题颜色
 */
@property (nonatomic, copy) NSString *rightText;
@property (nonatomic, copy) UIColor *rightTextColor;

/*
 最最右侧按钮标题及标题颜色
 */
@property (nonatomic, copy) NSString *nextRightText;
@property (nonatomic, copy) UIColor *nextRightTextColor;

@property (nonatomic, strong) void (^rightBlock)();
@property (nonatomic, strong) void (^nextRightBlock)();

@end
