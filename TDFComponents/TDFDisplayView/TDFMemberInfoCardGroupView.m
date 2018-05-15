//
//  TDFMemberInfoCardGroupView.m
//  TDFMemberPod
//
//  Created by 黄河 on 2017/4/25.
//  Copyright © 2017年 黄河. All rights reserved.
//

#import "TDFMemberInfoCardGroupView.h"
#import "UIImageView+TDFRequest.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
#import "TDFDataCenter.h"

@interface TDFMemberInfoCardDataLabelView ()

@property (nonatomic, strong)UILabel *titleLabel;

@property (nonatomic, strong)UILabel *dataLabel;

@end

@implementation TDFMemberInfoCardDataLabelView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configView];
    }
    return self;
}

- (void)configView {
    [self addSubview:self.titleLabel];
    [self addSubview:self.dataLabel];
    [self layoutView];
}

- (void)layoutView {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
    }];
    [self.dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.bottom.equalTo(self);
    }];
}
#pragma mark -- setter && getter

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}

- (UILabel *)dataLabel {
    if (!_dataLabel) {
        _dataLabel = [[UILabel alloc] init];
        _dataLabel.textAlignment = NSTextAlignmentCenter;
        _dataLabel.textColor = [UIColor colorWithHeX:0xE68028];
        _dataLabel.font = [UIFont systemFontOfSize:15];
    }
    return _dataLabel;
}

- (void)setDataDictionary:(NSDictionary *)dataDictionary {
    _dataDictionary = dataDictionary;
    self.titleLabel.text = dataDictionary[@"title"];
    self.dataLabel.text = dataDictionary[@"detail"];
}

- (void)setStyle:(NSString *)style {
    _style = style;
    UIColor *textColor = [UIColor whiteColor];
    if (style.length > 0) {
        if([style rangeOfString:NSLocalizedString(@"黑色", nil)].location !=NSNotFound){
            textColor = [UIColor blackColor];
        }
    }
    self.titleLabel.textColor = textColor;
}

@end

@interface TDFMemberInfoCardDataView ()

@property (nonatomic, strong)NSMutableArray *viewArray;

@end

@implementation TDFMemberInfoCardDataView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    }
    return self;
}

#pragma mark -- setter && getter

- (NSMutableArray *)viewArray {
    if (!_viewArray) {
        _viewArray = [NSMutableArray array];
    }
    return _viewArray;
}
- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    for (TDFMemberInfoCardDataLabelView *view in self.viewArray) {
        view.hidden = YES;
    }
    
    for (int i = 0; i < dataArray.count; i ++) {
        TDFMemberInfoCardDataLabelView *labelView ;
        if (i < self.viewArray.count) {
            labelView = self.viewArray[i];
        }else {
            labelView = [[TDFMemberInfoCardDataLabelView alloc] init];
            [self.viewArray addObject:labelView];
            [self addSubview:labelView];
        }
        labelView.hidden = NO;
        labelView.style = self.style;
        [labelView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.centerX.equalTo(self.mas_centerX).multipliedBy((2*i + 1)/2.0);
        }];
        labelView.dataDictionary = dataArray[i];
    }
}


@end


@interface TDFMemberInfoCardShadowView ()

@property (nonatomic, strong)UIButton *sendButton;

@property (nonatomic, strong)UILabel *infoLabel;

@end

@implementation TDFMemberInfoCardShadowView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        [self configView];
    }
    return self;
}

- (void)configView {
    self.sendButton.titleLabel.font = [UIFont systemFontOfSize:10];
    [self.sendButton addTarget:self action:@selector(sendCardButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.sendButton setTitle:NSLocalizedString(@"重发此卡", nil) forState:UIControlStateNormal];
    self.sendButton.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    self.sendButton.layer.cornerRadius = 30;
    [self addSubview:self.sendButton];
    
    self.infoLabel.textColor = [UIColor whiteColor];
    self.infoLabel.font = [UIFont systemFontOfSize:12];
    self.infoLabel.backgroundColor = [UIColor redColor];
    [self addSubview:self.infoLabel];
    
    [self layoutView];
}

- (void)layoutView {
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(40);
        make.centerX.equalTo(self);
        make.width.height.equalTo(@60);
    }];
    
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(10);
        make.width.greaterThanOrEqualTo(@70);
        make.height.equalTo(@20);
    }];
}

- (void)setCardName:(NSString *)cardName {
    _cardName = cardName;
    self.infoLabel.text = [NSString stringWithFormat:NSLocalizedString(@"  会员已删除此%@  ", nil),cardName];
}

- (void)sendCardButtonClick:(UIButton *)button {
    if (self.buttonClick) {
        self.buttonClick(NO);
    }
}

#pragma mark -- setter && getter

- (UIButton *)sendButton {
    if (!_sendButton) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _sendButton;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc] init];
    }
    return _infoLabel;
}

@end



@interface TDFMemberInfoCardView ()

@property (nonatomic, strong)TDFMemberInfoCardDataView *dataView;

@property (nonatomic, strong)UILabel *shopNameLabel;

@property (nonatomic, strong)UIView *centerView;

@property (nonatomic, strong)UILabel *nameLabel;

@property (nonatomic, strong)UILabel *subInfoLabel;

@property (nonatomic, strong)UIImageView *backImageView;

@property (nonatomic, strong)TDFMemberInfoCardShadowView *shadowView;

@property (nonatomic, strong)UIButton *sendButton;
@end

@implementation TDFMemberInfoCardView
- (instancetype)init {
    self = [super init];
    if (self) {
        [self configView];
    }
    return self;
}

- (void)configView {
    self.layer.cornerRadius = 3;
    self.layer.masksToBounds = YES;
    [self addSubview:self.backImageView];
    
    self.sendButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.sendButton setTitle:NSLocalizedString(@"发卡", nil) forState:UIControlStateNormal];
    self.sendButton.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    self.sendButton.layer.cornerRadius = 30;
    [self.sendButton addTarget:self action:@selector(sendCardButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.sendButton];
    
    self.shopNameLabel.textColor = [UIColor whiteColor];
    self.shopNameLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.shopNameLabel];
    
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.font = [UIFont systemFontOfSize:18];
    [self.centerView addSubview:self.nameLabel];
    
    self.subInfoLabel.textColor = [UIColor whiteColor];
    self.subInfoLabel.font = [UIFont systemFontOfSize:15];
    [self.centerView addSubview:self.subInfoLabel];
    [self addSubview:self.centerView];
    
    [self addSubview:self.dataView];
    
    __weak typeof(self) weakself = self;
    self.shadowView.buttonClick = ^(BOOL isNoData) {
        if (weakself.buttonClick) {
            weakself.buttonClick(NO);
        }
    };
    [self addSubview:self.shadowView];
    [self layoutView];
}

- (void)layoutView {
    
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(40);
        make.centerX.equalTo(self);
        make.width.height.equalTo(@60);
    }];
    
    [self.dataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.height.equalTo(@45);
    }];
    
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(21);
        make.top.equalTo(self).offset(20);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.centerView);
    }];
    [self.subInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom);
        make.bottom.equalTo(self.centerView);
        make.centerX.equalTo(self.nameLabel);
    }];
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}

- (void)sendCardButtonClick:(UIButton *)button {
    if (self.buttonClick) {
        self.buttonClick(YES);
    }
}

#pragma mark -- setter && getter

- (void)setItem:(TDFMemberInfoSubCardItem *)item {
    _item = item;
    if (item) {
        self.sendButton.hidden = YES;

        self.dataView.style = item.style;
        self.dataView.dataArray = item.cardInfoArray;
        
        self.shopNameLabel.text = item.shopName;
        self.nameLabel.text = item.cardName;
        self.subInfoLabel.text = item.subInfoStr;
        [self.backImageView tdf_imageRequstWithPath:item.imageUrl placeholderImage:[UIImage imageNamed:@"img_card_back" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] urlModel:ImageUrlOrigin];
        
        if (item.isDeleted == 1) {
            self.shopNameLabel.text = nil;
            self.subInfoLabel.text = nil;
            self.nameLabel.text = nil;
            self.shadowView.hidden = NO;
            self.shadowView.cardName = item.cardName;
        }else {
            self.shadowView.hidden = YES;
        }
        UIColor *textColor = [UIColor whiteColor];
        if (item.style.length > 0) {
            if([item.style rangeOfString:NSLocalizedString(@"黑色", nil)].location !=NSNotFound){
                textColor = [UIColor blackColor];
            }
        }
        self.shopNameLabel.textColor = textColor;
        self.nameLabel.textColor = textColor;
        self.subInfoLabel.textColor = textColor;
        
    }else {
        self.shopNameLabel.text = nil;
        self.subInfoLabel.text = nil;
        self.nameLabel.text = nil;
        self.shadowView.hidden = YES;
        self.sendButton.hidden = NO;
        self.backImageView.image = [UIImage imageNamed:@"img_card_back" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
        if (item.useMemberSystem) {
            self.dataView.dataArray = @[@{@"title":@"余额",
                                          @"detail":[NSString stringWithFormat:@"%@0.00",[TDFDataCenter sharedInstance].defaultCurrencySymbol]},
                                        ];
        } else {
            self.dataView.dataArray = @[@{@"title":@"折扣",
                                          @"detail":@"0.0折"},
                                        @{@"title":@"余额",
                                          @"detail":[NSString stringWithFormat:@"%@0.00",[TDFDataCenter sharedInstance].defaultCurrencySymbol]},
                                        ];
        }
    }
}



- (UIButton *)sendButton {
    if (!_sendButton) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _sendButton;
}

- (TDFMemberInfoCardShadowView *)shadowView {
    if (!_shadowView) {
        _shadowView = [[TDFMemberInfoCardShadowView alloc] init];
    }
    return _shadowView;
}

- (TDFMemberInfoCardDataView *)dataView {
    if (!_dataView) {
        _dataView = [[TDFMemberInfoCardDataView alloc] init];
    }
    return _dataView;
}

- (UILabel *)shopNameLabel {
    if (!_shopNameLabel) {
        _shopNameLabel = [[UILabel alloc] init];
    }
    return _shopNameLabel;
}

- (UILabel *)subInfoLabel {
    if (!_subInfoLabel) {
        _subInfoLabel = [[UILabel alloc] init];
    }
    return _subInfoLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
    }
    return _nameLabel;
}

- (UIView *)centerView {
    if (!_centerView) {
        _centerView = [[UIView alloc] init];
    }
    return _centerView;
}

- (UIImageView *)backImageView {
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] init];
    }
    return _backImageView;
}

@end

@interface TDFMemberInfoCardGroupView ()<UIScrollViewDelegate>

@property (nonatomic, assign)NSUInteger currentIndex;

@property (nonatomic, strong)UIScrollView *groupScrollView;

@property (nonatomic, strong)UIPageControl *pageControl;

@property (nonatomic, strong)NSMutableArray *viewArray;

@property (nonatomic, strong)TDFMemberInfoCardItem *item;

@end

@implementation TDFMemberInfoCardGroupView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configView];
    }
    return self;
}

- (void)configView {
    self.groupScrollView.showsHorizontalScrollIndicator = NO;
    self.groupScrollView.pagingEnabled = YES;
    self.groupScrollView.delegate = self;
    [self addSubview:self.groupScrollView];
    
    self.pageControl.currentPageIndicatorTintColor = [UIColor colorWithHeX:0x555555];
    self.pageControl.pageIndicatorTintColor = [UIColor colorWithHeX:0x888888];
    self.pageControl.hidesForSinglePage = YES;
    [self addSubview:self.pageControl];
    [self layoutView];
}

- (void)layoutView {
    [self.groupScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(20, 10, 20, 10));
    }];
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self.groupScrollView.mas_bottom);
        make.bottom.equalTo(self);
    }];
}

#pragma mark -- loadData

- (void)configWithItem:(TDFMemberInfoCardItem *)item {
    self.item = item;
}

- (TDFMemberInfoCardView *)getCardViewWithIndex:(NSUInteger)index {
    TDFMemberInfoCardView *cardView;
    float width = [UIScreen mainScreen].bounds.size.width - 30;
    float left = 5 + index * (width + 10);
    if (index < self.viewArray.count) {
        cardView = self.viewArray[index];
        cardView.hidden = NO;
    }else {
        cardView = [[TDFMemberInfoCardView alloc] init];
        [self.viewArray addObject:cardView];
        [self.groupScrollView addSubview:cardView];
    }
    [cardView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.groupScrollView).offset(left);
        make.top.equalTo(self.groupScrollView).offset(5);
        make.height.equalTo(self.groupScrollView.mas_height).offset(-10);
        make.width.equalTo(self.groupScrollView.mas_width).offset(-10);
    }];
    return cardView;
}


#pragma mark -- setter && getter
- (UIScrollView *)groupScrollView {
    if (!_groupScrollView) {
        _groupScrollView = [[UIScrollView alloc] init];
    }
    return _groupScrollView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
    }
    return _pageControl;
}

- (NSMutableArray *)viewArray {
    if (!_viewArray) {
        _viewArray = [NSMutableArray array];
    }
    return _viewArray;
}

- (void)setItem:(TDFMemberInfoCardItem *)item {
    _item = item;
    self.pageControl.numberOfPages = item.dataArray.count;
    for (UIView *view in self.viewArray) {
        view.hidden = YES;
    }
    if (item.dataArray.count == 0) {
        TDFMemberInfoCardView *cardView = [self getCardViewWithIndex:0];
        cardView.item = nil;
        cardView.buttonClick = ^(BOOL isNoData){
            if (item.filterBlock) {
                item.filterBlock(isNoData);
            }
        };
        
    }else {
        [item.dataArray enumerateObjectsUsingBlock:^(TDFMemberInfoSubCardItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            TDFMemberInfoCardView *cardView = [self getCardViewWithIndex:idx];
            cardView.buttonClick = ^(BOOL isNoData){
                if (item.filterBlock) {
                    item.filterBlock(isNoData);
                }
            };
            cardView.item = obj;
        }];
    }
    self.groupScrollView.contentSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 20) * item.dataArray.count, 0);
    self.currentIndex = item.currentCardIndex;
}

- (void)setCurrentIndex:(NSUInteger)currentIndex {
    if (_currentIndex == currentIndex) {
        return;
    }
    _currentIndex = currentIndex;
    self.pageControl.currentPage = currentIndex;
    [self.groupScrollView setContentOffset:CGPointMake(self.groupScrollView.bounds.size.width * currentIndex, 0)];
    if (self.item.scrollBlock) {
        self.item.scrollBlock(self.item.dataArray[currentIndex], currentIndex);
    }
}
#pragma mark -- UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSUInteger index = scrollView.contentOffset.x/scrollView.bounds.size.width;
    if (self.currentIndex != index) {
        self.currentIndex = index;
    }
}

@end
