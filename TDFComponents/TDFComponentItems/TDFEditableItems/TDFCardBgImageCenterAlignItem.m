//
//  TDFCardBgImageCenterAlignItem.m
//  Pods
//
//  Created by chaiweiwei on 2017/8/3.
//
//

#import "TDFCardBgImageCenterAlignItem.h"
#import "TDFCardBgImageCenterAlignItem+FormatValidatable.h"

@implementation TDFCardBgImageCenterAlignItem

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.shouldShow = YES;
        self.imageContentMode = UIViewContentModeScaleAspectFill;
    }
    
    return self;
}

- (id)requestValue {
    return self.validatedObject;
}

@end
