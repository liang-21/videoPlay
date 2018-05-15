//
//  TDFActionHeadCell.m
//  Pods
//
//  Created by 刘红琳 on 2017/7/4.
//
//

#import "TDFActionHeadCell.h"

#import "TDFActionHeadItem.h"
#import "Masonry.h"
@interface TDFActionHeadCell()
@property (strong,nonatomic) TDFActionHeadItem *model;

@property (nonatomic, strong) UIView *panel;
@property (nonatomic, strong) UILabel *lblName;

@property (nonatomic,strong) UIView *line;
@end

@implementation TDFActionHeadCell

#pragma mark - DHTTableViewCellDelegate

- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.panel];
    
    [self addSubview:self.lblName];
    [self addSubview:self.line];
}

+ (CGFloat)heightForCellWithItem:(TDFActionHeadItem *)item
{
    if(!item.shouldShow) {
        return 0;
    }
    return 44;
}

- (void)configCellWithItem:(TDFActionHeadItem *)item
{
    self.hidden = !item.shouldShow;
    if (!item.shouldShow) return;
    
    self.model = item;
    [self.panel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(45);
        make.right.equalTo(self.mas_right).with.offset(-45);
        make.top.equalTo(self.mas_top).with.offset(7);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    self.lblName.text = self.model.title;
    [self.lblName mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.panel);
    }];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    [self.line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.top.equalTo(self.mas_bottom).with.offset(-1);
        make.size.mas_equalTo(CGSizeMake(screenWidth - 20,1));
    }];
    
    self.line.hidden = self.model.isHideLine;
}

#pragma mark - Get Set

- (UIView *)panel {
    if(!_panel) {
        _panel = [[UIView alloc] init];
        _panel.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
        [_panel.layer setMasksToBounds:YES];
        _panel.layer.cornerRadius = 12;
    }
    return _panel;
}

- (UILabel *)lblName
{
    if (!_lblName) {
        _lblName = [[UILabel alloc] init];
        _lblName.font = [UIFont boldSystemFontOfSize:14];
        _lblName.textColor = [UIColor blackColor];
        _lblName.textAlignment = NSTextAlignmentCenter;
    }
    return _lblName;
}

- (UIView *)line
{
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    }
    return _line;
}

@end
