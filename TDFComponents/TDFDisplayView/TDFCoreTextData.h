//
//  TDFCoreTextData.h
//  TDFHyperLinkLabel
//
//  Created by 黄河 on 2017/6/1.
//  Copyright © 2017年 LearnLibrary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
@interface TDFCoreTextData : NSObject

@property (nonatomic, assign) CTFrameRef ctFrame;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, strong) NSArray *linkArray;

@end
