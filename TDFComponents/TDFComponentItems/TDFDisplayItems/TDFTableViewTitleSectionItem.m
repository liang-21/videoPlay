//
//  TDFTableViewTitleSectionItem.m
//  TDFComponents
//
//  Created by tripleCC on 2017/12/12.
//
#import "UIColor+RGB.h"
#import "TDFTableViewTitleSectionItem.h"

@implementation TDFTableViewTitleSectionItem
- (instancetype)init
{
    self = [super init];
    if (self) {
        _type = TDFTableViewTitleSectionItemTypeTopMargin;
    }
    return self;
}

- (CGFloat)cellHeight {
    switch (_type) {
        case TDFTableViewTitleSectionItemTypeNormal:
            return 36;
        case TDFTableViewTitleSectionItemTypeTopMargin:
        case TDFTableViewTitleSectionItemTypeTopMarginAndGray:
            return 66;
    }
}

- (UIColor *)titleBackgroundColor {
    switch (_type) {
        case TDFTableViewTitleSectionItemTypeNormal:
        case TDFTableViewTitleSectionItemTypeTopMargin:
            return [UIColor clearColor];
        case TDFTableViewTitleSectionItemTypeTopMarginAndGray:
            return [UIColor tdf_colorWithRGB:0xCCCCCC alpha:0.5];
    }
}
@end
