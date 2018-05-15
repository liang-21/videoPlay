//
//  TDFSKDisplayedImageItem.h
//  RestApp
//
//  Created by tripleCC on 2017/5/11.
//  Copyright © 2017年 杭州迪火科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHTTableViewItem.h"

@interface TDFSKDisplayedImageItem : DHTTableViewItem
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIImage *placeholderimage;

@property (assign, nonatomic) UIEdgeInsets imageInsets;
@property (assign, nonatomic) UIViewContentMode contentMode;
@property (assign, nonatomic) CGFloat cellHeight;
/**
 还没有实现
 */
@property (strong, nonatomic) NSString *imageURLString;
@end
