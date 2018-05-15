//
//  TDFEmptyCell.m
//  RestApp
//
//  Created by chaiweiwei on 2016/11/7.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import "TDFEmptyCell.h"
#import "TDFEmptyItem.h"
#import "Masonry.h"

@interface TDFEmptyCell()

@property (nonatomic, strong) UILabel *emptyLabel;

@end

@implementation TDFEmptyCell

- (void)cellDidLoad {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];

    [self addSubview:self.emptyLabel];
    [self.emptyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}

- (UILabel *)emptyLabel {
    if(!_emptyLabel) {
        _emptyLabel = [[UILabel alloc] init];
        _emptyLabel.backgroundColor =[UIColor clearColor];
        _emptyLabel.textColor =[UIColor whiteColor];
        _emptyLabel.font =[UIFont systemFontOfSize:18];
        _emptyLabel.numberOfLines=0;
        _emptyLabel.textAlignment =NSTextAlignmentCenter;
    }
    return _emptyLabel;
}

+ (CGFloat)heightForCellWithItem:(TDFEmptyItem *)item
{

    return item.height == 0 ? 200 : item.height;
}

- (void)configCellWithItem:(TDFEmptyItem *)item
{
    self.emptyLabel.text = item.title;
    if (item.color) {
        self.emptyLabel.textColor = item.color;
    }
}

@end
