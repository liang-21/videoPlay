//
//  TDFShowBigImageViewController.h
//  Pods
//
//  Created by chaiweiwei on 2017/7/17.
//
//

#import <UIKit/UIKit.h>

@interface TDFShowSmallImageItem : NSObject

@property (nonatomic,copy) NSString *imagePath;
@property (nonatomic,copy) NSString *imageName;

@property (nonatomic,copy) NSString *rightDownTip;

@end

@interface TDFShowBigImageViewController : UIViewController

/**
 创建视图
 
 @param items 图片item
 @return TDFShowBigImageViewController
 */
+ (instancetype)showBigImageScrollerWindowWithImagePaths:(NSArray<TDFShowSmallImageItem *> *)items firstShowIndex:(NSInteger)index;

/**
 显示
 */
- (void)presentViewController;

@end
