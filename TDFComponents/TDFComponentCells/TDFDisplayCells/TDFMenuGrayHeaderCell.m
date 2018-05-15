//
//  TDFMenuGrayHeaderCell.m
//  TDFShopInfoModule
//
//  Created by chaiweiwei on 2018/4/11.
//

#import "TDFMenuGrayHeaderCell.h"
#import "TDFMenuGrayHeaderItem.h"
#import "UITableViewCell+SeperatorLine.h"
#import "Masonry.h"
#import "TDFShapeButton.h"
#import "UIColor+Hex.h"
#import "UIColor+tdf_standard.h"

@interface TDFMenuGrayHeaderCell()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) TDFShapeButton *subtitleButton;

@end

@implementation TDFMenuGrayHeaderCell

-(void)cellDidLoad {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.tdf_showBottomLine = YES;
    
    UIView *grayView = [[UIView alloc] init];
    grayView.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"];
    grayView.layer.masksToBounds = YES;
    grayView.layer.cornerRadius = 12;
    [self addSubview:grayView];
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(70);
        make.right.equalTo(self.mas_right).with.offset(-70);
        make.height.mas_equalTo(24);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [grayView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(grayView.mas_left).with.offset(5);
        make.centerY.equalTo(grayView.mas_centerY);
    }];
    
    [grayView addSubview:self.subtitleButton];
    [self.subtitleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(grayView.mas_right).with.offset(-5);
        make.centerY.equalTo(grayView.mas_centerY);
        make.left.greaterThanOrEqualTo(self.titleLabel.mas_right).with.offset(5);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFMenuGrayHeaderItem *)item {
    return item.height;
}

- (void)configCellWithItem:(TDFMenuGrayHeaderItem *)item {
    [[self tdf_bottomLineView] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.equalTo(self).offset(item.seperatoInsets.left);
        make.right.equalTo(self).offset(-item.seperatoInsets.right);
        make.height.equalTo(@1);
    }];
    
    self.titleLabel.text = item.title;
    [self.subtitleButton setTitle:item.subtitle forState:UIControlStateNormal];
    [self.subtitleButton setTitleColor:item.subtitleColor forState:UIControlStateNormal];
    self.subtitleButton.titleLabel.font = item.subtitleFont;
    [self.subtitleButton setImage:item.tagIcon forState:UIControlStateNormal];
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor tdf_hex_333333];
    }
    return _titleLabel;
}

- (TDFShapeButton *)subtitleButton {
    if(!_subtitleButton) {
        _subtitleButton = [[TDFShapeButton alloc] init];
        _subtitleButton.space = 5;
        _subtitleButton.shapeType = TDFButtonShapeTypeHorizontal;
    }
    return _subtitleButton;
}
@end
