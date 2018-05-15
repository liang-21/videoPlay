//
//  TDFSmallImageItem.h
//  Pods
//
//  Created by 小龙虾 on 2017/7/15.
//
//

#import <Foundation/Foundation.h>
#import "DHTTableViewItem.h"

@interface TDFSmallImageItem : DHTTableViewItem
@property (nonatomic, copy)NSString *title;
/***最多放置三张图片**/
@property (nonatomic, strong)NSArray *imageAry;
@end
