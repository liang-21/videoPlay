//
//  TDFDPSwitchItem.h
//  Pods
//
//  Created by happyo on 2018/3/27.
//

#import "DHTTableViewItem.h"

@interface TDFDPTextItem : DHTTableViewItem

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *detail;

@property (nonatomic, assign) BOOL required;

@property (nonatomic, assign) BOOL shouldShow;

@property (nonatomic, assign) BOOL editable;

@property (nonatomic, assign) int keyboardType; // 1.全键盘 2.数字键盘

@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) NSString *preText;

@property (nonatomic, assign) BOOL isShowTip;

@end
