//
//  TDFHomeGroupForwardItem.m
//  Pods
//
//  Created by happyo on 2017/3/24.
//
//

#import "TDFHomeGroupForwardItem.h"

@implementation TDFHomeGroupForwardChildCellModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"isOpen" : @[@"isOpen",@"open"],
             @"isLock" : @[@"isLock",@"locked"],
             @"_id" : @"id",
             @"title": @[@"title",@"actionName"]};
}

@end
@implementation TDFHomeGroupForwardItem

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{@"forwardCells" : [TDFHomeGroupForwardChildCellModel class]};
}

@end
