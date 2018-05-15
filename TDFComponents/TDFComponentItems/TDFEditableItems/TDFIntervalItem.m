//
//  TDFIntervalItem.m
//  Pods
//
//  Created by guozhi on 2017/8/3.
//
//

#import "TDFIntervalItem.h"

@interface TDFIntervalItem () {
    double _maxValue;
}

/**
 是否设置了最大值
 */
@property (nonatomic, assign) BOOL isSetMax;

@end

@implementation TDFIntervalItem

- (instancetype)init {
    if (self = [super init]) {
        _maxValue = 999999.99;
        _isInputDecimal = YES;
        _limitDecimal = 2;
        _limitInteger = 6;
        _leftText = @"";
        _rightText = @"";
        _leftPreText = @"";
        _rightPreText = @"";
        _shouldClearWhenBeginEditing = YES;
    }
    return self;
}

- (double)maxValue {
    if (_maxValue < 0) {
        _maxValue = 0;
    }

    if (!self.isInputDecimal) {
        self.limitDecimal = 0;
    }
    if (self.isSetMax) {//如果设置了最大值则优先最大值
        return _maxValue;
    }
    
    int maxInteger = pow(10, self.limitInteger) - 1;
    int maxDecimal = pow(10, self.limitDecimal) - 1;
    if (!self.isInputDecimal || self.limitDecimal == 0) {
        _maxValue = maxInteger;
    } else {
        _maxValue = [[NSString stringWithFormat:@"%d.%d", maxInteger, maxDecimal] doubleValue];
    }
    return _maxValue;
    
    
}

- (void)setMaxValue:(double)maxValue {
    _maxValue = maxValue;
    self.isSetMax = YES;
}

- (int)limitDecimal {
    if (_limitDecimal < 0) {
        _limitDecimal = 0;
    }
    return _limitDecimal;
}

- (int)limitInteger {
    if (_limitInteger < 0) {
        _limitInteger = 0;
    }
    return _limitInteger;
}

@end
