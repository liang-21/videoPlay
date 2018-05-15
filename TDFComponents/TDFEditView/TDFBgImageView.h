//
//  TDFBgImageView.h
//  RestApp
//
//  Created by chaiweiwei on 2016/11/2.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import "TDFBaseEditView.h"
#import "TDFBigImageItem.h"

@interface TDFBgImageView : UIView

@property (nonatomic, strong) TDFBigImageItem *model;

- (void)configureViewWithModel:(TDFBigImageItem *)model;

+ (CGFloat)getHeight;

@end
