//
//  TDFImageManagerCell.m
//  RestApp
//
//  Created by happyo on 16/10/27.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFImageManagerCell.h"
#import "TDFImageManagerView.h"
#import "TDFImageManagerItem.h"
#import "Masonry.h"

@interface TDFImageManagerCell ()

@property (nonatomic, strong) UILabel *lblTitle;

@property (nonatomic, strong) TDFImageManagerView *imageManagerView;

@property (nonatomic, strong) TDFImageManagerItem *model;

@property (nonatomic,strong) UIView *lineView;
@end
@implementation TDFImageManagerCell

#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.lblTitle];
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).with.offset(10);
        make.top.equalTo(self);
        make.height.equalTo(@(41));
        make.width.lessThanOrEqualTo(@(300));
    }];
    
    [self addSubview:self.imageManagerView];
    [self.imageManagerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self);
        make.top.equalTo(self.lblTitle.mas_bottom);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

- (void)cellWillDisplay
{
    [self.imageManagerView configureViewWithModel:self.model];
}

+ (CGFloat)heightForCellWithItem:(TDFImageManagerItem *)item
{
    if ([item.title isEqualToString:@""]) {
        return 200;
    } else {
        return 200 + 42;
    }
    
}

- (void)configCellWithItem:(TDFImageManagerItem *)item
{
    self.model = item;
    
    CGFloat labelHeight = 0;
    if (![item.title isEqualToString:@""]) {
        labelHeight = 41;
        self.lblTitle.text = item.title;
    }
    [self.lblTitle mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(labelHeight));
    }];
    
    self.lineView.hidden = item.hidenLineView;
}

#pragma mark -- Setters && Getters --

- (TDFImageManagerView *)imageManagerView
{
    if (!_imageManagerView) {
        _imageManagerView = [[TDFImageManagerView alloc] init];
    }
    
    return _imageManagerView;
}

- (UILabel *)lblTitle
{
    if (!_lblTitle) {
        _lblTitle = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblTitle.font = [UIFont systemFontOfSize:15];
        _lblTitle.textColor = [UIColor blackColor];
        _lblTitle.backgroundColor = [UIColor clearColor];
    }
    
    return _lblTitle;
}

-(UIView *)lineView {
    if(!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    }
    return _lineView;
}


@end
