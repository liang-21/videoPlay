//
//  TDFButtonView.h
//  TDFComponents
//
//  Created by guozhi on 2017/10/24.
//

#import "TDFBaseEditItem.h"
@class TDFButtonItem;

@interface TDFButtonView : UIView

- (void)configureViewWithModel:(TDFButtonItem *)model;

+ (CGFloat)getHeightWithModel:(TDFBaseEditItem *)model;
@end
