//
//  AppDelegate.h
//  videoPlay
//
//  Created by 梁世伟 on 2018/4/8.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMPageController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarDelegate,UITabBarControllerDelegate,WMPageControllerDelegate,WMPageControllerDataSource>

@property (strong, nonatomic) UIWindow *window;


@end

