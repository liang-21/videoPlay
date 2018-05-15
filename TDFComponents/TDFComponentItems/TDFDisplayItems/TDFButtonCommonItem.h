//
//  TDFButtonCommonItem.h
//  Pods
//
//  Created by chaiweiwei on 2017/6/3.
//
//

#import "DHTTableViewItem.h"

typedef NS_ENUM(NSInteger,TDFButtonCommontType) {
    TDFButtonCommontTypeNone,
    TDFButtonCommontTypeAdd,
};

@interface TDFButtonCommonItem : DHTTableViewItem

@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) UIColor *titleColor;
/** 是否显示 */
@property (nonatomic, assign) BOOL shouldShow;
/**
 左侧图标
 */
@property (assign,nonatomic) TDFButtonCommontType buttonType;

@end
