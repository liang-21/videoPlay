//
//  TDFReviewStatusView.m
//  Pods
//
//  Created by chaiweiwei on 2017/7/13.
//
//

#import "TDFReviewStatusView.h"
#import "UIColor+Hex.h"
#import "Masonry.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "TDFShapeButton.h"

@interface TDFReviewStatusView()

@property (nonatomic, strong) UIView *alphaView;

@property (nonatomic,assign) TDFReviewStatusType type;

@property (nonatomic,copy) NSArray<TDFReviewButtonItem *> *buttonList;
@property (copy,nonatomic) NSString *buttomLinkTitle;

@property (strong,nonatomic) UIImageView *topImageView;
@property (strong,nonatomic) UILabel *topLabel;
@property (strong,nonatomic) UILabel *subtitleLabel;

@property (strong,nonatomic) UILabel *extendContentLabel;

@property (strong,nonatomic) UILabel *buttomtitleLabel;

@property (strong,nonatomic) UIButton *cancelButton;
@property (strong,nonatomic) UIButton *changeButton;

@property (strong,nonatomic) TDFShapeButton *linkButton;

@property (copy,nonatomic) void (^callBack)(void);

@end

@implementation TDFReviewStatusView

#pragma mark - TDFTableViewCustomViewDelegate

+ (instancetype)configWithModel:(TDFReviewStatusItem *)item {
    TDFReviewStatusView *view;
    
    if(item.buttonList.count > 0) {
        view = [TDFReviewStatusView headerWithStyle:item.type title:item.title subitle:item.subtitle buttomTitle:item.buttomtitle linkButtonTitle:item.buttomLinkTitle linkCallBack:item.callBack buttonList:item.buttonList];
    }else if(item.extendContent.length > 0) {
        view = [TDFReviewStatusView headerWithStyle:item.type title:item.title subitle:item.subtitle buttomTitle:item.buttomtitle linkButtonTitle:item.buttomLinkTitle linkCallBack:item.callBack extendContent:item.extendContent extendContentColor:item.extendContentColor];
    }else {
        view = [TDFReviewStatusView headerWithStyle:item.type title:item.title subitle:item.subtitle buttomTitle:item.buttomtitle linkButtonTitle:item.buttomLinkTitle linkCallBack:item.callBack];
    }
    
    view.alphaView.alpha = item.backgroundAlpha;
    
    return view;
}

+ (CGFloat)heightWithModel:(TDFReviewStatusItem *)item {
    TDFReviewStatusView *view = [TDFReviewStatusView configWithModel:item];
    
    return CGRectGetHeight(view.frame);
}

#pragma mark - Life Circle

+ (instancetype)headerWithStyle:(TDFReviewStatusType)type
                          title:(NSString *)title
                        subitle:(NSString *)subtitle
                    buttomTitle:(NSString *)buttomTitle {
    TDFReviewStatusView *View = [[TDFReviewStatusView alloc] init];
    View.type = type;
    View.topLabel.text = title;
    View.subtitleLabel.text = subtitle;
    View.buttomtitleLabel.text = buttomTitle;
    View.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [View calculationHeight]);
    return View;
}

+ (instancetype)headerWithStyle:(TDFReviewStatusType)type
                          title:(NSString *)title
                        subitle:(NSString *)subtitle
                    buttomTitle:(NSString *)buttomTitle
                linkButtonTitle:(NSString *)buttonTitle
                   linkCallBack:(void (^)(void))linkCallBack {
    TDFReviewStatusView *View = [TDFReviewStatusView headerWithStyle:type title:title subitle:subtitle buttomTitle:buttomTitle];
    View.buttomLinkTitle = buttonTitle;
    View.callBack = linkCallBack;
    View.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [View calculationHeight]);
    return View;
}

+ (instancetype)headerWithStyle:(TDFReviewStatusType)type
                          title:(NSString *)title
                        subitle:(NSString *)subtitle
                    buttomTitle:(NSString *)buttomTitle
                linkButtonTitle:(NSString *)buttonTitle
                   linkCallBack:(void (^)(void))linkCallBack
                     buttonList:(NSArray<TDFReviewButtonItem *> *)buttonList {
    TDFReviewStatusView *View = [TDFReviewStatusView headerWithStyle:type title:title subitle:subtitle buttomTitle:buttomTitle linkButtonTitle:buttonTitle linkCallBack:linkCallBack];
    View.buttonList = buttonList;
    View.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [View calculationHeight]);
    return View;
}

+ (instancetype)headerWithStyle:(TDFReviewStatusType)type
                          title:(NSString *)title
                        subitle:(NSString *)subtitle
                    buttomTitle:(NSString *)buttomTitle
                linkButtonTitle:(NSString *)buttonTitle
                   linkCallBack:(void (^)(void))linkCallBack
                  extendContent:(NSString *)extendContent
             extendContentColor:(UIColor *)extendContentColor {
    TDFReviewStatusView *View = [TDFReviewStatusView headerWithStyle:type title:title subitle:subtitle buttomTitle:buttomTitle linkButtonTitle:buttonTitle linkCallBack:linkCallBack];
    if(extendContent.length > 0) {
        View.extendContentLabel.hidden = NO;
        View.extendContentLabel.text = extendContent;

        if(extendContentColor) {
            View.extendContentLabel.textColor = extendContentColor;
        }
    }
    
    View.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [View calculationHeight]);
    return View;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        
        [self addSubview:self.alphaView];
        [self.alphaView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.mas_bottom).with.offset(-1);
        }];
        
        [self addSubview:self.topImageView];
        [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_offset(30);
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(self.mas_top).with.offset(15);
        }];
        
        [self addSubview:self.topLabel];
        [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topImageView.mas_bottom).with.offset(14);
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
        }];
        
        [self addSubview:self.subtitleLabel];
        [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topLabel.mas_bottom).with.offset(8);
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
        }];
        
        [self addSubview:self.extendContentLabel];
        [self.extendContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.subtitleLabel.mas_bottom).with.offset(8);
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
        }];
        
        [self addSubview:self.buttomtitleLabel];
        [self.buttomtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).with.offset(-10);
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
        }];
        
        [self addSubview:self.cancelButton];
        
        [self addSubview:self.changeButton];
        
        [self addSubview:self.linkButton];
        [self.linkButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom);
            make.right.equalTo(self.mas_right).with.offset(-8);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(120);
        }];

    }
    return self;
}

- (CGFloat)calculationHeight{
    
    CGFloat height = 15 + 30 + 15;
    CGFloat width = [UIScreen mainScreen].bounds.size.width-20;

    CGSize size = [self.topLabel.text boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} context:nil].size;
    height += size.height + 8;
    size = [self.subtitleLabel.text boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    height += size.height + 10;
    size = [self.buttomtitleLabel.text boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
    height += size.height;

    if(!self.extendContentLabel.hidden) {
        size = [self.extendContentLabel.text boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;

        height += size.height + 10;
        
        if(size.height < 20) {
            self.extendContentLabel.textAlignment = NSTextAlignmentCenter;
        }else {
            self.extendContentLabel.textAlignment = NSTextAlignmentLeft;
        }
    }
    
    if(self.buttonList.count > 0) {
        height += 50;
    }
    
    if(!self.linkButton.hidden) {
        height += 40;
    }else {
        height += 10;
    }

    return height;
}

- (void)setButtonList:(NSArray<TDFReviewButtonItem *> *)buttonList {
    _buttonList = buttonList;
    
    self.changeButton.hidden = self.cancelButton.hidden = YES;
    
    [buttonList enumerateObjectsUsingBlock:^(TDFReviewButtonItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (obj.buttonType) {
            case TDFReviewButtonTypeChange:{
                self.changeButton.hidden = NO;
                [self.changeButton setTitle:obj.buttonTitle forState:UIControlStateNormal];
                [[self.changeButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                    !obj.buttonClickCallBack?:obj.buttonClickCallBack();
                }];
                
                [self.changeButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.subtitleLabel.mas_bottom).with.offset(10);
                    make.right.equalTo(self.mas_right).with.offset(-10);
                    make.height.mas_equalTo(40);

                    if(buttonList.count > 1) {
                        make.left.equalTo(self.cancelButton.mas_right).with.offset(15);
                    }else {
                        make.left.equalTo(self.mas_left).with.offset(10);
                    }
                }];
            }
                
                break;
                
            case TDFReviewButtonTypeCancel:{
                self.cancelButton.hidden = NO;
                [self.cancelButton setTitle:obj.buttonTitle forState:UIControlStateNormal];
                [[self.cancelButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                    !obj.buttonClickCallBack?:obj.buttonClickCallBack();
                }];
                
                [self.cancelButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.subtitleLabel.mas_bottom).with.offset(10);
                    make.left.equalTo(self.mas_left).with.offset(10);
                    make.height.mas_equalTo(40);
                    
                    if(buttonList.count > 1) {
                        make.width.mas_equalTo(([UIScreen mainScreen].bounds.size.width-35)/2.0f);
                    }else {
                        make.right.equalTo(self.mas_right).with.offset(-10);
                    }
                }];
            }
                break;
        }
    }];
}

- (void)setButtomLinkTitle:(NSString *)buttomLinkTitle {
    _buttomLinkTitle = buttomLinkTitle;
    if(buttomLinkTitle.length > 0) {
        self.linkButton.hidden = NO;
        [self.linkButton setTitle:buttomLinkTitle forState:UIControlStateNormal];
        
        [self.buttomtitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).with.offset(-40);
        }];
    }
}

- (void)setType:(TDFReviewStatusType)type {
    _type = type;
    switch (_type) {
        case TDFReviewStatusTypeProcess:
        {
            self.topImageView.image = [UIImage imageNamed:@"icon_apply_wait" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
            self.topLabel.textColor = self.subtitleLabel.textColor = [UIColor colorWithHexString:@"#F58023"];
        }
            break;
        case TDFReviewStatusTypeSuccess:
        {
            self.topImageView.image = [UIImage imageNamed:@"icon_apply_pass" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
            self.topLabel.textColor = self.subtitleLabel.textColor = [UIColor colorWithHexString:@"#07AD1F"];
        }
            break;
        case TDFReviewStatusTypeFail:
        {
            self.topImageView.image = [UIImage imageNamed:@"icon_apply_fail" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
            self.topLabel.textColor = self.subtitleLabel.textColor = [UIColor colorWithHexString:@"#CC0000"];
        }
            break;
    }
}

#pragma mark - Set Get

- (UIView *)alphaView {
    if(!_alphaView) {
        UIView *view =[[UIView alloc] init];
        view.backgroundColor =[UIColor whiteColor];
        _alphaView = view;
    }
    return _alphaView;
}

- (UIImageView *)topImageView {
    if(!_topImageView) {
        _topImageView = [[UIImageView alloc] init];
    }
    return _topImageView;
}

- (UILabel *)topLabel {
    if(!_topLabel) {
        _topLabel = [[UILabel alloc] init];
        _topLabel.font = [UIFont systemFontOfSize:20];
        _topLabel.textColor = [UIColor colorWithHexString:@"#F58023"];
        _topLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _topLabel;
}

- (UILabel *)subtitleLabel {
    if(!_subtitleLabel) {
        _subtitleLabel = [[UILabel alloc] init];
        _subtitleLabel.font = [UIFont systemFontOfSize:14];
        _subtitleLabel.textColor = [UIColor colorWithHexString:@"#F58023"];
        _subtitleLabel.numberOfLines = 0;
        _subtitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _subtitleLabel;
}

- (UILabel *)extendContentLabel {
    if(!_extendContentLabel) {
        _extendContentLabel = [[UILabel alloc] init];
        _extendContentLabel.font = [UIFont systemFontOfSize:11];
        _extendContentLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        _extendContentLabel.numberOfLines = 0;
        _extendContentLabel.textAlignment = NSTextAlignmentLeft;
        _extendContentLabel.hidden = YES;
    }
    return _extendContentLabel;
}

- (UILabel *)buttomtitleLabel {
    if(!_buttomtitleLabel) {
        _buttomtitleLabel = [[UILabel alloc] init];
        _buttomtitleLabel.font = [UIFont systemFontOfSize:11];
        _buttomtitleLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        _buttomtitleLabel.numberOfLines = 0;
        _buttomtitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _buttomtitleLabel;
}

- (UIButton *)changeButton {
    if(!_changeButton) {
        UIButton *button = [[UIButton alloc] init];
        button.backgroundColor = [UIColor colorWithHexString:@"#CA0813"];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 3;
        button.hidden = YES;
        _changeButton = button;
    }
    return _changeButton;
}

- (UIButton *)cancelButton {
    if(!_cancelButton) {
        UIButton *button = [[UIButton alloc] init];
        button.backgroundColor = [UIColor clearColor];
        [button setTitleColor:[UIColor colorWithHexString:@"#CA0813"] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 3;
        button.layer.borderColor = [UIColor colorWithHexString:@"#CA0813"].CGColor;
        button.layer.borderWidth = 1;
        button.hidden = YES;
        _cancelButton = button;
    }
    return _cancelButton;
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
            !self.callBack?:self.callBack();
        }];
    }
    return _linkButton;
}

@end
