//
//  TDFMyShopItem.h
//
//  Created by doubanjiang on 2017/12/12.
//

#import "DHTTableViewItem.h"

@interface TDFMyShopItem : DHTTableViewItem

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *rightTitle;
@property (nonatomic ,strong) NSMutableAttributedString *attributedText;//富文本
@property (nonatomic, copy) NSString *imgUrl;
//是否显示向右箭头
@property (nonatomic, assign) BOOL showRightIcon;
//是否显示右边文本
@property (nonatomic, assign) BOOL showRightLabel;
//是否显示工作中
@property (nonatomic, assign) BOOL showWorkingImage;
//右边文本颜色
@property (nonatomic, strong) UIColor *rightLabelTextColor;

@property (nonatomic, strong) UIColor *subTitleColor;
@property (nonatomic, assign) CGFloat imageCornerRadius;
@property (nonatomic, copy) NSString *defultimgName;

//title距离顶部的距离
@property (nonatomic, assign) CGFloat topDistance;

@end
