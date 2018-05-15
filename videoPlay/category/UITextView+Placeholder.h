//
//  UITextView+Placeholder.h
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/4.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Placeholder)
@property (nonatomic, readonly) UILabel *placeholderLabel;

@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;
@property (nonatomic, strong) UIColor *placeholderColor;

+ (UIColor *)defaultPlaceholderColor;

@end
