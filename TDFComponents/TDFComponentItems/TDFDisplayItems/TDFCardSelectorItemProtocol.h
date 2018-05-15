//
//  TDFCardSelectorItemProtocol.h
//  RestApp
//
//  Created by tripleCC on 2017/5/15.
//  Copyright © 2017年 杭州迪火科技有限公司. All rights reserved.
//

#ifndef TDFCardSelectorItemProtocol_h
#define TDFCardSelectorItemProtocol_h

#import "TDFBatchOperation.h"


@protocol TDFCardSelectorItemProtocol <TDFSelectableProtocol>
@property (strong, nonatomic) NSString *displayedTitle;
@end

#endif /* TDFCardSelectorItemProtocol_h */
