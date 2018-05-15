//
//  TDFItemFormatValidator.h
//  Pods
//
//  Created by tripleCC on 2017/5/11.
//
//

#import "TDFItemValidator.h"

@interface TDFItemFormatValidator : TDFItemValidator
+ (TDFFormatValidBlock)ipFormatValidator;
+ (TDFFormatValidBlock)qqValidator;
+ (TDFFormatValidBlock)mobileValidator;
+ (TDFFormatValidBlock)emailValidator;
+ (TDFFormatValidBlock)telephoneValidator;
+ (TDFFormatValidBlock)numAndLetterValidator;
+ (TDFFormatValidBlock)idCardValidator;
@end
