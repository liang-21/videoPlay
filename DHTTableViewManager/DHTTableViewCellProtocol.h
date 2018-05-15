//
//  DHTTableViewCellProtocol.h
//  EffetivePlan
//
//  Created by happyo on 16/7/13.
//  Copyright © 2016年 happyo. All rights reserved.
//

#ifndef DHTTableViewCellProtocol_h
#define DHTTableViewCellProtocol_h

#import "DHTTableViewItem.h"

#define RGBA(r,g,b,a)  [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]

@protocol DHTTableViewCellDelegate <NSObject>
    
@required
/**
 cell创建的时候调用，只调用一次，类似viewDidLoad
 */
- (void)cellDidLoad;

/**
 用于获取cell的高度，item可以强转成对应的自定义item

 @param item cell对应的model
 @return cell的高度
 */
+ (CGFloat)heightForCellWithItem:(DHTTableViewItem *)item;


/**
 根据item来更新cell，item可以强转成对应的自定义item，此时cell视图大小还未确定

 @param item cell对应的model
 */
- (void)configCellWithItem:(DHTTableViewItem *)item;

@optional
/**
 cell 即将显示的时候调用
 */
- (void)cellWillDisplay;

/**
 cell 已经显示的时候调用
 */
- (void)cellDidEndDisplay;

@end


#endif /* DHTTableViewCellProtocol_h */
