//
//  TDFHomeGroupForwardItem.h
//  Pods
//
//  Created by happyo on 2017/3/24.
//
//

#import "DHTTableViewManager.h"

@interface TDFHomeGroupForwardChildCellModel : NSObject

@property (nonatomic, strong) NSString *_id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *actionCode;

@property (nonatomic, strong) NSString *actionId;

@property (nonatomic, copy) NSString *iconUrl;

@property (nonatomic, assign) BOOL isHide;

@property (nonatomic, assign) BOOL isLock;

@property (nonatomic, assign) BOOL isOpen;

@property (nonatomic, strong) NSString *clickUrl;

// 状态图片url，用于显示加锁等状态
@property (nonatomic, strong) NSString *tagUrl;

@end
@interface TDFHomeGroupForwardItem : DHTTableViewItem

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSArray<TDFHomeGroupForwardChildCellModel *> *forwardCells;

@property (nonatomic, strong) void (^clickedBlock)(TDFHomeGroupForwardChildCellModel *model);

@end
