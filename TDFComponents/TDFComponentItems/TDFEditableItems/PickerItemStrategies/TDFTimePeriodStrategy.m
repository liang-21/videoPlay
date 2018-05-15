//
//  TDFTimePeriodStrategy.m
//  AFNetworking
//
//  Created by Xihe on 2017/12/19.
//

#import "TDFTimePeriodStrategy.h"

@interface TDFTimePeriodStrategy ()

@property (nonatomic, strong) TDFShowTimeStrategy *beginStrategy;
@property (nonatomic, strong) TDFShowTimeStrategy *endStrategy;
@property (nonatomic, getter=isBeginTimeSetted) BOOL beginTimeSetted;
@property (nonatomic, copy) NSString *beginTimeText;

@end

@implementation TDFTimePeriodStrategy

#pragma mark - Override

- (void)invoke {
    self.beginTimeSetted = NO;
    [self.beginStrategy invoke];
}

#pragma mark - TDFPickerStrategyDelegate


- (BOOL)strategyCallbackWithTextValue:(NSString *)textValue requestValue:(id)requestValue {
    
    if (!self.isBeginTimeSetted) {
        [self.endStrategy invoke];
        self.beginTimeText = textValue;
        self.beginTimeSetted = YES;
    } else if ([self.delegate respondsToSelector:@selector(strategyCallbackWithTextValue:requestValue:)]) {
        NSString *text = [[self.beginTimeText stringByAppendingString:@"-"] stringByAppendingString:textValue];
        [self.delegate strategyCallbackWithTextValue:text requestValue:text];
        self.timePeriodText = text;
    }
    return YES;
}

#pragma mark - Accessor

- (TDFShowTimeStrategy *)beginStrategy {
    if (!_beginStrategy) {
        _beginStrategy = [[TDFShowTimeStrategy alloc] init];
        _beginStrategy.delegate = self;
        _beginStrategy.pickerName = @"开始时间";
    }
    return _beginStrategy;
}

- (TDFShowTimeStrategy *)endStrategy {
    if (!_endStrategy) {
        _endStrategy = [[TDFShowTimeStrategy alloc] init];
        _endStrategy.delegate = self;
        _endStrategy.pickerName = @"结束时间";
    }
    return _endStrategy;
}

- (void)setTimePeriodText:(NSString *)timePeriodText {
    
    NSArray *times = [timePeriodText componentsSeparatedByString:@"-"];
    if (times.count == 2) {
        self.beginStrategy.timeString = times.firstObject;
        self.endStrategy.timeString = times.lastObject;
    }
}

- (NSString *)timePeriodText {
    if (self.beginStrategy.timeString && self.endStrategy.timeString) {
        return [NSString stringWithFormat:@"%@-%@", self.beginStrategy.timeString, self.endStrategy.timeString];
    }
    return nil;
}

@end
