//
//  TDFAvatarImageItem.h
//  Pods
//
//  Created by chaiweiwei on 2016/12/28.
//
//

#import "TDFBaseEditItem.h"

@interface TDFAvatarImageItem : TDFBaseEditItem

//头像路径
@property (nonatomic, copy) NSString *filePath;
//头像image
@property (nonatomic, copy) UIImage *avatarImage;
//默认头像路径
@property (nonatomic, copy) NSString *defaultFileName;
// 点击头像位置回调
@property (nonatomic, strong) void (^filterBlock)(void);

@end
