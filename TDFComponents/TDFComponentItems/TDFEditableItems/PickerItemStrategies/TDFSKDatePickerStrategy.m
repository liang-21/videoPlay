//
//  TDFSKDatePickerStrategy.m
//  Pods
//
//  Created by tripleCC on 2017/5/16.
//
//

#import <TDFPickerProxy/TDFPickerProxy.h>
#import "TDFSKDatePickerStrategy.h"

@interface TDFSKDatePickerStrategy() <TDFDatePickerProxyDelegate>
@property (strong, nonatomic) TDFDatePickerProxy *proxy;
@end

@implementation TDFSKDatePickerStrategy
- (instancetype)init {
    if (self = [super init]) {
        self.datePickerMode = UIDatePickerModeDate;
    }
    
    return self;
}

- (void)invoke {
    self.proxy.date = self.date;
    self.proxy.mininumDate = self.mininumDate;
    self.proxy.maxinumDate = self.maxinumDate;
    self.proxy.datePickerMode = self.datePickerMode;
    [self.proxy presentPicker];
}

- (void)pickerProxy:(TDFDatePickerProxy *)proxy didPickDate:(NSDate *)date {
    if ([self.delegate conformsToProtocol:@protocol(TDFPickerStrategyDelegate)]) {
        
        NSString *dateString = nil;
        if (self.reformDateBlock) {
            dateString = self.reformDateBlock(date);
        }
        
        if ([self.delegate strategyCallbackWithTextValue:dateString requestValue:self.date]) {
            self.date = date;
        }
        
        if (self.afterApplyBlock) {
            self.afterApplyBlock(dateString);
        }
    }
}

- (TDFDatePickerProxy *)proxy {
    if (!_proxy) {
        _proxy = [[TDFDatePickerProxy alloc] initWithTitle:self.pickerName date:self.date model:UIDatePickerModeDate];
        _proxy.delegate = self;
    }
    
    return _proxy;
}
@end
