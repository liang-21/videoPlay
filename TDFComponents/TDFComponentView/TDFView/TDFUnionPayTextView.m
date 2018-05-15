//
//  TDFUnionPayTextView.m
//  Pods
//
//  Created by chaiweiwei on 2017/8/2.
//
//

#import "TDFUnionPayTextView.h"
#import <Masonry/Masonry.h>
#import <TDFOldBaseUtil/UIColor+Hex.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <TDFShapeButton.h>

@interface TDFUnionPayTextView()<UITextFieldDelegate>

@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UIView *textFieldView;
@property (nonatomic,strong) UILabel *textTitleLabel;
@property (nonatomic,strong) UITextField *textField;

@property (nonatomic,strong) UIButton *makeTrueButton;
@property (strong,nonatomic) TDFShapeButton *linkButton;

@end

@implementation TDFUnionPayTextView

+ (instancetype)configWithModel:(TDFUnionPayTextItem *)item {
    TDFUnionPayTextView *view = [[TDFUnionPayTextView alloc] init];
    view.unionPaymodel = item;
    
    CGFloat height = 60;
    CGSize size = [item.title boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
    height += size.height;
    height += 64 + 40 + 1;
    if(item.buttomLinkTitle.length > 0) {
        height += 43;
    }else {
        height += 10;
    }
    
    view.frame = CGRectMake(0, 0, 0, height);
    return view;
}

+(CGFloat)heightWithModel:(TDFUnionPayTextItem *)item {
    TDFUnionPayTextView *view = [TDFUnionPayTextView configWithModel:item];
    return CGRectGetHeight(view.frame);
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (instancetype)init {
    if(self = [super init]) {
        [self addSubview:self.iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_equalTo(30);
            make.top.equalTo(self.mas_top).with.offset(15);
            make.centerX.equalTo(self.mas_centerX);
        }];
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImageView.mas_bottom).with.offset(15);
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
        }];
        
        [self addSubview:self.textFieldView];
        
        [self addSubview:self.makeTrueButton];
        [self.makeTrueButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.textFieldView.mas_bottom).with.offset(15);
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.height.mas_equalTo(40);
        }];
        
        [self addSubview:self.linkButton];
        [self.linkButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.height.mas_equalTo(43);
            make.width.mas_equalTo(100);
        }];
        
    }
    return self;
}

- (void)setUnionPaymodel:(TDFUnionPayTextItem *)unionPaymodel {
    _unionPaymodel = unionPaymodel;
    
    self.iconImageView.image = [UIImage imageNamed:unionPaymodel.iconName];
    self.titleLabel.text = unionPaymodel.title;
    [self.linkButton setTitle:unionPaymodel.buttomLinkTitle forState:UIControlStateNormal];
    
    self.textTitleLabel.text = unionPaymodel.textFieldTitle;
    CGFloat width = 90;
    CGSize size = [unionPaymodel.textFieldTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
    width += size.width;
    size = [@"元" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
    width += size.width;
    if(width > [UIScreen mainScreen].bounds.size.width) {
        width = [UIScreen mainScreen].bounds.size.width;
    }
    [self.textFieldView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(34);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(15);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(width);
    }];
    
    self.linkButton.hidden = unionPaymodel.buttomLinkTitle.lastPathComponent > 0 ? NO:YES;
}

#pragma mark - Set Get

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
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UIView *)textFieldView {
    if(!_textFieldView) {
        _textFieldView = [[UIView alloc] init];
        [_textFieldView addSubview:self.textTitleLabel];
        [self.textTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_textFieldView.mas_left);
            make.centerY.equalTo(_textFieldView.mas_centerY);
        }];
        [_textFieldView addSubview:self.textField];
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.textTitleLabel.mas_right);
            make.top.equalTo(_textFieldView.mas_top);
            make.bottom.equalTo(_textFieldView.mas_bottom);
            make.width.mas_equalTo(90);
        }];
        
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor colorWithHexString:@"#333333"];
        label.text = @"元";
        
        [_textFieldView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.textField.mas_right);
            make.centerY.equalTo(_textFieldView.mas_centerY);
        }];
    }
    return _textFieldView;
}

- (UILabel *)textTitleLabel {
    if(!_textTitleLabel) {
        _textTitleLabel = [[UILabel alloc] init];
        _textTitleLabel.font = [UIFont systemFontOfSize:13];
        _textTitleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _textTitleLabel;
}

- (UITextField *)textField {
    if(!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.placeholder = @"输入金额";
        _textField.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.font = [UIFont systemFontOfSize:13];
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        _textField.delegate = self;
    }
    return _textField;
}

- (UIButton *)makeTrueButton {
    if(!_makeTrueButton) {
        _makeTrueButton = [[UIButton alloc] init];
        _makeTrueButton.backgroundColor = [UIColor colorWithHexString:@"#CC0000"];
        [_makeTrueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _makeTrueButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _makeTrueButton.layer.masksToBounds = YES;
        _makeTrueButton.layer.cornerRadius = 3;
        [_makeTrueButton setTitle:@"确定" forState:UIControlStateNormal];
        @weakify(self);
        [[_makeTrueButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            !self.unionPaymodel.okButtoncallBack?:self.unionPaymodel.okButtoncallBack(self.textField.text);
        }];
    }
    return _makeTrueButton;
}

- (TDFShapeButton *)linkButton {
    if(!_linkButton) {
        _linkButton = [[TDFShapeButton alloc] init];
        [_linkButton setTitleColor:[UIColor colorWithHexString:@"#0088CC"] forState:UIControlStateNormal];
        _linkButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_linkButton setImage:[UIImage imageNamed:@"display_view_header_blue_arrow" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        _linkButton.shapeType = TDFButtonShapeTypeHorizontal;
        _linkButton.space = 5;
        _linkButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        @weakify(self);
        [[_linkButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            !self.unionPaymodel.linkButtoncallBack?:self.unionPaymodel.linkButtoncallBack();
        }];
    }
    return _linkButton;
}


@end
