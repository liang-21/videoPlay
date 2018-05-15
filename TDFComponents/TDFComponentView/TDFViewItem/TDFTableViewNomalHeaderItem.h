//
//  TDFTableViewNomalHeaderItem.h
//  Pods
//
//  Created by chaiweiwei on 2017/7/20.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,TDFTableViewNomalHeaderType) {
    TDFTableViewNomalHeaderTypeIcon,
    TDFTableViewNomalHeaderTypeTitleIcon
};

@interface TDFTableViewNomalHeaderItem : NSObject

@property (nonatomic,assign) TDFTableViewNomalHeaderType type;

//title at bottom of icon（30*30） only one line
@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) UIColor *titleColor;

@property (nonatomic,copy) NSString *content;
//顶部图标
@property (nonatomic,copy) NSString *iconName;
//右上角图标
@property (nonatomic,copy) NSString *rightIcon;
//右下角按钮title
@property (nonatomic,copy) NSString *buttonTitle;

@property (nonatomic,assign) CGFloat backgroundAlpha;

@property (nonatomic,copy) void (^callBack)(void);

@end
