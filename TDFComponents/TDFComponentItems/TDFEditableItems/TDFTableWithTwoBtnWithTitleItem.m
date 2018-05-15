//
//  TDFTableWithTwoBtnWithTitleItem.m
//  TDFComponents
//
//  Created by 刘红琳 on 2017/11/14.
//

#import "TDFTableWithTwoBtnWithTitleItem.h"
#import "UIColor+Hex.h"

@implementation TDFTableWithTwoBtnWithTitleItem

- (instancetype)init {
    if(self = [super init]) {
        self.rightTextColor = [UIColor colorWithHexString:@"#FF0033"];
        self.nextRightTextColor = [UIColor colorWithHexString:@"#0088FF"];
    }
    return self;
}

@end
