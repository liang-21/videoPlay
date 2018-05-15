//
//  TDFCardImageAreaView.h
//  Pods
//
//  Created by chaiweiwei on 2017/8/3.
//
//

#import <UIKit/UIKit.h>

@interface TDFCardImageAreaView : UIView

@property (nonatomic,strong) UIView *centerAddImageView;

@property (nonatomic,strong) UIImageView *cardImageView;
@property (nonatomic,strong) UILabel *leftTagLabel;
@property (nonatomic,strong) UILabel *topTitleLabel;
@property (nonatomic,strong) UILabel *bottomTitleLabel;
@property (nonatomic,strong) UILabel *titleLabelForAddImage;
@property (nonatomic,strong) UILabel *descTitleLabel;

@property (nonatomic,strong) UIImageView *defalutAddIcon;

@property (nonatomic,strong) UIButton *delButton;

@property (nonatomic,strong) UIButton *cardAddButton;

@property (nonatomic, strong) UIImageView *backgroundImg;

//添加图片区域后面的背景颜色（默认0.2的浅灰色）
@property (nonatomic, copy) UIColor *cardImageAreaViewBgColor;

@property (nonatomic,copy) void (^cardAddButtonActionCallBack)(void);
@property (nonatomic,copy) void (^cardDelButtonActionCallBack)(void);


@end
