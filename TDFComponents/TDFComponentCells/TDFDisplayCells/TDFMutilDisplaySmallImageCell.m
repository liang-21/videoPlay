//
//  TDFMutilDisplaySmallImageCell.m
//  Pods
//
//  Created by chaiweiwei on 2017/7/17.
//
//

#import "TDFMutilDisplaySmallImageCell.h"
#import <Masonry/Masonry.h>
#import "TDFMutilDisplaySmallImageItem.h"
#import "UIButton+WebCache.h"
#import "TDFBatchOperation.h"
#import "ReactiveObjC.h"

@interface TDFMutilDisplaySmallImageCell()

@property (nonatomic,strong) TDFMutilDisplaySmallImageItem *modelItem;

@end

@implementation TDFMutilDisplaySmallImageCell

- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
}

+ (CGFloat)heightForCellWithItem:(TDFMutilDisplaySmallImageItem *)item {
    
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 40 - (item.smallImageItems.count-1)*10)/item.smallImageItems.count;
    return width;
}

- (void)configCellWithItem:(TDFMutilDisplaySmallImageItem *)item {
    
    self.modelItem = item;
    
    [self.contentView.subviews tdf_forEach:^(__kindof UIView *value) {
        if([value isKindOfClass:[UIButton class]]) {
            [value removeFromSuperview];
        }
    }];
    
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 40 - (item.smallImageItems.count-1)*10)/item.smallImageItems.count;
    
    [item.smallImageItems enumerateObjectsUsingBlock:^(TDFSmallSequenceImageItem * _Nonnull smallItem, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *coverButton = [self createSmallImageButtonWithItem:smallItem];
        coverButton.tag = 1000 + idx;
        [self.contentView addSubview:coverButton];
        if(idx == 0) {
            [coverButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(coverButton.mas_centerY);
                make.left.equalTo(self.contentView.mas_left).with.offset(20);
                make.width.and.height.mas_equalTo(width);
            }];
        }else {
            UIButton *preButtton = [self.contentView viewWithTag:(1000+idx-1)];
            [coverButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(coverButton.mas_centerY);
                make.left.equalTo(preButtton.mas_right).with.offset(10);
                make.width.and.height.mas_equalTo(width);
            }];
        }
    }];
    
    if(item.backgroundColor) {
        self.contentView.backgroundColor = item.backgroundColor;
    }
}


- (UIButton *)createSmallImageButtonWithItem:(TDFSmallSequenceImageItem *)item {
    UIButton *coverButton = [[UIButton alloc] init];
    coverButton.contentMode = UIViewContentModeScaleAspectFill;
    coverButton.layer.masksToBounds = YES;
    coverButton.layer.cornerRadius = 3;
    [[coverButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        !self.modelItem.smallImageClickCallBack?:self.modelItem.smallImageClickCallBack(x.tag - 1000);
    }];
    
    if(item.smallImagePath) {
        [coverButton sd_setBackgroundImageWithURL:[NSURL URLWithString:item.smallImagePath] forState:UIControlStateNormal];
    }
    
    if(item.smallImage) {
        [coverButton setBackgroundImage:item.smallImage forState:UIControlStateNormal];
    }

    UIView *alphaView = [[UIView alloc] init];
    alphaView.userInteractionEnabled = NO;
    alphaView.alpha = item.coverAlpha;
    alphaView.backgroundColor = item.coverColor;
    [coverButton addSubview:alphaView];
    [alphaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(coverButton);
    }];
    
    UIImageView *rightIcon= [[UIImageView alloc] init];
    rightIcon.userInteractionEnabled = NO;
    rightIcon.image = [UIImage imageNamed:@"icon_white_right" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    [coverButton addSubview:rightIcon];
    [rightIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(coverButton.mas_centerY);
        make.right.equalTo(coverButton.mas_right).with.offset(-10);
        make.size.mas_equalTo(rightIcon.image.size);
    }];
    
    UILabel *leftLabel = [[UILabel alloc] init];
    leftLabel.font = [UIFont systemFontOfSize:11];
    leftLabel.numberOfLines = 0;
    leftLabel.textColor = item.titleColor;
    leftLabel.userInteractionEnabled = NO;
    leftLabel.text = item.title;
    [coverButton addSubview:leftLabel];
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(coverButton.mas_top);
        make.left.equalTo(coverButton.mas_left).with.offset(10);
        make.bottom.equalTo(coverButton.mas_bottom);
        make.right.equalTo(rightIcon.mas_left).with.offset(-2.5);
    }];

    return coverButton;
}

@end
