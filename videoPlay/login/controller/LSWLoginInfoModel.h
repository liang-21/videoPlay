//
//  LSWLoginInfoModel.h
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/7.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSWLoginInfoModel : NSObject
@property(nonatomic, copy) NSString *username;
@property(nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, strong) NSNumber *age;
@end
