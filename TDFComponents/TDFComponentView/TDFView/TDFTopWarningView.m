//
//  TDFTopWarningview.m
//  Pods
//
//  Created by chaiweiwei on 2017/7/13.
//
//

#import "TDFTopWarningView.h"
#import <Masonry/Masonry.h>

@interface TDFTopWarningView ()

@property (nonatomic,assign) BOOL hasWarningIcon;
@property (nonatomic,copy) NSString *warningString;
@property (nonatomic,strong) UIColor *textColor;
@property (nonatomic,strong) UIImageView *iconView;
@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation TDFTopWarningView

+ (instancetype)configWithModel:(TDFTopWarningItem *)item {
    
    TDFTopWarningView *view = [TDFTopWarningView initViewWithString:item.warningString hasWarningIcon:item.hasWarningIcon textColor:item.textColor];
    view.frame = CGRectMake(0, 0, 0, [TDFTopWarningView heightWithModel:item]);
    return view;
}

+ (CGFloat)heightWithModel:(TDFTopWarningItem *)item {
    
    CGFloat width = 0;
    if(item.hasWarningIcon) {
        width = [UIScreen mainScreen].bounds.size.width - 50;
    }else {
        width = [UIScreen mainScreen].bounds.size.width - 20;
    }
    
    CGSize size = [item.warningString boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} context:nil].size;
    return size.height + 20;
}

- (instancetype)init {
    if(self = [super init]) {
        [self addSubview:self.iconView];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.centerY.equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        [self addSubview:self.titleLabel];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(38);
            make.top.equalTo(self.mas_top);
            make.bottom.equalTo(self.mas_bottom);
            make.right.equalTo(self.mas_right).with.offset(-10);
        }];
    }
    return self;
}

+ (instancetype)initViewWithString:(NSString *)warningString hasWarningIcon:(BOOL)hasWarningIcon textColor:(UIColor *) textColor{
    TDFTopWarningView *view = [[TDFTopWarningView alloc] init];
    view.warningString = warningString;
    view.hasWarningIcon = hasWarningIcon;
    view.textColor = textColor;
    return view;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.iconView.hidden = !self.hasWarningIcon;
    self.titleLabel.text = self.warningString;
    self.titleLabel.textColor = self.textColor?:[UIColor colorWithRed:204 green:0 blue:0 alpha:1];
    if(self.hasWarningIcon) {
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(38);
        }];
    }else {
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
        }];
    }
}

- (UIImageView *)iconView {
    if(!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"icon_apply_warnning" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor colorWithRed:204 green:0 blue:0 alpha:1];
        _titleLabel.font = [UIFont systemFontOfSize:11];
        _titleLabel.numberOfLines = 0;
        _titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
    }
    return _titleLabel;
}

@end
