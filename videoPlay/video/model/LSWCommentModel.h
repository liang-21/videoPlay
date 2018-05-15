//
//  LSWCommentModel.h
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/8.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSWtbUserModel.h"

@interface LSWCommentModel : NSObject
@property (nonatomic, assign) int videoid;
@property (nonatomic, assign) int userid;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSNumber *numberOfFloor;
@property (nonatomic, strong) NSNumber *numberOfLikeComment;
@property (nonatomic, assign) long commenttime;
@property (nonatomic, strong) LSWtbUserModel *tbUserDTO;
@end
