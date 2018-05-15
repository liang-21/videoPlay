//
//  TDFAgreeComponentItem.h
//  Pods
//
//  Created by 黄河 on 2017/5/27.
//
//

#import "TDFBaseEditItem.h"
#import "TDFCoreLinkTextData.h"
@interface TDFAgreeComponentItem : TDFBaseEditItem

@property (nonatomic, strong)NSString *content;

@property (nonatomic, strong)NSString *placeholder;

@property (nonatomic, strong)NSString *protocol;

@property (nonatomic, strong)NSString *showTitle;

@property (nonatomic, strong)NSString *showDetail;

@property (nonatomic, strong)NSString *showType;

@property (nonatomic, strong)UIColor *color;

@property (nonatomic, assign) BOOL isAgree;

@property (nonatomic, copy)void(^filterBlock)(BOOL isSelect);

@property (copy, nonatomic)void(^selectProtocol)(TDFCoreLinkTextData *data);
@end
