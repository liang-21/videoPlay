//
//  TDFSelectView.m
//  RestApp
//
//  Created by chaiweiwei on 2016/11/4.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import "TDFSelectView.h"
#import "UIView+Sizes.h"
#import "Masonry.h"

@interface TDFSelectView()

@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *descLabel;
@property (nonatomic,strong) UIButton *selectButton;
@property (nonatomic,strong) UIImageView *selectIcon;

@property (nonatomic,strong) UIView *lineView;


@end

@implementation TDFSelectView

- (instancetype)init {
    if(self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(38);
            make.width.mas_equalTo(47);
            make.height.mas_equalTo(54);
            make.top.equalTo(self.mas_top).with.offset(15);
        }];
        
        [self addSubview:self.selectButton];
        [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.iconImageView.mas_left);
            make.top.equalTo(self.mas_top);
            make.height.mas_equalTo(85);
        }];
        
        [self.selectButton addSubview:self.selectIcon];
        [self.selectIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.selectButton.mas_centerY);
            make.centerX.equalTo(self.selectButton.mas_centerX);
            make.height.and.with.mas_equalTo(18);
        }];
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).with.offset(10);
            make.right.equalTo(self.mas_right);
            make.height.mas_equalTo(20);
            make.top.equalTo(self.mas_top).with.offset(15);
        }];
        
        [self addSubview:self.descLabel];
        [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.top.equalTo(self.titleLabel.mas_bottom);
            make.bottom.equalTo(self.mas_bottom).with.offset(-10);
        }];
        
        [self addSubview:self.lineView];
        
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.height.mas_equalTo(0.5);
            make.bottom.equalTo(self.mas_bottom);
        }];

    }
    return self;
}

- (UIButton *)selectButton {
    if(!_selectButton) {
        _selectButton = [[UIButton alloc] init];
        [_selectButton addTarget:self action:@selector(selectButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectButton;
}

- (UIImageView *)selectIcon {
    if(!_selectIcon) {
        _selectIcon = [[UIImageView alloc] init];
        _selectIcon.image = [UIImage imageNamed:@"icon_select_empty" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    return _selectIcon;
}

- (void)selectButtonAction {
    self.selectButton.selected = !self.selectButton.selected;
    if(self.selectButton.selected){
        self.selectIcon.image = [UIImage imageNamed:@"icon_select_filled" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }else {
        self.selectIcon.image = [UIImage imageNamed:@"icon_select_empty" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    if(self.model.filterBlock) {
        self.model.filterBlock(self.selectButton.selected);
    }
}

- (UIImageView *)iconImageView {
    if(!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}

- (UILabel *)descLabel {
    if(!_descLabel) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.font = [UIFont systemFontOfSize:13];
        _descLabel.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1];
        _descLabel.numberOfLines = 0;
    }
    return _descLabel;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
    }
    return _titleLabel;
}

- (UIView *)lineView {
    if(!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1];
    }
    return _lineView;
}

- (void)configureViewWithModel:(TDFSelectItem *)model {
    self.model = model;
    
    self.titleLabel.text = model.title;
    self.descLabel.text = model.desc;
    self.iconImageView.image = [UIImage imageNamed:model.leftIconName];
    
    if(model.selectStatus) {
        self.selectButton.selected = YES;
        self.selectIcon.image = [UIImage imageNamed:@"icon_select_filled" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }else {
        self.selectButton.selected = NO;
        self.selectIcon.image = [UIImage imageNamed:@"icon_select_empty" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
}

+ (CGFloat)getHeightWithModel:(TDFSelectItem *)model {
    CGSize size = [model.desc boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-95, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
    if(size.height < 40) {
        size.height = 40;
    }
    size.height += 46;
    return size.height;
}

@end
