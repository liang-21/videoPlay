//
//  TDFButtonCommonItem.m
//  Pods
//
//  Created by chaiweiwei on 2017/6/3.
//
//

#import "TDFButtonCommonItem.h"

@implementation TDFButtonCommonItem

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.title = @"添加";
        self.titleColor = [UIColor colorWithRed:204 green:0 blue:0 alpha:1];
        self.buttonType = TDFButtonCommontTypeAdd;
        self.shouldShow = YES;
    }
    
    return self;
}

@end
