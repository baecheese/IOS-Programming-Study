//
//  AppDelegate.m
//  TabbarControllerExam
//
//  Created by 배지영 on 2016. 6. 14..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /*
    self.tabBarController = [[UITabBarController alloc]init];
    
    UIViewController *VC1 = [[UIViewController alloc]init];
    VC1.title = @"VC1";
    UINavigationController *naviVC1 = [[UINavigationController alloc]initWithRootViewController:VC1];
    
    UIViewController *VC2 = [[UIViewController alloc]init];
    VC2.title = @"VC2";
    UINavigationController *naviVC2 = [[UINavigationController alloc]initWithRootViewController:VC2];
    
    UIViewController *VC3 = [[UIViewController alloc]init];
    VC3.title = @"VC3";
    UINavigationController *naviVC3 = [[UINavigationController alloc]initWithRootViewController:VC3];
    
    NSArray* controllers = [NSArray arrayWithObjects:naviVC1, naviVC2, naviVC3, nil];
   
    
    //self.tabBarController.viewControllers = controllers;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
     */
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
