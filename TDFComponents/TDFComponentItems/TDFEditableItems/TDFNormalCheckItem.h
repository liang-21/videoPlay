//
//  TDFNormalCheckItem.h
//  TDFComponents
//
//  Created by doubanjiang on 2017/12/18.
//

#import "DHTTableViewItem.h"

@interface TDFNormalCheckItem : DHTTableViewItem

@property (nonatomic, copy) NSString *title;

@property (nonatomic ,assign) BOOL isSelected;

@property (nonatomic, strong) void (^checkBlock)();
@end
