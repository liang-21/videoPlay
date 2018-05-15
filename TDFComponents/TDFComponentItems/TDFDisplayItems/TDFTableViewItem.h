//
//  TDFTableViewItem.h
//  Pods
//
//  Created by chaiweiwei on 2017/4/28.
//
//

#import "DHTTableViewItem.h"

typedef NS_ENUM(NSInteger, TDFTableViewCellStyle) {
    //--------------
    // title
    //--------------
    TDFTableViewCellStyleDefault,
    //-------------------------
    // title .......  subtitle
    //-------------------------
    TDFTableViewCellStyleValue1,
    //-------------------------
    // title subtitle
    //-------------------------
    TDFTableViewCellStyleValue2,
    //-------------------------
    // title
    // subtitle
    //-------------------------
    TDFTableViewCellStyleSubtitle,
    //-------------------------
    // title
    //                                 reason
    // subtitle
    //-------------------------
    TDFTableViewCellStyleAllAbove,
};

typedef NS_ENUM(NSInteger, TDFTableViewCellAccessoryType) {
    TDFTableViewCellAccessoryNone,                                                      // don't show any accessory view
    TDFTableViewCellAccessoryDisclosureIndicator,                                       // 向右的箭头
    TDFTableViewCellAccessoryCircleSelect,
    TDFTableViewCellAccessoryCustomAccessoryView
};

typedef NS_ENUM(NSInteger, TDFTableViewCellSeperatorLineType) {
    TDFTableViewCellSeperatorLineTypeAlphaLine,//透明分割线
    TDFTableViewCellSeperatorLineTypeLeftMargin, //左边默认10px的分割线
};

typedef NS_ENUM(NSInteger, TDFAccessoryTextAlignment) {
    TDFAccessoryTextAlignmentCenter,
    TDFAccessoryTextAlignmentTop,
    TDFAccessoryTextAlignmentBottom,
};

@interface TDFTableViewItem : DHTTableViewItem

/** 是否显示 */
@property (nonatomic, assign) BOOL shouldShow;

@property (assign, nonatomic) TDFTableViewCellStyle style;

@property (assign, nonatomic) TDFTableViewCellSeperatorLineType seperatorType;
/** 分割线的左右边距 */
@property (nonatomic, assign) UIEdgeInsets seperatoInsets;

@property (assign, nonatomic) TDFTableViewCellAccessoryType accessoryType;

@property (strong, nonatomic) UIView *accessoryView;
/** 右边图片的左右边距 */
@property (nonatomic, assign) UIEdgeInsets accessoryInsets;

@property (strong, nonatomic) UIImage *image;
/** 左边图片的左右边距 */
@property (nonatomic, assign) UIEdgeInsets imageInsets;

@property (copy,nonatomic) NSString *title;

@property (nonatomic, strong)NSAttributedString *attributedTitle;

@property (copy,nonatomic) UIColor *titleColor;

@property (copy,nonatomic) UIFont *titleFont;

@property (copy,nonatomic) NSString *subtitle;

@property (copy,nonatomic) UIColor *subtitleColor;

@property (copy,nonatomic) UIFont *subtitleFont;

@property (copy, nonatomic) NSString *reason;

@property (copy, nonatomic) UIColor *reasonColor;

@property (copy, nonatomic) UIFont *reasonFont;

@property (nonatomic, strong) id preValue;

@property (assign,getter=isSelected) BOOL selected;
//title是否是多行(仅限在默认情况下使用)
@property (nonatomic, assign) NSInteger numLineOfTitle;

@property (assign,nonatomic) CGFloat cellHeightForStyleExceptSubtitle;

@property (assign,nonatomic) CGFloat greaterThanOrEqualOfSubtitleWidth;

//TDFTableViewCellAccessoryCircleSelect 时使用 其他用通用selectedBlock
@property (nonatomic, copy) void (^didSelectRowBlock)(BOOL isSelected);
// add by lingyou for shopchoose vc
@property (nonatomic, assign) BOOL disable;
//使用自定义的颜色 不使用disable默认的颜色字体 ps：因为视觉规范太随意 总是多变
@property (nonatomic, assign) BOOL userCustomFontOrColorWhenDisable;
@property (nonatomic, assign) CGFloat contentViewAlpha;

@end
