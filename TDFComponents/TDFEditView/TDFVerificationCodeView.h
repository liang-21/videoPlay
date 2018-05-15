//
//  TDFVerificationCodeView.h
//  Pods
//
//  Created by 刘红琳 on 2017/3/6.
//
//

#import "TDFBaseEditView.h"

@interface TDFVerificationCodeView : TDFBaseEditView
@property(nonatomic, copy)void (^buttonConfirm)();
@end
