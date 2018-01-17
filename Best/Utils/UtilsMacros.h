//
//  UtilsMacros.h
//  Best
//
//  Created by Gabriella on 2017/9/30.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h



// 发送通知
#define KPostNotification(name,obj) [[NSNotificationCenter defaultCenter]postNotificationName:name object:obj];
//-------------------打印日志-------------------------
//DEBUG打印 模式下打印日志,当前行
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

//拼接字符串
#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]
//字体
#define SYSTEMFONT(size) [UIFont systemFontOfSize:size]

//颜色
#define KClearColor [UIColor clearColor]
#define KWhiteColor [UIColor whiteColor]
#define KBlackColor [UIColor blackColor]
#define KGrayColor [UIColor grayColor]
#define KGray2Color [UIColor lightGrayColor]
#define KBlueColor [UIColor blueColor]
#define KRedColor [UIColor redColor]
#define KRGBColor(R,G,B,alpha) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:alpha]
#define kRandomColor    KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)        //随机色生成




// 主题
#define ThemeColor(colorName) [[ThemeManage sharedThemeManage] getThemeColor:colorName]
#define ThemeImage(imgName) [[ThemeManage sharedThemeManage] getThemeImg:imgName]
#define ThemeFont(fontName) [[ThemeManage sharedThemeManage] getThemeFont:fontName]

//强弱引用
//强弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;

//获取屏幕宽高
#define KScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreen_Bounds [UIScreen mainScreen].bounds

//数据验证
#define StrValid(f) (f!=nil && [f isKindOfClass:[NSString class]] && ![f isEqualToString:@""])
#define SafeStr(f) (StrValid(f) ? f:@"")
#define HasString(str,key) ([str rangeOfString:key].location!=NSNotFound)

#define ValidStr(f) StrValid(f)
#define ValidDict(f) (f!=nil && [f isKindOfClass:[NSDictionary class]])
#define ValidArray(f) (f!=nil && [f isKindOfClass:[NSArray class]] && [f count]>0)
#define ValidNum(f) (f!=nil && [f isKindOfClass:[NSNumber class]])
#define ValidClass(f,cls) (f!=nil && [f isKindOfClass:[cls class]])
#define ValidData(f) (f!=nil && [f isKindOfClass:[NSData class]])





#endif /* UtilsMacros_h */
