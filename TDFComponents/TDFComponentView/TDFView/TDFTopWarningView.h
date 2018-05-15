//
//  TDFTopWarningview.h
//  Pods
//
//  Created by chaiweiwei on 2017/7/13.
//
//

#import <UIKit/UIKit.h>
#import "TDFTopWarningItem.h"
#import "TDFTableViewViewProtocol.h"

@interface TDFTopWarningView : UIView<TDFTableViewCustomViewDelegate>

+ (instancetype)initViewWithString:(NSString *)warningString hasWarningIcon:(BOOL)hasWarningIcon;

@end
