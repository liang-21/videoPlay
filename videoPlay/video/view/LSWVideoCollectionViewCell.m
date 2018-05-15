//
//  LSWVideoCollectionViewCell.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/4/10.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "LSWVideoCollectionViewCell.h"
#import "Masonry.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface LSWVideoCollectionViewCell()
@property (nonatomic, strong) UIImageView *bigTopImageView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *watchNumerLabel;
@property (nonatomic, strong) UILabel * commentLabel;
@property (nonatomic, strong) UILabel *headLineLabel;
@property (nonatomic, strong) UILabel *tagLabel;
@property (nonatomic, strong) UIImageView *watchImageView;
@property (nonatomic, strong) UIImageView *commentImageView;
@end
    


@implementation LSWVideoCollectionViewCell

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void) setUI {
    [self addSubview:self.bigTopImageView];
    [self.bigTopImageView addSubview:self.timeLabel];
    [self.bigTopImageView addSubview:self.watchNumerLabel];
    [self.bigTopImageView addSubview:self.commentLabel];
    [self.bigTopImageView addSubview:self.watchImageView];
    [self.bigTopImageView addSubview:self.commentImageView];
    [self addSubview:self.headLineLabel];
    [self addSubview:self.tagLabel];
    [self configLayout];
}

- (void) configLayout {
    [self.bigTopImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@(self.frame.size.height * 0.6));
    }];
    [self.watchImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bigTopImageView.mas_left).offset(2);
        make.bottom.equalTo(self.bigTopImageView.mas_bottom).offset(-2);
        make.height.equalTo(@(10));
        make.width.equalTo(@(10));
    }];
    [self.watchNumerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.watchImageView.mas_right).offset(2);
        make.centerY.equalTo(self.watchImageView);
    }];
    [self.commentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.watchImageView);
        make.centerX.equalTo(self.mas_centerX).offset(-40);
        make.height.equalTo(@10);
        make.width.equalTo(@10);
    }];
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.commentImageView.mas_right).offset(2);
        make.centerY.equalTo(self.watchImageView);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-2);
        make.centerY.equalTo(self.watchImageView);
    }];
    [self.headLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bigTopImageView.mas_bottom).offset(5);
        make.left.equalTo(self.mas_left).offset(4);
        make.height.equalTo(@25);
        make.right.equalTo(self.mas_right).offset(-7);
    }];
    [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(4);
        make.bottom.equalTo(self.mas_bottom).offset(-4);
    }];
}


#pragma public
- (void) configWithModel: (LSWVideoModel *)model {
    [self.bigTopImageView sd_setImageWithURL:[NSURL URLWithString:model.tbVideoDTO.videoimage] placeholderImage:[UIImage imageNamed:@"bigtopImage"]];
    self.watchNumerLabel.text = model.tbVideoDTO.videowatch.stringValue;
    self.headLineLabel.text = model.tbVideoDTO.videotitle;
    self.commentLabel.text = model.numberOfComment.stringValue;
}


#pragma set
- (UIImageView *) bigTopImageView {
    if (!_bigTopImageView) {
        _bigTopImageView = [[UIImageView alloc] init];
        _bigTopImageView.contentMode = UIViewContentModeScaleToFill;
        [_bigTopImageView  setImage:[UIImage imageNamed:@"bigtopImage"]];
        _bigTopImageView.clipsToBounds = YES;
        
    }
    return _bigTopImageView;
}
- (UIImageView *) watchImageView {
    if (!_watchImageView) {
        
        _watchImageView = [[UIImageView alloc] init];
        [_watchImageView setImage:[UIImage imageNamed:@"watch"]];
    }
    return _watchImageView;
}
- (UIImageView *) commentImageView {
    if (!_commentImageView ) {
        
        _commentImageView  = [[UIImageView alloc] init];
        [_commentImageView  setImage:[UIImage imageNamed:@"comment"]];
    }
    return _commentImageView;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.text = @"02:59";
        _timeLabel.textColor = [UIColor whiteColor];
        _timeLabel.font = [UIFont systemFontOfSize:6];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        
    }
    return  _timeLabel;
}
- (UILabel *)watchNumerLabel {
    if (!_watchNumerLabel) {
        _watchNumerLabel = [[UILabel alloc] init];
        _watchNumerLabel.text = @"20";
        _watchNumerLabel.textColor = [UIColor whiteColor];
        _watchNumerLabel.font = [UIFont systemFontOfSize:10];
        _watchNumerLabel.textAlignment = NSTextAlignmentRight;
    }
    return  _watchNumerLabel;
}
- (UILabel *)commentLabel {
    if (!_commentLabel) {
        _commentLabel = [[UILabel alloc] init];
        _commentLabel.text = @"1234";
        _commentLabel.textColor = [UIColor whiteColor];
        _commentLabel.font = [UIFont systemFontOfSize:8];
        _commentLabel.textAlignment = NSTextAlignmentRight;
    }
    return  _commentLabel;
}
- (UILabel *)headLineLabel {
    if (!_headLineLabel) {
        _headLineLabel = [[UILabel alloc] init];
        _headLineLabel.text = @"炉石传说： 【天天素材库】第90期";
        _headLineLabel.textColor = [UIColor blackColor];
        _headLineLabel.font = [UIFont systemFontOfSize:11];
        _headLineLabel.textAlignment = NSTextAlignmentLeft;
        _headLineLabel.numberOfLines = 0;
         [_headLineLabel sizeToFit];
    }
    return  _headLineLabel;
}
- (UILabel *)tagLabel {
    if (!_tagLabel) {
        _tagLabel = [[UILabel alloc] init];
        _tagLabel.text = @"单机联机";
        _tagLabel.textColor = [UIColor grayColor];
        _tagLabel.font = [UIFont systemFontOfSize:8];
        _tagLabel.textAlignment = NSTextAlignmentLeft;
    }
    return  _tagLabel;
}


@end
