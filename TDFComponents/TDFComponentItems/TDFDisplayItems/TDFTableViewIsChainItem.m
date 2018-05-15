//
//  TDFTableViewIsChainItem.m
//  Pods
//
//  Created by 刘红琳 on 2017/5/17.
//
//

#import "TDFTableViewIsChainItem.h"

@implementation TDFTableViewIsChainItem

- (instancetype)init {
    if(self = [super init]) {
        self.shouldShow = YES;
        self.isDelete = NO;
        self.bgViewColor = [UIColor colorWithWhite:1 alpha:0.7];
        self.isHideLine = YES;
        self.isChain = YES;
    }
    return self;
}

@end
