//
//  TDFPreviewButtonItem.h
//  Pods
//
//  Created by 黄河 on 2017/6/29.
//
//

#import "DHTTableViewItem.h"

@interface TDFPreviewButtonItem : DHTTableViewItem

@property (nonatomic, assign)BOOL isShowBottomLine;

@property (nonatomic, copy)NSString *urlString;

@property (nonatomic, copy)NSString *title;

@property (nonatomic, assign)BOOL hide;

@property (nonatomic, copy)void(^previewClickBlock)();
@end
