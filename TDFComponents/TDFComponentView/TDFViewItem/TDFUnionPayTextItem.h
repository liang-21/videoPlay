//
//  TDFUnionPayTextItem.h
//  Pods
//
//  Created by chaiweiwei on 2017/8/2.
//
//

#import <Foundation/Foundation.h>

@interface TDFUnionPayTextItem : NSObject

@property (nonatomic,copy) NSString *iconName;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *textFieldTitle;
@property (nonatomic,copy) NSString *buttomLinkTitle;
@property (nonatomic,copy) void (^okButtoncallBack)(NSString *text);
@property (nonatomic,copy) void (^linkButtoncallBack)(void);

@end
