//
//  TDFCardCommonItem.h
//  Pods
//
//  Created by doubanjiang on 2017/3/6.
//
//

#import "DHTTableViewItem.h"

@interface TDFCardCommonItem : DHTTableViewItem

@property (nonatomic, strong) UIImage *iconImage;

@property (nonatomic, copy) NSString *title;

@property (nonatomic ,assign) BOOL  isLock;

@property (nonatomic ,copy) NSString *brandCode;

@property (nonatomic ,copy) NSString *singleCode;

@property (nonatomic, assign) BOOL isOpen;


@property (nonatomic, copy) void (^clickedBlock)();

@end
