//
//  AppDelegate.m
//  50 Thinks Book
//
//  Created by Emon on 12/30/16.
//  Copyright © 2016 csm. All rights reserved.
//

#import "AppDelegate.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [[UITabBar appearance] setTintColor:UIColorFromRGB(0xFBE3BF)]; //FBE3BF
    [[UITabBar appearance] setBarTintColor:UIColorFromRGB(0xB9864F)]; //B9864F


    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UITabBar *tabBar = tabBarController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];

    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : UIColorFromRGB(0xFBE3BF) }
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor blackColor] }
                                             forState:UIControlStateSelected];

    tabBarItem1.selectedImage = [[UIImage imageNamed:@"iconTab0"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem1.image = [[UIImage imageNamed:@"iconTab0_hover"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem1.title = @"Foreword";

    tabBarItem2.selectedImage = [[UIImage imageNamed:@"iconTab1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem2.image = [[UIImage imageNamed:@"iconTab1_hover"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem2.title = @"Preview";

    tabBarItem3.selectedImage = [[UIImage imageNamed:@"iconTab2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem3.image = [[UIImage imageNamed:@"iconTab2_hover"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem3.title = @"Author";

    tabBarItem4.selectedImage = [[UIImage imageNamed:@"iconTab3"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem4.image = [[UIImage imageNamed:@"iconTab3_hover"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem4.title = @"Get Hard Copy";

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
