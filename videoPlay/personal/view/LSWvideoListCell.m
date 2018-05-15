//
//  LSWvideoListCell.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/9.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "LSWvideoListCell.h"
//#import "SelVideoPlayer.h"
#import "SelPlayerConfiguration.h"
#import "AppDelegate.h"
#import <Masonry.h>
#import "LSWTextInputViewController.h"
#import "LSWTopImageCell.h"
#import "UIColor+Hex.h"
@interface LSWvideoListCell()
@property (nonatomic, strong) UIImageView *userImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *fansLabel;
@end

@implementation LSWvideoListCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}
- (void) setUI {
    [self.contentView addSubview:self.userImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.fansLabel];
    [self configLayout];
}

- (void) configLayout {
    [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.width.equalTo(@(60));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userImageView.mas_top);
        make.left.equalTo(self.userImageView.mas_left).offset(20);
    }];
}










- (UIImageView *) userImageView {
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.contentMode = UIViewContentModeScaleToFill;
        _userImageView.layer.cornerRadius = 10;
        _userImageView.layer.masksToBounds =YES;
        [_userImageView setImage:[UIImage imageNamed:@"contenImage"]];
    }
    return _userImageView;
}

- (UILabel *) titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"这是一个标题";
        _titleLabel.numberOfLines = 0;
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

@end
