//
//  TDFSKSingleButtonItem.m
//  DHTTableViewManager
//
//  Created by tripleCC on 12/9/16.
//  Copyright © 2016 tripleCC. All rights reserved.
//

#import "TDFSKSingleButtonItem.h"

@implementation TDFSKSingleButtonItem
+ (instancetype)item {
    TDFSKSingleButtonItem *item = [[TDFSKSingleButtonItem alloc] init];
    item.cellHeight = 44.0f;
    item.shouldShow = YES;
    return item;
}

- (UIColor *)backgroundColor {
    if (!_backgroundColor) {
        switch (self.transaction.backgroundType) {
            case TDFSKButtonItemBackgroundTypeWhite:
                return [UIColor whiteColor];
            default:
                return [UIColor clearColor];
        }
    }
    return _backgroundColor;
}
@end
