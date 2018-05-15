//
//  TDFMultiDisplayHeaderItem.h
//  Pods
//
//  Created by chaiweiwei on 2017/2/17.
//
//

#import "DHTTableViewItem.h"
#import "TDFBaseEditItem.h"

@interface TDFMultiDisplayHeaderItem : DHTTableViewItem

@property (nonatomic,copy) NSString *leftContent;
@property (nonatomic,copy) NSString *rightContent;
@property (nonatomic, assign) TDFEditStyle editStyle; // cell的编辑状态，目前是有 可编辑 和 不可编辑两种

@property (nonatomic, strong) void (^deleteBlock)(void);

@end
