//
//  TDFStaticLabelItem+Chainable.h
//  RestApp
//
//  Created by happyo on 16/10/21.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFStaticLabelItem.h"
#import "TDFBaseEditItem+Chainable.h"

typedef id (^TDFMapRequestBlock) (id value);

auto_declare_block(TDFStaticLabelItem)
declare_block_no_asterisk(TDFStaticLabelItem, TDFMapRequestBlock)

@interface TDFStaticLabelItem (Chainable)

declare_method(TDFStaticLabelItem, NSString, title)
declare_method(TDFStaticLabelItem, NSString, detail)
declare_method(TDFStaticLabelItem, BOOL, shouldShow)
declare_method(TDFStaticLabelItem, NSString, requestKey)
declare_method(TDFStaticLabelItem, id, requestValue)
declare_method(TDFStaticLabelItem, TDFMapRequestBlock, mapRequestBlock)
declare_method(TDFStaticLabelItem, id, preValue)
declare_method(TDFStaticLabelItem, BOOL, isShowTip)
declare_method(TDFStaticLabelItem, BOOL, isRequired)

declare_method(TDFStaticLabelItem, NSString, textValue)

@end
