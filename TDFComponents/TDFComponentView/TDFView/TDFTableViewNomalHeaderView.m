//
//  TDFTableViewNomalHeader.m
//  TDFIssueCenter
//
//  Created by chaiweiwei on 2017/4/27.
//  Copyright © 2017年 chaiweiwei. All rights reserved.
//

#import "TDFTableViewNomalHeaderView.h"
#import <TDFOldBaseUtil/UIColor+Hex.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "TDFShapeButton.h"
#import <TDFOldBaseUtil/UIImage+Resize.h>
#import <Masonry/Masonry.h>
#import "TDFTableViewNomalHeaderItem.h"

@interface TDFTableViewNomalHeaderView ()

@property (nonatomic, strong) UIView *alphaView;
@property (nonatomic, strong) UILabel *contentLabelInHeaderView;
@property (nonatomic, strong) UIImageView *iconInHeaderView;
@property (nonatomic, strong) UIImageView *rightIconInHeaderView;
@property (nonatomic, strong) TDFShapeButton *titleButton;

@property (nonatomic,copy) NSString *headerStr;
@property (nonatomic,copy) NSString *iconName;

@property (strong,nonatomic) TDFShapeButton *linkButton;

@property (copy,nonatomic) void (^callBack)(void);

@end

@implementation TDFTableViewNomalHeaderView

#pragma mark - TDFTableViewCustomViewDelegate

+ (instancetype)configWithModel:(TDFTableViewNomalHeaderItem *)item {
    TDFTableViewNomalHeaderView *view;
    
    switch (item.type) {
        case TDFTableViewNomalHeaderTypeIcon:
        {
            if(item.rightIcon.length > 0) {
                view = [TDFTableViewNomalHeaderView headerWithContent:item.content icon:item.iconName rightIcon:item.rightIcon];
            }else {
                 view = [TDFTableViewNomalHeaderView headerWithContent:item.content icon:item.iconName linkButtonTitle:item.buttonTitle linkCallBack:item.callBack];
            }
        }
            break;
        case TDFTableViewNomalHeaderTypeTitleIcon:
        {
            view = [TDFTableViewNomalHeaderView headerWithTitle:item.title titleColor:item.titleColor content:item.content icon:item.iconName linkButtonTitle:item.buttonTitle linkCallBack:item.callBack];
        }
            break;
    }
    view.alphaView.alpha = item.backgroundAlpha;
    return view;
}

+ (CGFloat)heightWithModel:(TDFTableViewNomalHeaderItem *)item {
    TDFTableViewNomalHeaderView *view = [TDFTableViewNomalHeaderView configWithModel:item];
    
    return CGRectGetHeight(view.frame);
}

#pragma mark - Life Circle

+ (instancetype)headerWithContent:(NSString *)content icon:(NSString *)icon {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    CGSize fontsize = [content boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSParagraphStyleAttributeName:paragraphStyle,NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;

    TDFTableViewNomalHeaderView *header = [[TDFTableViewNomalHeaderView alloc] init];
    header.frame = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 80+fontsize.height+10 + 1);
    header.headerStr = content;
    header.iconName = icon;
    header.alphaView.alpha = 0.6;
    return header;
}

+ (instancetype)headerWithContent:(NSString *)content icon:(NSString *)icon rightIcon:(NSString *)rightIcon {
    TDFTableViewNomalHeaderView *header = [TDFTableViewNomalHeaderView headerWithContent:content icon:icon];
    header.rightIconInHeaderView.hidden = NO;
    header.rightIconInHeaderView.image = [UIImage imageNamed:rightIcon];
    return header;
}

+ (instancetype)headerWithContent:(NSString *)content icon:(NSString *)icon linkButtonTitle:(NSString *)buttonTitle linkCallBack:(void (^)(void))linkCallBack {
    TDFTableViewNomalHeaderView *header = [TDFTableViewNomalHeaderView headerWithContent:content icon:icon];
    [header.linkButton setTitle:buttonTitle forState:UIControlStateNormal];
    header.callBack = linkCallBack;
    
    CGRect frame = header.frame;
    if(buttonTitle.length > 0) {
        frame.size.height += 30;
        header.linkButton.hidden = NO;
    }
    header.frame = frame;
    
    return header;
}

+ (instancetype)headerWithTitle:(NSString *)title titleColor:(UIColor *)titleColor content:(NSString *)content icon:(NSString *)icon linkButtonTitle:(NSString *)buttonTitle linkCallBack:(void (^)(void))linkCallBack {
    TDFTableViewNomalHeaderView *header = [TDFTableViewNomalHeaderView headerWithContent:content icon:icon linkButtonTitle:buttonTitle linkCallBack:linkCallBack];
    if(title.length > 0) {
        header.iconInHeaderView.hidden = YES;
        header.titleButton.hidden = NO;
        [header.titleButton setImage:[[UIImage imageNamed:icon] transformWidth:30 height:30] forState:UIControlStateNormal];
        [header.titleButton setTitle:title forState:UIControlStateNormal];
        if(titleColor) {
            [header.titleButton setTitleColor:titleColor forState:UIControlStateNormal];
        }
    }else {
        header.iconInHeaderView.hidden = NO;
        header.titleButton.hidden = YES;
    }
    
    return header;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [super initWithCoder:aDecoder];
}

- (instancetype)init {
    if(self = [super init]) {
        self.contentView.backgroundColor =[UIColor clearColor];
        [self addSubview:self.alphaView];
        [self.alphaView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.mas_bottom).with.offset(-1);
        }];
        
        [self addSubview:self.iconInHeaderView];
        [self.iconInHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(60);
            make.top.equalTo(self.mas_top).with.offset(10);
        }];
        
        [self addSubview:self.rightIconInHeaderView];
        [self.rightIconInHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(60);
            make.top.equalTo(self.iconInHeaderView.mas_top);
        }];
        
        [self addSubview:self.titleButton];
        [self.titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.height.mas_equalTo(80);
            make.top.equalTo(self.mas_top);
        }];
        
        [self addSubview:self.contentLabelInHeaderView];
        [self.contentLabelInHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.top.equalTo(self.iconInHeaderView.mas_bottom).with.offset(10);
        }];
        
        [self addSubview:self.linkButton];
        [self.linkButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentLabelInHeaderView.mas_bottom);
            make.right.equalTo(self.mas_right).with.offset(-8);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(120);
        }];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.iconInHeaderView.image =[UIImage imageNamed:self.iconName];
    
    if(self.headerStr.length > 0) {
        self.contentLabelInHeaderView.text = self.headerStr;
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:5];
        NSMutableAttributedString *str  =[[NSMutableAttributedString alloc] initWithString:self.contentLabelInHeaderView.text];
        [str addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.contentLabelInHeaderView.text.length)];
        self.contentLabelInHeaderView.attributedText =str;
    }
}

#pragma mark - Get Set

- (UIView *)alphaView {
    if(!_alphaView) {
        UIView *view =[[UIView alloc] init];
        view.backgroundColor =[UIColor whiteColor];
        _alphaView = view;
    }
    return _alphaView;
}

- (UIImageView *)iconInHeaderView {
    if(!_iconInHeaderView) {
        _iconInHeaderView =[[UIImageView alloc] init];
        _iconInHeaderView.layer.borderColor = [[UIColor whiteColor] CGColor];
        _iconInHeaderView.layer.masksToBounds =YES;
        _iconInHeaderView.layer.cornerRadius = _iconInHeaderView.frame.size.width/2;
    }
    return _iconInHeaderView;
}

- (UIImageView *)rightIconInHeaderView {
    if(!_rightIconInHeaderView) {
        _rightIconInHeaderView =[[UIImageView alloc] init];
        _rightIconInHeaderView.layer.borderColor = [[UIColor whiteColor] CGColor];
        _rightIconInHeaderView.layer.masksToBounds = YES;
        _rightIconInHeaderView.layer.cornerRadius = _rightIconInHeaderView.frame.size.width/2;
        _rightIconInHeaderView.hidden = YES;
    }
    return _rightIconInHeaderView;
}

- (UILabel *)contentLabelInHeaderView {
    if(!_contentLabelInHeaderView) {
        _contentLabelInHeaderView =[[UILabel alloc] init];
        _contentLabelInHeaderView.backgroundColor =[UIColor clearColor];
        _contentLabelInHeaderView.textAlignment = NSTextAlignmentLeft;
        _contentLabelInHeaderView.font = [UIFont systemFontOfSize:15];
        _contentLabelInHeaderView.numberOfLines = 0;
        _contentLabelInHeaderView.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
        _contentLabelInHeaderView.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _contentLabelInHeaderView;
}

- (TDFShapeButton *)linkButton {
    if(!_linkButton) {
        _linkButton = [[TDFShapeButton alloc] init];
        [_linkButton setTitleColor:[UIColor colorWithHexString:@"#3495C8"] forState:UIControlStateNormal];
        _linkButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _linkButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _linkButton.hidden = YES;
        _linkButton.space = 5;
        [_linkButton setImage:[UIImage imageNamed:@"display_view_header_blue_arrow" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        _linkButton.shapeType = TDFButtonShapeTypeHorizontal;
        @weakify(self);
        [[_linkButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            !self.callBack?:self.callBack();
        }];
    }
    return _linkButton;
}

- (TDFShapeButton *)titleButton {
    if(!_titleButton) {
        _titleButton = [[TDFShapeButton alloc] init];
        [_titleButton setTitleColor:[UIColor colorWithHexString:@"#3495C8"] forState:UIControlStateNormal];
        _titleButton.titleLabel.font = [UIFont systemFontOfSize:17];
        _titleButton.hidden = YES;
        _titleButton.space = 8;
        _titleButton.shapeType = TDFButtonShapeTypeVertical;
    }
    return _titleButton;
}

@end
