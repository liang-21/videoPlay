//
//  TDFMultiImagePickerItem.h
//  Pods
//
//  Created by Octree on 31/8/17.
//
//

#import "TDFBaseEditItem.h"

typedef NS_OPTIONS(NSInteger, TDFImagePickerSourceType) {

    TDFImagePickerSourceTypeLibrary     =       1 << 1,
    TDFImagePickerSourceTypeCamera      =       1 << 2,
};


/**
 图片上传
 */
@protocol TDFImageUploading <NSObject>

@required
- (void)uploadImage:(UIImage *)image withCallback:(void(^)(NSString *url))callback;

@end


@interface TDFMultiImagePickerItem : TDFBaseEditItem

@property (strong, nonatomic) void (^didDelete)(NSInteger index);
@property (strong, nonatomic) void (^didAdd)(NSString *url);

@property (weak, nonatomic) id<TDFImageUploading> uploader;

/**
 添加按钮的 title
 */
@property (copy, nonatomic) NSString *buttonTitle;

/**
 提示，灰色字体
 */
@property (copy, nonatomic) NSString *prompt;

/**
 提示下方，红色字体
 */
@property (copy, nonatomic) NSString *warning;

/**
 数量限制
 */
@property (nonatomic) NSUInteger limitation;

/**
 图片来源
 */
@property (nonatomic) TDFImagePickerSourceType sourceType;

/**
 隐藏头部标题
 */
@property (nonatomic) BOOL hideHeader;


@end
