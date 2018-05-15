//
//  TDFFoodDisplayCell.m
//  Pods
//
//  Created by happyo on 2016/11/28.
//
//

#import "TDFFoodDisplayCell.h"
#import "TDFFoodDisplayItem.h"
#import "Masonry.h"

@interface TDFFoodDisplayCell ()

@property (nonatomic, strong) UILabel *lblTitle;

@property (nonatomic, strong) UILabel *lblSubTitle;

@property (nonatomic, strong) UIButton *btnDelete;

@property (nonatomic, strong) TDFFoodDisplayItem *model;

@end
@implementation TDFFoodDisplayCell

#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    UIView *alphaView = [[UIView alloc] initWithFrame:CGRectZero];
    alphaView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    [self addSubview:alphaView];
    [alphaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.bottom.equalTo(self).with.offset(-1);
    }];
    
    [self addSubview:self.btnDelete];
    [self.btnDelete mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.trailing.equalTo(self).with.offset(-10);
        make.height.equalTo(@(18));
        make.width.equalTo(@(18));
    }];
    
    [self addSubview:self.lblTitle];
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).with.offset(10);
        make.centerY.equalTo(self);
        make.height.equalTo(@(14));
//        make.trailing.equalTo(self.btnDelete.mas_leading);
    }];
    
    [self addSubview:self.lblSubTitle];
    [self.lblSubTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.lblTitle.mas_trailing);
        make.height.equalTo(@(12));
        make.width.equalTo(@(200));
        make.centerY.equalTo(self);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFFoodDisplayItem *)item
{
    return 40;
}

- (void)configCellWithItem:(TDFFoodDisplayItem *)item
{
    self.model = item;
    self.lblTitle.text = item.title;
}

- (void)btnDeleteClicked
{
    if (self.model.deleteBlock) {
        self.model.deleteBlock(self.model.foodId);
    }
}

#pragma mark -- Setters && Getters --

- (UILabel *)lblTitle
{
    if (!_lblTitle) {
        _lblTitle = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblTitle.font = [UIFont systemFontOfSize:15];
        _lblTitle.textColor = [UIColor colorWithRed:21.0/255 green:21.0/255 blue:21.0/255 alpha:1];
    }
    
    return _lblTitle;
}

- (UILabel *)lblSubTitle
{
    if (!_lblSubTitle) {
        _lblSubTitle = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblSubTitle.font = [UIFont systemFontOfSize:11];
        _lblSubTitle.textColor = [UIColor colorWithRed:204.0/255 green:0/255 blue:0/255 alpha:1];
        _lblSubTitle.text = NSLocalizedString(@"（点重不提醒）", nil);
        _lblTitle.textAlignment = NSTextAlignmentLeft;

    }
    
    return _lblSubTitle;
}

- (UIButton *)btnDelete
{
    if (!_btnDelete) {
        _btnDelete = [[UIButton alloc] initWithFrame:CGRectZero];
        [_btnDelete setBackgroundImage:[UIImage imageNamed:@"food_display_icon_delete" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        [_btnDelete addTarget:self action:@selector(btnDeleteClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnDelete;
}



@end
