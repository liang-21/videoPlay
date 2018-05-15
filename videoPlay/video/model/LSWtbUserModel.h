//
//  LSWtbUserModel.h
//  videoPlay
//
//  Created by 梁世伟 on 2018/5/7.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSWtbUserModel : NSObject

@property (nonatomic, assign) int nid;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) long ctm;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, strong) NSNumber *focusers;
@property (nonatomic, strong) NSNumber *focuseds;
@property (nonatomic, assign) BOOL focus;





@end
