//
//  TDFCardBgImageBaseItem.m
//  RestApp
//
//  Created by chaiweiwei on 2016/11/3.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import "TDFCardBgImageBaseItem.h"

@implementation TDFCardBgImageBaseItem

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.titleForAddImageButton = NSLocalizedString(@"选择图片", nil);
    }
    
    return self;
}

@end
