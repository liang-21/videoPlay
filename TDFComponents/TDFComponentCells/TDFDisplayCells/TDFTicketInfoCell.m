//
//  TDFTicketInfoCell.m
//  TDFComponents
//
//  Created by doubanjiang on 2017/12/18.
//

#import "TDFTicketInfoCell.h"
#import "TDFTicketInfoItem.h"
#import <TDFStyleKit/UIColor+tdf_standard.h>
#import <Masonry/Masonry.h>

@interface TDFTicketInfoCell ()

@property (nonatomic, strong) UILabel *titleL;

@property (nonatomic, strong) UILabel *subTitleL;

@property (nonatomic, strong) UILabel *rightL;

@property (nonatomic, strong) UIImageView *arrowImgV;

@end

@implementation TDFTicketInfoCell

- (void)cellDidLoad {
    
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self.contentView addSubview:self.titleL];
    [self.contentView addSubview:self.subTitleL];
    [self.contentView addSubview:self.rightL];
    [self.contentView addSubview:self.arrowImgV];
    
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(10);
        make.height.mas_equalTo(22);
        
    }];
    [self.subTitleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleL.mas_bottom).offset(4);
        make.left.equalTo(self.titleL.mas_left);
        make.height.mas_equalTo(18);
    }];
    [self.arrowImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(8);
        make.height.mas_equalTo(13);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.offset(-15);
    }];
    [self.rightL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.arrowImgV.mas_left).offset(-10);
        make.centerY.equalTo(self.arrowImgV.mas_centerY);
        
    }];
}

- (void)configCellWithItem:(TDFTicketInfoItem *)item {
    [self.titleL setText:item.title];
    [self.subTitleL setText:item.subTitle];
}

+ (CGFloat)heightForCellWithItem:(DHTTableViewItem *)item {
    
    return 64.0f;
}

#pragma mark - Getter

- (UILabel *)titleL {
    if (!_titleL) {
        _titleL = [UILabel new];
        [_titleL setFont:[UIFont boldSystemFontOfSize:17]];
        [_titleL setTextColor:[UIColor tdf_hex_333333]];
    }
    return _titleL;
}

- (UILabel *)subTitleL {
    if (!_subTitleL) {
        _subTitleL = [UILabel new];
        [_subTitleL setFont:[UIFont systemFontOfSize:13]];
        [_subTitleL setTextColor:[UIColor tdf_hex_999999]];
    }
    return _subTitleL;
}

- (UILabel *)rightL {
    if (!_rightL) {
        _rightL = [UILabel new];
        [_rightL setFont:[UIFont systemFontOfSize:15]];
        [_rightL setTextColor:[UIColor tdf_hex_0088FF]];
        [_rightL setText:NSLocalizedString(@"查看详情", nil)];
    }
    return _rightL;
}

- (UIImageView *)arrowImgV {
    if (!_arrowImgV) {
        _arrowImgV = [UIImageView new];
        [_arrowImgV setImage:[UIImage imageNamed:@"icon_next_alpha"]];
        _arrowImgV.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _arrowImgV;
}

@end
