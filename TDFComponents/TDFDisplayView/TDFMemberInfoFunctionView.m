//
//  TDFMemberInfoFunctionView.m
//  TDFMemberPod
//
//  Created by 黄河 on 2017/4/24.
//  Copyright © 2017年 黄河. All rights reserved.
//

#import "TDFMemberInfoFunctionView.h"
#import "TDFMemberInfoFunctionItem.h"
#import "Masonry.h"
@interface TDFMemberInfoFunctionSubView ()

@property (nonatomic, strong)UILabel *titleLabel;

@property (nonatomic, strong)UIImageView *headerImageView;

@property (nonatomic, strong)UIImageView *lockImageView;

@end

@implementation TDFMemberInfoFunctionSubView

+ (instancetype)memberInfoFunctionSubView {
    return [[self alloc] init];
}
- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self configSubView];
        [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)configSubView {
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    
    self.lockImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.lockImageView];
    
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.headerImageView];
    [self layoutView];
}

- (void)layoutView {
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.centerX.equalTo(self);
        make.height.equalTo(@54);
        make.width.equalTo(self.headerImageView.mas_height);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerImageView.mas_bottom);
        make.left.right.bottom.equalTo(self);
    }];
    
    [self.lockImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.headerImageView.mas_right);
        make.top.equalTo(self.headerImageView.mas_top);
    }];
}

#pragma mark -- Click
- (void)click:(UIControl *)control {
    if (self.filterBlock) {
        self.filterBlock(self.model);
    }
}

#pragma mark -- setter && getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

- (UIImageView *)headerImageView {
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] init];
    }
    return _headerImageView;
}

- (UIImageView *)lockImageView {
    if (!_lockImageView) {
        _lockImageView = [[UIImageView alloc] init];
    }
    return _lockImageView;
}

- (void)setModel:(TDFMemberInfoFunctionSubModel *)model {
    _model = model;
    self.titleLabel.text = model.name;
    self.headerImageView.image = [UIImage imageNamed:model.iconString];
    self.lockImageView.image = model.isLock ? [UIImage imageNamed:@"ico_pw_w" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil]:nil;
}

@end

@interface TDFMemberInfoFunctionView ()
@property (nonatomic, strong)NSMutableArray *viewArray;
/** 背景View */
@property (nonatomic, strong) UIView *backgroundView;
/** 分割线 */
@property (nonatomic, strong) UIView *line;
@end

@implementation TDFMemberInfoFunctionView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.backgroundView = [[UIView alloc] init];
        [self addSubview:self.backgroundView];
        [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        UIView *spliteView = [[UIView alloc] initWithFrame:CGRectZero];
        spliteView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
        [self addSubview:spliteView];
        [spliteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
            make.bottom.equalTo(self);
            make.height.equalTo(@1);
        }];
        self.line = spliteView;
        
        
    }
    return self;
}

- (void)configWithModel:(TDFMemberInfoFunctionItem *)model {
    self.line.hidden = !model.showLine;
    [self.backgroundView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.viewArray removeAllObjects];
    __block int count = model.dataArray.count;
    //控件距离左边的距离
    CGFloat margin = 10;
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 2 * margin)/4;
    CGFloat height = 95;
    
    for (int i = 0; i < model.dataArray.count; i ++) {
        int x = i % 4;
        int y = i / 4;
        TDFMemberInfoFunctionSubView *subView = [TDFMemberInfoFunctionSubView memberInfoFunctionSubView];
        [self.backgroundView addSubview:subView];
        [self.viewArray addObject:subView];
        subView.model = model.dataArray[i];
        subView.filterBlock = model.filterBlock;
        [subView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10+x * width);
            make.top.equalTo(self).offset(y * height);
            make.width.equalTo(@(width));
            make.height.equalTo(@(height));
        }];
    }
}

#pragma mark -- setter && getter
- (NSMutableArray *)viewArray {
    if (!_viewArray) {
        _viewArray = [NSMutableArray array];
    }
    return _viewArray;
}

@end
