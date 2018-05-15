//
//  TDFCoreTextUtil.m
//  TDFHyperLinkLabel
//
//  Created by 黄河 on 2017/6/1.
//  Copyright © 2017年 LearnLibrary. All rights reserved.
//

#import "TDFCoreTextUtil.h"

@implementation TDFCoreTextUtil

+ (TDFCoreLinkTextData *)touchLinkInView:(UIView *)view atPoint:(CGPoint)point data:(TDFCoreTextData *)data {
    CFIndex idx = [self touchContentOffsetInView:view atPoint:point data:data];
    if (idx == -1) {
        return nil;
    }
    TDFCoreLinkTextData * foundLink = [self linkAtIndex:idx linkArray:data.linkArray];
    return foundLink;
}

+ (CFIndex)touchContentOffsetInView:(UIView *)view atPoint:(CGPoint)point data:(TDFCoreTextData *)data {
    CTFrameRef frameRef = data.ctFrame;
    CFArrayRef lines = CTFrameGetLines(frameRef);
    if (!lines) {
        return -1;
    }
    CFIndex count = CFArrayGetCount(lines);
    CGPoint origins[count];
    CTFrameGetLineOrigins(frameRef, CFRangeMake(0, 0), origins);
    
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, view.bounds.size.height);
    transform = CGAffineTransformScale(transform, 1.0, -1.0);
    CFIndex idx = -1;
    for (int i = 0; i < count; i ++) {
        CGPoint linePoint = origins[i];
        CTLineRef line = CFArrayGetValueAtIndex(lines, i);
        CGRect flippedRect = [self getLineBounds:line point:linePoint];
        CGRect rect = CGRectApplyAffineTransform(flippedRect, transform);
        
        if (CGRectContainsPoint(rect, point)) {
            // 将点击的坐标转换成相对于当前行的坐标
            CGPoint relativePoint = CGPointMake(point.x-CGRectGetMinX(rect),
                                                point.y-CGRectGetMinY(rect));
            // 获得当前点击坐标对应的字符串偏移
            idx = CTLineGetStringIndexForPosition(line, relativePoint);
        }
    }
    return idx;
}

+ (CGRect)getLineBounds:(CTLineRef)line point:(CGPoint)point {
    CGFloat ascent = 0.0f;
    CGFloat descent = 0.0f;
    CGFloat leading = 0.0f;
    CGFloat width = (CGFloat)CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
    CGFloat height = ascent + descent;
    return CGRectMake(point.x, point.y - descent, width, height);
}

+ (TDFCoreLinkTextData *)linkAtIndex:(CFIndex)i linkArray:(NSArray *)linkArray {
    TDFCoreLinkTextData *link = nil;
    for (TDFCoreLinkTextData *data in linkArray) {
        if (NSLocationInRange(i, data.range)) {
            link = data;
            break;
        }
    }
    return link;
}

@end
