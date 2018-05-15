//
//  TDFCustomTableViewItem.m
//  Pods
//
//  Created by chaiweiwei on 2017/7/25.
//
//

#import "TDFCustomTableViewItem.h"
#import <TDFOldBaseUtil/UIColor+Hex.h>

@implementation TDFCustomTableViewItem

- (instancetype)init {
    if(self = [super init]) {
        self.titleColor = [UIColor colorWithHexString:@"#333333"];
        self.titleFont = [UIFont systemFontOfSize:15];
        
        self.subtitleColor = [UIColor colorWithHexString:@"#0088CC"];
        self.subtitleFont = [UIFont systemFontOfSize:11];
        
        self.borderTipColor = [UIColor whiteColor];
        self.borderTipBgColor = [UIColor colorWithHexString:@"#F58023"];
        self.borderTipFont = [UIFont systemFontOfSize:11];
        
    }
    return self;
}
@end
