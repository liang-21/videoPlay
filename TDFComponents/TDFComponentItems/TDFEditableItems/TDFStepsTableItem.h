//
//  TDFStepsTableItem.h
//  TDFComponents
//
//  Created by 刘红琳 on 2017/11/14.
//

#import "TDFBaseEditItem.h"

@interface TDFStepsTableItem : TDFBaseEditItem

//步骤进行到第几布，用来显示圆圈的颜色是蓝色还是白色
@property (nonatomic, assign) NSInteger stepIndex;

//步骤标题集
@property (nonatomic, copy) NSArray<NSString *> *titleArray;

@end
