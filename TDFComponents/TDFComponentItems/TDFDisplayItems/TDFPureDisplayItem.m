//
//  TDFPureDisplayItem.m
//  TDFComponents
//
//  Created by 刘红琳 on 2017/11/15.
//

#import "TDFPureDisplayItem.h"
#import "UIColor+Hex.h"

@implementation TDFPureDisplayItem

- (instancetype)init {
    if(self = [super init]) {
        self.subTextColor = [UIColor colorWithHexString:@"#999999"];
    }
    return self;
}

@end
