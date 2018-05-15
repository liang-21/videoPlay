//
//  TDFCustomerButtonCell.m
//  TDFMemberPod
//
//  Created by 黄河 on 2017/10/30.
//  Copyright © 2017年 黄河. All rights reserved.
//

#import "TDFCustomerButtonCell.h"
#import "TDFCustomerButtonItem.h"
#import "Masonry.h"

@interface TDFCustomerButtonCell ()


@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) TDFCustomerButtonItem *item;

@end

@implementation TDFCustomerButtonCell

- (void)cellDidLoad {
    
    [self addSubview: self.button];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    self.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);
    
    __weak __typeof(self) wself = self;
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}


+ (CGFloat)heightForCellWithItem:(DHTTableViewItem *)item {
    
    return 60;
}

- (void)configCellWithItem:(TDFCustomerButtonItem *)item {
    self.item = item;
    if (item.cornerRadius > 0) {
        self.button.layer.cornerRadius = item.cornerRadius;
        self.button.layer.masksToBounds = YES;
    }
    self.button.layer.borderWidth = item.borderWidth;
    self.button.layer.borderColor = item.borderColor.CGColor;
    [self.button setTitle:item.title forState:UIControlStateNormal];
    [self.button setTitleColor:item.titleColor forState:UIControlStateNormal];
    self.button.titleLabel.font = item.font;
}


- (void)buttonTapped {
    
    if(self.item.tappedBlock) {
        
        self.item.tappedBlock();
    }
}
#pragma mark - Accessor

- (UIButton *)button {
    
    if (!_button) {
        
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _button;
}


@end

