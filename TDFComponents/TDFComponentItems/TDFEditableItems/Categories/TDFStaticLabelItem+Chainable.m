//
//  TDFStaticLabelItem+Chainable.m
//  RestApp
//
//  Created by happyo on 16/10/21.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFStaticLabelItem+Chainable.h"

@implementation TDFStaticLabelItem (Chainable)

imp_method_asterisk(TDFStaticLabelItem, NSString, title)
imp_method_asterisk(TDFStaticLabelItem, NSString, detail)
imp_method_no_asterisk(TDFStaticLabelItem, BOOL, shouldShow)
imp_method_asterisk(TDFStaticLabelItem, NSString, requestKey)
imp_method_no_asterisk(TDFStaticLabelItem, id, requestValue)
imp_method_no_asterisk(TDFStaticLabelItem, TDFMapRequestBlock, mapRequestBlock)
imp_method_no_asterisk(TDFStaticLabelItem, id, preValue)
imp_method_no_asterisk(TDFStaticLabelItem, BOOL, isShowTip)
imp_method_no_asterisk(TDFStaticLabelItem, BOOL, isRequired)

imp_method_asterisk(TDFStaticLabelItem, NSString, textValue)

@end
