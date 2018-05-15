//
//  TDFSKDisplayedTextItem.m
//  DHTTableViewManager
//
//  Created by tripleCC on 12/10/16.
//  Copyright © 2016 tripleCC. All rights reserved.
//
#import <TDFCategories/TDFCategories.h>
#import "TDFSKDisplayedTextItem.h"

const CGFloat kTDFSKDisplayedTextCommonMargin = 10;

@implementation TDFSKDisplayedTextItem
+ (instancetype)item {
    TDFSKDisplayedTextItem *item = [super item];
    item.font = [UIFont systemFontOfSize:15];
    item.textColor = [UIColor tdf_colorWithRGB:0x666666];
    item.topMargin = kTDFSKDisplayedTextCommonMargin;
    item.bottomMargin = kTDFSKDisplayedTextCommonMargin;
    item.leftMargin = kTDFSKDisplayedTextCommonMargin;
    item.rightMargin = kTDFSKDisplayedTextCommonMargin;
    item.shouldShow = YES;
    item.textAlignment = NSTextAlignmentLeft;
    return item;
}
@end
