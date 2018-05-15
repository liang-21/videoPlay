//
//  SelVideoViewController.h
//  SelVideoPlayer
//
//  Created by zhuku on 2018/1/28.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSWVideoModel.h"
#import "LSWCommentModel.h"

@interface SelVideoViewController : UIViewController
@property (nonatomic, strong)LSWVideoModel *model;
@property (nonatomic, strong) NSArray<LSWCommentModel *> *commentList;

@end
