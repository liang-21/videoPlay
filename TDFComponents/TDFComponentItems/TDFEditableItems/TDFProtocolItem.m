//
//  TDFProtocolItem.m
//  Pods
//
//  Created by chaiweiwei on 2017/7/14.
//
//

#import "TDFProtocolItem.h"

@implementation TDFProtocolButtonItem


@end

@implementation TDFProtocolItem
@synthesize shouldShow;

- (instancetype)init{
    if(self = [super init]) {
        self.shouldShow = YES;
        self.lineStyle = TDFMultiLine;
    }
    return self;
}

@end
