//
//  TDFSwitchHeaderItem.h
//  Pods
//
//  Created by doubanjiang on 2018/3/2.
//

#import "DHTTableViewItem.h"

@interface TDFSwitchHeaderItem : DHTTableViewItem

@property (nonatomic ,strong) NSArray<NSString *> *names;

@property (nonatomic ,strong) UIFont *font;

@property (nonatomic ,assign) NSInteger switchIndex;

@property (nonatomic ,copy) void(^didSwitch)(NSInteger index);

@end
