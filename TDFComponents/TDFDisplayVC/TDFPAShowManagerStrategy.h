//
//  TDFPAShowManagerStrategy.h
//  RestApp
//
//  Created by happyo on 16/8/2.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFPickerActionStrategy.h"
#import "INameItem.h"

@interface TDFPAShowManagerStrategy : TDFPickerActionStrategy

@property (nonatomic, strong) NSMutableArray<id<INameItem>> *pickerItemList;

@property (nonatomic, strong) id<INameItem> selectedItem;

@property (nonatomic, strong) NSString *pickerName;

@property (nonatomic, strong) NSString *managerName;

@property (nonatomic, strong) void (^managerClickedBlock)();

@property (nonatomic, assign) BOOL shouldShowManagerButton;

@end
