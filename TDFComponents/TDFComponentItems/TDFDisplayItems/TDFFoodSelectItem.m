//
//  TDFFoodSelectItem.m
//  Pods
//
//  Created by happyo on 2016/11/30.
//
//

#import "TDFFoodSelectItem.h"

@implementation TDFFoodSelectItem

- (instancetype)init
{
	self = [super init];
	
	if (self) {
		self.alpha = 0.7;
        self.shouldShow = YES;
	}
    
    return self;
}

@end
