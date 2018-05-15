//
//  TDFOpenKBStatusCell.m
//  TDFComponents
//
//  Created by doubanjiang on 2017/12/15.
//

#import "TDFOpenKBStatusCell.h"
#import "TDFOpenKBStatusItem.h"
#import <TDFCategories/UIColor+RGB.h>
#import <Masonry/Masonry.h>

@interface TDFOpenKBStatusCell ()

@property (nonatomic, strong) UIImageView *iconImgV;

@property (nonatomic, strong) UILabel *titleL;

@property (nonatomic, strong) UILabel *detailL;

@property (nonatomic, strong) UIView *lineV;

@end

@implementation TDFOpenKBStatusCell

- (void)cellDidLoad {
    
    [self configLayout];
}

- (void)configLayout {
    
    self.backgroundColor = [UIColor tdf_colorWithRGB:0xFFFFFF];
    [self.contentView addSubview:self.lineV];
    [self.contentView addSubview:self.iconImgV];
    [self.contentView addSubview:self.titleL];
    [self.contentView addSubview:self.detailL];
    
    [self.lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.width.mas_equalTo(2);
        make.centerX.equalTo(self.iconImgV.mas_centerX);
    }];
    [self.iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(30);
        make.width.height.mas_equalTo(30);
    }];
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImgV.mas_top);
        make.left.equalTo(self.iconImgV.mas_right).offset(15);
        make.right.offset(-15);
        make.height.mas_equalTo(20);
    }];
    [self.detailL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleL.mas_bottom).offset(5);
        make.left.equalTo(self.titleL.mas_left);
        make.right.offset(-15);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
}

- (void)configCellWithItem:(TDFOpenKBStatusItem *)item {
    
    [self.titleL setText:item.title];
    [self.detailL setText:item.detail];
    [self.iconImgV setImage:item.iconImg];

    [self.lineV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(1);
        make.centerX.equalTo(self.iconImgV.mas_centerX);
        switch (item.lineType) {
            case TDFOpenKBStatusItemLineType_Bottom:
            {
                make.top.equalTo(self.iconImgV.mas_bottom);
                make.bottom.equalTo(self.contentView.mas_bottom);
            }
                break;
            case TDFOpenKBStatusItemLineType_Top:
            {
                make.top.equalTo(self.contentView.mas_top);
                make.bottom.equalTo(self.iconImgV.mas_top);
            }
                break;
            case TDFOpenKBStatusItemLineType_All:
            {
                make.top.equalTo(self.contentView.mas_top);
                make.bottom.equalTo(self.contentView.mas_bottom);
            }
                break;
            default:
                break;
        }
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFOpenKBStatusItem *)item {
    
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-75-15, 0)];
    lb.numberOfLines = 0;
    [lb setFont:[UIFont systemFontOfSize:13]];
    [lb setTextColor:[UIColor tdf_colorWithRGB:0xFF666666]];
    [lb setText:item.detail];
    lb.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width-75-15;
    [lb sizeToFit];
    
    CGFloat height = lb.frame.size.height + 30 + 20 + 5;
    
    return height;
}

#pragma mark - Getter

- (UIImageView *)iconImgV {
    if (!_iconImgV) {
        _iconImgV = [UIImageView new];
    }
    return _iconImgV;
}

- (UILabel *)titleL {
    if (!_titleL) {
        _titleL = [UILabel new];
        [_titleL setFont:[UIFont systemFontOfSize:15]];
        [_titleL setTextColor:[UIColor tdf_colorWithRGB:0xFF333333]];
    }
    return _titleL;
}

- (UILabel *)detailL {
    if (!_detailL) {
        _detailL = [UILabel new];
        _detailL.numberOfLines = 0;
        [_detailL setFont:[UIFont systemFontOfSize:13]];
        [_detailL setTextColor:[UIColor tdf_colorWithRGB:0xFF666666]];
    }
    return _detailL;
}

- (UIView *)lineV {
    if (!_lineV) {
        _lineV = [UIView new];
        [_lineV setBackgroundColor:[UIColor tdf_colorWithRGB:0xFF999999]];
    }
    return _lineV;
}


@end
