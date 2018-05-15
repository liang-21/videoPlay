//
//  TDFFoodSelectItem.h
//  Pods
//
//  Created by happyo on 2016/11/30.
//
//

#import "DHTTableViewItem.h"

@interface TDFFoodSelectItem : DHTTableViewItem

@property (nonatomic, assign, getter=isSelected) BOOL selected;

@property (nonatomic, strong) NSString *title; // 左边label的值

@property (nonatomic, strong) NSString *value; // 右边label的值

@property (nonatomic, strong) void (^selectedBlock)(BOOL isSelected);

@property (nonatomic, assign) CGFloat alpha;

@property (nonatomic, assign) BOOL shouldShow;

@end
