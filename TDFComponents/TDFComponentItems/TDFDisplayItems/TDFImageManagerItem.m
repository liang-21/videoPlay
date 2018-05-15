//
//  TDFImageManagerItem.m
//  RestApp
//
//  Created by happyo on 16/10/26.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFImageManagerItem.h"

@implementation TDFImageManagerItem

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.title = @"";
        self.downloadUrl = @"";
        self.hidenLineView = YES;
        self.isOldUrl = YES;
    }
    
    return self;
}

@end
