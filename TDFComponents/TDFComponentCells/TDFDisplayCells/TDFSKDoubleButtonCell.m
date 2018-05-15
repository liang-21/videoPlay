//
//  TDFSKDoubleButtonCell.m
//  DHTTableViewManager
//
//  Created by tripleCC on 12/9/16.
//  Copyright © 2016 tripleCC. All rights reserved.
//
#import <Masonry/Masonry.h>
#import "TDFSKDoubleButtonCell.h"
#import "TDFSKDoubleButtonItem.h"

static const CGFloat kTDFSKDoubleButtonCellCommonMargin = 10;
static const CGFloat kTDFSKDoubleButtonCellButtonHeight = 44;

@interface TDFSKDoubleButtonCell()
@property (strong, nonatomic) UIButton *leftButton;
@property (strong, nonatomic) UIButton *rightButton;
@property (strong, nonatomic) TDFSKDoubleButtonItem *item;
@end

@implementation TDFSKDoubleButtonCell
- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.leftButton];
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kTDFSKDoubleButtonCellCommonMargin);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@(kTDFSKDoubleButtonCellButtonHeight));
        make.width.equalTo(self.contentView).offset(-1.5 * kTDFSKDoubleButtonCellCommonMargin).dividedBy(2);
    }];
    
    [self.contentView addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-kTDFSKDoubleButtonCellCommonMargin);
        make.width.equalTo(self.leftButton);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@(kTDFSKDoubleButtonCellButtonHeight));
    }];
}

- (void)configCellWithItem:(TDFSKDoubleButtonItem *)item {
    self.item = item;
    
    if (item.leftTransaction.backgroundImageName) {
        [self.leftButton setBackgroundImage:[UIImage imageNamed:item.leftTransaction.backgroundImageName] forState:UIControlStateNormal];
    } else {
        self.leftButton.backgroundColor = item.leftTransaction.backgroundColor ? : [UIColor redColor];;
    }
    [self.leftButton setTitle:item.leftTransaction.title forState:UIControlStateNormal];
    
    if (item.rightTransaction.backgroundImageName) {
        [self.rightButton setBackgroundImage:[UIImage imageNamed:item.rightTransaction.backgroundImageName] forState:UIControlStateNormal];
    } else {
        self.rightButton.backgroundColor = item.rightTransaction.backgroundColor ? : [UIColor redColor];;
    }
    [self.rightButton setTitle:item.rightTransaction.title forState:UIControlStateNormal];
}

+ (CGFloat)heightForCellWithItem:(TDFSKDoubleButtonItem *)item {
    return item.cellHeight;
}

- (void)buttonOnClicked:(UIButton *)button {
    if (button == self.leftButton) {
        !self.item.leftTransaction.clickedHandler ? : self.item.leftTransaction.clickedHandler();
    } else {
        !self.item.rightTransaction.clickedHandler ? : self.item.rightTransaction.clickedHandler();
    }
}

- (UIButton *)leftButton {
    if (_leftButton == nil) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.layer.cornerRadius = 6.0f;
        _leftButton.clipsToBounds = YES;
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_leftButton addTarget:self action:@selector(buttonOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _leftButton;
}

- (UIButton *)rightButton {
    if (_rightButton == nil) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.layer.cornerRadius = 6.0f;
        _rightButton.clipsToBounds = YES;
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_rightButton addTarget:self action:@selector(buttonOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _rightButton;
}
@end
