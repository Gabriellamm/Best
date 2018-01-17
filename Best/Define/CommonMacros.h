//
//  CommonMacros.h
//  Best
//
//  Created by Gabriella on 2017/9/29.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#ifndef CommonMacros_h
#define CommonMacros_h

//  放常数
#define mainScreemHeight [UIScreen mainScreen].bounds.size.height
#define mainScreemWidth [UIScreen mainScreen].bounds.size.width

#pragma mark ==============  主题  ==============
#define ThemeDefault @"猫爷"
#define KThemeChangeNotification @"KThemeChangeNotification"
#define ThemeNameChange  @"ThemeNameChange"


#pragma mark ==============  用户相关  ==============
#define KNotificationLoginState @"KNotificationLoginState"

// 自动登陆成功通知
#define KNotificationAutoLoginSuccess @"KNotificationAutoLoginSuccess"

//被踢下线
#define KNotificationOnKick @"KNotificationOnKick"

//用户信息缓存 名称
#define KUserCacheName @"KUserCacheName"

//用户model缓存
#define KUserModelCache @"KUserModelCache"

// 用户管理者
//#define userManager
//获取系统对象
#define KApplication [UIApplication sharedApplication]
#define KAppDelegate [UIApplication sharedApplication].delegate
#define KAppWindow   [UIApplication sharedApplication].delegate.window



#pragma mark ==============  网络相关  ==============
// 网络改变通知
#define KNotificationnetworkStateChange @"KNotificationnetworkStateChange"


#define kCDDDemoViewInputViewHeight     48
#define kKeyboardAnimationDuration      0.25f
#define kKeyboardAnimationCurve         7
// 单利


#define SINGLETON_FOR_HEADER(className) +(className *)shared##className;

#define SINGLETON_FOR_CLASS(className) \
static className *_instance;\
+(className *)shared##className{\
if(!_instance){\
_instance=[[self alloc]init];\
}\
return _instance;\
}\
+(id)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t dispatchOnce;\
dispatch_once(&dispatchOnce, ^{\
_instance=[super allocWithZone:zone];\
});\
return _instance;\
}



#endif /* CommonMacros_h */
