//
//  LSWVideoCollectionViewCell.h
//  videoPlay
//
//  Created by 梁世伟 on 2018/4/10.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSWVideoModel.h"
#import "LSWCommentModel.h"

@interface LSWVideoCollectionViewCell : UICollectionViewCell

- (void) configWithModel: (LSWVideoModel *)model;

@end
