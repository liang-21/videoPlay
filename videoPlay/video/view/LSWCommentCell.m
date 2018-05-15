//
//  LSWCommentCell.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/2.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "LSWCommentCell.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface LSWCommentCell()
@property (nonatomic, strong) UIImageView *userImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *contenLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *floorLabel;
@property (nonatomic, strong) UIImageView *supportImageView;
@property (nonatomic, strong) UILabel *supportLabel;
@property (nonatomic, strong) UIView *underLineView;
@end

@implementation LSWCommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

- (void) setUI {
    [self.contentView addSubview:self.userImageView];
    [self.contentView addSubview:self.userNameLabel];
    [self.contentView addSubview:self.floorLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.contenLabel];
    [self.contentView addSubview:self.supportImageView];
    [self.contentView addSubview:self.supportLabel];
    [self.contentView addSubview:self.underLineView];
    
    [self configLayout];
}
- (void) configLayout {
    [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(15);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.height.equalTo(@(30));
        make.width.equalTo(@(30));
    }];
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userImageView.mas_top);
        make.left.equalTo(self.userImageView.mas_right).offset(10);
    }];
    
    [self.floorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userNameLabel.mas_bottom).offset(10);
        make.left.equalTo(self.userNameLabel.mas_left);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.floorLabel.mas_right).offset(10);
        make.top.equalTo(self.floorLabel.mas_top);
    }];
    
    
    [self.contenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userNameLabel.mas_left);
        make.top.equalTo(self.timeLabel.mas_bottom).offset(4);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
    }];
    [self.supportLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contenLabel.mas_right).offset(-5);
        make.top.equalTo(self.contenLabel.mas_bottom).offset(10);
    }];
    
    [self.supportImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.supportLabel.mas_left).offset(-5);
        make.centerY.equalTo(self.supportLabel);
        make.height.equalTo(@(16));
        make.width.equalTo(@(16));
    }];
    
    [self.underLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.supportImageView.mas_bottom).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@0.5);
    }];
}

#pragma configModel
- (void) configWithModel: (LSWCommentModel *)model{
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.tbUserDTO.image] placeholderImage:[UIImage imageNamed:@"contenImage"]];
    self.supportLabel.text = model.numberOfLikeComment.stringValue;
    self.userNameLabel.text = model.tbUserDTO.username;
    self.contenLabel.text = model.content;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(model.commenttime)/1000];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY.MM.dd"];
    NSString *dateString = [formatter stringFromDate:date];
    self.timeLabel.text = dateString;
    self.floorLabel.text = [NSString stringWithFormat:@"#%@",model.numberOfFloor.stringValue];
}

#pragma set

- (UIImageView *) userImageView {
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.contentMode = UIViewContentModeScaleToFill;
        _userImageView.layer.cornerRadius = 15;
        _userImageView.layer.masksToBounds =YES;
        _userImageView.layer.shouldRasterize = YES;
        _userImageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        [_userImageView setImage:[UIImage imageNamed:@"contenImage"]];
    }
    return _userImageView;
}
- (UIImageView *) supportImageView {
    if (!_supportImageView) {
        _supportImageView = [[UIImageView alloc] init];
        _supportImageView.contentMode = UIViewContentModeScaleToFill;
        [_supportImageView setImage:[UIImage imageNamed:@"support_red"]];
    }
    return _supportImageView;
}

- (UILabel *) supportLabel {
    if (!_supportLabel) {
        _supportLabel = [[UILabel alloc] init];
        _supportLabel.text = @"1996";
        _supportLabel.font= [UIFont systemFontOfSize:8];
        _supportLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _supportLabel;
}

- (UILabel *) userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.text = @"张三";
        _userNameLabel.textColor = [UIColor grayColor];
        _userNameLabel.font = [UIFont systemFontOfSize:10];
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _userNameLabel;
}


-(UILabel *) timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.text = @"04-06";
        _timeLabel.textColor = [UIColor grayColor];
        _timeLabel.font = [UIFont systemFontOfSize:8];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _timeLabel;
}
- (UILabel *) floorLabel {
    if (!_floorLabel) {
        _floorLabel = [[UILabel alloc] init];
        _floorLabel.text = @"#1";
        _floorLabel.textColor = [UIColor grayColor];
        _floorLabel.font = [UIFont systemFontOfSize:8];
        _floorLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _floorLabel;
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

- (UIView *) underLineView {
    if (!_underLineView) {
        _underLineView = [[UIView alloc] initWithFrame:CGRectZero];
        _underLineView.backgroundColor = [UIColor grayColor];
    }
    return _underLineView;
}

@end
