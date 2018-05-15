//
//  LSWVideoCommentCell.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/2.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "LSWVideoCommentCell.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface  LSWVideoCommentCell()
@property (nonatomic, strong) UIImageView *userImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *fansLabel;
@property (nonatomic, strong) UILabel *contenLabel;
@property (nonatomic, strong) UILabel *watchNumerLabel;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *watchImageView;
@property (nonatomic, strong) UIImageView *commentImageView;
@property (nonatomic, strong) UIButton *attentionButton;
@property (nonatomic, strong) UIImageView *supprotImageView;
@property (nonatomic, strong) UIImageView *moneyImageView;
@property (nonatomic, strong) UIImageView *collectionImageView;
@property (nonatomic, strong) UIImageView *cacheImageView;
@property (nonatomic, strong) UIImageView *shareImageView;
@property (nonatomic, strong) UIView *underLineView;

@end

@implementation LSWVideoCommentCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}


- (void) setUI {
    [self.contentView addSubview:self.userImageView];
    [self.contentView addSubview:self.userNameLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.contenLabel];
    [self.contentView addSubview:self.fansLabel];
    [self.contentView addSubview:self.watchNumerLabel];
    [self.contentView addSubview:self.commentLabel];
    [self.contentView addSubview:self.watchImageView];
    [self.contentView addSubview:self.commentImageView];
    [self.contentView addSubview:self.attentionButton];
    [self.contentView addSubview:self.supprotImageView];
    [self.contentView addSubview:self.moneyImageView];
    [self.contentView addSubview:self.collectionImageView];
    [self.contentView addSubview:self.cacheImageView];
    [self.contentView addSubview:self.shareImageView];
    [self.contentView addSubview:self.underLineView];
    
    [self configLayout];
}


- (void) configLayout {
    [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.height.equalTo(@(30));
        make.width.equalTo(@(30));
    }];
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userImageView.mas_top);
        make.left.equalTo(self.userImageView.mas_right).offset(10);
    }];
    [self.fansLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userNameLabel);
        make.bottom.equalTo(self.userImageView.mas_bottom);
    }];
    
    [self.attentionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.userImageView);
        make.right.equalTo(self.mas_right).offset(-20);
        make.height.equalTo(@(20));
        make.width.equalTo(@(45));
    }];
    
    [self.contenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userImageView.mas_left).offset(5);
        make.top.equalTo(self.userImageView.mas_bottom).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);
    }];
    
    [self.watchImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userImageView.mas_left);
        make.top.equalTo(self.contenLabel.mas_bottom).offset(10);
        make.height.equalTo(@(15));
        make.width.equalTo(@(15));
    }];
    [self.watchNumerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.watchImageView.mas_right).offset(2);
        make.centerY.equalTo(self.watchImageView);
        
    }];
    [self.commentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.watchImageView);
        make.left.equalTo(self.watchNumerLabel.mas_right).offset(5);
        make.height.equalTo(@15);
        make.width.equalTo(@15);
    }];
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.commentImageView.mas_right).offset(2);
        make.centerY.equalTo(self.watchImageView);
        
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.commentLabel.mas_right).offset(10);
        make.centerY.equalTo(self.watchImageView);
        
    }];
    
    CGFloat padding = ([UIScreen mainScreen].bounds.size.width-5*20)/4.5;
    [self.supprotImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contenLabel.mas_left);
        make.top.equalTo(self.watchImageView.mas_bottom).offset(10);
        make.height.equalTo(@(19));
        make.width.equalTo(@(19));
    }];
    [self.moneyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.supprotImageView.mas_right).offset(padding);
        make.centerY.equalTo(self.supprotImageView);
        make.height.equalTo(@(17));
        make.width.equalTo(@(17));
    }];
    [self.collectionImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.moneyImageView.mas_right).offset(padding);
        make.centerY.equalTo(self.supprotImageView);
        make.height.equalTo(@(17));
        make.width.equalTo(@(17));
    }];
    [self.cacheImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.collectionImageView.mas_right).offset(padding);
        make.centerY.equalTo(self.supprotImageView);
        make.height.equalTo(@(20));
        make.width.equalTo(@(20));
    }];
    [self.shareImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cacheImageView.mas_right).offset(padding);
        make.centerY.equalTo(self.supprotImageView);
        make.height.equalTo(@(20));
        make.width.equalTo(@(20));
    }];
    [self.underLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shareImageView.mas_bottom).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@0.5);
    }];
}

- (void) configWithModel: (LSWVideoModel *)model {
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.tbUserDTO.image] placeholderImage:[UIImage imageNamed:@"contenImage"]];
    self.userNameLabel.text = model.tbUserDTO.username;
    self.fansLabel.text = [NSString stringWithFormat:@"%@粉丝",model.tbUserDTO.focusers.stringValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(model.tbVideoDTO.videocreattime)/1000];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY.MM.dd"];
    NSString *dateString = [formatter stringFromDate:date];
    self.timeLabel.text = dateString;
    self.contenLabel.text = model.tbVideoDTO.videointroduce;
    if (model.tbUserDTO.focus) {
        [self.attentionButton setTitle:@"取消关注" forState:UIControlStateNormal];
    }
    else{
        [self.attentionButton setTitle:@"取消关注" forState:UIControlStateNormal];
    }
    self.commentLabel.text = model.numberOfComment.stringValue;
    self.watchNumerLabel.text = model.tbVideoDTO.videowatch.stringValue;
    if (model.like) {
        [self.supprotImageView setImage:[UIImage imageNamed:@"support_red"]];
    }
    else{
        [self.supprotImageView setImage:[UIImage imageNamed:@"support"]];
    }
    if (model.collection) {
        [self.collectionImageView setImage:[UIImage imageNamed:@"collection_red"]];
    }
    else{
        [self.collectionImageView setImage:[UIImage imageNamed:@"collection_black"]];
    }
}
#pragma action
- (void)btnClick {
    !self.buttonClickBlock ?: self.buttonClickBlock();
}

#pragma set

- (UIImageView *) userImageView {
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.contentMode = UIViewContentModeScaleToFill;
        _userImageView.layer.cornerRadius = 15;
        _userImageView.layer.masksToBounds =YES;
//        _userImageView.layer.shouldRasterize = YES;
//        _userImageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        [_userImageView setImage:[UIImage imageNamed:@"contenImage"]];
    }
    return _userImageView;
}

- (UILabel *) userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.text = @"张三";
        _userNameLabel.textColor = [UIColor blackColor];
        _userNameLabel.font = [UIFont systemFontOfSize:13];
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _userNameLabel;
}

-(UILabel *) fansLabel {
    if (!_fansLabel) {
        _fansLabel = [[UILabel alloc] init];
        _fansLabel.text = @"7211粉丝";
        _fansLabel.textColor = [UIColor grayColor];
        _fansLabel.font = [UIFont systemFontOfSize:8];
        _fansLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _fansLabel;
}
-(UILabel *) timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.text = @"04-06";
        _timeLabel.textColor = [UIColor grayColor];
        _timeLabel.font = [UIFont systemFontOfSize:10];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _timeLabel;
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


- (UILabel *)watchNumerLabel {
    if (!_watchNumerLabel) {
        _watchNumerLabel = [[UILabel alloc] init];
        _watchNumerLabel.text = @"20";
        _watchNumerLabel.textColor = [UIColor grayColor];
        _watchNumerLabel.font = [UIFont systemFontOfSize:11];
        _watchNumerLabel.textAlignment = NSTextAlignmentRight;
    }
    return  _watchNumerLabel;
}
- (UILabel *)commentLabel {
    if (!_commentLabel) {
        _commentLabel = [[UILabel alloc] init];
        _commentLabel.text = @"1234";
        _commentLabel.textColor = [UIColor grayColor];
        _commentLabel.font = [UIFont systemFontOfSize:11];
        _commentLabel.textAlignment = NSTextAlignmentRight;
    }
    return  _commentLabel;
}


- (UIImageView *) watchImageView {
    if (!_watchImageView) {
        
        _watchImageView = [[UIImageView alloc] init];
        [_watchImageView setImage:[UIImage imageNamed:@"watch_black"]];
    }
    return _watchImageView;
}
- (UIImageView *) commentImageView {
    if (!_commentImageView ) {
        
        _commentImageView  = [[UIImageView alloc] init];
        [_commentImageView  setImage:[UIImage imageNamed:@"comment_black"]];
    }
    return _commentImageView;
}

- (UIButton *)attentionButton {
    if (!_attentionButton) {
        _attentionButton = [[UIButton alloc] initWithFrame:CGRectZero];
         [_attentionButton setTitle:NSLocalizedString(@"+关注", nil) forState:UIControlStateNormal];
        _attentionButton.layer.cornerRadius = 5;
        _attentionButton.layer.masksToBounds = YES;
        _attentionButton.titleLabel.font = [UIFont systemFontOfSize:10];
        _attentionButton.backgroundColor = [UIColor colorWithHexString:@"#EE82EE"];
        [_attentionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_attentionButton addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _attentionButton;
    
}
- (UIImageView *) supprotImageView {
    if (!_supprotImageView ) {
        
        _supprotImageView  = [[UIImageView alloc] init];
        [_supprotImageView  setImage:[UIImage imageNamed:@"support"]];
    }
    return _supprotImageView;
}
- (UIImageView *) moneyImageView {
    if (!_moneyImageView ) {
        
        _moneyImageView  = [[UIImageView alloc] init];
        [_moneyImageView  setImage:[UIImage imageNamed:@"money"]];
    }
    return _moneyImageView;
}
- (UIImageView *) collectionImageView {
    if (!_collectionImageView ) {
        
        _collectionImageView  = [[UIImageView alloc] init];
        [_collectionImageView  setImage:[UIImage imageNamed:@"collection_black"]];
    }
    return _collectionImageView;
}
- (UIImageView *) cacheImageView {
    if (!_cacheImageView ) {
        
        _cacheImageView  = [[UIImageView alloc] init];
        [_cacheImageView  setImage:[UIImage imageNamed:@"cache"]];
    }
    return _cacheImageView;
}
- (UIImageView *) shareImageView {
    if (!_shareImageView ) {
        
        _shareImageView  = [[UIImageView alloc] init];
        [_shareImageView  setImage:[UIImage imageNamed:@"share"]];
    }
    return _shareImageView;
}
- (UIView *)underLineView {
    if (!_underLineView) {
        _underLineView = [[UIView alloc] init];
        _underLineView.backgroundColor = [UIColor grayColor];
    }
    return _underLineView;
}






@end
