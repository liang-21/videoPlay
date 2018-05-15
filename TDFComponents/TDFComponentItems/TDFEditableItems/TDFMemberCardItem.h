//
//  TDFMemberCardItem.h
//  Pods
//
//  Created by 黄河 on 2017/6/5.
//
//

#import "TDFBaseEditItem.h"
#import "TDFCardSelectorItemProtocol.h"

@interface TDFMemberCardItem : TDFBaseEditItem<TDFEditCommonPropertyProtocol,TDFCardSelectorItemProtocol>

@property (nonatomic, strong)NSString *cardName;

@property (nonatomic, strong)NSString *discountName;

@property (nonatomic, strong)NSString *shopName;

@property (nonatomic, strong)NSString *imageUrl;

@property (nonatomic, strong)NSString *fontColor;

@property (nonatomic, copy)void(^filterBlock)();

@end
