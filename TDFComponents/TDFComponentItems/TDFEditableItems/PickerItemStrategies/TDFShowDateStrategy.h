//
//  TDFShowDateStrategy.h
//  RestApp
//
//  Created by happyo on 16/7/21.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFPickerActionStrategy.h"

@interface TDFShowDateStrategy : TDFPickerActionStrategy

@property (nonatomic, strong) NSString *dateString;

@property (nonatomic, strong) NSString *pickerName;
@property (nonatomic, strong) NSDate *minDate;
@property (nonatomic, strong) NSDate *maxDate;

@end
