//
//  TDFSKDisplayedImageCell.m
//  RestApp
//
//  Created by tripleCC on 2017/5/11.
//  Copyright © 2017年 杭州迪火科技有限公司. All rights reserved.
//

#import <Masonry/Masonry.h>
#import "TDFSKDisplayedImageCell.h"
#import "TDFSKDisplayedImageItem.h"

@interface TDFSKDisplayedImageCell()
@property (strong, nonatomic) UIImageView *contentImageView;
@end

@implementation TDFSKDisplayedImageCell
- (void)cellDidLoad {
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.contentImageView];
}

+ (CGFloat)heightForCellWithItem:(TDFSKDisplayedImageItem *)item {
    return item.cellHeight;
}

- (void)configCellWithItem:(TDFSKDisplayedImageItem *)item {
    [self.contentImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(item.imageInsets.left);
        make.right.equalTo(self.contentView).offset(-item.imageInsets.right);
        make.top.equalTo(self.contentView).offset(item.imageInsets.top);
        make.bottom.equalTo(self.contentView).offset(-item.imageInsets.bottom);
        
    }];
    
    self.contentImageView.contentMode = item.contentMode;
    
    if (!item.image) {
        self.contentImageView.image = item.placeholderimage;
        return;
    }
    
    self.contentImageView.image = item.image;
}

- (UIImageView *)contentImageView {
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] init];
        _contentImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _contentImageView;
}
@end
