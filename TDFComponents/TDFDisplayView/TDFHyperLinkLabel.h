//
//  TDFHyperLinkLabel.h
//  TDFHyperLinkLabel
//
//  Created by 黄河 on 2017/6/1.
//  Copyright © 2017年 LearnLibrary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDFCoreTextData.h"
#import "TDFCoreLinkTextData.h"

@interface TDFHyperLinkLabel : UIView

@property (nonatomic, strong)TDFCoreTextData *data;

@property (nonatomic, copy)void(^clickLinkBlock)(TDFCoreLinkTextData *data);

@end
