//
//  TDFCardBgImageItem.m
//  Pods
//
//  Created by chaiweiwei on 2016/12/21.
//
//

#import "TDFCardBgImageItem.h"
#import <YYModel/YYModel.h>
#import "TDFCardBgImageItem+FormatValidatable.h"

@implementation TDFCardBgImageItem

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.hasCornerRadius = NO;
        self.showRightArea = YES;
        self.imageContentMode = UIViewContentModeScaleAspectFill;
        self.cardImageAreaViewBgColor = [[UIColor whiteColor] colorWithAlphaComponent:0.2];
    }
    
    return self;
}

- (id)requestValue {
    return self.validatedObject;
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"cardImageItems" : [TDFCardBgImageBaseItem class]};
}

@end
