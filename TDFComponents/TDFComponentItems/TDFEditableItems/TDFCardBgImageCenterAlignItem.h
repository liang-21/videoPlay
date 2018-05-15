//
//  TDFCardBgImageCenterAlignItem.h
//  Pods
//
//  Created by chaiweiwei on 2017/8/3.
//
//

#import "TDFBaseEditItem.h"
#import "TDFCardBgImageBaseItem.h"
#import "TDFCardBgImageItem.h"

@interface TDFCardBgImageCenterAlignItem : TDFBaseEditItem

@property(nonatomic,copy) NSString *iconName;
//是否需要删除按钮
@property (nonatomic,assign) BOOL showDelButton;
//底部link按钮
@property (copy,nonatomic) NSString *buttomLinkTitle;
//图片contentmode
@property (nonatomic,assign) UIViewContentMode imageContentMode;
//添加多个图片
@property (nonatomic,copy) NSArray<TDFCardBgImageBaseItem *> *cardImageItems;
//删除按钮还是添加按钮回调
@property (nonatomic, strong) void (^filterBlock)(NSInteger idx,TDFFilterType filterType);

@property (nonatomic,copy) void (^linkButtonCallBack)(void);

@end
