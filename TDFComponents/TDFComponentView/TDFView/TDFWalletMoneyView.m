//
//  TDFWalletMoneyView.m
//  TDFComponents
//
//  Created by chaiweiwei on 2017/10/10.
//

#import "TDFWalletMoneyView.h"
#import "UIColor+tdf_standard.h"
#import "UILabel+AttributedText.h"
#import "Masonry.h"

@interface TDFWalletMoneyView ()

@property (nonatomic,strong) UILabel *moneyLabel;
@property (nonatomic,strong) UILabel *contentLabel;

@end

@implementation TDFWalletMoneyView

+ (instancetype)configWithModel:(TDFWalletMoneyItem *)item {
    
    TDFWalletMoneyView *view = [[TDFWalletMoneyView alloc] init];
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [TDFWalletMoneyView heightWithModel:item]);

    NSString *text = [NSString stringWithFormat:@"%@\n%@",item.title,item.money];
    [view.moneyLabel tdf_attributedFontText:text attributedText:item.title attributedFontSize:15 bold:YES];
    [view.moneyLabel tdf_attributedColorText:text attributedText:item.money attributedColor:[UIColor tdf_hex_FF0033]];
    [view.moneyLabel tdf_attributedFontText:text attributedText:item.money attributedFontSize:34 bold:NO];
    [view.moneyLabel tdf_attributedLineSpacingText:text attributedSpace:20];

    view.contentLabel.text = item.content;
    
    return view;
}

- (instancetype)init {
    if(self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self addSubview:self.moneyLabel];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top).with.offset(15);
    }];
    
    [self addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.top.equalTo(self.moneyLabel.mas_bottom).with.offset(15);
    }];
}

+ (CGFloat)heightWithModel:(TDFWalletMoneyItem *)item {
    
    CGSize size = [item.content boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-30, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
    return 90 + 15 + size.height + 20;
}

- (UILabel *)moneyLabel {
    if(!_moneyLabel) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.font = [UIFont systemFontOfSize:15];
        _moneyLabel.textColor = [UIColor tdf_hex_333333];
        _moneyLabel.numberOfLines = 0;
    }
    return _moneyLabel;
}

- (UILabel *)contentLabel {
    if(!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:13];
        _contentLabel.textColor = [UIColor tdf_hex_999999];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}
@end
