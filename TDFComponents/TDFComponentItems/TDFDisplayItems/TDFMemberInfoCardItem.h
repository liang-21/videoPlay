//
//  TDFMemberInfoCardItem.h
//  TDFMemberPod
//
//  Created by 黄河 on 2017/4/25.
//  Copyright © 2017年 黄河. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTTableViewItem.h"
#import "TDFBaseEditItem.h"
@interface TDFMemberInfoSubCardItem : NSObject

/**
 * key1 @"title"
 * key2 @"detail"
 */
@property (nonatomic, strong)NSArray<NSDictionary*> *cardInfoArray;

@property (nonatomic, strong)NSString *cardName;

@property (nonatomic, strong)NSString *style;

@property (nonatomic, strong)NSString *subInfoStr;

@property (nonatomic, strong)NSString *shopName;

@property (nonatomic, strong)NSString *imageUrl;

@property (nonatomic, assign)int isDeleted;

@property (nonatomic, assign) BOOL useMemberSystem;/* 使用了会员体系<*/

@end

@interface TDFMemberInfoCardItem : DHTTableViewItem<TDFEditCommonPropertyProtocol>

@property (nonatomic, assign)NSUInteger currentCardIndex;

@property (nonatomic, copy)void(^scrollBlock)(TDFMemberInfoSubCardItem *item, NSUInteger index);

/**
 * isNoData YES 代表发卡, NO 代表重发此卡
 */
@property (nonatomic, copy)void(^filterBlock)(BOOL isNoData);

@property (nonatomic, strong)NSArray<TDFMemberInfoSubCardItem *> *dataArray;

@end
