//
//  TDFMultiSwitchItem.h
//  Pods
//
//  Created by chaiweiwei on 2017/5/22.
//
//

#import <Foundation/Foundation.h>
#import "TDFSwitchItem.h"

@interface TDFMultiSwitchItem : DHTTableViewItem

/**
 左边的标题
 */
@property (nonatomic, strong) NSString *title;

/**
 右边的描述
 */
@property (nonatomic, strong) NSString *subtitle;
/**
 subtitle的字体颜色
 */
@property (nonatomic, strong) UIColor *subtitleColor;

@property (nonatomic, copy) NSArray<TDFSwitchItem *> *switchItems;

@end
