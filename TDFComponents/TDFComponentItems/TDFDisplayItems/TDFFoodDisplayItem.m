//
//  TDFFoodDisplayItem.m
//  Pods
//
//  Created by happyo on 2016/11/28.
//
//

#import "TDFFoodDisplayItem.h"

@implementation TDFFoodDisplayItem

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"foodId" : @"menuId",
             @"title" : @"menuName"
             };
}

@end
