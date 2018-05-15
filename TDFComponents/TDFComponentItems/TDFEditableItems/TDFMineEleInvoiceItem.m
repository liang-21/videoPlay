//
//  TDFMineEleInvoiceItem.m
//  Pods
//
//  Created by Arlen on 2017/6/17.
//
//

#import "TDFMineEleInvoiceItem.h"

@implementation TDFMineEleInvoiceItem

- (NSString *)remainNum {
    if (_remainNum == nil) {
        _remainNum = @"0";
    }
    return _remainNum;
}

- (NSString *)containPackageNum {
    if (_containPackageNum == nil) {
        _containPackageNum = @"0";
    }
    return _containPackageNum;
}

- (NSString *)snackPackageNum {
    
    if (_snackPackageNum == nil) {
        _snackPackageNum = @"0";
    }
    
    return _snackPackageNum;
}

@end
