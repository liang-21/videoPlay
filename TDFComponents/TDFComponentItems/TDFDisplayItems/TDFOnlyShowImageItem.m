//
//  TDFOnlyShowImagesItem.m
//  Pods
//
//  Created by chaiweiwei on 2017/7/17.
//
//

#import "TDFOnlyShowImageItem.h"

@implementation TDFOnlyShowImageItem

- (instancetype)init {
    if(self = [super init]) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        self.imageDefaultSize = CGSizeMake(width-20, (width-20)*233/355);
        self.shouldShow = YES;
    }
    return self;
}

@end
