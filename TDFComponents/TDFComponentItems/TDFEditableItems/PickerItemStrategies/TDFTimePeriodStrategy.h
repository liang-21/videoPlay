//
//  TDFTimePeriodStrategy.h
//  AFNetworking
//
//  Created by Xihe on 2017/12/19.
//

#import <Foundation/Foundation.h>
#import "TDFShowTimeStrategy.h"

@interface TDFTimePeriodStrategy : TDFPickerActionStrategy <TDFPickerStrategyDelegate>

@property (copy, nonatomic) NSString *timePeriodText;

@end
