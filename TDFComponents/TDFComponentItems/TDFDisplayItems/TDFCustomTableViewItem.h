//
//  TDFCustomTableViewItem.h
//  Pods
//
//  Created by chaiweiwei on 2017/7/25.
//
//

#import "DHTTableViewItem.h"

//-------------------------
// title borderTip subtitle arrow
//-------------------------

@interface TDFCustomTableViewItem : DHTTableViewItem

@property (copy,nonatomic) NSString *title;

@property (copy,nonatomic) UIColor *titleColor;

@property (copy,nonatomic) UIFont *titleFont;

@property (copy,nonatomic) NSString *subtitle;

@property (copy,nonatomic) UIColor *subtitleColor;

@property (copy,nonatomic) UIFont *subtitleFont;

@property (copy,nonatomic) NSString *borderTip;

@property (copy,nonatomic) UIColor *borderTipColor;

@property (copy,nonatomic) UIColor *borderTipBgColor;

@property (copy,nonatomic) UIFont *borderTipFont;

@end
