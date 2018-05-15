//
//  TDFCoreTextData.m
//  TDFHyperLinkLabel
//
//  Created by 黄河 on 2017/6/1.
//  Copyright © 2017年 LearnLibrary. All rights reserved.
//

#import "TDFCoreTextData.h"

@implementation TDFCoreTextData

- (void)setCtFrame:(CTFrameRef)ctFrame {
    if (_ctFrame != ctFrame) {
        if (_ctFrame) {
            CFRelease(_ctFrame);
        }
        CFRetain(ctFrame);
        _ctFrame = ctFrame;
    }
}

- (void)dealloc {
    if (_ctFrame != nil) {
        CFRetain(_ctFrame);
        _ctFrame = nil;
    }
}

@end
