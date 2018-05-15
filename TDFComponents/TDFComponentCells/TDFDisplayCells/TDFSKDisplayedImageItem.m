//
//  TDFSKDisplayedImageItem.m
//  RestApp
//
//  Created by tripleCC on 2017/5/11.
//  Copyright © 2017年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFSKDisplayedImageItem.h"

@implementation TDFSKDisplayedImageItem
+ (instancetype)item {
    TDFSKDisplayedImageItem *item = [super item];
    item.contentMode = UIViewContentModeScaleAspectFit;
    return item;
}
@end
