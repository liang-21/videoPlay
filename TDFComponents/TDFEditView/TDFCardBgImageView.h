//
//  TDFCardBgImageView.h
//  RestApp
//
//  Created by chaiweiwei on 2016/11/3.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDFCardBgImageItem.h"
#import "TDFBaseEditView.h"

@interface TDFCardBgImageView : TDFBaseEditView

@property (nonatomic, strong) TDFCardBgImageItem *model;

+ (CGFloat)getHeightWithModel:(TDFCardBgImageItem *)model;

@end
