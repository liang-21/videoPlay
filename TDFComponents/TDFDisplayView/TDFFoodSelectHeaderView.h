//
//  TDFFoodSelectHeaderView.h
//  Pods
//
//  Created by happyo on 2016/11/30.
//
//

#import <UIKit/UIKit.h>

@interface TDFFoodSelectHeaderView : UIView

@property (nonatomic, strong) void (^selectedBlock)(BOOL isSelected);

- (instancetype)initWithTitle:(NSString *)title; // 不显示选择框

- (instancetype)initWithTitle:(NSString *)title isSelected:(BOOL)isSelected;

- (void)changeSelected:(BOOL)isSelected;

- (void)updateTitleColor:(UIColor *)color;

+ (CGFloat)heightForView;

@end
