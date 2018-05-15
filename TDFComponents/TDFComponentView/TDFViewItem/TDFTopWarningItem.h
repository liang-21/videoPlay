//
//  TDFTopWarningItem.h
//  Pods
//
//  Created by chaiweiwei on 2017/7/20.
//
//

#import <Foundation/Foundation.h>

@interface TDFTopWarningItem : NSObject

@property (nonatomic,assign) BOOL hasWarningIcon;
@property (nonatomic,copy) NSString *warningString;
@property (nonatomic,strong) UIColor *textColor;
@end
