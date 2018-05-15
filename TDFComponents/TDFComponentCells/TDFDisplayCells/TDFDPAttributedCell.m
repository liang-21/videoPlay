//
//  TDFDPAttributedCell.m
//  Pods
//
//  Created by happyo on 2018/3/22.
//

#import "TDFDPAttributedCell.h"
#import "Masonry.h"
#import "TDFDPAttributedItem.h"

@interface TDFDPAttributedCell ()

@property (nonatomic, strong) UILabel *label;

@end 
@implementation TDFDPAttributedCell

#pragma mark -- DHTTableViewCellDelegate --
    
- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.centerY.equalTo(self);
        make.height.equalTo(@20);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFDPAttributedItem *)item
{
    CGFloat height = 30;
    
    return height;
}

- (void)configCellWithItem:(TDFDPAttributedItem *)item
{
    
}

#pragma mark -- Getters && Setters --

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] init];
    }
    
    return _label;
}

@end
