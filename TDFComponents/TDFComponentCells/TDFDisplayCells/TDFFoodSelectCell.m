//
//  TDFFoodSelectCell.m
//  Pods
//
//  Created by happyo on 2016/11/30.
//
//

#import "TDFFoodSelectCell.h"
#import "TDFFoodSelectItem.h"
#import "Masonry.h"

@interface TDFFoodSelectCell ()

@property (nonatomic, strong) UIButton *btnSelect;

@property (nonatomic, strong) UILabel *lblTitle;

@property (nonatomic, strong) UILabel *lblValue;

@property (nonatomic, strong) TDFFoodSelectItem *model;

@property (nonatomic, strong) UIView *alphaView;

@end
@implementation TDFFoodSelectCell

#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    self.alphaView = [[UIView alloc] initWithFrame:CGRectZero];
    self.alphaView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    [self addSubview:self.alphaView];
    [self.alphaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.bottom.equalTo(self).with.offset(-1);
    }];
    
    [self addSubview:self.btnSelect];
    [self.btnSelect mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).with.offset(10);
        make.centerY.equalTo(self);
        make.width.equalTo(@(18));
        make.height.equalTo(@(18));
    }];
    
    [self addSubview:self.lblTitle];
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).with.offset(40);
        make.centerY.equalTo(self);
        make.height.equalTo(@(20));
//        make.width.equalTo(@(140));
    }];
    
    [self addSubview:self.lblValue];
    [self.lblValue mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self).with.offset(-20);
        make.centerY.equalTo(self);
        make.height.equalTo(@(20));
        make.width.equalTo(@(120));
    }];
}


+ (CGFloat)heightForCellWithItem:(TDFFoodSelectItem *)item
{
    if (item.shouldShow) {
        return 45;
    } else {
        return 0;
    }
}

- (void)configCellWithItem:(TDFFoodSelectItem *)item
{
    self.model = item;
    
    self.hidden = !item.shouldShow;
    
    self.btnSelect.selected = item.isSelected;
    self.lblTitle.text = item.title;
    self.lblValue.text = item.value;
    self.alphaView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:item.alpha];
}

- (void)btnSelectClicked:(UIButton *)button
{
    button.selected = !button.isSelected;
    
    self.model.selected = button.selected;
    
    if (self.model.selectedBlock) {
        self.model.selectedBlock(button.selected);
    }
}

#pragma mark -- Setters && Getters --

- (UIButton *)btnSelect
{
    if (!_btnSelect) {
        _btnSelect = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnSelect setBackgroundImage:[UIImage imageNamed:@"food_cell_icon_unSelected" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        [_btnSelect setBackgroundImage:[UIImage imageNamed:@"food_cell_icon_selected" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateSelected];
        [_btnSelect addTarget:self action:@selector(btnSelectClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnSelect;
}

- (UILabel *)lblTitle
{
    if (!_lblTitle) {
        _lblTitle = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblTitle.font = [UIFont systemFontOfSize:15];
        _lblTitle.textColor = [UIColor colorWithRed:21.0/255 green:21.0/255 blue:21.0/255 alpha:1];
        _lblTitle.textAlignment = NSTextAlignmentLeft;
    }
    
    return _lblTitle;
}

- (UILabel *)lblValue
{
    if (!_lblValue) {
        _lblValue = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblValue.font = [UIFont systemFontOfSize:13.];
        _lblValue.textColor = [UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1];
        _lblValue.textAlignment = NSTextAlignmentRight;
    }
    
    return _lblValue;
}

@end
