//
//  TDFIssueMissionStatusView.m
//  Pods
//
//  Created by chaiweiwei on 2017/5/5.
//
//

#import "TDFIssueMissionStatusView.h"
#import "UIColor+Hex.h"
#import "Masonry.h"

@interface TDFIssueMissionStatusView()

@property (assign,nonatomic) TDFIssueMissionStatusType type;

@property (strong,nonatomic) UIImageView *topImageView;
@property (strong,nonatomic) UILabel *topLabel;
@property (strong,nonatomic) UILabel *subtitleLabel;

@end

@implementation TDFIssueMissionStatusView

+ (instancetype)statusViewWithType:(TDFIssueMissionStatusType)type title:(NSString *)title subtitle:(NSString *)subtitle {
    TDFIssueMissionStatusView *view = [[TDFIssueMissionStatusView alloc] init];
    view.topLabel.text = title;
    view.subtitleLabel.text = subtitle;
    view.type = type;
    
    
    NSMutableAttributedString *attributedString =  [[NSMutableAttributedString alloc] initWithString:subtitle];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:8];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, subtitle.length)];
    [view.subtitleLabel setAttributedText:attributedString];
    
    CGSize size = [subtitle boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 120+size.height);
    
    return view;
}


- (instancetype)init {
    if(self = [super init]) {
        [self addSubview:self.topImageView];
        [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_offset(30);
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(self.mas_top).with.offset(20);
        }];
        
        [self addSubview:self.topLabel];
        [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(self.topImageView.mas_bottom).with.offset(14);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
        }];
        
        [self addSubview:self.subtitleLabel];
        
        [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(self.topLabel.mas_bottom).with.offset(8);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
        }];
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
        [self addSubview:lineView];
        
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.bottom.equalTo(self.mas_bottom);
            make.height.mas_equalTo(1);
            make.right.equalTo(self.mas_right).with.offset(-10);
        }];
    }
    return self;
}

- (void)setType:(TDFIssueMissionStatusType)type {
    _type = type;
    switch (_type) {
        case TDFIssueMissionStatusTypeProcess:
        case TDFIssueMissionStatusTypeWaiting:
        {
            self.topImageView.image = [UIImage imageNamed:@"icon_waiting" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
            self.topLabel.textColor = self.subtitleLabel.textColor = [UIColor colorWithHexString:@"#F58023"];
        }
            break;
        case TDFIssueMissionStatusTypeSuccess:
        {
            self.topImageView.image = [UIImage imageNamed:@"icon_success" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
            self.topLabel.textColor = self.subtitleLabel.textColor = [UIColor colorWithHexString:@"#07AD1F"];
        }
            break;
        case TDFIssueMissionStatusTypeFail:
        {
            self.topImageView.image = [UIImage imageNamed:@"icon_fail" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
            self.topLabel.textColor = self.subtitleLabel.textColor = [UIColor colorWithHexString:@"#CC0000"];
        }
            break;
    }
}

- (UIImageView *)topImageView {
    if(!_topImageView) {
        _topImageView = [[UIImageView alloc] init];
    }
    return _topImageView;
}

- (UILabel *)topLabel {
    if(!_topLabel) {
        _topLabel = [[UILabel alloc] init];
        _topLabel.font = [UIFont systemFontOfSize:20];
        _topLabel.textColor = [UIColor colorWithHexString:@"#F58023"];
        _topLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _topLabel;
}

- (UILabel *)subtitleLabel {
    if(!_subtitleLabel) {
        _subtitleLabel = [[UILabel alloc] init];
        _subtitleLabel.font = [UIFont systemFontOfSize:15];
        _subtitleLabel.textColor = [UIColor colorWithHexString:@"#F58023"];
        _subtitleLabel.numberOfLines = 0;
        _subtitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _subtitleLabel;
}

@end
