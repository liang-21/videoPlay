//
//  TDFMemberInfoFunctionItem.h
//  TDFMemberPod
//
//  Created by 黄河 on 2017/4/24.
//  Copyright © 2017年 黄河. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TDFBaseEditItem.h"
@interface TDFMemberInfoFunctionSubModel : NSObject

@property (nonatomic, strong)NSString *name;

@property (nonatomic, strong)NSString *iconString;

@property (nonatomic, strong)NSString *actionCode;

@property (nonatomic, assign)BOOL isLock;

@end
@interface TDFMemberInfoFunctionItem : DHTTableViewItem<TDFEditCommonPropertyProtocol>
@property (nonatomic, strong)NSArray<TDFMemberInfoFunctionSubModel *> *dataArray;

/** 分割线是否显示 默认显示 */
@property (nonatomic, assign) BOOL showLine;

@property (nonatomic, strong)void(^filterBlock)(TDFMemberInfoFunctionSubModel *model);
@end
