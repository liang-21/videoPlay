//
//  AnimationTextField.m
//  登陆界面的动画
//
//  Created by zhangjiang on 15/6/12.
//  Copyright (c) 2015年 张江. All rights reserved.
//

#import "AnimationTextField.h"
#define KDefaultColor [UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1]
#define angle2radian(angle) ((angle) / 180.0 * M_PI)
#define KLabeX 5
@interface AnimationTextField ()
{
    BOOL isNull;
    CGFloat labelH;
}
@property (strong,nonatomic)UILabel *placerLabel;

@property (strong,nonatomic)UITextField *textFiled;



@end

@implementation AnimationTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        //默认动画
        _animationType = AnimationFieldTypeUp;
        isNull = YES;
        labelH = 20;
        CGFloat textFieldH = frame.size.height - labelH;
        //占位符
        _placerLabel = [[UILabel alloc]initWithFrame:CGRectMake(KLabeX ,labelH ,frame.size.width ,textFieldH)];
        _placerLabel.textColor = KDefaultColor;
        [self addSubview:_placerLabel];
        //输入框
        _textFiled = [[UITextField alloc]initWithFrame:CGRectMake(0 ,labelH ,frame.size.width ,textFieldH )];
        _textFiled.borderStyle = UITextBorderStyleRoundedRect;
        [_textFiled addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventEditingChanged];
        _textFiled.backgroundColor = [UIColor clearColor];
        [self addSubview:_textFiled];
    }
    return self;
}
#pragma mark - 占位符颜色
-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    _placerLabel.textColor = _placeholderColor;
}

#pragma mark - 对齐方式
-(void)setTextAlignment:(NSTextAlignment)textAlignment{
    _textAlignment = textAlignment;
    _placerLabel.textAlignment = _textAlignment;
    _textFiled.textAlignment = _textAlignment;
}
#pragma mark - 占位符
-(void)setPlaceStr:(NSString *)placeStr{
    _placeStr = placeStr;
    _placerLabel.text = _placeStr;
    
}
#pragma mark - 字体
-(void)setPlacerholderFont:(UIFont *)placeholderFont{
    _placeholderFont = placeholderFont;
    _placerLabel.font = _placeholderFont;
    _textFiled.font = _placeholderFont;
}
#pragma mark - 输入框文字颜色
-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    _textFiled.textColor = _textColor;
}

-(void)setAnimationType:(AnimationFieldType)animationType{
    _animationType = animationType;
}

#pragma mark -监测textField的输入
-(void)valueChange:(UITextField*)sender{

    switch (_animationType) {
        case AnimationFieldTypeBound:
            [self animationBound];
            break;
        case AnimationFieldTypeShake:
            [self animationShake];
            break;
        case AnimationFieldTypeUp:
            [self animationUp];
            break;
        
    }
    //取出当前输入的文字
    _textInput = sender.text;
}
#pragma mark -向上的动画
-(void)animationUp{
    CGRect labelRect = self.textFiled.frame ;
    labelRect.origin.x = KLabeX;
    if (isNull) {
        isNull = NO;
        labelRect.origin.y = self.textFiled.frame.origin.y - self.textFiled.frame.size.height;
        //开始描写动画效果
        [UIView animateWithDuration:0.3  animations:^{
            self.placerLabel.frame = labelRect;
        }];
    }else if (!_textFiled.text.length){
        isNull = YES;
        labelRect.origin.y = self.textFiled.frame.origin.y;
        [UIView animateWithDuration:0.3  animations:^{
            self.placerLabel.frame = labelRect;
        }];
    }
}
#pragma mark -抖动的动画
-(void)animationShake{
    
    CGRect labelRect = self.textFiled.frame ;
    labelRect.origin.x = KLabeX;
    if (isNull) {
        isNull = NO;
        labelRect.origin.y = self.textFiled.frame.origin.y - self.textFiled.frame.size.height;
        //开始描写动画效果
        [UIView animateWithDuration:0.3  animations:^{
            self.placerLabel.frame = labelRect;
            CAKeyframeAnimation *rotation = [CAKeyframeAnimation animation];
            rotation.keyPath = @"transform.rotation";
            rotation.values = @[@(angle2radian(-5)),@(angle2radian(5)),@(angle2radian(-5))];
            [self.placerLabel.layer addAnimation:rotation forKey:nil];
        }];
    }else if (!_textFiled.text.length){
        isNull = YES;
        labelRect.origin.y = self.textFiled.frame.origin.y;
        [UIView animateWithDuration:0.3  animations:^{
            self.placerLabel.frame = labelRect;
            CAKeyframeAnimation *rotation = [CAKeyframeAnimation animation];
            rotation.keyPath = @"transform.rotation";
            rotation.values = @[@(angle2radian(5)),@(angle2radian(-5)),@(angle2radian(5))];
            [self.placerLabel.layer addAnimation:rotation forKey:nil];
        }];
    }
}

#pragma mark -弹簧的动画
-(void)animationBound{
    CGRect labelRect = self.textFiled.frame ;
    labelRect.origin.x = KLabeX;
    if (isNull) {
        isNull = NO;
        labelRect.origin.y = self.textFiled.frame.origin.y - self.textFiled.frame.size.height;
        //开始描写动画效果
        [UIView animateWithDuration:0.3 delay:0.0 usingSpringWithDamping:0.3 initialSpringVelocity:5.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.placerLabel.frame = labelRect;
        } completion:nil];
    }else if (!_textFiled.text.length){
        isNull = YES;
        labelRect.origin.y = self.textFiled.frame.origin.y;
        [UIView animateWithDuration:0.3 delay:0.0 usingSpringWithDamping:0.3 initialSpringVelocity:5.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.placerLabel.frame = labelRect;
        } completion:nil];
    }
}
@end
