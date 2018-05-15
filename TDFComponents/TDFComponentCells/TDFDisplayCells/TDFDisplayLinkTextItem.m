//
//  TDFDisplayLinkTextItem.m
//  TDFElectronicWalletModule
//
//  Created by chaiweiwei on 2017/11/29.
//

#import "TDFDisplayLinkTextItem.h"
#import "UIColor+tdf_standard.h"
#import "TDFSKDisplayedTextItem.h"

@implementation TDFDisplayLinkTextItem

+ (instancetype)item {
    TDFDisplayLinkTextItem *item = [super item];
    item.font = [UIFont systemFontOfSize:15];
    item.textColor = [UIColor tdf_hex_666666];
    item.topMargin = kTDFSKDisplayedTextCommonMargin;
    item.bottomMargin = kTDFSKDisplayedTextCommonMargin;
    item.shouldShow = YES;
    item.textAlignment = NSTextAlignmentLeft;
    return item;
}

@end
