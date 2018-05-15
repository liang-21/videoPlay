//
//  TDFVerifyCodeCell.m
//  Pods
//
//  Created by doubanjiang on 2018/2/22.
//

#import "TDFVerifyCodeCell.h"
#import "TDFVerifyCodeItem.h"
#import <TDFOldBaseUtil/ColorHelper.h>
#import <TDFStyleKit/UIColor+tdf_standard.h>
#import <TDFStyleKit/UIFont+tdf_standard.h>
#import <TDFNetworking/TDFNetworking.h>
#import <TDFAPIKit/TDFGeneralAPI.h>
#import <Mantle/EXTScope.h>
#import <Masonry/Masonry.h>

@interface TDFVerifyCodeCell ()

@property (nonatomic ,strong) UITextField *codeField;
@property (nonatomic ,strong) UIButton *codeBtn;
@property (nonatomic ,strong) UILabel *titlelabel;
@property (nonatomic ,strong) dispatch_source_t timer;
@property (nonatomic, strong) TDFVerifyCodeItem *item;
@property (nonatomic ,strong) TDFRequestModel *reqModel;
@property (nonatomic ,strong) TDFGeneralAPI *api;

@end

@implementation TDFVerifyCodeCell



- (void)cellDidLoad {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
    [self configLayout];
}

- (void)configCellWithItem:(TDFVerifyCodeItem *)item {
    _item = item;
    self.api.presenter = item.presenter;
    self.backgroundColor = item.alpha?[[UIColor whiteColor] colorWithAlphaComponent:item.alpha]:[UIColor whiteColor];
}

+ (CGFloat)heightForCellWithItem:(TDFVerifyCodeItem *)item {
    return 44.0f;
}

- (void)valueChanged:(UITextField *)txf
{
    self.item.codeStr = txf.text;
}

- (void)configLayout {
    
    [self.contentView addSubview:self.titlelabel];
    [self.contentView addSubview:self.codeBtn];
    [self.contentView addSubview:self.codeField];
    
    [self.titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.equalTo(self.codeBtn.mas_top);
        make.bottom.equalTo(self.codeBtn.mas_bottom);
    }];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.top.offset(7);
        make.bottom.offset(-7);
        make.width.mas_equalTo(120);
    }];
    [self.codeField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.codeBtn.mas_left).offset(-5);
        make.top.equalTo(self.codeBtn.mas_top);
        make.bottom.equalTo(self.codeBtn.mas_bottom);
        make.left.equalTo(self.titlelabel.mas_right);
    }];
}

- (void)clickToGetMsg:(UIButton *)sender {
    
    if (!self.item||(!self.item.didTapSendbtnCallback)||(!self.item.didTapSendbtnCallback())) return;
    
    self.reqModel.parameters = self.item.params;
    self.reqModel.serviceName = self.item.apiPath;
    @weakify(self);
    [self.api setApiSuccessHandler:^(__kindof TDFBaseAPI *api, id response) {
        @strongify(self);
        [self sendMsgSuccess];
    }];
    [self.api start];
}

- (void)sendMsgSuccess {

    [self.codeField becomeFirstResponder];
    self.codeBtn.enabled = false;
    [self.codeBtn setBackgroundColor:[UIColor lightGrayColor]];
    
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    __block NSInteger lastTime = 60;
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    @weakify(self);
    dispatch_source_set_event_handler(self.timer, ^{
        
        @strongify(self);
        [self.codeBtn setTitle:[NSString stringWithFormat:NSLocalizedString(@"(%lds)重新获取",nil),(long)lastTime] forState:UIControlStateNormal];
        
        if (lastTime == 0) {
            
            dispatch_source_cancel(_timer);
            self.codeBtn.enabled = true;
            [self.codeBtn setBackgroundColor:[UIColor tdf_hex_0088FF]];
            [self.codeBtn setTitle:NSLocalizedString(@"获取验证码",nil) forState:UIControlStateNormal];
            
        }
        lastTime = lastTime - 1;
    });
    dispatch_resume(self.timer);
}

#pragma mark - Getter
- (TDFGeneralAPI *)api {
    if (!_api) {
        _api = [[TDFGeneralAPI alloc]init];
        _api.requestModel = self.reqModel;
    }
    return _api;
}

- (TDFRequestModel *)reqModel {
    
    if (!_reqModel) {
        
        _reqModel = [[TDFRequestModel alloc]init];
        _reqModel.timeout = 8.0;
        _reqModel.requestType = TDFHTTPRequestTypePOST;
        _reqModel.signType = TDFHTTPRequestSignTypeBossAPI;
        _reqModel.serverRoot = kTDFBossAPI;
    }
    return _reqModel;
}

- (UITextField *)codeField {
    if (!_codeField) {
        _codeField = [UITextField new];
        _codeField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"请输入验证码",nil) attributes:@{NSForegroundColorAttributeName:[UIColor tdf_hex_CCCCCC]}];
        _codeField.textColor = [UIColor tdf_hex_333333];
        _codeField.font = [UIFont tdf_15];
        _codeField.textAlignment = NSTextAlignmentRight;
        [_codeField addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _codeField;
}

- (UILabel *)titlelabel {
    if (!_titlelabel) {
        _titlelabel = [UILabel new];
        _titlelabel.font = [UIFont tdf_15];
        _titlelabel.textColor = [UIColor tdf_hex_333333];
        _titlelabel.text = NSLocalizedString(@"验证码", nil);
    }
    return _titlelabel;
}

- (UIButton *)codeBtn {
    
    if (!_codeBtn) {
        _codeBtn = [UIButton new];
        [_codeBtn setTitle:NSLocalizedString(@"获取验证码",nil) forState:UIControlStateNormal];
        _codeBtn.layer.cornerRadius = 5;
        _codeBtn.layer.masksToBounds = YES;
        [_codeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _codeBtn.backgroundColor = [UIColor tdf_hex_0088FF];
        _codeBtn.titleLabel.font = [UIFont tdf_13];
        [_codeBtn addTarget:self action:@selector(clickToGetMsg:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _codeBtn;
}


@end
