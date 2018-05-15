//
//  LSWVideoModel.h
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/7.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSWtbUserModel.h"
#import "LSWVideoModel.h"
#import "LSWtbVideoModel.h"

@interface LSWVideoModel : NSObject
@property (nonatomic, strong) LSWtbVideoModel *tbVideoDTO;
@property (nonatomic, strong) LSWtbUserModel *tbUserDTO;
@property (nonatomic, strong) NSNumber *numberOfComment;
@property (nonatomic, assign) BOOL collection;
@property (nonatomic, assign) BOOL like;

@end
