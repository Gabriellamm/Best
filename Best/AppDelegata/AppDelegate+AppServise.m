//
//  AppDelegate+AppServise.m
//  Best
//
//  Created by Gabriella on 2017/9/28.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "AppDelegate+AppServise.h"
#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "RootNavigationVC.h"
#import "MainTabBarController.h"

@implementation AppDelegate (AppServise)




#pragma mark ************* def
#pragma mark ************* override
#pragma mark ************* function
// 初始化wondows
-(void)initWondow{
    self.window = [[UIWindow alloc ]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    

}

-(void)initUserManager{

    DLog(@"获取设备IMEI ：%@",[OpenUDID value]);

    if ([userManager loadUserInfo]) {
        self.mainTabBarC =[MainTabBarController new];
        self.window.rootViewController = self.mainTabBarC;

        // 异步的自动登陆
        [userManager autoLoginToServer:^(BOOL success, NSString *des) {
            if (success) {
                DLog(@"自动登陆成功");
                KPostNotification(KNotificationAutoLoginSuccess, nil);
            }else{
                [MBProgressHUD showErrorMessage:NSStringFormat(@"自动登录失败：%@",des)];

            }

        }];
    }else{
        KPostNotification(KNotificationLoginState, @NO);
    }
}

// app登陆 和 网络
-(void)initAppService{
// 登陆改变接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginChangeState:) name:KNotificationLoginState object:nil];

    //  网络改变接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStateChange:) name:KNotificationnetworkStateChange object:nil];
}

-(UIViewController *)getCurrentUIVC{

    UIViewController *superVC = [self getCurrentVC];
    if ([superVC isKindOfClass:[MainTabBarController class]]) {
        UIViewController  *tabSelectVC = ((MainTabBarController*)superVC).selectedViewController;
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            return ((UINavigationController *)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }

    if ([superVC isKindOfClass:[UINavigationController class]]) {
        return ((UINavigationController *)superVC).viewControllers.lastObject;
    }

    return superVC;
}

// 没有到tabbar 中
-(UIViewController *)getCurrentVC{

    UIViewController *result = nil;
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [UIApplication sharedApplication].windows;
        for (UIWindow *tempWindow in windows) {
            if (tempWindow.windowLevel == UIWindowLevelNormal) {
                window = tempWindow;
                break;
            }
        }
    }

    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];//  获取 view  的UIViewController
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    }else{
        result = window.rootViewController;
    }
    return  result;
}
#pragma mark ************* model event
#pragma mark ************* view event
#pragma mark ************* private
-(void)loginChangeState:(NSNotification *)noti{

    BOOL loginSuccess = [noti.object boolValue];

    if (loginSuccess) {
// 避免自动登陆时刷新tabbar
        if (!self.mainTabBarC || ![self.window.rootViewController isKindOfClass:[MainTabBarController class]]) {
            self.mainTabBarC = [MainTabBarController new];
            self.window.rootViewController = self.mainTabBarC;

            //添加动画
            CATransition *animation = [CATransition animation];// 专门做转场动画
            animation.type = @"cube";
            animation.subtype  = kCATransitionFromLeft;
            animation.duration = 0.3f;

            [KAppWindow.layer addAnimation:animation forKey:@"revealAnimation"];

}
    }else{

// 当没有登陆时  进入登陆页面
        self.mainTabBarC = nil;

        RootNavigationVC *Navigation = [[RootNavigationVC alloc]initWithRootViewController:[LoginViewController new]];
        KAppWindow.rootViewController = Navigation;

        CATransition *animation = [CATransition animation];
        animation.type = @"fade";
        animation.subtype = kCATransitionFromRight;
        animation.duration = 0.3f;

        [KAppWindow.layer addAnimation:animation forKey:@"revealAnimation"];

    }
}

//网络改变的通知
-(void)networkStateChange:(NSNotification *)noti{

    BOOL isNetWork = [noti.object boolValue];
    if (isNetWork) {
        if ([userManager loadUserInfo] || !userManager.isLogined) {
            // 有数据可是 没有登陆成功
            [userManager autoLoginToServer:^(BOOL success, NSString *des) {
                if (success) {
                    DLog(@"有网络 登陆成功");
                    KPostNotification(KNotificationAutoLoginSuccess, nil);
                    
                }else{
                    [MBProgressHUD showErrorMessage:NSStringFormat(@"自动登录失败：%@",des)];
                }
            }];
        }else{
            [MBProgressHUD showTopTipMessage:@"网络状态不佳" isWindow:YES];
        }
    }
}
#pragma mark ************* getter / setter
@end
