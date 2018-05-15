//
//  TDFItemValidator.h
//  Pods
//
//  Created by tripleCC on 2017/5/11.
//
//

#import <Foundation/Foundation.h>

@interface TDFItemValidator : NSObject
+ (BOOL (^)(NSString *))validatorMaxLength:(NSInteger)length;
+ (BOOL (^)(NSString *))validatorMaxInteger:(NSInteger)integer;
+ (BOOL (^)(NSString *))validatorMaxInteger:(NSInteger)integer decimalLength:(NSInteger)length;
+ (BOOL (^)(NSString *))validatorDecimalLength:(NSInteger)length;
@end
