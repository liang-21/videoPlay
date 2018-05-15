//
//  TDFOpenKBStatusItem.h
//  TDFComponents
//
//  Created by doubanjiang on 2017/12/15.
//

#import "DHTTableViewItem.h"

typedef NS_ENUM(NSUInteger, TDFOpenKBStatusItemLineType) {
    TDFOpenKBStatusItemLineType_Bottom,
    TDFOpenKBStatusItemLineType_Top,
    TDFOpenKBStatusItemLineType_All,
};

@interface TDFOpenKBStatusItem : DHTTableViewItem

@property (nonatomic ,assign) TDFOpenKBStatusItemLineType lineType;

@property (nonatomic, strong) UIImage *iconImg;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *detail;

@end
