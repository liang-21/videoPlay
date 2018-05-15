//
//  TDFWalletContentCell.m
//  TDFComponents
//
//  Created by chaiweiwei on 2017/9/28.
//

#import "TDFWalletContentCell.h"
#import "Masonry.h"
#import "TDFStyleKit/UIColor+tdf_standard.h"
#import "UILabel+AttributedText.h"
#import "TDFWalletContentItem.h"
#import "UITableViewCell+SeperatorLine.h"

@interface TDFWalletContentCell()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *totalMoneyLabel;

@end

@implementation TDFWalletContentCell

+ (CGFloat)heightForCellWithItem:(TDFWalletContentItem *)item {
    return 116;
}

- (instancetype)init {
    if(self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)cellDidLoad {
    
    [super layoutSubviews];
    
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.top.equalTo(self.mas_top).with.offset(15);
    }];
    
    [self addSubview:self.totalMoneyLabel];
    [self.totalMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.bottom.equalTo(self.mas_bottom).with.offset(-20);
    }];
    
    self.tdf_showBottomLine = YES;
}

- (void)configCellWithItem:(TDFWalletContentItem *)item {
    self.titleLabel.text = item.title;
    self.totalMoneyLabel.text = item.totalMoney;
}

- (void)setTdf_showBottomLine:(BOOL)tdf_showBottomLine {
    
    if (tdf_showBottomLine) {
        if ([self tdf_bottomLineView].superview) return;
        
        [self.contentView addSubview:[self tdf_bottomLineView]];
        [[self tdf_bottomLineView] mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-1);
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.height.equalTo(@1);
        }];
    } else {
        [super setTdf_showBottomLine:tdf_showBottomLine];
    }
}

- (UILabel *)totalMoneyLabel {
    if(!_totalMoneyLabel) {
        _totalMoneyLabel = [[UILabel alloc] init];
        _totalMoneyLabel.font = [UIFont systemFontOfSize:34];
        _totalMoneyLabel.textColor = [UIColor tdf_hex_FF0033];
        _totalMoneyLabel.numberOfLines = 0;
    }
    return _totalMoneyLabel;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15];
        _titleLabel.textColor = [UIColor tdf_hex_333333];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}



@end
