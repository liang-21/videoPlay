//
//  TDFCardBgImageCenterAlignCell.m
//  Pods
//
//  Created by chaiweiwei on 2017/8/3.
//
//

#import "TDFCardBgImageCenterAlignCell.h"
#import "TDFCardBgImageCenterAlignItem.h"
#import <Masonry/Masonry.h>
#import <TDFOldBaseUtil/UIColor+Hex.h>
#import "TDFCardImageAreaView.h"
#import <libextobjc/EXTScope.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "TDFBaseEditView.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "TDFShapeButton.h"

@interface TDFCardBgImageCenterAlignCell()

@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *lblTip;

@property (strong,nonatomic) TDFShapeButton *linkButton;

@property (strong,nonatomic) TDFCardBgImageCenterAlignItem *item;
@end

@implementation TDFCardBgImageCenterAlignCell

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(15);
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.width.and.height.mas_equalTo(30);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).with.offset(15);
        make.centerX.equalTo(self.contentView.mas_centerX);
    }];
    
    [self.contentView addSubview:self.lblTip];
    [self.lblTip mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(32));
        make.height.equalTo(@(12));
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.leading.equalTo(self).with.offset(11);
    }];
    
    [self addSubview:self.linkButton];
    [self.linkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right).with.offset(-8);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(120);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFCardBgImageCenterAlignItem *)item {
    
    CGFloat height = 0;
    
    if(!item.shouldShow) return height;
    
    if(item.buttomLinkTitle.length > 0) {
        height += 40;
    }else {
        height += 10;
    }
    
    if(item.cardImageItems.count <= 0) {
        return height += 80;
    }
    return item.cardImageItems.count * [UIScreen mainScreen].bounds.size.width*208.0f/320.0f + 88 + (item.cardImageItems.count-1)*10 + height;
}

- (void)configCellWithItem:(TDFCardBgImageCenterAlignItem *)item {
    
    self.item = item;
    
    self.contentView.hidden = !item.shouldShow;
    if (!item.shouldShow) return;
    
    self.titleLabel.text = item.title;
    
    self.linkButton.hidden = !(item.buttomLinkTitle.length > 0);
    
    [self.linkButton setTitle:item.buttomLinkTitle forState:UIControlStateNormal];
    
    self.iconImageView.image = [UIImage imageNamed:item.iconName];
    
    for (UIView *view in self.contentView.subviews) {
        
        if ([view isKindOfClass:[TDFCardImageAreaView class]]) {
            
            [view removeFromSuperview];
        }
    }
    
    [item.cardImageItems enumerateObjectsUsingBlock:^(TDFCardBgImageBaseItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        TDFCardImageAreaView *imageAreaView = [self viewWithTag:1000+idx];
        if(!imageAreaView){
            imageAreaView = [[TDFCardImageAreaView alloc] init];
            imageAreaView.tag = 1000+idx;
            imageAreaView.cardImageView.contentMode = item.imageContentMode;
            [self.contentView addSubview:imageAreaView];
            
            [imageAreaView setCardAddButtonActionCallBack:^{
                !item.filterBlock?:item.filterBlock(idx,TDFFilterTypeAdd);
            }];
            
            [imageAreaView setCardDelButtonActionCallBack:^{
                !item.filterBlock?:item.filterBlock(idx,TDFFilterTypeDel);
            }];
        }
        
        TDFCardImageAreaView *preImageAreaView;
        if(idx!=0){
            preImageAreaView = [self.contentView viewWithTag:1000+idx-1];
        }
        [imageAreaView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            if(preImageAreaView) {
                make.top.equalTo(preImageAreaView.mas_bottom).with.offset(10);
            }else {
                make.top.equalTo(self.titleLabel.mas_bottom).with.offset(15);
            }
            make.height.mas_equalTo([UIScreen mainScreen].bounds.size.width*208.0f/320.0f);
        }];
        imageAreaView.titleLabelForAddImage.text = obj.titleForAddImageButton;
        imageAreaView.descTitleLabel.text = obj.descTitleValue;
        
        if(obj.cardImagePath.length > 0 || obj.cardImage) {
            imageAreaView.delButton.hidden = !item.showDelButton;
            imageAreaView.centerAddImageView.hidden = YES;
            imageAreaView.cardImageView.hidden = NO;
            
            if(obj.cardImage){
                imageAreaView.cardImageView.image = obj.cardImage;
            }else if(obj.cardImagePath.length > 0) {
                [imageAreaView.cardImageView sd_setImageWithURL:[NSURL URLWithString:obj.cardImagePath]];
            }
            
            imageAreaView.leftTagLabel.text = obj.leftTagTextValue;
            imageAreaView.topTitleLabel.text = obj.topTitleValue;
            imageAreaView.bottomTitleLabel.text = obj.bottomTitleValue;
            
            if(item.editStyle == TDFEditStyleUnEditable) {
                imageAreaView.cardAddButton.hidden = YES;
                imageAreaView.delButton.hidden = YES;
            }else {
                imageAreaView.cardAddButton.hidden = NO;
            }
            
        }else {
            imageAreaView.centerAddImageView.hidden = NO;
            imageAreaView.cardImageView.hidden = YES;
            imageAreaView.delButton.hidden = YES;
            
            if(item.editStyle == TDFEditStyleUnEditable) {
                imageAreaView.cardAddButton.hidden = YES;
                imageAreaView.defalutAddIcon.hidden = YES;
                imageAreaView.titleLabelForAddImage.text = @"图片未上传";
                
                [imageAreaView.titleLabelForAddImage mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerY.equalTo(imageAreaView.centerAddImageView.mas_centerY);
                }];
            }else {
                imageAreaView.cardAddButton.hidden = NO;
                imageAreaView.defalutAddIcon.hidden = NO;
                [imageAreaView.titleLabelForAddImage mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerY.equalTo(imageAreaView.centerAddImageView.mas_centerY).with.offset(35);
                }];
            }
        }
    }];
    
    if(item.editStyle == TDFEditStyleEditable) {
        [self checkShouldShowTipWithModel:item];
    }
}

- (void)checkShouldShowTipWithModel:(TDFCardBgImageCenterAlignItem *)model {
    __block BOOL isShowTip = NO;
    [model.cardImageItems enumerateObjectsUsingBlock:^(TDFCardBgImageBaseItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
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
    
    model.isShowTip = isShowTip;
    self.lblTip.hidden = !isShowTip;
}


- (UIImageView *)iconImageView {
    if(!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _titleLabel;
}

- (UILabel *)lblTip
{
    if (!_lblTip) {
        _lblTip = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblTip.layer.backgroundColor = [UIColor colorWithRed:204/255.0 green:0/255.0 blue:0/255.0 alpha:1].CGColor;
        _lblTip.textColor = [UIColor whiteColor];
        _lblTip.font = [UIFont systemFontOfSize:10];
        _lblTip.text = @"未保存";
        _lblTip.layer.cornerRadius = 2;
        _lblTip.hidden = YES;
        [RACObserve(_lblTip, hidden) subscribeNext:^(id  _Nullable hidden) {
            [[NSNotificationCenter defaultCenter] postNotificationName:kTDFEditViewIsShowTipNotification object:hidden];
        }];
    }
    
    return _lblTip;
}

- (TDFShapeButton *)linkButton {
    if(!_linkButton) {
        _linkButton = [[TDFShapeButton alloc] init];
        [_linkButton setTitleColor:[UIColor colorWithHexString:@"#0088CC"] forState:UIControlStateNormal];
        _linkButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _linkButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _linkButton.space = 5;
        _linkButton.hidden = YES;
        [_linkButton setImage:[UIImage imageNamed:@"display_view_header_blue_arrow" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        _linkButton.shapeType = TDFButtonShapeTypeHorizontal;
        @weakify(self);
        [[_linkButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            !self.item.linkButtonCallBack?:self.item.linkButtonCallBack();
        }];
    }
    return _linkButton;
}

@end
