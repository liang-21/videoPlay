//
//  TDFBgImageCell.m
//  RestApp
//
//  Created by chaiweiwei on 2016/11/2.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//
#import "UITableViewCell+SeperatorLine.h"
#import "TDFBigImageCell.h"
#import "TDFBgImageView.h"
#import "TDFBigImageItem.h"
#import "Masonry.h"

@interface TDFBigImageCell()

@property (nonatomic, strong) TDFBgImageView *bgImageView;

@end

@implementation TDFBigImageCell

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
    self.tdf_showBottomLine = YES;
    
    [self addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.bottom.equalTo(self).offset(-10);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFBigImageItem *)item
{
    CGFloat height = 0;
    
    if (item.shouldShow) {
        
        height = [TDFBgImageView getHeight];
    }
    
    return height;
}

- (void)configCellWithItem:(TDFBigImageItem *)item
{
    if (item.shouldShow) {
        self.hidden = NO;
    } else {
        self.hidden = YES;
        return ;
    }
    
    [self.bgImageView configureViewWithModel:item];
}

- (TDFBgImageView *)bgImageView {
    if(!_bgImageView) {
        _bgImageView = [[TDFBgImageView alloc] init];
    }
    return _bgImageView;
}


@end
