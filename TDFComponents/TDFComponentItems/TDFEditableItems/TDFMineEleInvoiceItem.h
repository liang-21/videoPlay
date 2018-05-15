//
//  TDFMineEleInvoiceItem.h
//  Pods
//
//  Created by Arlen on 2017/6/17.
//
//

#import "TDFBaseEditItem.h"

typedef enum : NSUInteger {
    TDFMineEleInvoiceTypeNone,                  //未加餐包状态
    TDFMineEleInvoiceTypeSnackPackage,          //已加餐包状态
} TDFMineEleInvoiceContainPackageType;

@interface TDFMineEleInvoiceItem : TDFBaseEditItem

@property (nonatomic, assign) TDFMineEleInvoiceContainPackageType  type;

@property (nonatomic, copy) void(^useDetailBlock)();        //使用详情
@property (nonatomic, copy) void(^buyPackageBlock)();       //购买加餐包

@property (nonatomic, strong) NSString *validUntil;         //有效期至

@property (nonatomic, strong) NSString *remainNum;          //剩余数量
@property (nonatomic, strong) NSString *containPackageNum;  //包含套餐内数量
@property (nonatomic, strong) NSString *snackPackageNum;    //加餐包内数量

@property (nonatomic, strong) NSString *buyPackageTitle;    //购买新套餐的标题

@end
