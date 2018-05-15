//
//  TDFReasonItem.h
//  Pods
//
//  Created by Arlen on 2017/6/17.
//
//

#import "TDFBaseEditItem.h"

@interface TDFReasonItem : TDFBaseEditItem

@property (nonatomic, copy) void (^deleteBlock)();

@property (nonatomic, strong) NSString *redReasonID;

@end
