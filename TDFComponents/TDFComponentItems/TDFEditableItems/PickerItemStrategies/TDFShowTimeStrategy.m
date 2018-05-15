//
//  TDFShowTimeStrategy.m
//  RestApp
//
//  Created by happyo on 16/7/21.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFShowTimeStrategy.h"
//#import "TimePickerBox.h"
#import "NSString+Estimate.h"
#import "DateUtils.h"
#import "TDFDatePickerController.h"

#ifndef TDF_ROOT_NAVIGATION_CONTROLLER
#define TDF_ROOT_NAVIGATION_CONTROLLER (UINavigationController *)[[UIApplication sharedApplication].delegate window].rootViewController
#endif

@interface TDFShowTimeStrategy ()

@end
@implementation TDFShowTimeStrategy

- (void)invoke
{
    [self showTimePickerView];
}

- (void)showTimePickerView
{
    NSDate* date=[NSDate date];
    if ([NSString isNotBlank:self.timeString]) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"HH:mm";
        date = [dateFormatter dateFromString:self.timeString];
    }
    
    TDFDatePickerController *pvc = [TDFDatePickerController datePickerControllerWithTitle:self.pickerName currentDate:date datePickerMode:(UIDatePickerModeTime)];
    __weak __typeof(self) wself = self;
    pvc.competionBlock = ^void (NSDate *date) {
    
        [wself pickTime:date event:0];
    };
    
    [TDF_ROOT_NAVIGATION_CONTROLLER presentViewController:pvc animated:YES completion:nil];
    
}

#pragma mark -- TimePickerClient --

- (BOOL)pickTime:(NSDate *)date event:(NSInteger)event
{
    NSString *value = [DateUtils formatTimeWithDate:date type:TDFFormatTimeTypeHourAndMinute];
    if ([self.delegate conformsToProtocol:@protocol(TDFPickerStrategyDelegate)]) {
        if ([self.delegate strategyCallbackWithTextValue:value requestValue:date]) {
            self.timeString = value;
        }
    }
    
    return YES;
}

@end
