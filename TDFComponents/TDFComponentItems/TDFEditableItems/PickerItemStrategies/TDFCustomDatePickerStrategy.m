//
//  TDFCustomDatePickerStrategy.m
//  Pods
//
//  Created by 黄河 on 2017/7/10.
//
//

#import "TDFCustomDatePickerStrategy.h"
#import <TDFPickerProxy/TDFPickerProxy.h>

@interface TDFCustomDatePickerStrategy ()
@property (strong, nonatomic) TDFCustomDatePickerProxy *proxy;
@end

@implementation TDFCustomDatePickerStrategy

- (void)invoke {
    self.proxy.confirmBlock = self.confirmBlock;
    self.proxy.pickerMode = self.datePickerMode;
    self.proxy.dateStr = self.dateStr;
    self.proxy.formart = self.format;
    [self.proxy presentPicker];
}

- (TDFCustomDatePickerProxy *)proxy {
    if (!_proxy) {
        _proxy = [[TDFCustomDatePickerProxy alloc] initWithTitle:self.pickerName model:TDFDatePickerModeDateWithNoYear];
    }
    
    return _proxy;
}

@end
