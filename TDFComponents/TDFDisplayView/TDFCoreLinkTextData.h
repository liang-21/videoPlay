//
//  TDFCoreLinkTextData.h
//  TDFHyperLinkLabel
//
//  Created by 黄河 on 2017/6/1.
//  Copyright © 2017年 LearnLibrary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDFCoreLinkTextData : NSObject

@property (nonatomic, assign)NSRange range;

@property (nonatomic, copy)NSString *title;

@property (nonatomic, copy)NSString *detail;

@property (nonatomic, copy)NSString *type;

@end
