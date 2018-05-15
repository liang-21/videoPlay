//
//  TDFCardImageAreaView.m
//  Pods
//
//  Created by chaiweiwei on 2017/8/3.
//
//

#import "TDFCardImageAreaView.h"
#import <Masonry/Masonry.h>

@implementation TDFCardImageAreaView

- (instancetype)init {
    if(self = [super init]){
        
        self.defalutAddIcon.image = [UIImage imageNamed:@"icon_add_image" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
        [self addSubview:self.backgroundImg];
        [self addSubview:self.centerAddImageView];
        [self.centerAddImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.top.equalTo(self.mas_top).with.offset(6);
            make.bottom.equalTo(self.mas_bottom);
        }];
        
        [self addSubview:self.cardImageView];
        [self.cardImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.top.equalTo(self.mas_top).with.offset(6);
            make.bottom.equalTo(self.mas_bottom);
        }];
        [self.backgroundImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(15);
            make.right.equalTo(self.mas_right).with.offset(-15);
            make.top.equalTo(self.mas_top).with.offset(10);
            make.bottom.equalTo(self.mas_bottom).offset(-10);
        }];
        
        [self addSubview:self.cardAddButton];
        [self.cardAddButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        [self addSubview:self.delButton];
        [self.delButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_equalTo(50);
            make.right.equalTo(self.cardImageView.mas_right);
            make.top.equalTo(self.cardImageView.mas_top);
        }];
    }
    return self;
}

- (UIButton *)delButton{
    if(!_delButton){
        _delButton = [[UIButton alloc] init];
        [_delButton addTarget:self action:@selector(cardDelButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *icon = [[UIImageView alloc] init];
        icon.image = [UIImage imageNamed:@"ico_remove" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
        [_delButton addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_equalTo(22);
            make.right.equalTo(_delButton.mas_right).with.offset(-5);
            make.top.equalTo(_delButton.mas_top).with.offset(5);
        }];
    }
    return _delButton;
}

- (UIButton *)cardAddButton {
    if(!_cardAddButton){
        _cardAddButton = [[UIButton alloc] init];
        [_cardAddButton addTarget:self action:@selector(cardAddButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cardAddButton;
}


- (void)cardAddButtonAction{
    !self.cardAddButtonActionCallBack?:self.cardAddButtonActionCallBack();
}
- (void)cardDelButtonAction{
    !self.cardDelButtonActionCallBack?:self.cardDelButtonActionCallBack();
}

- (UIView *)centerAddImageView {
    if(!_centerAddImageView) {
        _centerAddImageView = [[UIView alloc] init];
        _centerAddImageView.backgroundColor = [UIColor clearColor];
        
        UIView *alphaView = [[UIView alloc] init];
        alphaView.backgroundColor = self.cardImageAreaViewBgColor;
        [_centerAddImageView addSubview:alphaView];
        [alphaView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_centerAddImageView);
        }];
        
        [_centerAddImageView addSubview:self.defalutAddIcon];
        
        [self.defalutAddIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_equalTo(50);
            make.centerY.equalTo(_centerAddImageView.mas_centerY).with.offset(-15);
            make.centerX.equalTo(_centerAddImageView.mas_centerX);
        }];
        
        [_centerAddImageView addSubview:self.titleLabelForAddImage];
        [self.titleLabelForAddImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(20);
            make.centerY.equalTo(_centerAddImageView.mas_centerY).with.offset(35);
            make.centerX.equalTo(_centerAddImageView.mas_centerX);
        }];
        
        [_centerAddImageView addSubview:self.descTitleLabel];
        [self.descTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_centerAddImageView.mas_left).with.offset(10);
            make.right.equalTo(_centerAddImageView.mas_right).with.offset(-10);
            make.bottom.equalTo(_centerAddImageView.mas_bottom).with.offset(-15);
        }];
    }
    return _centerAddImageView;
}

- (UIImageView *)defalutAddIcon {
    if(!_defalutAddIcon) {
        _defalutAddIcon = [[UIImageView alloc] init];
    }
    return _defalutAddIcon;
}

- (UILabel *)titleLabelForAddImage {
    if(!_titleLabelForAddImage) {
        _titleLabelForAddImage = [[UILabel alloc] init];
        _titleLabelForAddImage.font = [UIFont systemFontOfSize:20];
        _titleLabelForAddImage.textColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1];
    }
    return _titleLabelForAddImage;
}

- (UILabel *)descTitleLabel {
    if(!_descTitleLabel) {
        _descTitleLabel = [[UILabel alloc] init];
        _descTitleLabel.font = [UIFont systemFontOfSize:11];
        _descTitleLabel.textColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1];
        _descTitleLabel.numberOfLines = 2;
    }
    return _descTitleLabel;
}

- (UIImageView *)cardImageView {
    if(!_cardImageView) {
        _cardImageView = [[UIImageView alloc] init];
        _cardImageView.layer.borderWidth = 1;
        _cardImageView.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:0.1].CGColor;
        _cardImageView.layer.masksToBounds = YES;
        
        [_cardImageView addSubview:self.leftTagLabel];
        [self.leftTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_cardImageView.mas_top).with.offset(20);
            make.left.equalTo(_cardImageView.mas_left).with.offset(20);
            make.right.equalTo(_cardImageView.mas_right).with.offset(-20);
        }];
        
        [_cardImageView addSubview:self.topTitleLabel];
        [self.topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_cardImageView.mas_centerX);
            make.centerY.equalTo(_cardImageView.mas_centerY);
        }];
        
        [_cardImageView addSubview:self.bottomTitleLabel];
        [self.bottomTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topTitleLabel.mas_bottom);
            make.centerX.equalTo(_cardImageView.mas_centerX);
        }];
    }
    return _cardImageView;
}

- (UILabel *)leftTagLabel {
    if(!_leftTagLabel) {
        _leftTagLabel = [[UILabel alloc] init];
        _leftTagLabel.font = [UIFont systemFontOfSize:16];
        _leftTagLabel.textColor = [UIColor whiteColor];
        _leftTagLabel.numberOfLines = 1;
        _leftTagLabel.alpha = 0.8;
    }
    return _leftTagLabel;
}

- (UILabel *)topTitleLabel {
    if(!_topTitleLabel) {
        _topTitleLabel = [[UILabel alloc] init];
        _topTitleLabel.font = [UIFont systemFontOfSize:30];
        _topTitleLabel.textColor = [UIColor whiteColor];
    }
    return _topTitleLabel;
}

- (UILabel *)bottomTitleLabel {
    if(!_bottomTitleLabel) {
        _bottomTitleLabel = [[UILabel alloc] init];
        _bottomTitleLabel.font = [UIFont systemFontOfSize:14];
        _bottomTitleLabel.textColor = [UIColor whiteColor];
        _bottomTitleLabel.alpha = 0.8;
    }
    return _bottomTitleLabel;
}

-(UIImageView *)backgroundImg{
    if (!_backgroundImg) {
        _backgroundImg = [[UIImageView alloc]init];
        _backgroundImg.contentMode = UIViewContentModeScaleToFill;
        _backgroundImg.hidden = YES;
        _backgroundImg.image = [UIImage imageNamed:@"icon_backgroud_dotted" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    return _backgroundImg;
}

@end
