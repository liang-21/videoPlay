//
//  UITableViewCell+SeperatorLine.m
//  DHTTableViewManager
//
//  Created by tripleCC on 12/9/16.
//  Copyright © 2016 tripleCC. All rights reserved.
//
#import <objc/runtime.h>
#import <Masonry/Masonry.h>
#import "UIColor+RGB.h"
#import "DHTTableViewManager.h"
#import "UITableViewCell+SeperatorLine.h"
#import "TDFSectionItemProtocol.h"

static const CGFloat kTDFSeperatorDefaultMargin = 15.0f;
static const CGFloat kTDFSeperatorDefaultHeight = 0.5f;

@implementation UITableViewCell (SeperatorLine)
@dynamic tdf_showTopLine;
@dynamic tdf_showBottomLine;
@dynamic tdf_showBottomMargin;

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originSelector = NSSelectorFromString(@"setFrame:");
        SEL newSelector = NSSelectorFromString(@"tdf_setFrame:");
        Method originMethod = class_getInstanceMethod(class, originSelector);
        Method newMethod = class_getInstanceMethod(class, newSelector);
        
        BOOL addMethodSuccess = class_addMethod(class, originSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
        if (addMethodSuccess) {
            class_replaceMethod(class, newSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        } else {
            method_exchangeImplementations(originMethod, newMethod);
        }
    });
}
- (void)_tdf_updateBottomLineViewWithItem:(DHTTableViewItem *)item {
    if (![self tdf_bottomLineView].superview) return;
    
    [self.tdf_bottomLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(item.position == DHTTableViewItemPositionLast || item.position == DHTTableViewItemPositionSingle ? @0 : @(kTDFSeperatorDefaultMargin) );
    }];
}

- (void)_tdf_updateTopLineViewWithItem:(DHTTableViewItem *)item {
    if (![self tdf_topLineView].superview) return;
    
    [self.tdf_topLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(item.position == DHTTableViewItemPositionFirst || item.position == DHTTableViewItemPositionSingle ? @0 : @(kTDFSeperatorDefaultMargin) );
    }];
}

- (void)tdf_updateSeperatorWithItem:(DHTTableViewItem *)item {
    [self _tdf_updateBottomLineViewWithItem:item];
    [self _tdf_updateTopLineViewWithItem:item];
}

- (void)tdf_setFrame:(CGRect)frame {
    if (self.tdf_showBottomMargin) {
        frame.size.height -= kTDFSeperatorDefaultHeight;
    }
    [self tdf_setFrame:frame];
}

- (UIView *)tdf_topLineView {
    if (!objc_getAssociatedObject(self, _cmd)) {
        objc_setAssociatedObject(self, _cmd, [self generateSeperatorView], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, _cmd);;
}

- (UIView *)tdf_bottomLineView {
    if (!objc_getAssociatedObject(self, _cmd)) {
        objc_setAssociatedObject(self, _cmd, [self generateSeperatorView], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, _cmd);;
}

- (void)setTdf_showBottomMargin:(BOOL)tdf_showBottomMargin {
    objc_setAssociatedObject(self, @selector(tdf_showBottomMargin), @(tdf_showBottomMargin), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)tdf_showBottomMargin {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (UIView *)generateSeperatorView {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor tdf_colorWithRGB:0xcccccc];
    return line;
}

-(void)setTdf_showTopLine:(BOOL)tdf_showTopLine {
    if (tdf_showTopLine) {
        if ([self tdf_topLineView].superview) return;
        
        [self.contentView addSubview:[self tdf_topLineView]];
        [[self tdf_topLineView] mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(kTDFSeperatorDefaultMargin);
            make.right.equalTo(self.contentView);
            make.height.equalTo(@(kTDFSeperatorDefaultHeight));
        }];
    } else {
        [[self tdf_topLineView] removeFromSuperview];
    }
}

- (BOOL)tdf_showTopLine {
    return [self tdf_topLineView].superview == nil;
}

- (void)setTdf_showBottomLine:(BOOL)tdf_showBottomLine {
    if (tdf_showBottomLine) {
        if ([self tdf_bottomLineView].superview) return;
        
        [self.contentView addSubview:[self tdf_bottomLineView]];
        [[self tdf_bottomLineView] mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(kTDFSeperatorDefaultMargin);
            make.right.equalTo(self.contentView);
            make.height.equalTo(@(kTDFSeperatorDefaultHeight));
        }];
    } else {
        [[self tdf_bottomLineView] removeFromSuperview];
    }
}

- (BOOL)tdf_showBottomLine {
    return [self tdf_bottomLineView].superview == nil;
}
@end
