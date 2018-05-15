//
//  TDFTableViewItem.h
//  Pods
//
//  Created by chaiweiwei on 2017/4/28.
//
//

#import "DHTTableViewItem.h"
#import "TDFTableViewItem.h"

//-------------------------
// title         accessoryLable1
// subtitle      accessoryLable2
//-------------------------

@interface TDFMutiTableViewItem : DHTTableViewItem

@property (assign, nonatomic) TDFTableViewCellSeperatorLineType seperatorType;
/** 分割线的左右边距 */
@property (nonatomic, assign) UIEdgeInsets seperatoInsets;

@property (copy,nonatomic) NSString *title;

@property (copy,nonatomic) UIColor *titleColor;

@property (copy,nonatomic) UIFont *titleFont;

@property (copy,nonatomic) NSString *title2;

@property (copy,nonatomic) NSAttributedString *titleAtt2;

@property (copy,nonatomic) UIColor *titleColor2;

@property (copy,nonatomic) UIFont *titleFont2;

@property (copy,nonatomic) NSString *subtitle;

@property (copy,nonatomic) NSAttributedString *subtitleAtt;

@property (copy,nonatomic) UIColor *subtitleColor;

@property (copy,nonatomic) UIFont *subtitleFont;

@property (copy,nonatomic) NSString *subtitle2;

@property (copy,nonatomic) UIColor *subtitleColor2;

@property (copy,nonatomic) UIFont *subtitleFont2;

@property (copy,nonatomic) NSAttributedString *subtitleAtt2;

@property (nonatomic, assign) CGFloat contentViewAlpha;

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, assign) BOOL showRight;
@end

