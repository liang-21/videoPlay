//
//  TDFImageBgItem.h
//  RestApp
//
//  Created by 小龙虾 on 2017/7/17.
//  Copyright © 2017年 杭州迪火科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTTableViewItem.h"
@class TDFCardBgImageBaseItem;

@interface TDFImageBgItem : DHTTableViewItem
@property (nonatomic, copy)NSString *title;
@property (nonatomic, strong)NSArray <TDFCardBgImageBaseItem *>*imageAry;
@property (nonatomic, strong)UIImage *iconImg;
/***是否显示下方跳转按钮**/
@property (nonatomic, assign)BOOL showTip;
@property (nonatomic, strong) void(^fileBlock)(NSInteger btnType,NSInteger idx);
@property (nonatomic, strong) void(^clickBlock)();
@end
