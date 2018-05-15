//
//  TDFSelectItem.h
//  RestApp
//
//  Created by chaiweiwei on 2016/11/4.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTTableViewItem.h"

@interface TDFSelectItem : DHTTableViewItem

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *leftIconName;
@property (nonatomic,assign) BOOL selectStatus;

@property (nonatomic, strong) BOOL (^filterBlock)(BOOL selectStatus);

@end
