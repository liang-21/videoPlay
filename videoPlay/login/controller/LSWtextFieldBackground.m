//
//  LSWtextFieldBackground.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/7.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "LSWtextFieldBackground.h"

@implementation LSWtextFieldBackground

- (void)drawRect:(CGRect)rect {
    // Drawing code
    //    获取绘图上下文
    CGContextRef context=UIGraphicsGetCurrentContext();
    //    设置粗细
    
    CGContextSetLineWidth(context,0.2);
    //    开始绘图
    
    CGContextBeginPath(context);
    //    移动到开始绘图的点
    CGContextMoveToPoint(context,5,50);
    //    移动到绘图的第二个点，加一条线
    
    CGContextAddLineToPoint(context,self.frame.size.width-5,50);
    //    关闭绘图
    
    CGContextClosePath(context);
    //    设置颜色
    
    [[UIColor grayColor]setStroke];
    //    绘图
    
    CGContextStrokePath(context);
    
}

@end
