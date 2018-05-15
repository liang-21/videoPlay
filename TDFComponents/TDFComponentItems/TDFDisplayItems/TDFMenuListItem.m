//
//  TDFMenuListItem.m
//  Pods
//
//  Created by tripleCC on 2017/6/26.
//
//

#import "TDFMenuListItem.h"
#import <TDFCore/TDFCore.h>

@implementation TDFMenuListItem
- (instancetype)init
{
    self = [super init];
    if (self) {
        _titleFont = [UIFont boldSystemFontOfSize:18];
        _detailFont = [UIFont systemFontOfSize:13];
    }
    return self;
}

+ (instancetype)itemWithTitle:(NSString *)title detail:(NSString *)detail imageURL:(NSString *)imageURL {
    TDFMenuListItem *item = [self item];
    item.title = title;
    item.detail = detail;
    item.imageURL = imageURL;
    
    return item;
}

- (UIImage *)statusImage {
    switch (self.status) {
        case TDFMenuFunctionStatusWillCome:
            return TDFLocaizedImageInBundle(@"tdf_m_activity_will_come_icon", [NSBundle bundleForClass:[self class]]);
        
        case TDFMenuFunctionStatusAvailable:
        case TDFMenuFunctionStatusNone:
        default:
            return nil;
    }
}
@end
