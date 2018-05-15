//
//  TDFMenuGrayHeaderItem.m
//  TDFShopInfoModule
//
//  Created by chaiweiwei on 2018/4/11.
//

#import "TDFMenuGrayHeaderItem.h"
#import "UIColor+tdf_standard.h"

@implementation TDFMenuGrayHeaderItem

- (instancetype)init {
    if(self = [super init]) {
        self.subtitleFont = [UIFont systemFontOfSize:15];
        self.subtitleColor = [UIColor tdf_hex_333333];
        self.seperatoInsets = UIEdgeInsetsMake(0, 15, 0, 15);
        self.height = 44;
    }
    return self;
}
@end
