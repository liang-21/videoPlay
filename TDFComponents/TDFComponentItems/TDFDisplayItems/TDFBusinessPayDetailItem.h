//
//  TDFBusinessPayDetailItem.h
//  Pods
//
//  Created by happyo on 2016/11/25.
//
//

#import "DHTTableViewItem.h"

@interface TDFBusinessPayDetailItem : DHTTableViewItem

@property (nonatomic, strong) NSString *orderId;

@property (nonatomic, strong) NSString *orderCode;

@property (nonatomic, strong) NSString *totalPayId;

@property (nonatomic, strong) NSString *openDate;

@property (nonatomic, strong) NSString *tabelNum;

@property (nonatomic, strong) NSString *memberName;

@property (nonatomic, assign) double fee;

@property (nonatomic, strong) NSString *formatAccount;

@property (nonatomic, strong) NSArray *payTypeList;

@property (nonatomic, strong) NSArray *payTypeImageList;

@property (nonatomic, strong) NSString *orderStatus; //1 正常 | 2 并单 | 3 撤销 | 4 结账

@property (nonatomic, assign) NSInteger orderFrom;

@end
