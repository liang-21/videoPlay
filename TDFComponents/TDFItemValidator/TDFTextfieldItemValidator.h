//
//  TDFTextfieldItemValidator.h
//  Pods
//
//  Created by tripleCC on 2017/5/11.
//
//
#import "TDFItemValidator.h"
#import "TDFTextfieldItem+FormatValidatable.h"

@interface TDFTextfieldItemValidator : TDFItemValidator
+ (BOOL (^)(TDFTextfieldItem *, NSString *value))validateTextLength:(NSInteger)length;
+ (BOOL (^)(TDFTextfieldItem *, NSString *value))validateTextLength:(NSInteger)length
                                                      unpassHandler:(void (^)(TDFTextfieldItem *))handler;
@end
