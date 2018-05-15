//
//  TDFCardBgImageItem+FormatValidatable.m
//  Pods
//
//  Created by chaiweiwei on 2017/7/28.
//
//

#import "TDFCardBgImageItem+FormatValidatable.h"
#import <objc/runtime.h>

@implementation TDFCardBgImageItem (FormatValidatable)

- (id)validatedObject {
    NSArray *tempArray = [[self.cardImageItems tdf_filter:^BOOL(TDFCardBgImageBaseItem *value) {
        return value.cardImagePath.length > 0;
    }] tdf_map:^id(TDFCardBgImageBaseItem *value) {
        return value.cardImagePath;
    }];
    
    return tempArray;
}

- (NSString *)validatedTitle {
    return [self.title componentsSeparatedByString:@"("].firstObject;
}

- (BOOL)valid {
    if(self.isRequired) {
        NSArray *tempArray = [self.cardImageItems tdf_filter:^BOOL(TDFCardBgImageBaseItem *value) {
            return value.cardImagePath.length > 0;
        }];
        
        return tempArray.count > 0;
    }
    return YES;
}

- (void)setValidatedMessage:(NSString *)validatedMessage {
    objc_setAssociatedObject(self, @selector(validatedMessage), validatedMessage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)validatedMessage {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setFormatValidBlock:(TDFFormatValidBlock)formatValidBlock {
    objc_setAssociatedObject(self, @selector(formatValidBlock), formatValidBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TDFFormatValidBlock)formatValidBlock {
    return objc_getAssociatedObject(self, _cmd);
}


@end
