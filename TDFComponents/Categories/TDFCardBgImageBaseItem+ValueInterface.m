//
//  TDFCardBgImageBaseItem+ValueInterface.m
//  Pods
//
//  Created by chaiweiwei on 2017/8/1.
//
//

#import "TDFCardBgImageBaseItem+ValueInterface.h"

@implementation TDFCardBgImageBaseItem (ValueInterface)

#pragma mark - TDFItemValueInterfaceProtocol
- (void)setTdf_originValue:(id)value {
    self.cardImagePath = value;
    self.preValue = value;
}

- (void)setTdf_newValue:(id)bs_newValue {
    self.cardImagePath = bs_newValue;
}

- (id)tdf_newValue {
    return self.cardImagePath;
}

@end
