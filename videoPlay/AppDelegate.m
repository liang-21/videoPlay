//
//  AppDelegate.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/4/8.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "AppDelegate.h"
#import "WMPageController.h"
#import "LSWVideoViewController.h"
#import "LSWRankViewController.h"
#import "LSWPublishViewController.h"
#import "LSWPersonalViewController.h"
#import "LSWVideoNextViewController.h"
#import "UIColor+Hex.h"
#import "LSWLoginViewController.h"

@interface AppDelegate ()
@property (nonatomic ,strong) UITabBarController *tabBarController;
@property (nonatomic ,assign) NSInteger indexFlag;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor grayColor];
    //    UITabBarController *tb = [[UITabBarController alloc]init];
    self.tabBarController = [[UITabBarController alloc]init];
    self.tabBarController.delegate = self;
    [self.tabBarController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:12.0F], NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#EE82EE"]} forState:UIControlStateSelected];
    [self.tabBarController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12.0F],  NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    self.tabBarController.tabBar.tintColor = [UIColor colorWithHexString:@"#EE82EE"];
//    LoginView *login = [[LoginView alloc]init];
    LSWLoginViewController *loginVC = [[LSWLoginViewController alloc] init];
//    self.window.rootViewController = loginVC;
    
    self.window.rootViewController = self.tabBarController;
    
    
    
    
    UIViewController *rankVc = [[LSWRankViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:rankVc];
    //    颜色部分代码无效
    nav2.view.backgroundColor = [UIColor redColor];
    nav2.tabBarItem.title = @"排行";
    nav2.tabBarItem.image = [UIImage imageNamed:@"rank"];

    
    
    
    //    UIViewController *c2 = [[NewsView alloc]init];
    WMPageController *WMPVc = [self createPages];
    UINavigationController *nav1= [[UINavigationController alloc]initWithRootViewController:WMPVc];
    nav1.tabBarItem.title = @"首页";
    nav1.tabBarItem.image = [UIImage imageNamed:@"home"];
    
    
    UIViewController *pubVc = [[LSWPublishViewController alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:pubVc];
    nav3.view.backgroundColor = [UIColor whiteColor];
    nav3.tabBarItem.title = @"动态";
    nav3.tabBarItem.image = [UIImage imageNamed:@"publish"];
    
    
    UIViewController *personalVc = [[LSWPersonalViewController alloc]init];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:personalVc];
    nav4.view.backgroundColor = [UIColor grayColor];
    nav4.tabBarItem.title = @"我的";
    nav4.tabBarItem.image = [UIImage imageNamed:@"personal"];
    
    
    self.tabBarController.viewControllers = @[nav1,nav2,nav3,nav4];
    [self.window makeKeyAndVisible];
    [self.tabBarController presentViewController:loginVC animated:YES completion:nil];
    
    return YES;
}
- (WMPageController *)createPages {
    
    
    //WMPageController中包含的页面数组
    NSArray *controllers = [NSArray arrayWithObjects:[LSWVideoViewController class], [LSWVideoNextViewController class], nil];
    //WMPageController控件的标题数组
    NSArray *titles = [NSArray arrayWithObjects:@"推荐", @"直播" ,nil];
    //用上面两个数组初始化WMPageController对象
    WMPageController *pageController = [[WMPageController alloc] initWithViewControllerClasses:controllers andTheirTitles:titles];
    pageController.menuViewStyle = WMMenuViewStyleLine;
    pageController.titleColorSelected = [UIColor whiteColor];
    //    pageController.titleColorNormal = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
    pageController.titleColorNormal=[UIColor whiteColor];
    
    //    pageController.progressColor = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
    pageController.progressColor = [UIColor whiteColor];
    //    pageController.itemsWidths = @[@(70),@(100),@(70)]; // 这里可以设置不同的宽度
    
    //设置WMPageController每个标题的宽度
    pageController.menuItemWidth = [[UIScreen mainScreen] bounds].size.width/4;
    //设置WMPageController标题栏的高度
    pageController.menuHeight = 64;
    pageController.menuBGColor = [UIColor colorWithHexString:@"#EE82EE"];
    pageController.progressViewBottomSpace = 3;
    pageController.progressWidth = 40;
    pageController.progressHeight = 3;
    pageController.menuViewBottomSpace = 0;
    
    
    //    字体设置
    pageController.titleSizeNormal=16;
    pageController.titleSizeSelected=16;
    //设置WMPageController选中的标题的颜色
    pageController.titleColorSelected = [UIColor whiteColor];
    return pageController;
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return 2;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    if (index == 0) {
        return [[LSWVideoViewController alloc] init];
    }
    else{
        return [[LSWVideoNextViewController alloc] init];
    }
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    if (index == 0) {
        return @"推荐";
    }
    else{
        return @"直播";
    }
}








-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    NSInteger index = [self.tabBarController.viewControllers indexOfObject:viewController];
    
    if (self.indexFlag != index) {
        [self animationWithIndex:index];
    }
    
}

- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBarController.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.08;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.7];
    pulse.toValue= [NSNumber numberWithFloat:1.3];
    [[tabbarbuttonArray[index] layer]
     addAnimation:pulse forKey:nil];
    
    self.indexFlag = index;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
