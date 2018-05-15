//
//  TDFHyperLinkLabel.m
//  TDFHyperLinkLabel
//
//  Created by 黄河 on 2017/6/1.
//  Copyright © 2017年 LearnLibrary. All rights reserved.
//

#import "TDFHyperLinkLabel.h"
#import <CoreText/CoreText.h>
#import "TDFCoreTextUtil.h"
#import "TDFCoreLinkTextData.h"

static NSString *const defaultPlaceString = @"%@";

@interface TDFHyperLinkLabel ()

@property (copy, nonatomic)NSString *content;

@property (copy, nonatomic)NSString *placeHolder;

@property (copy, nonatomic)NSString *replaceString;

@end

@implementation TDFHyperLinkLabel


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (!self.data) {
        return;
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CTFrameDraw(self.data.ctFrame, context);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.data) {
      [self setNeedsDisplay];
    }
}

- (void)setData:(TDFCoreTextData *)data {
    _data = data;
    [self setNeedsDisplay];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    TDFCoreLinkTextData *linkData = [TDFCoreTextUtil touchLinkInView:self atPoint:point data:self.data];
    if (!linkData) {
        return;
    }
    if (self.clickLinkBlock) {
        self.clickLinkBlock(linkData);
    }
}

@end
