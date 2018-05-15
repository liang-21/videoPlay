//
//  TDFDPButtonCell.m
//  Pods
//
//  Created by happyo on 2018/3/27.
//

#import "TDFDPButtonCell.h"
#import "Masonry.h"
#import "TDFDPButtonItem.h"
#import "UIColor+Hex.h"
#import "UIFont+tdf_standard.h"

@interface TDFDPButtonCell ()

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) TDFDPButtonItem *model;

@end
@implementation TDFDPButtonCell

#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [UIColor colorWithHeX:0xCCCCCC].CGColor;
    self.layer.borderWidth = 0.5;
    
    [self addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFDPButtonItem *)item
{
    return item.shouldShow ? 44 : 0;
}

- (void)configCellWithItem:(TDFDPButtonItem *)item
{
    self.model = item;
    
    [self.button setTitle:item.title forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor colorWithHexString:item.textColor] forState:UIControlStateNormal];
    self.button.hidden = !item.shouldShow;
}

#pragma mark -- Actions --

- (void)buttonClicked
{
    if (self.model.onClick) {
        self.model.onClick();
    }
}

#pragma mark -- Getters && Setters --

- (UIButton *)button
{
    if (!_button) {
        _button = [[UIButton alloc] init];
        _button.titleLabel.font = [UIFont tdf_15];
        [_button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _button;
}

@end
