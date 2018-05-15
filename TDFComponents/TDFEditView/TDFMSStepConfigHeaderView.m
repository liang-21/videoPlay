//
//  TDFMSStepConfigHeaderView.m
//  AssemblyComponent_Example
//
//  Created by 黄河 on 2017/12/5.
//  Copyright © 2017年 infiniteQin. All rights reserved.
//

#import "TDFMSStepConfigHeaderView.h"
#import "UIColor+tdf_standard.h"
#import "Masonry.h"

@interface TDFMSStepConfigHeaderView ()
{
    dispatch_semaphore_t _signal;
    CGFloat _distance;
    CGFloat _radius;
    CGFloat _top;
    CGFloat _textSpacing;
}
@property (nonatomic, strong)CAShapeLayer *lineLayer;
@end

@implementation TDFMSStepConfigHeaderView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self.layer addSublayer:self.lineLayer];
        _signal = dispatch_semaphore_create(0);
        _textSpacing = 10;
        _radius = 5;
        _top = 20;
        
    }
    return self;
}

- (void)configViewWithItem:(TDFMSStepConfigHeaderItem *)headerItem {
    self.dataArray = headerItem.dataArray;
    self.step = headerItem.step;
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self setNeedsLayout];
}

- (void)setStep:(int)step {
    _step = step;
    dispatch_semaphore_signal(_signal);
}

- (void)updateView {
    dispatch_async(dispatch_get_main_queue(), ^{
        for (int i = 0; i < self.dataArray.count; i ++) {
            TDFMSStepConfigData *data = self.dataArray[i];
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont systemFontOfSize:15];
            [self addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.mas_left).offset(_distance + _distance *2 *i);
                make.top.equalTo(@(_top + _textSpacing));
                make.width.lessThanOrEqualTo(@(_distance * 2));
            }];
            label.text = data.title;
        }
    });
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.dataArray.count == 0) return;
    _distance = (float)self.bounds.size.width / (self.dataArray.count * 2);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_wait(_signal, DISPATCH_TIME_FOREVER);
        [self drawLine];
        [self updateView];
//        dispatch_semaphore_signal(_signal);
    });
}

- (void)drawLine {
    for (int i = 0; i < self.dataArray.count; i ++) {
        TDFMSStepConfigData *data = self.dataArray[i];
        CAShapeLayer *layer = [CAShapeLayer layer];
        CAShapeLayer *linLayer = [CAShapeLayer layer];
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path addArcWithCenter:CGPointMake(_distance + _distance *2 *i, _top)
                        radius:_radius startAngle:0 endAngle:2* M_PI clockwise:YES];
        if (i != self.dataArray.count - 1 ){
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(_distance + _distance *2 *i + 5, _top)];
            [path addLineToPoint:CGPointMake(_distance + _distance *2 *(i+1) - 5, _top)];
            linLayer.path = path.CGPath;
            linLayer.strokeColor = [UIColor tdf_hex_999999].CGColor;
            [self.lineLayer addSublayer:linLayer];
        }
        layer.path = path.CGPath;
        if (data.step > self.step) {
            layer.strokeColor = [UIColor tdf_hex_999999].CGColor;
            layer.fillColor = [[UIColor whiteColor] colorWithAlphaComponent:0].CGColor;
        }else {
            layer.fillColor = [UIColor tdf_hex_0088FF].CGColor;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
           [self.lineLayer addSublayer:layer];
        });

    }
}

- (CAShapeLayer *)lineLayer {
    if (!_lineLayer) {
        _lineLayer = [CAShapeLayer layer];
    }
    return _lineLayer;
}

@end
