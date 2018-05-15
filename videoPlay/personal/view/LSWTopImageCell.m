//
//  LSWTopImageCell.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/9.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "LSWTopImageCell.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface LSWTopImageCell()
@property (nonatomic, strong) UIImageView *userImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *fansLabel;

@end

@implementation LSWTopImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

- (void) setUI {
    [self.contentView addSubview:self.userImageView];
    [self.contentView addSubview:self.userNameLabel];
    [self.contentView addSubview:self.fansLabel];
    [self configLayout];
}

- (void) configLayout {
    [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(40);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.height.equalTo(@(50));
        make.width.equalTo(@(50));
    }];
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userImageView.mas_top);
        make.left.equalTo(self.contentView.mas_left).offset(20);
    }];
    [self.fansLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userNameLabel);
        make.bottom.equalTo(self.userImageView.mas_bottom);
    }];
}



- (UIImageView *) userImageView {
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.contentMode = UIViewContentModeScaleToFill;
        _userImageView.layer.cornerRadius = 25;
        _userImageView.layer.masksToBounds =YES;
        [_userImageView setImage:[UIImage imageNamed:@"contenImage"]];
    }
    return _userImageView;
}

- (UILabel *) userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.text = @"张三";
        _userNameLabel.textColor = [UIColor blackColor];
        [_userNameLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:25]];
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _userNameLabel;
}

-(UILabel *) fansLabel {
    if (!_fansLabel) {
        _fansLabel = [[UILabel alloc] init];
        _fansLabel.text = @"7211粉丝";
        _fansLabel.textColor = [UIColor grayColor];
        _fansLabel.font = [UIFont systemFontOfSize:17];
        _fansLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _fansLabel;
}


@end
