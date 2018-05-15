//
//  TDFEleInvUnusualItem.h
//  Pods
//
//  Created by Arlen on 2017/6/19.
//
//

#import "TDFBaseEditItem.h"

typedef enum : NSUInteger {
    TDFEleInvUnusualTypeNone,                   //没有异常
    TDFEleInvUnusualTypeExpired,                //已过期
    TDFEleInvUnusualTypeNoneMargin,             //余量为0
    TDFEleInvUnusualTypeReconsideration,        //重新审核
    TDFEleInvUnusualTypeManuallyClosed,         //手动关闭
    TDFEleInvUnusualTypeAuditfailure,           //审核失败
    
} TDFEleInvUnusualType;

@interface TDFEleInvUnusualItem : TDFBaseEditItem

@property (nonatomic, assign) TDFEleInvUnusualType unusualType;     //异常类型

@property (nonatomic, strong) NSString *manualClosedTime;
@property (nonatomic, strong) NSString *submitTime;
@property (nonatomic, strong) NSString *errryMessage;


@property (nonatomic, copy) void(^clickBack)(TDFEleInvUnusualType *unusuaType);

@end
