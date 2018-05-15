//
//  TDFAddReasonCell.m
//  Pods
//
//  Created by Arlen on 2017/6/17.
//
//

#import "TDFAddReasonCell.h"
#import "TDFAddReasonItem.h"
#import "UIColor+Hex.h"
#import "Masonry.h"


@interface TDFAddReasonCell ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *lblTitle;
@property (nonatomic, strong) UIImageView *iconTitle;

@property (nonatomic, strong) TDFAddReasonItem *item;

@end


@implementation TDFAddReasonCell

- (void)cellDidLoad {
    
    self.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.button];
    [self.contentView addSubview:self.lblTitle];
    [self.contentView addSubview:self.iconTitle];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.button);
        make.centerX.equalTo(self.button.mas_centerX).offset(10);
        make.height.equalTo(@15);
    }];
    [self.iconTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.lblTitle.mas_left).offset(-5);
        make.centerY.equalTo(self.lblTitle.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.equalTo(self.contentView);
        make.height.equalTo(@1);
    }];
    
}

+ (CGFloat)heightForCellWithItem:(TDFBaseEditItem *)item
{
    if (!item.shouldShow) {
        return 0;
    }
    return 40;
}

- (void)configCellWithItem:(TDFAddReasonItem *)item {
    
    self.contentView.hidden = !item.shouldShow;
    if (!item.shouldShow) {
        return;
    }
    self.item = item;
    if (item.title) {
        self.lblTitle.text = item.title;
    }
}


- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UILabel *)lblTitle {
    if (!_lblTitle) {
        _lblTitle = [[UILabel alloc] init];
        _lblTitle.text = @"添加原因";
        _lblTitle.font = [UIFont systemFontOfSize:15];
        _lblTitle.textColor = [UIColor colorWithHexString:@"#CC0000"];
    }
    return _lblTitle;
}

- (UIImageView *)iconTitle {
    if (!_iconTitle) {
        _iconTitle = [[UIImageView alloc] init];
        _iconTitle.image = [UIImage imageNamed:@"add_icon_red" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    return _iconTitle;
}

- (void)clickButton {
    if (self.item.selectedBlock) {
        self.item.selectedBlock();
    }
}


@end
