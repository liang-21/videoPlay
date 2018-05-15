//
//  TDFMenuGrayHeaderItem.h
//  TDFShopInfoModule
//
//  Created by chaiweiwei on 2018/4/11.
//

#import "DHTTableViewItem.h"

@interface TDFMenuGrayHeaderItem : DHTTableViewItem

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,copy) UIFont *subtitleFont;
@property (nonatomic,copy) UIColor *subtitleColor;
@property (nonatomic,copy) UIImage *tagIcon;
/** 分割线的左右边距 */
@property (nonatomic, assign) UIEdgeInsets seperatoInsets;

@property (nonatomic,assign) CGFloat height;

@end
