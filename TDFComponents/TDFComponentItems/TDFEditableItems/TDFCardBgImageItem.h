//
//  TDFCardBgImageItem.h
//  Pods
//
//  Created by chaiweiwei on 2016/12/21.
//
//

#import "TDFBaseEditItem.h"
#import "TDFCardBgImageBaseItem.h"

typedef NS_ENUM(NSInteger,TDFFilterType) {
    TDFFilterTypeAdd,
    TDFFilterTypeDel,
};

//类似cell样式 选择卡片背景
@interface TDFCardBgImageItem : TDFBaseEditItem

@property (nonatomic, assign) BOOL showPreviewLinkButton;
@property (nonatomic, strong) NSString *previewLinkButtonTitle;
@property (nonatomic, copy) void(^preViewLinkCallBack)(void);

//字体颜色 默认白色
@property (nonatomic, copy) NSString *fontColor;
//是否显示右边的“可不选 向下”的区域
@property (nonatomic,assign) BOOL showRightArea;
//是否圆角
@property (nonatomic,assign) BOOL hasCornerRadius;
//是否需要删除按钮
@property (nonatomic,assign) BOOL showDelButton;
//隐藏右侧下箭头
@property (nonatomic,assign) BOOL hideRightArr;
//图片contentmode
@property (nonatomic,assign) UIViewContentMode imageContentMode;
//添加多个图片
@property (nonatomic,copy) NSArray<TDFCardBgImageBaseItem *> *cardImageItems;
//根据多个图片区域是否有值 空就显示原状态 有主动隐藏RightArea
@property (nonatomic,assign) BOOL autoHidenRghtArea;
//添加图片区域后面的背景颜色（默认0.2的浅灰色）
@property (nonatomic, copy) UIColor *cardImageAreaViewBgColor;
//删除按钮还是添加按钮回调
@property (nonatomic, strong) void (^filterBlock)(NSInteger idx,TDFFilterType filterType);

@end
