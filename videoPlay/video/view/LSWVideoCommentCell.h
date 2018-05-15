//
//  LSWVideoCommentCell.h
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/2.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSWVideoModel.h"

@interface LSWVideoCommentCell : UITableViewCell
@property (nonatomic, copy) void(^buttonClickBlock)(void);
- (void) configWithModel: (LSWVideoModel *)model;

@end
