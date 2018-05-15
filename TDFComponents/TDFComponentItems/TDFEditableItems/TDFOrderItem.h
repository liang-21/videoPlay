//
//  TDFOrderItem.h
//  RestApp
//
//  Created by happyo on 16/9/12.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFBaseEditItem.h"

@interface TDFOrderItem : TDFBaseEditItem

@property (nonatomic, assign) NSInteger numValue;

@property (nonatomic, strong) NSString *metric; // 单位 默认为“份”

@property (nonatomic, strong) BOOL (^filterBlock)(NSInteger newNumValue);

@end
