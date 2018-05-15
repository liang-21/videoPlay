//
//  TDFTableWithTwoBtnWithImageItem.m
//  TDFComponents
//
//  Created by 刘红琳 on 2017/11/15.
//

#import "TDFTableWithTwoBtnWithImageItem.h"

@implementation TDFTableWithTwoBtnWithImageItem
- (instancetype)init {
    if(self = [super init]) {
        self.cellStyle = TDFTableWithTwoBtnWithImageStyleDefault;
        self.isLastItem = YES;
    }
    return self;
}
@end
