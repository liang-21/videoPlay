//
//  TDFTextCell.m
//  RestApp
//
//  Created by Octree on 29/11/16.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFTextCell.h"
#import "UIColor+Hex.h"
#import <Masonry/Masonry.h>
#import "TDFTextItem.h"

@interface TDFTextCell ()

@property (strong, nonatomic) UILabel *detailLabel;

@end

@implementation TDFTextCell


- (void)cellDidLoad {

    [self addSubview:self.detailLabel];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    self.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}

+ (CGFloat)heightForCellWithItem:(DHTTableViewItem *)item {

    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, 0);
    UILabel *detailLabel = [[UILabel alloc] init];
    detailLabel.numberOfLines = 0;
    detailLabel.font = [UIFont systemFontOfSize:12];
    detailLabel.textColor = [UIColor colorWithHeX:0x666666];
    detailLabel.text = ((TDFTextItem *) item).detail;
    size = [detailLabel sizeThatFits:size];
    return size.height + 20;
}

- (void)configCellWithItem:(DHTTableViewItem *)item {

    self.detailLabel.text = ((TDFTextItem *) item).detail;
}

- (UILabel *)detailLabel {

    if (!_detailLabel) {
        
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.numberOfLines = 0;
        _detailLabel.font = [UIFont systemFontOfSize:12];
        _detailLabel.textColor = [UIColor colorWithHeX:0x666666];
    }
    
    return _detailLabel;
}

@end
