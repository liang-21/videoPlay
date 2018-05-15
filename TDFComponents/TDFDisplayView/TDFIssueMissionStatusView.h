//
//  TDFIssueMissionStatusView.h
//  Pods
//
//  Created by chaiweiwei on 2017/5/5.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,TDFIssueMissionStatusType) {
    TDFIssueMissionStatusTypeWaiting,
    TDFIssueMissionStatusTypeSuccess,
    TDFIssueMissionStatusTypeFail,
    TDFIssueMissionStatusTypeProcess,
};

@interface TDFIssueMissionStatusView : UIView

+ (instancetype)statusViewWithType:(TDFIssueMissionStatusType)type title:(NSString *)title subtitle:(NSString *)subtitle;

@end
