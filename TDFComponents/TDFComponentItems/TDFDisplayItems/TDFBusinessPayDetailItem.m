//
//  TDFBusinessPayDetailItem.m
//  Pods
//
//  Created by happyo on 2016/11/25.
//
//

#import "TDFBusinessPayDetailItem.h"
#import "TDFDataCenter.h"

@implementation TDFBusinessPayDetailItem

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"tabelNum" : @[@"seatName"],
             @"memberName" : @[@"cardCustomerName"],
             @"payTypeList" : @[@"paymentTypes"]
             };
}

- (NSString *)formatAccount
{
    return [NSString stringWithFormat:NSLocalizedString(@"%.2f%@", nil), self.fee,TDFCurrencySymbol];
}

@end
