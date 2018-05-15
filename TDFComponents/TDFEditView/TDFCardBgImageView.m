//
//  TDFCardBgImageView.m
//  RestApp
//
//  Created by chaiweiwei on 2016/11/3.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import "TDFCardBgImageView.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
#import "NSString+TDF_Empty.h"
#import <libextobjc/EXTScope.h>
#import "UIColor+Hex.h"
#import "TDFBatchOperation.h"
#import "TDFCardImageAreaView.h"
#import "UIColor+tdf_standard.h"
#import "UIFont+tdf_standard.h"

@interface TDFCardBgImageView()

@property (nonatomic,strong) UILabel *textLabel;
@property (nonatomic,strong) UIImageView *igvIcon;
@property (nonatomic,strong) UIButton *previewLinkButton;
@end

@implementation TDFCardBgImageView

- (void)initView {
    [super initView];
    
    self.spliteView.hidden = YES;
    
    [self addSubview:self.igvIcon];
    [self addSubview:self.previewLinkButton];
    [self.igvIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.height.equalTo(@(21));
        make.width.equalTo(@(21));
    }];
    [self.previewLinkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.lblTitle);
        make.right.equalTo(self.mas_right).with.offset(-10);
    }];
    
    [self addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lblTitle.mas_right);
        make.right.equalTo(self.igvIcon.mas_left);
        make.height.equalTo(@(21));
        make.top.equalTo(self).with.offset(10);
    }];
}


- (UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.font = [UIFont systemFontOfSize:15];
        _textLabel.textAlignment = UIControlContentHorizontalAlignmentRight;
        _textLabel.text = NSLocalizedString(@"可不选", nil);
        _textLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    }
    
    return _textLabel;
}

- (UIImageView *)igvIcon
{
    if (!_igvIcon) {
        _igvIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_next_down.png" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil]];
    }
    
    return _igvIcon;
}


- (void)configureViewWithModel:(TDFCardBgImageItem *)model {
    
    [super configureViewWithModel:model];
    
    self.model = model;
    
    for (UIView *view in self.subviews) {
        
        if ([view isKindOfClass:[TDFCardImageAreaView class]]) {
            
            [view removeFromSuperview];
        }
    }
    
    if (self.model.showPreviewLinkButton) {
        self.previewLinkButton.hidden = NO;
        [self.previewLinkButton setTitle:self.model.previewLinkButtonTitle forState:UIControlStateNormal];
        self.model.showRightArea = NO;
    }else {
        self.previewLinkButton.hidden = YES;
    }
    
    [self.model.cardImageItems enumerateObjectsUsingBlock:^(TDFCardBgImageBaseItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        TDFCardImageAreaView *imageAreaView = [self viewWithTag:1000+idx];
        
        if(!imageAreaView){
            imageAreaView = [[TDFCardImageAreaView alloc] init];
            imageAreaView.cardImageAreaViewBgColor = model.cardImageAreaViewBgColor;
            imageAreaView.tag = 1000+idx;
            imageAreaView.cardImageView.contentMode = self.model.imageContentMode;
            [self addSubview:imageAreaView];
            
            @weakify(self);
            [imageAreaView setCardAddButtonActionCallBack:^{
                @strongify(self);
                !self.model.filterBlock?:self.model.filterBlock(idx,TDFFilterTypeAdd);
            }];
            
            [imageAreaView setCardDelButtonActionCallBack:^{
                @strongify(self);
                !self.model.filterBlock?:self.model.filterBlock(idx,TDFFilterTypeDel);
            }];
        }
        
        TDFCardImageAreaView *preImageAreaView;
        if(idx!=0){
            preImageAreaView = [self viewWithTag:1000+idx-1];
        }
        [imageAreaView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            if(preImageAreaView) {
                make.top.equalTo(preImageAreaView.mas_bottom).with.offset(10);
            }else {
                make.top.equalTo(self.lblDetail.mas_bottom);
            }
            make.height.mas_equalTo([UIScreen mainScreen].bounds.size.width*208.0f/320.0f);
        }];
        imageAreaView.titleLabelForAddImage.text = obj.titleForAddImageButton;
        if (obj.imgStrForAddImageButton) {
            imageAreaView.defalutAddIcon.image = [UIImage imageNamed:obj.imgStrForAddImageButton];

        }
        imageAreaView.descTitleLabel.text = obj.descTitleValue;
        if(self.model.hasCornerRadius) {
            imageAreaView.cardImageView.layer.cornerRadius = 10;
        }else{
            imageAreaView.cardImageView.layer.cornerRadius = YES;
        }

        if(obj.cardImagePath.length > 0 || obj.cardImage) {
            imageAreaView.delButton.hidden = !self.model.showDelButton;
            imageAreaView.centerAddImageView.hidden = YES;
            imageAreaView.cardImageView.hidden = NO;
            
            if(obj.cardImage){
                imageAreaView.cardImageView.image = obj.cardImage;
            }else if(obj.cardImagePath.length > 0) {
                [imageAreaView.cardImageView sd_setImageWithURL:[NSURL URLWithString:obj.cardImagePath]];
            }
            
            int r=255;
            int g=255;
            int b=255;
            if (self.model.fontColor.length > 0) {
                NSArray* colors=[self.model.fontColor componentsSeparatedByString:@","];
                r=((NSString*)[colors objectAtIndex:1]).intValue;
                g=((NSString*)[colors objectAtIndex:2]).intValue;
                b=((NSString*)[colors objectAtIndex:3]).intValue;
            }
            [imageAreaView.leftTagLabel setTextColor:[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]];
            [imageAreaView.topTitleLabel setTextColor:[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]];
            [imageAreaView.bottomTitleLabel setTextColor:[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]];
            
            imageAreaView.leftTagLabel.text = obj.leftTagTextValue;
            imageAreaView.topTitleLabel.text = obj.topTitleValue;
            imageAreaView.bottomTitleLabel.text = obj.bottomTitleValue;
            
            if(model.editStyle == TDFEditStyleUnEditable) {
                imageAreaView.cardAddButton.hidden = YES;
                imageAreaView.delButton.hidden = YES;
                imageAreaView.backgroundImg.hidden = YES;
            }else {
                imageAreaView.cardAddButton.hidden = NO;
            }
            
        }else {
            imageAreaView.centerAddImageView.hidden = NO;
            imageAreaView.cardImageView.hidden = YES;
            imageAreaView.delButton.hidden = YES;
            
            if(model.editStyle == TDFEditStyleUnEditable) {
                imageAreaView.cardAddButton.hidden = YES;
                imageAreaView.defalutAddIcon.hidden = YES;
                imageAreaView.backgroundImg.hidden = YES;
                imageAreaView.titleLabelForAddImage.text = NSLocalizedString(@"图片未上传", nil);
                
                [imageAreaView.titleLabelForAddImage mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerY.equalTo(imageAreaView.centerAddImageView.mas_centerY);
                }];
            }else {
                imageAreaView.cardAddButton.hidden = NO;
                imageAreaView.defalutAddIcon.hidden = NO;
                imageAreaView.backgroundImg.hidden = !obj.isShowBackgoundImg;
                [imageAreaView.titleLabelForAddImage mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerY.equalTo(imageAreaView.centerAddImageView.mas_centerY).with.offset(35);
                }];
            }
        }
        
    }];
    
    if(model.autoHidenRghtArea) {
        NSArray *temp = [self.model.cardImageItems tdf_filter:^BOOL(TDFCardBgImageBaseItem *value) {
            return (value.cardImagePath.length > 0 || value.cardImage);
        }];
        if(model.isRequired) {
            if(temp.count != 0 && temp.count == self.model.cardImageItems.count) {
                self.model.showRightArea = NO;
            }else {
                self.model.showRightArea = YES;
            }
        }else {
            if(temp.count > 0) {
                self.model.showRightArea = NO;
            }else {
                self.model.showRightArea = YES;
            }
        }
    }

    if(model.editStyle == TDFEditStyleUnEditable) {
        //不可编辑 隐藏右边“可不选与箭头” 不check未保存
        self.textLabel.hidden = self.igvIcon.hidden = YES;
    }else {
        self.textLabel.hidden = !self.model.showRightArea;
        self.igvIcon.hidden = !self.model.showRightArea;
        [self checkShouldShowTip];
        
        if(self.model.hideRightArr) {
            [self.igvIcon mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(0));
            }];
            self.igvIcon.image = nil;
        }else {
            [self.igvIcon mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(21));
            }];
            self.igvIcon.image = [UIImage imageNamed:@"ico_next_down.png" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
        }
    }
    
    if (model.isRequired) {
        self.textLabel.text = [self getPlaceholderWithModel:model];
        self.textLabel.textColor = model.placeHolderColor ? model.placeHolderColor :[UIColor colorWithHexString:@"#CC0000"];
    }else {
        self.textLabel.text =  [self getPlaceholderWithModel:model];
        self.textLabel.textColor = model.placeHolderColor ? model.placeHolderColor : [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    }
}

- (void)previewLink:(UIButton *)button {
    if (self.model.preViewLinkCallBack) {
        self.model.preViewLinkCallBack();
    }
}

- (void)checkShouldShowTip
{
    __block BOOL isShowTip = NO;
    [self.model.cardImageItems enumerateObjectsUsingBlock:^(TDFCardBgImageBaseItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *pre = (NSString *)obj.preValue;
        if((!pre.length && !obj.cardImagePath.length) || ([pre isEqualToString:obj.cardImagePath])){
            isShowTip = NO;
            self.lblTip.hidden = YES;
        }else {
            isShowTip = YES;
            self.lblTip.hidden = NO;
            *stop = YES;
        }
    }];
    
    self.model.isShowTip = isShowTip;
    self.lblTip.hidden = !isShowTip;
}

+ (CGFloat)getHeightWithModel:(TDFCardBgImageItem *)model {
    
    CGFloat detailHeight = 15;
    if ([model.detail isNotEmpty] || [model.attributedDetail.string isNotEmpty]) {
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        UILabel *lblHeight = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screenWidth - 20, 0)];
        lblHeight.font = [UIFont systemFontOfSize:11];
        lblHeight.numberOfLines = 0;
        lblHeight.text = model.detail;
        
        if ([model.attributedDetail.string isNotEmpty]) {
            lblHeight.attributedText = model.attributedDetail;
        }
        
        [lblHeight sizeToFit];
        detailHeight += lblHeight.frame.size.height;
    }
    
    if(model.cardImageItems.count <= 0) {
        return 44 + detailHeight - 15;
    }
    return model.cardImageItems.count * [UIScreen mainScreen].bounds.size.width*208.0f/320.0f + 44 + (model.cardImageItems.count-1)*10 + detailHeight;
}

- (UIButton *)previewLinkButton {
    if (!_previewLinkButton) {
        _previewLinkButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_previewLinkButton setTitle:@"asdasdasdas" forState:UIControlStateNormal];
        [_previewLinkButton setTitleColor:[UIColor tdf_hex_0088FF] forState:UIControlStateNormal];
        _previewLinkButton.titleLabel.font = [UIFont tdf_15];
        [_previewLinkButton addTarget:self action:@selector(previewLink:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _previewLinkButton;
}

@end
