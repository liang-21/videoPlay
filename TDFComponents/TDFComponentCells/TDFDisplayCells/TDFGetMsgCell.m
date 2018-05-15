//
//  TDFGetMsgCell.m
//  TDFLoginModule
//
//  Created by doubanjiang on 2017/5/27.
//  Copyright © 2017年 doubanjiang. All rights reserved.
//

#import "TDFGetMsgCell.h"
#import "TDFGetMsgItem.h"
#import "Masonry.h"
#import <libextobjc/EXTScope.h>

@interface TDFGetMsgCell ()<UITextFieldDelegate>

@property (nonatomic ,strong) UIImageView *icon;

@property (nonatomic ,strong) UITextField *codeField;

@property (nonatomic ,strong) UIButton *codeBtn;

@property (nonatomic ,strong) UIView *lineView;

@property (nonatomic ,strong) TDFGetMsgItem *item;

@property (nonatomic ,strong) dispatch_source_t timer;



@property (nonatomic ,strong) UILabel *titlelabel;

@end

@implementation TDFGetMsgCell


- (void)cellDidLoad {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIColor *color = [UIColor colorWithWhite:1 alpha:0.7];
    self.codeField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"验证码",nil) attributes:@{NSForegroundColorAttributeName: color}];
    
    [self configLayout];
}

- (void)configLayout {
    
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.codeField];
    [self.contentView addSubview:self.titlelabel];
    [self.contentView addSubview:self.codeBtn];
    [self.contentView addSubview:self.lineView];
    
    [self configConstrains];
}

- (void)configConstrains {

    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.height.mas_equalTo(20);
        make.left.offset(10);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [self.codeField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.icon.mas_right).with.offset(10);
        make.right.equalTo(self.codeBtn.mas_left);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(self.icon.mas_centerY);
    }];
    
    [self.titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.icon.mas_left);
        make.top.equalTo(self.icon.mas_top);
        make.bottom.equalTo(self.icon.mas_bottom);
        make.right.equalTo(self.codeField.mas_right);
    }];
    
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.icon.mas_centerY);
        make.height.mas_equalTo(30);
        make.right.offset(-10);
        make.width.mas_equalTo(120);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.offset(0);
        make.left.offset(10);
        make.right.offset(-10);
        make.height.mas_equalTo(1);
    }];
}

- (void)clickToGetMsg {
    
    
    
    if (self.codeBtn.selected) {
        
        return;
    }
    
    if (_item.fitCondition && ((!_item.fitCondition()))) {
        
        return;
    }
    
    [self.codeBtn setTitle:NSLocalizedString(@"发送中",nil) forState:UIControlStateNormal];
    
    if (!_item.msgSendType) {
        //    [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow.rootViewController.view animated:YES];
        @weakify(self);
        [_item sendMsgWithCallBack:^(NSError *error, TDFVerCodeResultModel *model) {
            @strongify(self);
            
            if (!model.status) {
                
                [self.codeBtn setTitle:NSLocalizedString(@"获取验证码",nil) forState:UIControlStateNormal];
            }
            if (_item.sendMsgCallBack && (!_item.sendMsgCallBack(error, model))) {
                
                return ;
            }
            [self sendSuccess];
        }];
    }
    else {
        if (_item.msgSendType == TDFPayInfoMsg4New) {
          @weakify(self);
            [_item sendPayInfoMsgWithCallBack:^(NSError *error, id *response) {
                @strongify(self);
                
                if (_item.sendPayInfoMsgWithCallBack && (!_item.sendPayInfoMsgWithCallBack(error,response))) {
                    [self.codeBtn setTitle:NSLocalizedString(@"获取验证码",nil) forState:UIControlStateNormal];
                    return ;
                }
                //发送成功
                [self sendSuccess];
                
            }];
        } else if (_item.msgSendType == TDFpayInfoMsg4Old) {
            @weakify(self);
            [_item sendOldPayInfoMsgWithCallBack:^(NSError *error, id *response) {
                @strongify(self);
                //如果是发送请求失败的话 背景颜色不变
                if (_item.sendOldPayInfoMsgWithCallBack && (!_item.sendOldPayInfoMsgWithCallBack(error,response))) {
                    [self.codeBtn setTitle:NSLocalizedString(@"获取验证码",nil) forState:UIControlStateNormal];
                    return ;
                }
                //发送成功
                [self sendSuccess];
            }];
            
        }
    }
}

- (void)sendSuccess {
    [self.codeField becomeFirstResponder];
    
    self.codeBtn.selected = YES;
    [self makeItUnavailable];
}

- (void)makeItUnavailable {
    
    [self.codeBtn setBackgroundColor:[UIColor lightGrayColor]];
    [self.codeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    self.timer = timer;
    
    __block NSInteger lastTime = 60;
    
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    //3.设置定时器要执行的事情
    @weakify(self);
    dispatch_source_set_event_handler(timer, ^{
        
        @strongify(self);
//        NSLog(@"---%@--",[NSThread currentThread]);
        
        [self.codeBtn setTitle:[NSString stringWithFormat:NSLocalizedString(@"(%lds)重新获取",nil),(long)lastTime] forState:UIControlStateNormal];
        
        if (lastTime == 0) {
            
            dispatch_source_cancel(_timer);
            [self makeItAvailable];
            
        }
        lastTime = lastTime - 1;
    });
    // 启动
    dispatch_resume(timer);
}

- (void)makeItAvailable {
    
    self.codeBtn.selected = false;
    //变红
    [self.codeBtn setBackgroundColor:[UIColor colorWithRed:204/255.0 green:0/255.0 blue:0/255.0 alpha:1]];
    if (_item.btnBGColor) {
        [self.codeBtn setBackgroundColor:_item.btnBGColor];
    }
    [self.codeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.codeBtn setTitle:NSLocalizedString(@"重新获取",nil) forState:UIControlStateNormal];
}

+ (CGFloat)heightForCellWithItem:(TDFGetMsgItem *)item {
    
    if (item.shouldShow) {
        return 44;
    }
    return 0;
    
}

- (void)configCellWithItem:(TDFGetMsgItem *)item {
    
    _item = item;
    
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:self.item.alpha];

    if (item.noIcon) {
        
        self.titlelabel.hidden = NO;
        self.icon.hidden = YES;
        self.codeField.hidden = YES;
        self.titlelabel.text = item.titleStr;
    }
    //在短信发送中 + item重载 ＝ 颜色变成蓝色 （临时处理）
    if (item.btnBGColor && !(self.codeBtn.backgroundColor == [UIColor lightGrayColor])) {
        self.codeBtn.backgroundColor = item.btnBGColor;
    }
    self.hidden = !item.shouldShow;

    
    if (item.noIconButShowCodeArea) {
        
        self.titlelabel.hidden = NO;
        self.icon.hidden = YES;
        
        [self.codeField mas_updateConstraints:^(MASConstraintMaker *make) {
           
            make.left.offset(10);
        }];
    }
    
    if (item.textColor) {
        
        self.codeField.textColor = item.textColor;
    }
    
    if (item.placeHolderColor) {
        
        self.codeField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"验证码",nil) attributes:@{NSForegroundColorAttributeName: item.placeHolderColor}];
    }
}

- (void)valueChanged:(UITextField *)txf
{
    self.item.msgStr = txf.text;
    
    if (self.item.filterBlock) {
     
        self.item.filterBlock(txf.text);
    }
}


#pragma mark - TextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    _item.msgStr = [textField.text stringByReplacingCharactersInRange:range withString:string];
    return YES;
}


#pragma mark - Getter

- (UIImageView *)icon {
    
    if (!_icon) {
        
        _icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_msg" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil]];
    }
    return _icon;
}

- (UITextField *)codeField {
    
    if (!_codeField) {
        
        _codeField = [UITextField new];
        
        _codeField.placeholder = NSLocalizedString(@"验证码",nil);
        
        _codeField.textColor = [UIColor whiteColor];
        
        _codeField.font = [UIFont systemFontOfSize:15];
        
        _codeField.delegate = self;
        
        _codeField.keyboardType = UIKeyboardTypeNumberPad;
        
        [_codeField addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _codeField;
}

- (UIButton *)codeBtn {
    
    if (!_codeBtn) {
        
        _codeBtn = [UIButton new];
        [_codeBtn setTitle:NSLocalizedString(@"获取验证码",nil) forState:UIControlStateNormal];
        _codeBtn.layer.cornerRadius = 5;
        _codeBtn.layer.masksToBounds = YES;
        [_codeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _codeBtn.backgroundColor = [UIColor colorWithRed:204/255.0 green:0/255.0 blue:0/255.0 alpha:1];
        _codeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_codeBtn addTarget:self action:@selector(clickToGetMsg) forControlEvents:UIControlEventTouchUpInside];
    }
    return _codeBtn;
}

- (UILabel *)titlelabel {

    if (!_titlelabel) {
        
        _titlelabel = [UILabel new];
        _titlelabel.font = [UIFont systemFontOfSize:15];
        _titlelabel.hidden = YES;
    }
    return _titlelabel;
}

- (UIView *)lineView {
    
    if (!_lineView) {
        
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor grayColor];
        _lineView.alpha = 0.2;
    }
    return _lineView;
}



@end
