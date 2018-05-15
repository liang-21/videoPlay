//
//  TDFPreviewButtonComponent.m
//  Pods
//
//  Created by 黄河 on 2017/6/29.
//
//

#import "TDFPreviewButtonCell.h"
#import "TDFPreviewButtonItem.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <Masonry/Masonry.h>
#import "UIColor+Hex.h"

@interface TDFPreviewButtonCell ()

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UIView *bottomSepLine;

@property (nonatomic, strong) TDFPreviewButtonItem *item;

@property (nonatomic, copy)void(^previewClickBlock)();

@end

@implementation TDFPreviewButtonCell

/**
 cell创建的时候调用，只调用一次，类似viewDidLoad
 */
- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.button];
    [self.contentView addSubview:self.bottomSepLine];
    [self.button setTitleColor:[UIColor colorWithHexString:@"#0088CC"] forState:UIControlStateNormal];
    self.button.titleLabel.font = [UIFont systemFontOfSize:13];
    self.button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-15);
    }];
    
    [self.bottomSepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.equalTo(@1);
    }];
}

/**
 用于获取cell的高度，item可以强转成对应的自定义item
 
 @param item cell对应的model
 @return cell的高度
 */
+ (CGFloat)heightForCellWithItem:(TDFPreviewButtonItem *)item {
    return 30;
}

- (void)buttonClick:(UIButton *)button {
    if (self.previewClickBlock) {
        self.previewClickBlock();
    }
}

/**
 根据item来更新cell，item可以强转成对应的自定义item，此时cell视图大小还未确定
 
 @param item cell对应的model
 */
- (void)configCellWithItem:(TDFPreviewButtonItem *)item {
    self.item = item;
    self.previewClickBlock = item.previewClickBlock;
    self.bottomSepLine.hidden = !item.isShowBottomLine;
    [RACObserve(self, item.isShowBottomLine) subscribeNext:^(id  _Nullable x) {
        self.bottomSepLine.hidden = ![x boolValue];
    }];
    
    [RACObserve(self.item, title) subscribeNext:^(id  _Nullable x) {
        [self.button setTitle:x forState:UIControlStateNormal];
    }];
}

#pragma mark -- setter && getter

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _button;
}

- (UIView *)bottomSepLine {
    if (!_bottomSepLine) {
        _bottomSepLine = [UIView new];
        _bottomSepLine.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    }
    return _bottomSepLine;
}

@end
