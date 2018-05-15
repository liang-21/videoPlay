//
//  TDFBigImageItem.h
//  RestApp
//
//  Created by chaiweiwei on 2016/11/2.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import "TDFBaseEditItem.h"

@interface TDFBigImageItem : DHTTableViewItem

@property (nonatomic, copy) NSString *leftTagTextValue;
@property (nonatomic, copy) NSString *topTitleValue;
@property (nonatomic, copy) NSString *bottomTitleValue;
@property (nonatomic, copy) NSString *bgImageNamePath;
@property (nonatomic, copy) NSString *bgDefultImageName;

@property (nonatomic, copy) NSString *fontColor;

@property (nonatomic, assign) BOOL shouldShow;
@property (nonatomic, assign) BOOL isShowTip;

@end
