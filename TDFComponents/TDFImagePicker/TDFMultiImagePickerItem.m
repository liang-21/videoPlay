//
//  TDFMultiImagePickerItem.m
//  Pods
//
//  Created by Octree on 31/8/17.
//
//

#import "TDFMultiImagePickerItem.h"

@implementation TDFMultiImagePickerItem

- (instancetype)init {

    if (self = [super init]) {
        
        self.shouldShow = YES;
    }
    return self;
}

- (void)setPreValue:(NSArray *)preValue {

    if (preValue.count == 0) {
        [super setPreValue:nil];
    } else {
    
        [super setPreValue:preValue];
    }
}

- (void)setRequestValue:(NSArray *)requestValue {

    if (requestValue.count == 0) {
        [super setRequestValue:nil];
    } else {
        
        [super setRequestValue:requestValue];
    }
}

- (BOOL)isShowTip {

    NSInteger preCount = [self.preValue count];
    NSInteger curCount = [self.requestValue count];
    if (preCount != curCount) {
        return YES;
    }
    
    for (NSInteger index = 0; index < curCount; index++) {
        NSString *pre = [self.preValue objectAtIndex:index];
        NSString *cur = [self.requestValue objectAtIndex:index];
        if (![pre isEqual:cur]) {
            return YES;
        }
    }
    return NO;
}

@end
