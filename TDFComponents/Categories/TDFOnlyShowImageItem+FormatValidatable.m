//
//  TDFOnlyShowImageItem+FormatValidatable.m
//  Pods
//
//  Created by chaiweiwei on 2017/7/28.
//
//

#import "TDFOnlyShowImageItem+FormatValidatable.h"
#import <objc/runtime.h>

@implementation TDFOnlyShowImageItem (FormatValidatable)

- (id)validatedObject {
    return self.imagePath;
}

- (NSString *)validatedTitle {
    return @"";
}

- (BOOL)valid {
    return YES;
}

- (void)setFormatValidBlock:(TDFFormatValidBlock)formatValidBlock {
    objc_setAssociatedObject(self, @selector(formatValidBlock), formatValidBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TDFFormatValidBlock)formatValidBlock {
    return objc_getAssociatedObject(self, _cmd);
}

@end
