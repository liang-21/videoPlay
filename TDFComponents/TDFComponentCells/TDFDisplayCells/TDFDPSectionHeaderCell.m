//
//  TDFDPSectionHeaderCell.m
//  Pods
//
//  Created by happyo on 2018/3/22.
//

#import "TDFDPSectionHeaderCell.h"
#import "Masonry.h"
#import "TDFDPAttributedItem.h"

@interface TDFDPSectionHeaderCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end
@implementation TDFDPSectionHeaderCell

#pragma mark -- DHTTableViewCellDelegate --
    
- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.titleLabel);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFDPAttributedItem *)item
{
    CGFloat height = 0;
    
    return height;
}

- (void)configCellWithItem:(TDFDPAttributedItem *)item
{
    
}

#pragma mark -- Getters && Setters --

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    
    return _titleLabel;
}

@end
