//
//  TDFSKOptionPickerStrategy.h
//  TDFBaseSettingModule
//
//  Created by tripleCC on 3/20/17.
//  Copyright © 2017 tripleCC. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "TDFPickerActionStrategy.h"

@interface TDFSKOptionPickerStrategy : TDFPickerActionStrategy
@property (strong, nonatomic) NSString *pickerName;
@property (strong, nonatomic) NSArray *items;
@property (assign, nonatomic) NSInteger selectedIndex;
@property (copy, nonatomic) void (^afterApplyBlock)(id item);
@end
