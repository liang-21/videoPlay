//
//  TDFItemFormatValidator.m
//  Pods
//
//  Created by tripleCC on 2017/5/11.
//
//
#import "TDFBatchOperation.h"
#import <TDFCategories/TDFCategories.h>
#import <TDFOldBaseUtil/TDFOldBaseUtil.h>

#import "TDFItemFormatValidator.h"

@implementation TDFItemFormatValidator
+ (TDFFormatValidBlock)ipFormatValidator {
    return ^BOOL(NSString *value) {
        return !value.tdf_notEmpty || [NSString isValidatIP:value];
    };
}

+ (TDFFormatValidBlock)qqValidator {
    return ^BOOL(NSString *value) {
        return !value.tdf_notEmpty || [NSString isValidNumber:value];
    };
}


+ (TDFFormatValidBlock)mobileValidator {
    return ^BOOL(NSString *value) {
        return !value.tdf_notEmpty || ([NSString isMobileNumber:value] && [NSString isValidNumber:value]);
    };
}

+ (TDFFormatValidBlock)emailValidator {
    return ^BOOL(NSString *value) {
        return !value.tdf_notEmpty || [NSString isValidateEmail:value];
    };
}

+ (TDFFormatValidBlock)telephoneValidator {
    return ^BOOL(NSString *value) {
        return !value.tdf_notEmpty || [NSString isRightTelephoneNumber:value];
    };
}

+ (TDFFormatValidBlock)numAndLetterValidator {
    
    return ^BOOL(NSString *value) {
        return !value.tdf_notEmpty || ![NSString isNotNumAndLetter:value];
    };
}

+ (TDFFormatValidBlock)idCardValidator {
    return ^BOOL(NSString *value) {
        return !value.tdf_notEmpty || [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^(\\d{14}|\\d{17})(\\d|[xX])$"] evaluateWithObject:value];
    };
}
@end
