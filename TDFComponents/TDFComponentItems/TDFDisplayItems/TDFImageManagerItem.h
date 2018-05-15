//
//  TDFImageManagerItem.h
//  RestApp
//
//  Created by happyo on 16/10/26.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "DHTTableViewItem.h"
#import "UIImageView+TDFRequest.h"

@interface TDFImageManagerItem : DHTTableViewItem

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *imageId;

@property (nonatomic, strong) NSString *path;

@property (nonatomic, strong) NSString *downloadUrl;

@property (nonatomic, assign) ImageUrlModel urlModel;

@property (nonatomic, strong) UIImage *placeholderImage;

@property (nonatomic, assign) BOOL hidenDeleteIcon;

@property (nonatomic, assign) BOOL hidenLineView;

@property (nonatomic, strong) void (^btnDeleteClicked)();

@property (nonatomic, assign) BOOL isOldUrl; // 是否是老接口请求的图片

@end
