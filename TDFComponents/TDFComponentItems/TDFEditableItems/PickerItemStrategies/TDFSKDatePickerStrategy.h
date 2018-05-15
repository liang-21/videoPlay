//
//  TDFSKDatePickerStrategy.h
//  Pods
//
//  Created by tripleCC on 2017/5/16.
//
//
#import "TDFPickerActionStrategy.h"

@interface TDFSKDatePickerStrategy : TDFPickerActionStrategy
@property (nonatomic, strong) NSString *pickerName;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSDate *mininumDate;
@property (strong, nonatomic) NSDate *maxinumDate;
@property (assign, nonatomic) UIDatePickerMode datePickerMode;

@property (copy, nonatomic) NSString *(^reformDateBlock)(NSDate *date);
@property (copy, nonatomic) void (^afterApplyBlock)(NSString *dateString);
@end
