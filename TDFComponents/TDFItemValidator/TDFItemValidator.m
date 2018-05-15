//
//  TDFItemValidator.m
//  Pods
//
//  Created by tripleCC on 2017/5/11.
//
//

#import "TDFItemValidator.h"

@implementation TDFItemValidator
+ (BOOL (^)(NSString *))validatorMaxLength:(NSInteger)length {
    return ^BOOL(NSString *value){
        return value.length <= length;
    };
}

+ (BOOL (^)(NSString *))validatorMaxInteger:(NSInteger)integer {
    return [self validatorMaxInteger:integer decimalLength:HUGE_VAL];
}

+ (BOOL (^)(NSString *))validatorMaxInteger:(NSInteger)integer decimalLength:(NSInteger)length {
    return ^BOOL(NSString *value) {
        NSArray <NSString *>*numbers = [value componentsSeparatedByString:@"."];
        if (numbers.count > 1) { // 0 - 99.99
            return numbers.lastObject.length <= length && numbers.firstObject.integerValue < integer;
        } else { // 0 - 100
            return numbers.firstObject.integerValue <= integer;
        }
    };
}

+ (BOOL (^)(NSString *))validatorDecimalLength:(NSInteger)length {
    return ^BOOL(NSString *value) {
        NSArray <NSString *>*numbers = [value componentsSeparatedByString:@"."];
        if (numbers.count > 1) {
            return numbers.lastObject.length <= length;
        }
        return YES;
    };
}
@end
