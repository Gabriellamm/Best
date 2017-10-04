//
//  CommonMacros.h
//  Best
//
//  Created by Gabriella on 2017/9/29.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#ifndef CommonMacros_h
#define CommonMacros_h

#pragma mark ==============  用户相关  ==============
#define KNotificationLoginState @"KNotificationLoginState"

// 自动登陆成功通知
#define KNotificationAutoLoginSuccess @"KNotificationAutoLoginSuccess"

//被踢下线
#define KNotificationOnKick @"KNotificationOnKick"
//获取系统对象
#define KAppDelegate [UIApplication sharedApplication].delegate
#define KAppWindow   [UIApplication sharedApplication].delegate.window

#pragma mark ==============  网络相关  ==============
// 网络改变通知
#define KNotificationnetworkStateChange @"KNotificationnetworkStateChange"
#endif /* CommonMacros_h */
