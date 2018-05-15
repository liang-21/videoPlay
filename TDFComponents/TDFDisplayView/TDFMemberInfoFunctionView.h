//
//  TDFMemberInfoFunctionView.h
//  TDFMemberPod
//
//  Created by 黄河 on 2017/4/24.
//  Copyright © 2017年 黄河. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TDFMemberInfoFunctionItem,TDFMemberInfoFunctionSubModel;

@interface TDFMemberInfoFunctionSubView : UIControl

@property (nonatomic, strong)TDFMemberInfoFunctionSubModel *model;

@property (nonatomic, strong)void(^filterBlock)(TDFMemberInfoFunctionSubModel *model);

@end

@interface TDFMemberInfoFunctionView : UIView
+ (instancetype)memberInfoFunctionSubView;
- (void)configWithModel:(TDFMemberInfoFunctionItem *)model;
@end
