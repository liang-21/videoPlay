//
//  TDFKindPayHeaderView.m
//  Pods
//
//  Created by chaiweiwei on 2017/5/4.
//
//

#import "TDFKindPayHeaderView.h"
#import "Masonry.h"

@interface TDFKindPayHeaderView()

@property (strong,nonatomic) UIView *alphaView;

@property (strong,nonatomic) UILabel *titleLabel1;

@property (strong,nonatomic) UILabel *titleLabel2;

@end

@implementation TDFKindPayHeaderView

+ (instancetype)headerViewWithTitle1:(NSString *)title1 title2:(NSString *)title2 {
    TDFKindPayHeaderView *headerView = [[TDFKindPayHeaderView alloc] init];
    headerView.titleLabel1.text = title1;
    headerView.titleLabel2.text = title2;
    return headerView;
}

- (instancetype)init {
    if(self = [super init]) {
        [self addSubview:self.alphaView];
        [self.alphaView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.centerY.equalTo(self.mas_centerY);
            make.height.mas_equalTo(22);
        }];
        [self addSubview:self.titleLabel1];
        [self.titleLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(15);
            make.centerY.equalTo(self.mas_centerY);
        }];
        [self addSubview:self.titleLabel2];
        [self.titleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).with.offset(-15);
            make.centerY.equalTo(self.mas_centerY);
        }];
        
    }
    return self;
}

+ (CGFloat)height {
    return 40;
}

- (UIView *)alphaView {
    if(!_alphaView) {
        _alphaView = [[UIView alloc] init];
        _alphaView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        _alphaView.layer.masksToBounds = YES;
        _alphaView.layer.cornerRadius = 11;
    }
    return _alphaView;
}

- (UILabel *)titleLabel1 {
    if(!_titleLabel1) {
        _titleLabel1 = [[UILabel alloc] init];
        _titleLabel1.font = [UIFont systemFontOfSize:13];
        _titleLabel1.textColor = [UIColor whiteColor];
    }
    return _titleLabel1;
}

- (UILabel *)titleLabel2 {
    if(!_titleLabel2) {
        _titleLabel2 = [[UILabel alloc] init];
        _titleLabel2.font = [UIFont systemFontOfSize:13];
        _titleLabel2.textColor = [UIColor whiteColor];
        _titleLabel2.textAlignment = NSTextAlignmentRight;
    }
    return _titleLabel2;
}

@end
