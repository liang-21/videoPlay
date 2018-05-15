//
//  TDFTextfieldItemValidator.m
//  Pods
//
//  Created by tripleCC on 2017/5/11.
//
//
#import "TDFTextfieldItemValidator.h"

@implementation TDFTextfieldItemValidator
+ (BOOL (^)(TDFTextfieldItem *, NSString *value))validateTextLength:(NSInteger)length
                                                      unpassHandler:(void (^)(TDFTextfieldItem *))handler {
    return ^BOOL(TDFTextfieldItem *item, NSString *value){
        
        BOOL validate = value.length <= length;
        
        if (!validate) {
            item.textValue = [value substringToIndex:length];
            
            !handler ?: handler(item);
        }
        return validate;
    };

}
+ (BOOL (^)(TDFTextfieldItem *, NSString *value))validateTextLength:(NSInteger)length {
    return [self validateTextLength:length unpassHandler:nil];
}

@end
