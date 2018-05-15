//
//  TDFSKButtonItemTransaction.h
//  DHTTableViewManager
//
//  Created by tripleCC on 12/9/16.
//  Copyright © 2016 tripleCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TDFSKButtonItemBackgroundType){
    TDFSKButtonItemBackgroundTypeRed, /// btn_full_red
    TDFSKButtonItemBackgroundTypeGreen, /// btn_full_green
    TDFSKButtonItemBackgroundTypeGray, /// btn_full_gray
    TDFSKButtonItemBackgroundTypeRedBoarder, /// btn_full_red_boarder
    TDFSKButtonItemBackgroundTypeWhite, /// white
};

@interface TDFSKButtonItemTransaction : NSObject
/** 标题 */
@property (copy, nonatomic) NSString *title;

/** 标题颜色 */
@property (copy, nonatomic) UIColor *titleColor;

/** 背景颜色 */
@property (strong, nonatomic) UIColor *backgroundColor;

/** 是否可拉伸（如果是，则已center为中心点对背景图片进行拉伸） */
@property (assign, nonatomic) BOOL resizable;

/** 背景类型 */
@property (assign, nonatomic) TDFSKButtonItemBackgroundType backgroundType;

/** 背景图名 */
@property (strong, nonatomic) NSString *backgroundImageName;

/** 按钮左右边距 垂直居中 */
@property (nonatomic,assign) UIEdgeInsets singleButtonCellInsets;

/** 点击按钮回调 */
@property (copy, nonatomic) void (^clickedHandler)();

/** 背景图名 */
@property (strong, nonatomic) NSString *imageName __attribute__ ((deprecated("use backgroundImageName or backgroundType")));
@end
