//
//  TDFDPButtonItem.h
//  Pods
//
//  Created by happyo on 2018/3/27.
//

#import "DHTTableViewItem.h"

@interface TDFDPButtonItem : DHTTableViewItem

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *textColor;

@property (nonatomic) BOOL shouldShow;

@property (nonatomic, strong) void (^onClick)(void);

@end
