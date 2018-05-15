//
//  TDFDPPickerItem.h
//  Pods
//
//  Created by happyo on 2018/3/27.
//

#import "DHTTableViewItem.h"

@interface TDFDPPickerItem : DHTTableViewItem

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *detail;

@property (nonatomic, assign) BOOL required;

@property (nonatomic, assign) BOOL shouldShow;

@property (nonatomic, assign) BOOL iconDown;

@property (nonatomic, assign) BOOL editable;

@property (nonatomic, strong) NSString *pickerId;

@property (nonatomic, strong) NSString *pickerText;

@property (nonatomic, strong) NSString *preValue;

@property (nonatomic, assign) BOOL isShowTip;

@property (nonatomic, copy) void (^onClick)(void);

@end
