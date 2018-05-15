//
//  TDFOrderItem.m
//  RestApp
//
//  Created by happyo on 16/9/12.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFOrderItem.h"

@implementation TDFOrderItem

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.numValue = 0;
        self.metric = NSLocalizedString(@"份", nil);
    }
    
    return self;
}

@end
