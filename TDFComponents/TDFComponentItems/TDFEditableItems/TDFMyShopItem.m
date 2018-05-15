//
//  TDFMyShopItem.m
//
//  Created by doubanjiang on 2017/12/12.
//

#import "TDFMyShopItem.h"
#import "UIColor+Hex.h"

@implementation TDFMyShopItem
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.showRightIcon = YES;
        self.showRightLabel = YES;
        self.showWorkingImage = NO;
        self.subTitleColor = [UIColor colorWithHexString:@"#666666"];
        self.imageCornerRadius = 5;
        self.defultimgName = @"ico_kouBeiShop_defult_img";
        self.topDistance = 14;
    }
    return self;
}
@end
