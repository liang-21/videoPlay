//
//  TDFNewLineReasonItem.h
//  Pods
//
//  Created by wuwangwo on 2017/8/8.
//
//

#import "TDFBaseEditItem.h"

@interface TDFNewLineReasonItem : TDFBaseEditItem

@property (nonatomic, copy) void (^deleteBlock)();

@property (nonatomic, strong) NSString *redReasonID;

@property (nonatomic, assign) NSInteger reasonItemHeight;

@end
