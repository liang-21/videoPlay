//
//  TDFMemberInfoCardItem.m
//  TDFMemberPod
//
//  Created by 黄河 on 2017/4/25.
//  Copyright © 2017年 黄河. All rights reserved.
//

#import "TDFMemberInfoCardItem.h"
#import "TDFDataCenter.h"

@implementation TDFMemberInfoSubCardItem
- (NSString *)shopName {
    return [TDFDataCenter sharedInstance].shopName;
}


@end

@implementation TDFMemberInfoCardItem
@synthesize shouldShow = _shouldShow;

@end
