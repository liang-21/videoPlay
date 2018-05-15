//
//  TDFMSDiscountListCell.m
//  TDFComponents
//
//  Created by 黄河 on 2017/12/9.
//

#import "TDFMSSelectListCell.h"
#import "TDFMSSelectListItem.h"
#import "UIColor+tdf_standard.h"
#import "ReactiveObjC.h"
#import "UITableViewCell+SeperatorLine.h"
#import "Masonry.h"

@interface TDFMSSelectListCell ()

@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *detailLabel;

@end

@implementation TDFMSSelectListCell

- (void)cellDidLoad {
//    self.tdf_showBottomLine = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self addSubview:self.titleLabel];
    [self addSubview:self.detailLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.centerY.equalTo(self);
        make.right.lessThanOrEqualTo(self.detailLabel.mas_left);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_centerX);
        make.centerY.equalTo(self);
        make.right.lessThanOrEqualTo(self).offset(-20);
    }];
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.height.equalTo(@1);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFMSSelectListItem *)item {
    if (item.hide) {
        return 0;
    }
    return item.height;
}

- (void)configCellWithItem:(TDFMSSelectListItem *)item {
    self.titleLabel.text = item.title;
    self.detailLabel.text = item.subTitle;
    [RACObserve(item, select) subscribeNext:^(id  _Nullable x) {
        self.accessoryType = [x boolValue]?UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    }];
}


#pragma mark -- setter && getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor tdf_hex_333333];
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textColor = [UIColor tdf_hex_666666];
        _detailLabel.font = [UIFont systemFontOfSize:15];
    }
    return _detailLabel;
}

@end
