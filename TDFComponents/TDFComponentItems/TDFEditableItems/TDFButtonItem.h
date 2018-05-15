//
//  TDFButtonItem.h
//  TDFComponents
//
//  Created by guozhi on 2017/10/24.
//

#import "TDFBaseEditItem.h"

typedef void(^TDFButtonItemBlock)(void);
typedef NS_ENUM(NSInteger, TDFButtonItemStyle) {
    TDFButtonItemStyleDel,
};

@interface TDFButtonItem : TDFBaseEditItem
/** 按钮标题 */
@property (nonatomic, copy) NSString *title;
/** 按钮样式 */
@property (nonatomic, assign) TDFButtonItemStyle style;
/** 按钮点击回调 */
@property (nonatomic, copy) TDFButtonItemBlock buttonClickEvent;

@end
