//
//  AppDelegate.m
//  test
//
//  Created by wangzhiwei on 2017/7/24.
//  Copyright © 2017年 wangzhiwei. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNav.h"
#import <UserNotifications/UserNotifications.h>
#import "ViewController.h"
#import "SecondVC.h"
#import "ThirdVC.h"
@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.backgroundColor = [UIColor whiteColor];
    ViewController *vc = [[ViewController alloc] init];
    vc.title  =@"abvc";
    BaseNav *nav = [[BaseNav alloc] initWithRootViewController:vc];
    
    SecondVC *vc1 = [[SecondVC alloc] init];
    BaseNav *nav1 = [[BaseNav alloc] initWithRootViewController:vc1];

    ThirdVC *vc2 = [[ThirdVC alloc] init];
    BaseNav *nav2 = [[BaseNav alloc] initWithRootViewController:vc2];
    
    ViewController *vc3 = [[ViewController alloc] init];
    vc3.view.backgroundColor = [UIColor orangeColor];
    BaseNav *nav3 = [[BaseNav alloc] initWithRootViewController:vc3];

//    
    UITabBarItem * barItem1 = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"menu_0@2x1_2.png"] selectedImage:[UIImage imageNamed:@"menu_0@2x1_1.png"]];
    [barItem1 setImageInsets:UIEdgeInsetsMake(6, 0.0, -6.0, 0.0)];
    vc.tabBarItem = barItem1;
    
    UITabBarItem * barItem2 = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"menu_0@2x3_2.png"] selectedImage:[UIImage imageNamed:@"menu_0@2x3_1.png"]];
    [barItem2 setImageInsets:UIEdgeInsetsMake(6, 0.0, -6.0, 0.0)];
    vc1.tabBarItem = barItem2;
    UITabBarItem * barItem3 = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"menu_0@2x2_2.png"] selectedImage:[UIImage imageNamed:@"menu_0@2x2_1.png"]];
    [barItem3 setImageInsets:UIEdgeInsetsMake(6, 0.0, -6.0, 0.0)];
    vc2.tabBarItem = barItem3;
    
    UITabBarItem * barItem4 = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"menu_0@2x4_2.png"] selectedImage:[UIImage imageNamed:@"menu_0@2x4_1.png"]];
    [barItem4 setImageInsets:UIEdgeInsetsMake(6, 0.0, -6.0, 0.0)];
    vc3.tabBarItem = barItem4;
    [barItem4 setBadgeValue:@"23"];
    barItem4.badgeColor = [UIColor greenColor];

    UITabBarController *tab = [[UITabBarController alloc] init];
    tab.viewControllers = @[nav,nav1,nav2,nav3];
    tab.tabBar.translucent = YES;
//    UIImageView *tabBarBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,
//    tab.tabBar.frame.size.width, tab.tabBar.frame.size.height)];
//    tab.tabBar.BackgroundImageView.image = [UIImage imageNamed:@"ITaskTabMain.png"];
//    [tab.tabBar insertSubview:tabBarBackgroundImageView atIndex:1]; //atIndex决定你的图片显示在标签栏的哪一层
//    tab.tabBar.itemWidth = 100;
//        tab.tabBar.itemPositioning = UITabBarItemPositioningFill;
    tab.selectedIndex =1;
    window.rootViewController = tab;
    [window makeKeyAndVisible];
    self.window =window;
//    [UIApplication sharedApplication].applicationIconBadgeNumber = 8;
//
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
//        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
//        center.delegate = self;
//        [center requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionBadge completionHandler:^(BOOL granted, NSError * _Nullable error) {
//            if (granted) {
//                [UIApplication sharedApplication].applicationIconBadgeNumber = 15;
//
//                [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
//                    
//                }];
//            }else{
//
//            }
//        }];
//    }else if ([[UIDevice currentDevice].systemVersion floatValue] > 8.0){
//        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge categories:nil]];
//        
//    }
//    [UIApplication sharedApplication].applicationIconBadgeNumber = 5;
//
////    [[UIApplication sharedApplication] registerForRemoteNotifications];
    return YES;
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
