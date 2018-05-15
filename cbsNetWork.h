//
//  cbsNetWork.h
//  这是一个app
//
//  Created by 梁世伟 on 2017/10/15.
//  Copyright © 2017年 梁世伟. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void (^requestSuccessBlock)(NSDictionary *dic);

//请求失败回调block
typedef void (^requestFailureBlock)(NSError *error);

//请求方法define
typedef enum {
    GET,
    POST,
    PUT,
    DELETE,
    HEAD
} HTTPMethod;
@interface cbsNetWork : AFHTTPSessionManager
+ (instancetype)sharedManager;
- (void)requestWithMethod:(HTTPMethod)method
                 WithPath:(NSString *)path
               WithParams:(NSDictionary*)params
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure;

@end
