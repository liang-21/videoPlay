//
//  TDFIssueInfoItem.h
//  Pods
//
//  Created by chaiweiwei on 2017/4/27.
//
//

#import "DHTTableViewItem.h"

typedef NS_ENUM(NSInteger,TDFIssueInfoType) {
    TDFIssueInfoTypeWaiting,
    TDFIssueInfoTypProcess,
    TDFIssueInfoTypeFail,
    TDFIssueInfoTypeSuccess,
    TDFIssueInfoTypCustom,
};

@interface TDFIssueInfoItem : DHTTableViewItem

@property (assign,nonatomic) TDFIssueInfoType infoType;

@property (copy,nonatomic) NSString *topIconName;

@property (copy,nonatomic) NSString *title;

@property (copy,nonatomic) NSString *content;

@end
