//
//  UIButton+TDFMixExtend.h
//  Pods
//
//  Created by CaydenK on 2017/9/1.
//
//

#import <UIKit/UIKit.h>

//button图文混排样式
typedef NS_ENUM(NSUInteger, TDFButtonMixStyle) {
    TDFButtonMixStyleNone = 0,              //当为none时什么都不做，使用系统默认的排版方式，设置padding也无效
    TDFButtonMixStyleDefault = 1,
    TDFButtonMixStyleImageUp,
    TDFButtonMixStyleImageRight,
    TDFButtonMixStyleImageBottom
};

IB_DESIGNABLE
@interface UIButton (TDFMixExtend)

@property (assign, nonatomic, setter=tdfm_setPadding:) IBInspectable CGFloat tdfm_padding;
@property (assign, nonatomic, setter=tdfm_setStyle:) IBInspectable TDFButtonMixStyle tdfm_style;

@end
