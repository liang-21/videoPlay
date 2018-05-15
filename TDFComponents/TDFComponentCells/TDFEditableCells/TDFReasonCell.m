//
//  TDFReasonCell.m
//  Pods
//
//  Created by Arlen on 2017/6/17.
//
//

#import "TDFReasonCell.h"
#import "TDFReasonItem.h"
#import "Masonry.h"

@interface TDFReasonCell()

@property (nonatomic, strong) UILabel *lblTitle;
@property (nonatomic, strong) UIButton *btnDelete;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) TDFReasonItem *item;

@end

@implementation TDFReasonCell

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.lblTitle];
    [self.contentView addSubview:self.btnDelete];
    
    
    [self.btnDelete mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView).with.offset(-10);
        make.height.equalTo(@(18));
        make.width.equalTo(@(18));
    }];
    
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.btnDelete.mas_left).with.offset(-5);
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@(14));
    }];
    
    _line = [[UIView alloc] init];
    _line.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_line];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.height.equalTo(@1);
        make.bottom.equalTo(self.contentView);
    }];
    
}

+ (CGFloat)heightForCellWithItem:(TDFReasonItem *)item
{
    if (!item.shouldShow) return 0;
    return 40;
}


- (void)configCellWithItem:(TDFReasonItem *)item
{
    self.item = item;
    self.contentView.hidden = !item.shouldShow;
    
    if (!item.shouldShow) return;
    self.lblTitle.text = item.title;
}


- (UILabel *)lblTitle
{
    if (!_lblTitle) {
        _lblTitle = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblTitle.font = [UIFont systemFontOfSize:15];
        _lblTitle.textColor = [UIColor colorWithRed:21.0/255 green:21.0/255 blue:21.0/255 alpha:1];
    }
    
    return _lblTitle;
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
- (void)btnDeleteClicked {
    if (self.item.deleteBlock) {
        self.item.deleteBlock();
    }
}


@end
