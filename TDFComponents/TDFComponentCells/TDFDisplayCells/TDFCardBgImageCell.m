//
//  TDFCardBgImageCell.m
//  RestApp
//
//  Created by chaiweiwei on 2016/11/3.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import "TDFCardBgImageCell.h"
#import "TDFCardBgImageItem.h"
#import "TDFCardBgImageView.h"
#import "Masonry.h"

@interface TDFCardBgImageCell()

@property (nonatomic, strong) TDFCardBgImageView *cardbgImageView;

@end

@implementation TDFCardBgImageCell

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.cardbgImageView];
    [self.cardbgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFCardBgImageItem *)item
{
    if(!item.shouldShow) return 0;
    
    CGFloat height = [TDFCardBgImageView getHeightWithModel:item];

    return height;
}

- (void)configCellWithItem:(TDFCardBgImageItem *)item
{
    self.hidden = !item.shouldShow;
    if (!item.shouldShow) return;
    
    [self.cardbgImageView configureViewWithModel:item];
}

- (TDFCardBgImageView *)cardbgImageView {
    if(!_cardbgImageView) {
        _cardbgImageView = [[TDFCardBgImageView alloc] init];
    }
    return _cardbgImageView;
}

@end
