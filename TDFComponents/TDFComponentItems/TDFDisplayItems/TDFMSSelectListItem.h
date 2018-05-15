//
//  TDFMSDiscountListItem.h
//  TDFComponents
//
//  Created by 黄河 on 2017/12/9.
//

#import "TDFBaseEditItem.h"

@interface TDFMSSelectListItem : TDFBaseEditItem

@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, assign) BOOL select;
@property (nonatomic, assign) BOOL hide;
@property (nonatomic, assign) CGFloat height;
@end
