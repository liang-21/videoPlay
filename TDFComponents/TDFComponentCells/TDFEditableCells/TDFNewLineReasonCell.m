//
//  TDFNewLineReasonCell.m
//  Pods
//
//  Created by wuwangwo on 2017/8/8.
//
//

#import "TDFNewLineReasonCell.h"
#import "TDFNewLineReasonItem.h"
#import "Masonry.h"

@interface TDFNewLineReasonCell ()

@property (nonatomic, strong) UILabel *lblTitle;

@property (nonatomic, strong) UIButton *btnDelete;

@property (nonatomic, strong) UIView *line;

@property (nonatomic, strong) TDFNewLineReasonItem *item;

@end

@implementation TDFNewLineReasonCell

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
        make.leading.equalTo(self.contentView).with.offset(10);
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.btnDelete.mas_left).offset(-10);
//        make.height.equalTo(@(14));
    }];
    
    /*
    [self.btnDelete mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView).with.offset(-10);
        make.height.equalTo(@(18));
        make.width.equalTo(@(18));
    }];
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).with.offset(10);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@(14));
    }];*/
    
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

+ (CGFloat)heightForCellWithItem:(TDFNewLineReasonItem *)item
{
    if (!item.shouldShow) return 0;
    return item.reasonItemHeight;
//    return 40;
}


- (void)configCellWithItem:(TDFNewLineReasonItem *)item
{
    self.item = item;
    self.contentView.hidden = !item.shouldShow;
    if (!item.shouldShow) return;
    self.lblTitle.text = item.title;

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - 28 , 0)];
    label.font = [UIFont systemFontOfSize:15];
    label.text = item.title;
    label.numberOfLines = 0;
    [label sizeToFit];
    
    item.reasonItemHeight = label.frame.size.height + 30;
}


- (UILabel *)lblTitle
{
    if (!_lblTitle) {
        _lblTitle = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblTitle.font = [UIFont systemFontOfSize:15];
        _lblTitle.numberOfLines = 0;
        [_lblTitle sizeToFit];
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
