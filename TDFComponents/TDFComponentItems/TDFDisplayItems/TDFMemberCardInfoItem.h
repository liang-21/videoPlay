//
//  TDFMemberCardInfoItem.h
//  Pods
//
//  Created by 黄河 on 2017/3/13.
//
//

#import <Foundation/Foundation.h>
#import "DHTTableViewItem.h"
@interface TDFMemberCardInfoItem :DHTTableViewItem

/*
 * 领卡人数、储值总额、积分总额
 */
@property (nonatomic, strong)NSArray *cardInfoArray;

@property (nonatomic, strong)NSString *cardName;

@property (nonatomic, strong)NSString *discountName;

@property (nonatomic, strong)NSString *shopName;

@property (nonatomic, strong)NSString *imageUrl;

@property (nonatomic, assign)int upStatus;

@property (nonatomic, strong)NSString *upgradeTimeMessage;

@property (nonatomic, strong)NSString *fontColor;

@property (nonatomic, copy)void(^filterBlock)();

@end
