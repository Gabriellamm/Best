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
#import "JMTabBarController.h"
#import "FindVC.h"
#import "MessageVC.h"
#import "TestViewController.h"
#import "MeVC.h"

@implementation AppDelegate (AppServise)
#pragma mark ************* def
#pragma mark ************* override
#pragma mark ************* function
// 初始化wondows
-(void)initWondow{


    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];

    //初始化标题数组, 未选择图片数组, 选择图片数组, 控制器数组
    NSMutableArray *titleArr = [NSMutableArray arrayWithObjects:@"首页",@"制作视频",@"测量",@"个人中心", nil];
    NSMutableArray *imageNormalArr = [NSMutableArray arrayWithObjects:@"tab1_nor",@"tab2_nor",@"tab3_nor",@"tab4_nor", nil];
    NSMutableArray *imageSelectedArr = [NSMutableArray arrayWithObjects:@"tab1_sel",@"tab2_sel",@"tab3_sel",@"tab4_sel", nil];


    FindVC *makeFriendVC = [[FindVC alloc]init];
    MessageVC *msgVC = [[MessageVC alloc]init];
    MeVC *mineVC = [[MeVC alloc]init];
    TestViewController * testVC = [[TestViewController alloc]init];
    NSArray *VCs = @[makeFriendVC,msgVC,mineVC,testVC ];
    NSMutableArray *controllersArr = [NSMutableArray array];
    for (int i=0; i<VCs.count; i++) {
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:VCs[i]];
        [controllersArr addObject:nav];
    }

    //初始化配置信息
    JMConfig *config = [JMConfig config];

    JMTabBarController *tabBarVc = [[JMTabBarController alloc] initWithTabBarControllers:controllersArr NorImageArr:imageNormalArr SelImageArr:imageSelectedArr TitleArr:titleArr Config:config];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.imageEdgeInsets = UIEdgeInsetsMake(-20, 0, 0, 0);
    [btn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [config addCustomBtn:btn AtIndex:2 BtnClickBlock:^(UIButton *btn, NSInteger index) {
        JMLog(@"点击了我");
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor orangeColor];
        [[JMConfig config].tabBarController presentViewController:vc animated:YES completion:nil];

        //测试代码 (两秒后自动关闭)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [vc dismissViewControllerAnimated:YES completion:nil];
        });
    }];

    self.window.rootViewController = tabBarVc;

    [self.window makeKeyAndVisible];


}

-(void)initUserManager{
    DLog(@"获取设备IMEI ：%@",[OpenUDID value]);
    if ([userManager loadUserInfo]) {


        // 异步的自动登陆
        [userManager autoLoginToServer:^(BOOL success, NSString *des) {
            if (success) {
                DLog(@"自动登陆成功");
                KPostNotification(KNotificationAutoLoginSuccess, nil);
            }else{

                 KPostNotification(KNotificationLoginState, @NO);
          

            }

        }];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:KNotificationLoginState object:@NO];
//        KPostNotification(KNotificationLoginState, @NO);
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




            //添加动画
            CATransition *animation = [CATransition animation];// 专门做转场动画
            animation.type = @"cube";
            animation.subtype  = kCATransitionFromLeft;
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
//                    [MBProgressHUD showErrorMessage:NSStringFormat(@"自动登录失败：%@",des)];
                }
            }];
        }else{
//            [MBProgressHUD showTopTipMessage:@"网络状态不佳" isWindow:YES];
        }
    }
}


-(void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self name:KNotificationLoginState object:nil];
}
#pragma mark ************* getter / setter
@end
