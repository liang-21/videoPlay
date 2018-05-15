//
//  LSWPublishCell.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/2.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "LSWPublishCell.h"
#import "Masonry.h"
#import "UIColor+Hex.h"

@interface LSWPublishCell()
@property (nonatomic, strong) UIImageView *userImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *TimeLabel;
@property (nonatomic, strong) UILabel *contenLabel;
@property (nonatomic, strong) UIImageView *cotentImageView;
@end

@implementation LSWPublishCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

- (void) setUI {
    [self addSubview:self.userImageView];
    [self addSubview:self.userNameLabel];
    [self addSubview:self.TimeLabel];
    [self addSubview:self.contenLabel];
    [self addSubview:self.cotentImageView];
    [self configLayout];
}


- (void) configLayout {
    [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20);
        make.left.equalTo(self.mas_left).offset(20);
        make.height.equalTo(@(30));
        make.width.equalTo(@(30));
    }];
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userImageView.mas_top);
        make.left.equalTo(self.userImageView.mas_right).offset(10);
    }];
    [self.TimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userNameLabel);
        make.bottom.equalTo(self.userImageView.mas_bottom);
    }];
    [self.contenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userImageView);
        make.top.equalTo(self.userImageView.mas_bottom).offset(20);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.right.equalTo(self.mas_right).offset(-20);
    }];
    [self.cotentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userImageView);
        make.top.equalTo(self.contenLabel.mas_bottom).offset(20);
        make.height.equalTo(@(200));
        make.width.equalTo(@(200));
    }];
}

#pragma set

- (UIImageView *) userImageView {
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.contentMode = UIViewContentModeScaleToFill;
        _userImageView.layer.cornerRadius = 15;
        _userImageView.layer.shouldRasterize = YES;
        _userImageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        [_userImageView setImage:[UIImage imageNamed:@"contenImage"]];
    }
    return _userImageView;
}

- (UILabel *) userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.text = @"张三";
        _userNameLabel.textColor = [UIColor colorWithHexString:@"#fdb933"];
        [_userNameLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _userNameLabel;
}

-(UILabel *) TimeLabel {
    if (!_TimeLabel) {
        _TimeLabel = [[UILabel alloc] init];
        _TimeLabel.text = @"4月30日 20:31";
        _TimeLabel.textColor = [UIColor grayColor];
        _TimeLabel.font = [UIFont systemFontOfSize:8];
        _TimeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _TimeLabel;
}

- (UILabel *) contenLabel {
    if (!_contenLabel) {
        _contenLabel = [[UILabel alloc] init];
        _contenLabel.text = @"UITableView+FDTemplateLayoutCell 是一个由国人团队开发的优化计算 UITableViewCell 高度的轻量级框架（GitHub 地址），由于实现逻辑简明清晰，代码也不复杂，非常适合作为新手学习其他著名却庞大的开源项目的入门教材。";
        [_contenLabel sizeToFit];
        _contenLabel.numberOfLines = 0;
        _contenLabel.font = [UIFont systemFontOfSize:13];
    }
    return _contenLabel;
}

- (UIImageView *) cotentImageView {
    if (!_cotentImageView) {
        _cotentImageView = [[UIImageView alloc] init];
        _cotentImageView.contentMode = UIViewContentModeScaleToFill;
        [_cotentImageView setImage:[UIImage imageNamed:@"contenImage"]];
    }
    return _cotentImageView;
}

























@end
