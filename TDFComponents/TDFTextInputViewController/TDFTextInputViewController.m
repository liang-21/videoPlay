//
//  TDFTextInputViewController.m
//  TDFKouBeiGoodsModule_Example
//
//  Created by 梁世伟 on 2017/12/18.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import "TDFTextInputViewController.h"

#import <TDFBatchOperation/TDFBatchOperation.h>
#import <Masonry/Masonry.h>
#import "UIViewController+TableViewManager.h"
#import <TDFStyleKit/UIColor+tdf_standard.h>
#import "UIViewController+AlertMessage.h"
#import "UITextView+Placeholder.h"



@interface TDFTextInputViewController ()<UITextViewDelegate,TDFNavigationClickListenerProtocol>
@property (strong,nonatomic) UIView *topBackgroundView;
@property (strong,nonatomic) UITextView *textView;
@property (strong,nonatomic) UIButton *deleteButton;
@property (strong,nonatomic) UILabel *numberOfAllLabel;
@property (strong,nonatomic) UILabel *numberOfTypingLabel;


@end

@implementation TDFTextInputViewController

- (instancetype)init {
    if(self = [super init]) {
        self.NavigationStyle = TDFTextInputNavigationStyleCancel;
    }
    return self;
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNavigationTitle];
    [self configureNavigationItem];
    [self layoutSubView];
}



#pragma mark - Config View

- (void)configNavigationTitle {
    self.navigationItem.title = self.navTitle;
}

- (void)configureNavigationItem {
    [self tdf_setupNavigationBarType:TDFNavigationBarTypeNormal];
    if (self.NavigationStyle == TDFTextInputNavigationStyleCancel) {
        [self tdf_setupBackItemType:TDFBackItemTypeCancel];
    }
    else{
        [self tdf_setupBackItemType:TDFBackItemTypeNone];
    }
}

- (void) setupSubView {
    [self.view addSubview:self.topBackgroundView];
    [self.topBackgroundView addSubview:self.textView];
    if (!self.isHideNumberLable) {
        [self.topBackgroundView addSubview:self.numberOfAllLabel];
        [self.topBackgroundView addSubview:self.numberOfTypingLabel];
    }
    if (self.isShowButton) {
        [self.view addSubview:self.deleteButton];
    }
}

- (void) layoutSubView {
    [self setupSubView];
    [self.topBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.height.equalTo(@190);
        make.top.equalTo(self.view).offset(36);
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.topBackgroundView).with.insets(UIEdgeInsetsMake(15, 15, 15, 15));
    }];
    
    
    if (self.isShowButton) {
        [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.view);
            make.height.equalTo(@44);
            make.top.equalTo(self.topBackgroundView.mas_bottom).offset(36);
        }];
    }
    
    if (!self.isHideNumberLable) {
        [self.numberOfAllLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.topBackgroundView.mas_right).offset(-27);
            make.bottom.equalTo(self.topBackgroundView.mas_bottom).offset(-25);
            make.size.mas_equalTo(CGSizeMake(32, 14));
            //        make.width.equalTo(@26);
        }];
        
        [self.numberOfTypingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@30);
            make.height.equalTo(@14);
            make.right.equalTo(self.numberOfAllLabel.mas_left).offset(0);
            make.centerY.equalTo(self.numberOfAllLabel);
            
        }];
    }
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    _numberOfTypingLabel.text = [NSString stringWithFormat:@"%lu",self.textView.text.length];
    if (![self.textView.text isEqualToString:self.savedContent]){
        [self tdf_setupSureItemType:TDFSureItemTypeSaved];
    }
    else{
        [self tdf_setupSureItemType:TDFSureItemTypeNone];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    if (self.limitation) {
        NSString *comcatstr = [textView.text stringByReplacingCharactersInRange:range withString:text];
        NSInteger caninputlen;
        
        caninputlen = _limitation - comcatstr.length;
        
        
        //    NSInteger caninputlen = 100 - comcatstr.length;
        
        if (caninputlen >= 0)
        {
            return YES;
        }
        else
        {
            NSInteger len = text.length + caninputlen;
            //防止当text.length + caninputlen < 0时，使得rg.length为一个非法最大正数出错
            NSRange rg = {0,MAX(len,0)};
            
            if (rg.length > 0)
            {
                NSString *s = [text substringWithRange:rg];
                
                [textView setText:[textView.text stringByReplacingCharactersInRange:range withString:s]];
            }
            return NO;
        }
    }
    else
        return YES;
}
#pragma mark - UIResponder
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textView resignFirstResponder];
}
#pragma mark - TDFNavigationClickListenerProtocol
- (void)viewControllerDidTriggerRightClick:(UIViewController *)viewController {
    
    [self saveButtonTapped];
}

- (void)viewControllerDidTriggerLeftClick:(UIViewController *)viewController{
    [self cancelButtonTapped];
}


#pragma mark Action
- (void)saveButtonTapped {
    !self.saveContentBlock ?: self.saveContentBlock(self.textView.text);
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)cancelButtonTapped {
    if (![self.textView.text isEqualToString:self.savedContent]) {
        [self showAlertWithTitle:@"提示"
                         message:[NSString stringWithFormat:@"尚未保存%@,确定要退出吗",self.navTitle]
                    confirmTitle:@"确定"
                     cancelTitle:@"取消"
                         confirm:^{
                             [self.navigationController popViewControllerAnimated:YES];
                         }
                          cancel:nil];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)removeButtonTapped {
    [self showAlertWithTitle:@"提示"
                     message:[NSString stringWithFormat:@"确定要%@该条%@",self.buttonTitle,self.navTitle]
                confirmTitle:@"确认"
                 cancelTitle:@"取消"
                     confirm:^{
                         !self.buttonClickBlock ?: self.buttonClickBlock();
                         [self.navigationController popViewControllerAnimated:YES];
                     }
                      cancel:nil];
}


#pragma mark - Accessor
- (UIView *)topBackgroundView {
    if (!_topBackgroundView) {
        _topBackgroundView = [[UIView alloc] init];
        _topBackgroundView.backgroundColor = [UIColor whiteColor];
        
    }
    return _topBackgroundView;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.backgroundColor = [[UIColor tdf_hex_CCCCCC]colorWithAlphaComponent:0.1];
        _textView.delegate = self;
        _textView.scrollEnabled = YES;
        _textView.contentInset = UIEdgeInsetsMake(0, 0, 24, 0);
        _textView.returnKeyType = UIReturnKeyDefault;
        _textView.font = [UIFont systemFontOfSize:15];
        _textView.textColor = [UIColor blackColor];
        _textView.text = self.savedContent;
        
        _textView.placeholderColor = [UIColor lightGrayColor];
        _textView.placeholderLabel.font = [UIFont systemFontOfSize:15];
        _textView.placeholder = self.placeHolderContent;
        
        
    }
    return _textView;
}

- (UIButton *)deleteButton {
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc] init];
        _deleteButton.backgroundColor = [UIColor whiteColor];
        //        [_deleteButton setTitle:NSLocalizedString(@"删除", nil) forState:UIControlStateNormal];
        
        [_deleteButton setTitle:self.buttonTitle forState:UIControlStateNormal];
        [_deleteButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _deleteButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _deleteButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _deleteButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _deleteButton.layer.borderWidth = 0.5;
        _deleteButton.layer.borderColor = [[UIColor tdf_hex_CCCCCC]CGColor];
        [_deleteButton addTarget:self action:@selector(removeButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}


- (UILabel *)numberOfAllLabel {
    if (!_numberOfAllLabel) {
        _numberOfAllLabel = [[UILabel alloc] init];
        _numberOfAllLabel.text = [NSString stringWithFormat:@"/%zd",_limitation];
        _numberOfAllLabel.font = [UIFont systemFontOfSize:11];
        _numberOfAllLabel.textColor = [UIColor tdf_hex_CCCCCC];
        _numberOfAllLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _numberOfAllLabel;
}

- (UILabel *)numberOfTypingLabel {
    if (!_numberOfTypingLabel) {
        _numberOfTypingLabel = [[UILabel alloc] init];
        //        _NumberOfTypingWord.text = [NSString stringWithFormat:@"%@",self.typingNumber];
        _numberOfTypingLabel.text = [NSString stringWithFormat:@"%lu",self.textView.text.length];
        _numberOfTypingLabel.textColor = [UIColor tdf_hex_CCCCCC];
        _numberOfTypingLabel.font = [UIFont systemFontOfSize:11];
        _numberOfTypingLabel.textAlignment =NSTextAlignmentRight;
    }
    return _numberOfTypingLabel;
}

- (NSString *)savedContent {
    if (!_savedContent) {
        _savedContent = [[NSString alloc] init];
        
    }
    return _savedContent;
}

@end

