//
//  TDFTableViewTitleSection.m
//  TDFDoubleTwelveActivityModule
//
//  Created by tripleCC on 2017/11/6.
//
#import <Masonry/Masonry.h>
#import "UIColor+RGB.h"
#import "TDFSKTableViewTitleSection.h"

@interface TDFSKTableViewTitleSection()
@property (strong, nonatomic) UIView *titleContainerView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) UIView *headerLineView;
@property (strong, nonatomic) UIView *footerLineView;
@end

@implementation TDFSKTableViewTitleSection

+ (instancetype)sectionWithTitle:(NSString *)title {
    return [self sectionWithTitle:title type:TDFSKTableViewTitleSectionTypeTopMargin];
}

+ (instancetype)sectionWithTitle:(NSString *)title type:(TDFSKTableViewTitleSectionType)type {
    TDFSKTableViewTitleSection *section = [super section];
    switch (type) {
        case TDFSKTableViewTitleSectionTypeNormal: {
            section.headerHeight = 36;
        } break;
        case TDFSKTableViewTitleSectionTypeTopMargin: {
            section.headerHeight = 66;
        } break;
        case TDFSKTableViewTitleSectionTypeTopMarginAndGray: {
            section.headerHeight = 66;
            section.titleContainerView.backgroundColor = [UIColor tdf_colorWithRGB:0xe3e2e4];
            [section.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@15);
                make.right.equalTo(section.titleContainerView).offset(-10);
                make.centerY.equalTo(section.titleContainerView);
            }];
        } break;
            
        default:
            break;
    }
    section.titleLabel.text = title;
    section.containerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, section.headerHeight);
    return section;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.titleContainerView addSubview:self.titleLabel];
        [self.containerView addSubview:self.titleContainerView];
        [self.containerView addSubview:self.headerLineView];
        [self.titleContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.containerView);
            make.height.equalTo(@28);
        }];
        [self.headerLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.containerView);
            make.height.equalTo(@1);
            make.bottom.equalTo(self.containerView);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@15);
            make.right.bottom.equalTo(self.titleContainerView).offset(-10);
        }];
        self.headerView = self.containerView;
        self.footerView = self.footerLineView;
        self.footerHeight = 1;
    }
    return self;
}

- (void)updateOldLayout {
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
    }];
}

- (UIView *)footerLineView {
    if (!_footerLineView) {
        _footerLineView = [UIView new];
        _footerLineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    }
    
    return _footerLineView;
}

- (UIView *)headerLineView {
    if (!_headerLineView) {
        _headerLineView = [UIView new];
        _headerLineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    }
    
    return _headerLineView;
}

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [UIView new];
    }
    
    return _containerView;
}

- (UIView *)titleContainerView {
    if (!_titleContainerView) {
        _titleContainerView = [UIView new];
    }
    
    return _titleContainerView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    
    return _titleLabel;
}
@end
