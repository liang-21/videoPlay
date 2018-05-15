//
//  TDFMutiTableViewItem.m
//  TDFComponents
//
//  Created by chaiweiwei on 2017/10/21.
//

#import "TDFMutiTableViewItem.h"
#import "UIColor+tdf_standard.h"

@implementation TDFMutiTableViewItem

- (instancetype)init {
    if(self = [super init]) {
        self.contentViewAlpha = 0.7;
        self.titleColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
        self.subtitleColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1];
        self.titleColor2 = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
        self.subtitleColor2 = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1];
        self.titleFont = [UIFont systemFontOfSize:15];
        self.subtitleFont = [UIFont systemFontOfSize:13];
        self.titleFont2 = [UIFont systemFontOfSize:15];
        self.subtitleFont2 = [UIFont systemFontOfSize:13];
        self.seperatoInsets = UIEdgeInsetsMake(0, 15, 0, 15);
        
        self.cellHeight = 64;
    }
    return self;
}

@end
