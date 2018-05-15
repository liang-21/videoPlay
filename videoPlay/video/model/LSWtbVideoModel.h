//
//  LSWtbVideoModel.h
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/7.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSWtbVideoModel : NSObject
@property (nonatomic, assign) int videoid;
@property (nonatomic, assign) int userid;
@property (nonatomic, copy) NSString *videourl;
@property (nonatomic, copy) NSString *videoimage;
@property (nonatomic, copy) NSString *videotitle;
@property (nonatomic, strong) NSNumber *videowatch;
@property (nonatomic, copy)NSString *videointroduce;
@property (nonatomic, assign) long videocreattime;


@end
