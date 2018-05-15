//
//  TDFCTFrameParser.m
//  TDFHyperLinkLabel
//
//  Created by 黄河 on 2017/6/1.
//  Copyright © 2017年 LearnLibrary. All rights reserved.
//

#import "TDFCTFrameParser.h"

@implementation TDFCTFrameParser


+ (NSDictionary *)attributesWithConfig:(TDFCTFrameParserConfig *)config {
    CGFloat fontSize = config.fontSize;
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"ArialMT", fontSize, NULL);
    CGFloat lineSpace = config.lineSpace;
    const CFIndex kNumberOfSettings = 3;
    CTParagraphStyleSetting theSettings[kNumberOfSettings] = {
        {kCTParagraphStyleSpecifierLineSpacingAdjustment, sizeof(CGFloat), &lineSpace},
        {kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(CGFloat), &lineSpace},
        {kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(CGFloat), &lineSpace}
    };
    CTParagraphStyleRef theParagraphRef = CTParagraphStyleCreate(theSettings, kNumberOfSettings);
    UIColor *textColor = config.textColor;
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[(id)kCTForegroundColorAttributeName] = (id)textColor.CGColor;
    dic[(id)kCTFontAttributeName] = (__bridge id)fontRef;
    dic[(id)kCTParagraphStyleAttributeName] = (__bridge id)theParagraphRef;
    
    CFRelease(theParagraphRef);
    CFRelease(fontRef);
    return dic;
}

+ (TDFCoreTextData *)parseContent:(NSString *)content
                           config:(TDFCTFrameParserConfig *)config {
    NSDictionary *attributes = [self attributesWithConfig:config];
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:content
                                                                 attributes:attributes];
    return [self parseAttributeString:string config:config];
}

+ (TDFCoreTextData *)parseAttributeString:(NSAttributedString *)attributeString
                                   config:(TDFCTFrameParserConfig *)config {
    CTFramesetterRef frameSetterRef = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributeString);
    CGSize restrictSize = CGSizeMake(config.width, CGFLOAT_MAX);
    CGSize coretextSize = CTFramesetterSuggestFrameSizeWithConstraints(frameSetterRef, CFRangeMake(0, 0), nil, restrictSize, nil);
    CGFloat textHeight = coretextSize.height;
    CTFrameRef frameRef = [self createFrameWithFrameSetter:frameSetterRef
                                                    config:config
                                                    height:textHeight];
    TDFCoreTextData *data = [[TDFCoreTextData alloc] init];
    data.ctFrame = frameRef;
    data.height = textHeight;
    
    CFRelease(frameRef);
    CFRelease(frameSetterRef);
    return data;
}

+ (CTFrameRef)createFrameWithFrameSetter:(CTFramesetterRef)frameSetterRef
                                  config:(TDFCTFrameParserConfig *)config
                                  height:(CGFloat)height {
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0,config.width, height));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetterRef, CFRangeMake(0, 0), path, NULL);
    CFRelease(path);
    return frame;
    
}

@end
