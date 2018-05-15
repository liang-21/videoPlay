//
//  TDFNormalIntroductionCell.m
//  TDFComponents
//
//  Created by chaiweiwei on 2018/1/29.
//

#import <Masonry/Masonry.h>
#import "UIColor+RGB.h"
#import "NSString+SizeCalculator.h"
#import "TDFNormalIntroductionItem.h"
#import "TDFNormalIntroductionCell.h"

@interface TDFNormalIntroductionCell ()
@property (strong, nonatomic) UIImageView *avatarImageView;
@property (strong, nonatomic) UILabel *introductionLabel;
@property (strong, nonatomic) TDFNormalIntroductionItem *item;
@end

@implementation TDFNormalIntroductionCell

- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.introductionLabel];
    
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.equalTo(self.contentView);
        make.top.equalTo(@20);
        make.height.equalTo(@125);
    }];
    
    [self.introductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.right.equalTo(self.contentView).offset(-15);
        make.bottom.equalTo(self.contentView).offset(-20);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFNormalIntroductionItem *)item {
    return [item.introduction tdf_heightForFont:[UIFont systemFontOfSize:13] width:[UIScreen mainScreen].bounds.size.width - 30] + 60 + 125;
}

- (void)configCellWithItem:(TDFNormalIntroductionItem *)item {
    self.item = item;
    self.avatarImageView.image = item.image;
    self.introductionLabel.text = item.introduction;
}


- (UILabel *)introductionLabel {
    if (!_introductionLabel) {
        _introductionLabel = [UILabel new];
        _introductionLabel.font = [UIFont systemFontOfSize:13];
        _introductionLabel.numberOfLines = 0;
        _introductionLabel.textColor = [UIColor tdf_colorWithRGB:0x333333];
    }
    
    return _introductionLabel;
}

- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [UIImageView new];
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _avatarImageView;
}
@end

