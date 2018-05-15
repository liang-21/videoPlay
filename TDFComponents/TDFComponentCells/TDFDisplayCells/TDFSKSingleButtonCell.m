//
//  TDFSKSingleButtonCell.m
//  DHTTableViewManager
//
//  Created by tripleCC on 12/9/16.
//  Copyright © 2016 tripleCC. All rights reserved.
//
#import <Masonry/Masonry.h>
#import "TDFSKSingleButtonItem.h"
#import "TDFSKSingleButtonCell.h"

static const CGFloat kTDFSKSingleButtonCellCommonMargin = 10;
static const CGFloat kTDFSKSingleButtonCellButtonHeight = 44;


@interface TDFSKSingleButtonCell()
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) TDFSKSingleButtonItem *item;
@end

@implementation TDFSKSingleButtonCell
- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kTDFSKSingleButtonCellCommonMargin);
        make.right.equalTo(self.contentView).offset(-kTDFSKSingleButtonCellCommonMargin);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@(kTDFSKSingleButtonCellButtonHeight));
    }];
}

- (void)configCellWithItem:(TDFSKSingleButtonItem *)item {
    self.item = item;
    
    self.contentView.hidden = !item.shouldShow;
    if (!item.shouldShow) return;
    
    [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(self.item.transaction.singleButtonCellInsets.left);
        make.right.equalTo(self.contentView).offset(-self.item.transaction.singleButtonCellInsets.right);
    }];
    
    if (item.transaction.backgroundImageName) {
        UIImage *image = [UIImage imageNamed:item.transaction.backgroundImageName];
        if (item.transaction.resizable) {
            image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.5,
                                                                        image.size.width * 0.5,
                                                                        image.size.height * 0.5,
                                                                        image.size.width * 0.5)
                                          resizingMode:UIImageResizingModeStretch];            
        }
        [self.button setBackgroundImage:image forState:UIControlStateNormal];
    } else {
        self.button.backgroundColor = item.transaction.backgroundColor;
        [self.button setBackgroundImage:nil forState:UIControlStateNormal];
    }
    
    [self.button setTitle:item.transaction.title forState:UIControlStateNormal];
    [self.button setTitleColor:item.transaction.titleColor forState:UIControlStateNormal];
    
    if(item.backgroundColor) {
        self.contentView.backgroundColor = item.backgroundColor;
    }
}

+ (CGFloat)heightForCellWithItem:(TDFSKSingleButtonItem *)item {
    return item.shouldShow ? item.cellHeight : 0;
}

- (void)buttonOnClicked:(UIButton *)button {
    !self.item.transaction.clickedHandler ? : self.item.transaction.clickedHandler();
}

- (UIButton *)button {
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.layer.cornerRadius = 6.0f;
        _button.clipsToBounds = YES;
        _button.titleLabel.font = [UIFont systemFontOfSize:15];
        [_button addTarget:self action:@selector(buttonOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _button;
}
@end
