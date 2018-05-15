//
//  TDFSearchBar.m
//  Pods
//
//  Created by happyo on 2016/12/6.
//
//

#import "TDFSearchBarNew.h"
#import "Masonry.h"

@interface TDFSearchBarNew () <UITextFieldDelegate>

@property (nonatomic, strong) UIView *backgroudView;

@property (nonatomic, strong) UIImageView *igvIcon;

@property (nonatomic, strong) UITextField *txfSearch;

@property (nonatomic, strong) UIButton *btnCancel;

@end
@implementation TDFSearchBarNew

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        //
        self.placeholder = @"输入名称";
        self.rightButtonTitle = @"取消";
        
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.2];
        [self addSubview:self.backgroudView];
        [self.backgroudView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(5);
            make.leading.equalTo(self).with.offset(10);
            make.bottom.equalTo(self).with.offset(-5);
            make.trailing.equalTo(self).with.offset(-50);
        }];
        
        [self.backgroudView addSubview:self.igvIcon];
        [self.igvIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.backgroudView).with.offset(10);
            make.centerY.equalTo(self.backgroudView);
            make.width.equalTo(@(20));
            make.height.equalTo(@(20));
        }];
        
        [self.backgroudView addSubview:self.txfSearch];
        [self.txfSearch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.backgroudView).with.offset(45);
            make.top.equalTo(self.backgroudView);
            make.bottom.equalTo(self.backgroudView);
            make.trailing.equalTo(self.backgroudView);
        }];
        
        [self addSubview:self.btnCancel];
        [self.btnCancel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.height.equalTo(@(40));
            make.leading.equalTo(self.backgroudView.mas_trailing);
            make.trailing.equalTo(self);
        }];
    }
    
    return self;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    NSAttributedString *attributePlaceholder = [[NSAttributedString alloc] initWithString:_placeholder attributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:216.0/255 green:216.0/255 blue:216.0/255 alpha:0.3]}];
    self.txfSearch.attributedPlaceholder = attributePlaceholder;
}

- (void)setRightButtonTitle:(NSString *)rightButtonTitle
{
    _rightButtonTitle = rightButtonTitle;
    [self.btnCancel setTitle:rightButtonTitle forState:UIControlStateNormal];
}

#pragma mark -- Actions --

- (void)btnClearClicked
{
    if (self.delegate) {
        [self.delegate searchBarCancelButtonClicked:self];
    }
}

#pragma mark -- UITextFieldDelegate --

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.delegate) {
        [self.delegate searchBarSearchButtonClicked:self];
    }
    
    return YES;
}

#pragma mark -- Getters && Setters --

- (NSString *)text
{
    return self.txfSearch.text;
}

- (void)setText:(NSString *)text
{
    self.txfSearch.text = text;
}

- (UIView *)backgroudView
{
    if (!_backgroudView) {
        _backgroudView = [[UIView alloc] initWithFrame:CGRectZero];
        _backgroudView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        _backgroudView.layer.cornerRadius = 5;
    }
    
    return _backgroudView;
}

- (UIImageView *)igvIcon
{
    if (!_igvIcon) {
        _igvIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
        _igvIcon.image = [UIImage imageNamed:@"search_bar_icon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    
    return _igvIcon;
}

- (UITextField *)txfSearch
{
    if (!_txfSearch) {
        _txfSearch = [[UITextField alloc] initWithFrame:CGRectZero];
        NSAttributedString *attributePlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"输入名称", nil) attributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:216.0/255 green:216.0/255 blue:216.0/255 alpha:0.3]}];
        _txfSearch.attributedPlaceholder = attributePlaceholder;
        _txfSearch.font = [UIFont systemFontOfSize:15];
        _txfSearch.textColor = [UIColor whiteColor];
        _txfSearch.clearButtonMode = UITextFieldViewModeAlways;
        _txfSearch.returnKeyType = UIReturnKeySearch;
        _txfSearch.delegate = self;
    }
    
    return _txfSearch;
}

- (UIButton *)btnCancel
{
    if (!_btnCancel) {
        _btnCancel = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnCancel setTitle:NSLocalizedString(@"取消", nil) forState:UIControlStateNormal];
        [_btnCancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btnCancel.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btnCancel addTarget:self action:@selector(btnClearClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnCancel;
}

@end
