//
//  UIButton+TDFMixExtend.m
//  Pods
//
//  Created by CaydenK on 2017/9/1.
//
//

#import "UIButton+TDFMixExtend.h"
#import <objc/runtime.h>

@implementation UIButton (TDFMixExtend)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        UIButtonTDFMixExtendMethodSwizzling(class, @selector(layoutSubviews), @selector(tdfm_layoutSubviews));
        UIButtonTDFMixExtendMethodSwizzling(class, @selector(intrinsicContentSize), @selector(tdfm_intrinsicContentSize));
    });
}


void UIButtonTDFMixExtendMethodSwizzling(Class class , SEL originSelector, SEL newSelector) {
    Method originMethod = class_getInstanceMethod(class, originSelector);
    Method newMethod = class_getInstanceMethod(class, newSelector);
    
    BOOL addMethodSuccess = class_addMethod(class, originSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (addMethodSuccess) {
        class_replaceMethod(class, newSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    } else {
        method_exchangeImplementations(originMethod, newMethod);
    }
}


- (void)tdfm_layoutSubviews {
    if (self.tdfm_style == TDFButtonMixStyleNone) {
        [self tdfm_layoutSubviews];
        return;
    }
    //计算布局
    [self tdfm_layoutSubviews];
    
    //重设图片文字
//    self.titleLabel.backgroundColor = self.backgroundColor;
//    self.imageView.backgroundColor = self.backgroundColor;

    
    // 1. 得到imageView和titleLabel的size
    CGSize titleSize = self.titleLabel.intrinsicContentSize;
    CGSize imageSize = self.imageView.bounds.size;
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    // 3. 根据style和space设置imageEdgeInsets和labelEdgeInsets的值
    switch (self.tdfm_style) {
        case TDFButtonMixStyleImageBottom:
        {
            labelEdgeInsets = UIEdgeInsetsMake(0,-(imageSize.width), imageSize.height + self.tdfm_padding, 0);
            imageEdgeInsets = UIEdgeInsetsMake(titleSize.height + self.tdfm_padding, 0, 0, -(titleSize.width));
        }
            break;
        case TDFButtonMixStyleImageRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width , 0, - titleSize.width - self.tdfm_padding);
            labelEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, 0, imageSize.width + self.tdfm_padding);
        }
            break;
        case TDFButtonMixStyleImageUp:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0,0, titleSize.height + self.tdfm_padding, -(titleSize.width));
            labelEdgeInsets = UIEdgeInsetsMake(imageSize.height + self.tdfm_padding, -(imageSize.width), 0, 0);
        }
            break;
        case TDFButtonMixStyleDefault:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, - self.tdfm_padding, 0, 0);
            labelEdgeInsets = UIEdgeInsetsMake(0, self.tdfm_padding, 0, 0);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}


- (CGSize)tdfm_intrinsicContentSize
{
    CGSize size = [self tdfm_intrinsicContentSize];
    if (self.tdfm_style == TDFButtonMixStyleNone) {
        return size;
    }
    
    
    if (self.tdfm_style == TDFButtonMixStyleDefault || self.tdfm_style == TDFButtonMixStyleImageRight) {
        //左右布局
        return CGSizeMake(size.width + self.tdfm_padding, size.height);
    }
    else {
        //上下布局
        CGSize titleSize = self.titleLabel.intrinsicContentSize;
        CGSize imageSize = self.imageView.bounds.size;
        UIEdgeInsets contentInsets = self.contentEdgeInsets;
        
        CGSize contentSize = CGSizeZero;
        contentSize.width = MAX(titleSize.width, imageSize.width);
        contentSize.height = titleSize.height + imageSize.height + self.tdfm_padding;
        
        return CGSizeMake(contentSize.width + contentInsets.left + contentInsets.right, contentSize.height + contentInsets.top + contentInsets.bottom);
    }
}



#pragma mark - getter & setter

- (CGFloat)tdfm_padding {
    NSNumber *padding = objc_getAssociatedObject(self, _cmd);
    return [padding doubleValue];
}
- (void)tdfm_setPadding:(CGFloat)tdfm_padding {
    objc_setAssociatedObject(self, @selector(tdfm_padding), @(tdfm_padding), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TDFButtonMixStyle)tdfm_style {
    NSNumber *style = objc_getAssociatedObject(self, _cmd);
    return [style unsignedIntegerValue];
}

- (void)tdfm_setStyle:(TDFButtonMixStyle)tdfm_style {
    objc_setAssociatedObject(self, @selector(tdfm_style), @(tdfm_style), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
