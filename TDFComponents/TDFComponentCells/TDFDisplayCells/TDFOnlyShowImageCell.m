//
//  TDFOnlyShowImagesCell.m
//  Pods
//
//  Created by chaiweiwei on 2017/7/17.
//
//

#import "TDFOnlyShowImageCell.h"
#import "TDFOnlyShowImageItem.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>

@interface TDFOnlyShowImageCell()

@property (nonatomic,strong) UIImageView *contentImageView;
@property (strong, nonatomic) UIView *seperatorLineView;

@end

@implementation TDFOnlyShowImageCell

- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.seperatorLineView];
    [self.seperatorLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.equalTo(@1);
        make.bottom.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.contentImageView];
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(10);
        make.bottom.equalTo(self.seperatorLineView.mas_top).with.offset(-10);
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFOnlyShowImageItem *)item
{
    if(!item.shouldShow) {
        return 0;
    }
    
    UIImageView *imageTest = [[UIImageView alloc] init];
    
    if(item.imagePath.length > 0) {
        [imageTest sd_setImageWithURL:[NSURL URLWithString:item.imagePath] placeholderImage:item.image];
    }
    
    if(item.image) {
        imageTest.image = item.image;
    }
    
    CGSize size;
    if(item.isFixSize) {
        size = item.imageDefaultSize;
        
        return size.height + 21;
    }else {
        if(imageTest.image) {
            size = imageTest.image.size;
        }else {
            size = item.imageDefaultSize;
        }
        CGFloat height = ([UIScreen mainScreen].bounds.size.width-20)*size.height*1.0/size.width*1.0;
        
        return height + 21;
    }
}

- (void)configCellWithItem:(TDFOnlyShowImageItem *)item
{
    if (!item.shouldShow) return;
    
    if(item.imagePath.length > 0) {
        [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:item.imagePath] placeholderImage:item.image];
    }else {
        self.contentImageView.image = item.image;
    }

    if(item.backgroundColor) {
        self.contentView.backgroundColor = item.backgroundColor;
    }
    
    [self.contentImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(10);
        make.bottom.equalTo(self.seperatorLineView.mas_top).with.offset(-10);
        if (item.isFixSize) {
            make.centerX.equalTo(self.contentView.mas_centerX);
            make.width.mas_offset(item.imageDefaultSize.width);
        }else {
            make.left.equalTo(self.contentView.mas_left).with.offset(10);
            make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        }
    }];
}

- (UIImageView *)contentImageView {
    if(!_contentImageView) {
        _contentImageView = [[UIImageView alloc] init];
        _contentImageView.contentMode = UIViewContentModeScaleAspectFill;
        _contentImageView.clipsToBounds = YES;
    }
    return _contentImageView;
}

- (UIView *)seperatorLineView {
    if (!_seperatorLineView) {
        _seperatorLineView = [[UIView alloc] init];
        _seperatorLineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    }
    
    return _seperatorLineView;
}

@end
