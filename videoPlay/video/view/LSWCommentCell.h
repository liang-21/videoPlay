//
//  LSWCommentCell.h
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/2.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSWVideoModel.h"
#import "LSWCommentModel.h"

@interface LSWCommentCell : UITableViewCell
- (void) configWithModel: (LSWCommentModel *)model;

@end
