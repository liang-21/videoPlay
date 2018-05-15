//
//  TDFAvatarImageItem.m
//  Pods
//
//  Created by chaiweiwei on 2016/12/28.
//
//

#import "TDFAvatarImageItem.h"

@implementation TDFAvatarImageItem

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.defaultFileName = @"img_stuff_male";
        self.preValue = @"";
        self.filePath = @"";
    }
    
    return self;
}

@end
