//
//  TDFEmptyView.h
//  TDFIssueCenter
//
//  Created by chaiweiwei on 2017/4/28.
//  Copyright © 2017年 chaiweiwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDFEmptyView : UIView

+ (instancetype)emptyViewWithContent:(NSString *)content;

+ (instancetype)emptyViewWithContent:(NSString *)content centerButtonTitle:(NSString *)title click:(void(^)(void))block;

+ (instancetype)emptyViewWithContent:(NSString *)content emptyImage:(UIImage *)emptyImage;
/**
 提示文案
 */
@property (copy,nonatomic) NSString*content;

/**
 提示图片
 */
@property (copy,nonatomic) UIImage *emptyImage;

@end
