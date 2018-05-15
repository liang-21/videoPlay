//
//  TDFSelectView.h
//  RestApp
//
//  Created by chaiweiwei on 2016/11/4.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDFSelectItem.h"

@interface TDFSelectView : UIView

@property (nonatomic,strong) TDFSelectItem *model;

- (void)configureViewWithModel:(TDFSelectItem *)model;

+ (CGFloat)getHeightWithModel:(TDFSelectItem *)model;

@end
