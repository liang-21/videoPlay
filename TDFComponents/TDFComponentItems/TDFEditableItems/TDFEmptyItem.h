//
//  TDFEmptyItem.h
//  RestApp
//
//  Created by chaiweiwei on 2016/11/7.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTTableViewItem.h"

@interface TDFEmptyItem : DHTTableViewItem

@property (nonatomic, copy) NSString *title;

/** <#注释#> */
@property (nonatomic, strong) UIColor *color;

/** <#注释#> */
@property (nonatomic, assign) CGFloat height;

@end
