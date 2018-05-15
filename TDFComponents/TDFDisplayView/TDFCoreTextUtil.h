//
//  TDFCoreTextUtil.h
//  TDFHyperLinkLabel
//
//  Created by 黄河 on 2017/6/1.
//  Copyright © 2017年 LearnLibrary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TDFCoreLinkTextData.h"
#import "TDFCoreTextData.h"

@interface TDFCoreTextUtil : NSObject

+ (TDFCoreLinkTextData *)touchLinkInView:(UIView *)view atPoint:(CGPoint)point data:(TDFCoreTextData *)data;

+ (CFIndex)touchContentOffsetInView:(UIView *)view atPoint:(CGPoint)point data:(TDFCoreTextData *)data;

@end
