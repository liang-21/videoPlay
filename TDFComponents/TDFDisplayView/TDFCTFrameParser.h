//
//  TDFCTFrameParser.h
//  TDFHyperLinkLabel
//
//  Created by 黄河 on 2017/6/1.
//  Copyright © 2017年 LearnLibrary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TDFCTFrameParserConfig.h"
#import "TDFCoreTextData.h"

@interface TDFCTFrameParser : NSObject

+ (TDFCoreTextData *)parseContent:(NSString *)content
                           config:(TDFCTFrameParserConfig *)config;


+ (TDFCoreTextData *)parseAttributeString:(NSAttributedString *)attributeString
                                   config:(TDFCTFrameParserConfig *)config;


@end
