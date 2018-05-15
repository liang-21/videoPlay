//
//  TDFMSStepConfigHeaderItem.h
//  ActivityForRestApp
//
//  Created by 黄河 on 2017/12/6.
//

#import "TDFBaseEditItem.h"

@interface TDFMSStepConfigData :NSObject

@property (nonatomic, strong)NSString *title;
@property (nonatomic, assign)int step;

@end

@interface TDFMSStepConfigHeaderItem : TDFBaseEditItem

@property (nonatomic, strong)NSArray<TDFMSStepConfigData *> *dataArray;

@property (nonatomic, assign)int step;

@property (nonatomic, assign)int hide;
@end
