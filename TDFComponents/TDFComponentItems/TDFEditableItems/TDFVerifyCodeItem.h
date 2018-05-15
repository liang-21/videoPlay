//
//  TDFVerifyCodeItem.h
//  Pods
//
//  Created by doubanjiang on 2018/2/22.
//

#import "DHTTableViewItem.h"

#import <TDFAPIHUDPresenter/TDFAPIHUDPresenter.h>
@interface TDFVerifyCodeItem : DHTTableViewItem

/**
 
 country_code   区号
 mobile         手机号
 is_require_register  是否需要判断注册 0否 1是
 type           0手机未注册时发送 1手机已经注册时发
 special_tag    特殊tag
 special_param  特殊处理参数
 */
@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic, copy) NSString *apiPath;
/**
 验证码(不需要传)
 */
@property (nonatomic, copy) NSString *codeStr;

/**
 cell背景的alpha值
 */
@property (nonatomic, assign) CGFloat alpha;

@property (nonatomic, strong) TDFAlertAPIHUDPresenter *presenter;

@property (nonatomic, copy) BOOL(^didTapSendbtnCallback)(void);


@end
