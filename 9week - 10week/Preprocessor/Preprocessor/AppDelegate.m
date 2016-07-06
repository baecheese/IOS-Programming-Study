//
//  AppDelegate.m
//  Preprocessor
//
//  Created by 배지영 on 2016. 6. 30..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /* 애플리케이션 버전 아는 법*/
    NSURL *infoURL = [[NSBundle mainBundle] URLForResource:@"Info" withExtension:@"plst"];
    NSDictionary *infoDic = [NSDictionary dictionaryWithContentsOfURL:infoURL];
    NSLog(@"%@", infoDic);
    NSLog(@"%@", infoDic[@"CFBundleShortVersionString"]);
    
    NSLog(@"%@", projectConstantMyName);
    
    /* 전처리기 사용 예제 */
    NSLog(@"언제나 보일 수 있는 로그");
    LOG_LEV_ONE(@"로그 레벨 1 : 플로우만 체크하는 로그");
    LOG_LEV_TWO(@"로그 레벨 2 : 조금더 깊은 내용의 로그");
    NSLog(@"%@", projectConstantMyName);
    
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
