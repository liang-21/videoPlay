//
//  TDFMSStepConfigHeaderView.h
//  AssemblyComponent_Example
//
//  Created by 黄河 on 2017/12/5.
//  Copyright © 2017年 infiniteQin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDFMSStepConfigHeaderItem.h"

@interface TDFMSStepConfigHeaderView : UIView

@property (nonatomic, strong) NSArray <TDFMSStepConfigData *>*dataArray;

@property (nonatomic, assign) int step;

- (void)configViewWithItem:(TDFMSStepConfigHeaderItem *)headerItem;

@end
