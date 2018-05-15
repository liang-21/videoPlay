//
//  TDFWalletDrawItem.h
//  TDFComponents
//
//  Created by chaiweiwei on 2017/10/11.
//

#import "DHTTableViewItem.h"

@interface TDFWalletDrawItem : DHTTableViewItem

@property (nonatomic,copy) NSString *charUnit;
@property (nonatomic,copy) NSString *signUtil;
@property (nonatomic,copy) NSString *limitMoney;
@property (nonatomic,copy) NSString *placeholder;
@property (nonatomic,copy) NSString *transferTime;
@property (nonatomic,copy) NSString *poundage;

@property (nonatomic,copy) void (^drawAllActionCallBack)(void);
@property (nonatomic,copy) void (^drawAvailableCallBack)(BOOL isAvailable,NSString *value);

@end
