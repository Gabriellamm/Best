//
//  AppDelegate.m
//  Best
//
//  Created by Gabriella on 2017/9/28.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "AppDelegate.h"
#import "MapEngine.h"
#import "WXApi.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {



    // 设置app服务 通知 网络等
    [self initAppService];
    
    // 设置window
    [self initWondow];

    // 设置用户数据
    [self initUserManager];

    // 初始化map
    [[MapEngine sharedMapEngine] initMap];
    
    return YES;



}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    //微信回调函
    return  [WXApi handleOpenURL:url delegate:[HttpPayUtils sharedHttpPayUtils]];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [WXApi handleOpenURL:url delegate:[HttpPayUtils sharedHttpPayUtils]];
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
