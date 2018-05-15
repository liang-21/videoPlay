//
//  TDFIntroductionHeaderView.m
//  RestApp
//
//  Created by happyo on 16/10/21.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFIntroductionHeaderView.h"
#import "UIImage+Resize.h"
#import "Masonry.h"

@interface TDFIntroductionHeaderView ()

@property (nonatomic, strong) UIImageView *igvIcon;

@property (nonatomic, strong) UILabel *lblDescription;

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) UIView *moreView;

@property (nonatomic, strong) void (^detailBlock)();

@property (nonatomic, strong) UIImageView *badgeImageView;

@property (copy, nonatomic) NSString *detailTitle;

@end
@implementation TDFIntroductionHeaderView

static CGSize imageSize;

+ (instancetype)headerViewWithIcon:(UIImage *)icon description:(NSString *)description {

    return [[self class] headerViewWithIcon:icon description:description badgeIcon:nil];
}

+ (instancetype)headerViewWithIcon:(UIImage *)icon description:(NSString *)description badgeIcon:(UIImage *)badgeIcon {

    return [[self class] headerViewWithIcon:icon description:description badgeIcon:badgeIcon detailBlock:nil];
}
+ (instancetype)headerViewWithIcon:(UIImage *)icon description:(NSString *)description badgeIcon:(UIImage *)badgeIcon detailBlock:(void (^)())detailBlock {

    return [[self class] headerViewWithIcon:icon description:description badgeIcon:badgeIcon detailTitle:nil detailBlock:detailBlock];
}

+ (instancetype)headerViewWithIcon:(UIImage *)icon description:(NSString *)description badgeIcon:(UIImage *)badgeIcon detailTitle:(NSString *)detailTitle detailBlock:(void (^)())detailBlock {
    TDFIntroductionHeaderView *view = [[[self class] alloc] initWithImageIcon:icon description:description detailTitle:detailTitle detailBlock:detailBlock];
    view.badgeImageView.image = badgeIcon;
    
    return view;
}

- (instancetype)initWithImageIcon:(UIImage *)icon description:(NSString *)description detailTitle:(NSString *)detailTitle  detailBlock:(void (^)())detailBlock {
    imageSize = icon ? icon.size : CGSizeMake(60.0, 60.0);
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    self = [super initWithFrame:CGRectMake(0, 0, screenWidth, [TDFIntroductionHeaderView getHeightWithDescription:description shouldShowButton:detailBlock != nil shouldLimitLineNumber:NO])];
    
    if (self) {
        //
        _detailTitle = detailTitle;
        [self initView];
        
        self.igvIcon.image = icon;
        
        self.lblDescription.text = description;
        
        self.detailBlock = detailBlock;
        self.moreView.hidden = detailBlock == nil;
    }
    return self;
}

- (instancetype)initWithImageIcon:(UIImage *)icon description:(NSString *)description detailBlock:(void (^)())detailBlock
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    imageSize = icon ? icon.size : CGSizeMake(60.0, 60.0);
    self = [super initWithFrame:CGRectMake(0, 0, screenWidth, [TDFIntroductionHeaderView getHeightWithDescription:description shouldShowButton:detailBlock != nil shouldLimitLineNumber:detailBlock != nil])];
    
    if (self) {
        //
        [self initView];

        self.igvIcon.image = icon;
        
		self.lblDescription.numberOfLines = 4;
		
        self.lblDescription.text = description;
        
        self.detailBlock = detailBlock;
        self.moreView.hidden = detailBlock == nil;
    }
    
    return self;
}

- (instancetype)initWithImageIcon:(UIImage *)icon description:(NSString *)description detailBlock:(void (^)())detailBlock shouldLimitLineNumber:(BOOL)shouldLimitLineNumber
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    imageSize = icon ? icon.size : CGSizeMake(60.0, 60.0);
    self = [super initWithFrame:CGRectMake(0, 0, screenWidth, [TDFIntroductionHeaderView getHeightWithDescription:description shouldShowButton:detailBlock != nil shouldLimitLineNumber:shouldLimitLineNumber])];
    
    if (self) {
        //
        [self initView];
        
        self.igvIcon.image = icon;
        
        self.lblDescription.numberOfLines = shouldLimitLineNumber ? 4 : 0;
        
        self.lblDescription.text = description;
        
        self.detailBlock = detailBlock;
        self.moreView.hidden = detailBlock == nil;
    }
    
    return self;
}

- (instancetype)initWithImageIcon:(UIImage *)icon description:(NSString *)description
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    imageSize = icon ? icon.size : CGSizeMake(60.0, 60.0);
    self = [super initWithFrame:CGRectMake(0, 0, screenWidth, [TDFIntroductionHeaderView getHeightWithDescription:description shouldShowButton:NO shouldLimitLineNumber:NO])];
    
    if (self) {
        //
        [self initView];
        
        self.igvIcon.image = icon;
        
		self.lblDescription.numberOfLines = 0;
		
        self.lblDescription.text = description;
        
//        self.btnMore.hidden = YES;
        self.moreView.hidden = YES;
        
//        self.detailBlock = detailBlock;
    }
    
    return self;
}

- (void)changeBackAlpha:(CGFloat)alpha
{
    self.backView.alpha = alpha;
}

- (void)initView
{
    self.backView = [[UIView alloc] initWithFrame:CGRectZero];
    self.backView.backgroundColor = [UIColor whiteColor];
    self.backView.alpha = 0.7;
    [self addSubview:self.backView];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.bottom.equalTo(self).with.offset(-1);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
    }];
    
    [self addSubview:self.igvIcon];
    CGFloat topMargin = imageSize.height > 60.0 ? 20.0 : 10.0;
    [self.igvIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(topMargin);
        make.centerX.equalTo(self);
//        make.width.equalTo(@(60));
//        make.height.equalTo(@(60));
    }];
    
    [self addSubview:self.lblDescription];
    topMargin = imageSize.height > 60.0 ? 22.0 : 7.0;
    [self.lblDescription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).with.offset(10);
        make.trailing.equalTo(self).with.offset(-10);
        make.top.equalTo(self.igvIcon.mas_bottom).with.offset(topMargin);
    }];
    
    [self addSubview:self.badgeImageView];
    [self.badgeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.width.mas_offset(56);
        make.height.mas_offset(56);
    }];
    
//    [self addSubview:self.btnMore];
//    [self.btnMore mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.trailing.equalTo(self).with.offset(-10);
//        make.height.equalTo(@(13));
//        make.width.equalTo(@(65));
//        make.bottom.equalTo(self).with.offset(-13);
//    }];
    
    UILabel *lblMore = [[UILabel alloc] initWithFrame:CGRectZero];
    lblMore.font = [UIFont systemFontOfSize:13];
    lblMore.textColor = [UIColor colorWithRed:0/255.0 green:136/255.0 blue:204/255.0 alpha:1];
    lblMore.text = self.detailTitle ?: NSLocalizedString(@"查看详情", nil);
    lblMore.textAlignment = NSTextAlignmentRight;
    
    [self.moreView addSubview:lblMore];
    [lblMore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.moreView).with.offset(-11);
        make.leading.equalTo(self.moreView);
        make.top.equalTo(self.moreView);
        make.bottom.equalTo(self.moreView);
    }];
    
    UIImageView *igvMore = [[UIImageView alloc] initWithFrame:CGRectZero];
    igvMore.image = [UIImage imageNamed:@"display_view_header_blue_arrow" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    
    [self.moreView addSubview:igvMore];
    [igvMore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(6));
        make.height.equalTo(@(11));
        make.centerY.equalTo(self.moreView);
        make.trailing.equalTo(self.moreView);
    }];
    
    [self addSubview:self.moreView];
    [self.moreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self).with.offset(-10);
        make.bottom.equalTo(self).with.offset(-13);
        make.width.equalTo(@(200));
        make.height.equalTo(@(13));
    }];
}


+ (CGFloat)getHeightWithDescription:(NSString *)description shouldShowButton:(BOOL)shouldShowButton shouldLimitLineNumber:(BOOL)shouldLimitLineNumber
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screenWidth - 10 * 2, 0)];
    label.font = [UIFont systemFontOfSize:15];
    if (shouldLimitLineNumber) {
        label.numberOfLines = 4;
    } else {
        label.numberOfLines = 0;
    }
    
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.text = description;
    [label sizeToFit];
    CGFloat lblHeight = label.frame.size.height;
    
    if (shouldShowButton) {
        lblHeight += 26;
    }
    
    if (imageSize.height > 60) {
        return lblHeight + 20 + imageSize.height + 22 + 11;
    }
    
    return lblHeight + 10 + imageSize.height + 7 + 11;
}

- (void)btnMoreClicked
{
    if (self.detailBlock) {
        self.detailBlock();
    }
}

#pragma mark -- Getters && Setters --

- (UIImageView *)igvIcon
{
    if (!_igvIcon) {
        _igvIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    
    return _igvIcon;
}

- (UILabel *)lblDescription
{
    if (!_lblDescription) {
        _lblDescription = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblDescription.font = [UIFont systemFontOfSize:15];
        _lblDescription.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        _lblDescription.numberOfLines = 0;
    }
    
    return _lblDescription;
}

//- (UIButton *)btnMore
//{
//    if (!_btnMore) {
//        _btnMore = [[UIButton alloc] initWithFrame:CGRectZero];
//        [_btnMore setTitle:@"查看详情" forState:UIControlStateNormal];
//        _btnMore.titleLabel.font = [UIFont systemFontOfSize:13];
//        UIImage *image = [UIImage imageNamed:@"display_view_header_blue_arrow" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
//        [_btnMore setImage:image forState:UIControlStateNormal];
//        [_btnMore setTitleEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 0)];
//        [_btnMore setImageEdgeInsets:UIEdgeInsetsMake(0, 62, 0, 0)];
//        UIColor *color = [UIColor colorWithRed:0/255.0 green:136/255.0 blue:204/255.0 alpha:1];
//        [_btnMore setTitleColor:color forState:UIControlStateNormal];
//        [_btnMore addTarget:self action:@selector(btnMoreClicked) forControlEvents:UIControlEventTouchUpInside];
//    }
//    
//    return _btnMore;
//}

- (UIImageView *)badgeImageView {
    
    if (!_badgeImageView) {
        
        _badgeImageView = [[UIImageView alloc] init];
    }
    
    return _badgeImageView;
}

- (UIView *)moreView
{
    if (!_moreView) {
        _moreView = [[UIView alloc] initWithFrame:CGRectZero];
        _moreView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btnMoreClicked)];
        [_moreView addGestureRecognizer:tapGestureRecognizer];
    }
    
    return _moreView;
}

@end
