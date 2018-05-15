//
//  TDFShowDateStrategy.m
//  RestApp
//
//  Created by happyo on 16/7/21.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFShowDateStrategy.h"
//#import "DatePickerBox.h"
#import "DateUtils.h"
#import "NSString+Estimate.h"
#import "TDFDatePickerController.h"
#import "UIViewController+TopViewController.h"
#import "TDFInternationalRender.h"
@interface TDFShowDateStrategy ()


@end
@implementation TDFShowDateStrategy

- (void)invoke
{
    [self showDatePickerView];
}

- (void)showDatePickerView
{
    NSDate* date=[NSDate date];
    if ([NSString isNotBlank:self.dateString] && [DateUtils DateWithString:self.dateString type:TDFFormatTimeTypeYearMonthDayString]) {
        date = [DateUtils DateWithString:self.dateString type:TDFFormatTimeTypeYearMonthDayString];
    }
//    [DatePickerBox show:self.pickerName date:date client:self event:0];
    TDFDatePickerController *vc = [[TDFDatePickerController alloc] initWithTitle:self.pickerName currentDate:date datePickerMode:UIDatePickerModeDate];
    vc.mininumDate = self.minDate;
    vc.maxinumDate = self.maxDate;
    vc.competionBlock = ^(NSDate *newDate) {
        NSString *dateStr = [DateUtils formatTimeWithDate:newDate type:TDFFormatTimeTypeYearMonthDay];
        if ([self.delegate conformsToProtocol:@protocol(TDFPickerStrategyDelegate)]) {
            if ([self.delegate strategyCallbackWithTextValue:dateStr requestValue:newDate]) {
                self.dateString = dateStr;
            }
        }

    };
    
    UIViewController *root = [[UIApplication sharedApplication].delegate window].rootViewController;
    [[root tdf_topViewController] presentViewController:vc animated:YES completion:nil];
}

//#pragma mark -- DatePickerClient --
//
//- (BOOL)pickDate:(NSDate *)date event:(NSInteger)event
//{
//    NSString *dateStr = [DateUtils formatTimeWithDate:date type:TDFFormatTimeTypeYearMonthDay];
//    self.dateString = dateStr;
//    
//    if ([self.delegate conformsToProtocol:@protocol(TDFPickerStrategyDelegate)]) {
//        [self.delegate strategyCallbackWithTextValue:dateStr requestValue:date];
//    }
//    
//    return YES;
//}

@end
