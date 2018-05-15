//
//  TDFMutilDisplaySmallImage.h
//  Pods
//
//  Created by chaiweiwei on 2017/7/17.
//
//

#import "TDFTableViewItem.h"

@interface TDFSmallSequenceImageItem : NSObject

@property (nonatomic, copy) UIImage *smallImage;
@property (nonatomic, copy) NSString *smallImagePath;
@property (nonatomic, assign) CGFloat coverAlpha;
@property (nonatomic, copy) UIColor *coverColor;
@property (nonatomic, copy) UIColor *titleColor;
@property (nonatomic, copy) NSString *title;

@end

@interface TDFMutilDisplaySmallImageItem : TDFTableViewItem

@property (nonatomic, copy) NSArray<TDFSmallSequenceImageItem *> *smallImageItems;

/** 背景颜色 */
@property (strong, nonatomic) UIColor *backgroundColor;

@property (nonatomic,copy) void (^smallImageClickCallBack)(NSInteger index);

@end
