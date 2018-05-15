//
//  TDFSKButtonItemTransaction.m
//  DHTTableViewManager
//
//  Created by tripleCC on 12/9/16.
//  Copyright © 2016 tripleCC. All rights reserved.
//
#import "UIColor+RGB.h"
#import "TDFSKButtonItemTransaction.h"

@implementation TDFSKButtonItemTransaction
- (instancetype)init {
    if (self = [super init]) {
        self.resizable = YES;
        self.backgroundType = TDFSKButtonItemBackgroundTypeWhite;
        self.singleButtonCellInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    }
    return self;
}

- (void)setImageName:(NSString *)imageName {
    self.backgroundImageName = imageName;
}

- (NSString *)imageName {
    return self.backgroundImageName;
}

- (UIColor *)titleColor {
    if (!_titleColor) {
        switch (self.backgroundType) {
            case TDFSKButtonItemBackgroundTypeWhite:
                return [UIColor tdf_colorWithRGB:0xff0033];
            default:
                return [UIColor whiteColor];
        }
    }
    return _titleColor;
}

- (NSString *)backgroundImageName {
    switch (self.backgroundType) {
        case TDFSKButtonItemBackgroundTypeRed:
            _backgroundImageName = @"btn_full_red";
            break;
        case TDFSKButtonItemBackgroundTypeGreen:
            _backgroundImageName = @"btn_full_green";
            break;
        case TDFSKButtonItemBackgroundTypeGray:
            _backgroundImageName = @"btn_full_gray";
            break;
        case TDFSKButtonItemBackgroundTypeRedBoarder:
            _backgroundImageName = @"btn_full_red_boarder";
            break;
        case TDFSKButtonItemBackgroundTypeWhite:
            return nil;
        default:
            break;
    }
    
    return _backgroundImageName;
}
@end
