//
//  ASCCardSelectBackgroundItem.m
//  AssemblyComponent
//
//  Created by 黄河 on 2017/11/28.
//

#import "TDFCardSelectBackgroundItem.h"

@implementation TDFCardSelectBackgroundItem

- (instancetype)init {
    self = [super init];
    if (self) {
        self.imageHeight = 215/345.0 * [UIScreen mainScreen].bounds.size.width;
        self.inset = UIEdgeInsetsMake(0, 15, 10, 15);
    }
    return self;
}

@end
