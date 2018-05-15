//
//  TDFCustomDatePickerStrategy.h
//  Pods
//
//  Created by 黄河 on 2017/7/10.
//
//

#import <TDFComponents/TDFPickerActionStrategy.h>

@interface TDFCustomDatePickerStrategy : TDFPickerActionStrategy

@property (nonatomic, strong) NSString *pickerName;

@property (nonatomic, strong) NSString *dateStr;

@property (nonatomic, strong) NSString *format;

// 'TDFDatePickerMode'
@property (nonatomic, assign) int datePickerMode;

@property (nonatomic, copy)void(^confirmBlock)(NSString *dateStr, NSString *format);
@end
