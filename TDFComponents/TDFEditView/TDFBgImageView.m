//
//  TDFBgImageView.m
//  RestApp
//
//  Created by chaiweiwei on 2016/11/2.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import "TDFBgImageView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface TDFBgImageView ()

@property (nonatomic,strong) UILabel *leftTagLabel;
@property (nonatomic,strong) UILabel *topTitleLabel;
@property (nonatomic,strong) UILabel *bottomTitleLabel;
@property (nonatomic,strong) UIImageView *bgImageView;

@end

@implementation TDFBgImageView

- (instancetype)init {
    if(self = [super init]) {
        [self addSubview:self.bgImageView];
        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(10);
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.height.mas_equalTo(([UIScreen mainScreen].bounds.size.width-20)*228.0f/355.0f);
        }];
        
        [self.bgImageView addSubview:self.leftTagLabel];
        [self.leftTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgImageView.mas_top).with.offset(15);
            make.left.equalTo(self.bgImageView.mas_left).with.offset(15);
            make.right.equalTo(self.bgImageView.mas_right).with.offset(-15);
        }];
        
        [self.bgImageView addSubview:self.topTitleLabel];
        [self.topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.bgImageView.mas_centerX);
            make.centerY.equalTo(self.bgImageView.mas_centerY).with.offset(-10);
        }];
        
        [self.bgImageView addSubview:self.bottomTitleLabel];
        [self.bottomTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topTitleLabel.mas_bottom);
            make.centerX.equalTo(self.bgImageView.mas_centerX);
        }];
    }
    return self;
}

- (void)configureViewWithModel:(TDFBigImageItem *)model
{
    self.model = model;
    
    int r=255;
    int g=255;
    int b=255;
    if (self.model.fontColor.length > 0) {
        NSArray* colors=[self.model.fontColor componentsSeparatedByString:@","];
        r=((NSString*)[colors objectAtIndex:1]).intValue;
        g=((NSString*)[colors objectAtIndex:2]).intValue;
        b=((NSString*)[colors objectAtIndex:3]).intValue;
    }
    [self.leftTagLabel setTextColor:[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]];
    [self.topTitleLabel setTextColor:[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]];
    [self.bottomTitleLabel setTextColor:[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]];

    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:self.model.bgImageNamePath] placeholderImage:[UIImage imageNamed:self.model.bgDefultImageName]];
    self.leftTagLabel.text = self.model.leftTagTextValue;
    self.topTitleLabel.text = self.model.topTitleValue;
    self.bottomTitleLabel.text = self.model.bottomTitleValue;
}


+ (CGFloat)getHeight {
    return ([UIScreen mainScreen].bounds.size.width-20)*228.0f/355.0f + 10;
}

- (UIImageView *)bgImageView {
    if(!_bgImageView) {
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.layer.masksToBounds = YES;
        _bgImageView.layer.cornerRadius = 5;
        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _bgImageView;
}

- (UILabel *)leftTagLabel {
    if(!_leftTagLabel) {
        _leftTagLabel = [[UILabel alloc] init];
        _leftTagLabel.font = [UIFont systemFontOfSize:18];
        _leftTagLabel.textColor = [UIColor whiteColor];
        _leftTagLabel.numberOfLines = 1;
    }
    return _leftTagLabel;
}

- (UILabel *)topTitleLabel {
    if(!_topTitleLabel) {
        _topTitleLabel = [[UILabel alloc] init];
        _topTitleLabel.font = [UIFont boldSystemFontOfSize:48];
        _topTitleLabel.textColor = [UIColor whiteColor];
    }
    return _topTitleLabel;
}

- (UILabel *)bottomTitleLabel {
    if(!_bottomTitleLabel) {
        _bottomTitleLabel = [[UILabel alloc] init];
        _bottomTitleLabel.font = [UIFont systemFontOfSize:18];
        _bottomTitleLabel.textColor = [UIColor whiteColor];
    }
    return _bottomTitleLabel;
}
@end
