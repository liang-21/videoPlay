//
//  TDFTableViewItem.m
//  Pods
//
//  Created by chaiweiwei on 2017/4/28.
//
//

#import "TDFTableViewItem.h"
#import "UIColor+tdf_standard.h"

@implementation TDFTableViewItem

- (instancetype)init {
    if(self = [super init]) {
        self.style = TDFTableViewCellStyleDefault;
        self.accessoryType = TDFTableViewCellAccessoryNone;
        self.shouldShow = YES;
        self.contentViewAlpha = 0.7;
        self.titleColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
        self.subtitleColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1];
        self.titleFont = [UIFont systemFontOfSize:15];
        self.subtitleFont = [UIFont systemFontOfSize:13];
        self.reasonFont = [UIFont systemFontOfSize:15.0];
        self.reasonColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1];
        self.imageInsets = UIEdgeInsetsMake(0, 10, 0, 10);
        self.accessoryInsets = UIEdgeInsetsMake(0, 5, 0, 10);
        self.seperatoInsets = UIEdgeInsetsMake(0, 10, 0, 10);
        self.cellHeightForStyleExceptSubtitle = 48;
        self.numLineOfTitle = 1;
    }
    return self;
}

@end
