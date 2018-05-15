//
//  TDFReviewStatusItem.m
//  Pods
//
//  Created by chaiweiwei on 2017/7/25.
//
//

#import "TDFReviewStatusItem.h"
#import <TDFOldBaseUtil/UIColor+Hex.h>

@interface TDFReviewButtonItem()

@end

@implementation TDFReviewButtonItem

+ (instancetype)buttonWithTitle:(NSString *)buttonTitle type:(TDFReviewButtonType)buttonType {
    TDFReviewButtonItem *item = [[TDFReviewButtonItem alloc] init];
    item.buttonType = buttonType;
    item.buttonTitle = buttonTitle;
    return item;
}

@end


@implementation TDFReviewStatusItem

- (instancetype)init {
    if(self = [super init]) {
        self.extendContentColor = [UIColor colorWithHexString:@"#666666"];
    }
    return self;
}

@end
