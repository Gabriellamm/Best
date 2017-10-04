//
//  AppDelegate+AppServise.h
//  Best
//
//  Created by Gabriella on 2017/9/28.
//  Copyright © 2017年 Gabriella. All rights reserved.
/**
 类目:1.AppDelegate类扩展方法  减少AppDelegate压力
 类目可以添加变量   需要 runtime
 */

#import "AppDelegate.h"

@interface AppDelegate (AppServise)



// 初始化wondows
-(void)initWondow;

// 初始化系统数据
-(void)initUserManager;

// app登陆 和 网络
-(void)initAppService;


-(UIViewController *)getCurrentUIVC;
@end
