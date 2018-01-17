//
//  CacheManager.h
//  Finance
//
//  Created by Gabriella on 2017/12/5.
//  Copyright © 2017年 JECO. All rights reserved.
/*
1.内存警告
2.点击内存清理
 
 
 内存文件属性 
  NSUserDirectory

 NSDocumentDirectory:    保存创建程序产生的文件，及应用浏览产生的一些数据。itunes同步备份的时候，会把这个目录一起备份，所这个这目录可以用来存储一些定期备份的资料。
 也是出于这个原因，我们开发的时候本地保存一些图片啊视频啊等东西最好不要放在这东西目录下，因为这样会大大地占用云空间（正常情况下我们的iCloud也就是云容量为5G

 NSCachesDirectory  :Caches和Preferences：Caches是用来保存缓存应用文件，关闭应用后不会丢失，不会同步到iTunes, 比较大的文可以保存在这里。Preferences: 保存应用程序的偏好设置文件，NSUserDefaults保存的东西也在这里,
 
 tmp: 用于存放临时文件，程序关闭后，里面的东西会删除掉。
 获取该文件路径的方法：
 NSString *tmpPath = NSTemporaryDirectory();
 */

#import <Foundation/Foundation.h>

@interface CacheManager : NSObject

SINGLETON_FOR_HEADER(CacheManager)


/*
 * 真机和模拟器下WKWebKit下载的图片资源缓存路径不一样
 * 真机:/Library/Caches/WebKit
 * 模拟器:/Library/Caches/cn.demo.demo/WebKit
 * cn.demo.demo是指APP的Boundle Identifier
 * 真机清理Cache缓存有坑,Snapshots文件夹无操作权限,导致清理失败,提供的方法中已经做了过滤处理
 */


#pragma mark - 计算和清理Cache文件夹总缓存
/*s*
 *  获取Cache文件夹缓存的总大小(Snapshots除外,没有权限获取)
 *
 *  @param path 要获取的文件夹 路径
 *
 *  @return 返回path路径下文件夹的大小
 */
+ (NSString *)getCacheSize;

/**
 *  获取Cache文件夹缓存的总大小(Snapshots除外,没有权限获取)
 *  @return 是否清除成功
 */
+ (BOOL)clearCache;
+ (void)readyClearCache;


#pragma mark - 计算和清理指定路径文件夹总缓存
/*s*
 *  获取path路径下文件夹的大小
 *
 *  @param path 要获取的文件夹 路径
 *
 *  @return 返回path路径下文件夹的大小
 */
+ (NSString *)getCacheSizeWithFilePath:(NSString *)path;

/**
 *  清除path路径下文件夹的缓存
 *
 *  @param path  要清除缓存的文件夹 路径
 *
 *  @return 是否清除成功
 */
+ (BOOL)clearCacheWithFilePath:(NSString *)path;

#pragma mark - 计算和清理WebKit文件夹的WKWebKit总缓存
/*s*
 *  获取WKWebKit路径下文件夹的大小
 *  @return 返回WKWebKit路径下文件夹的大小
 */
+ (NSString *)getWKWebKitCacheSize;

/**
 *  清除WKWebKit路径下文件夹的缓存
 *  @return 是否清除成功
 */
+ (BOOL)clearWKWebKitCache;



#pragma mark - 计算和清理SDImageCache--default文件夹的总缓存
/*s*
 *  获取SDImageCache--default路径下文件夹的大小
 *  @return 返回WKWebKit路径下文件夹的大小
 */
+ (NSString *)getSDImageDefaultCacheSize;

/**
 *  清除SDImageCache--default路径下文件夹的缓存
 *  @return 是否清除成功
 */
+ (BOOL)clearSDImageDefaultCache;


#pragma mark - MAC电脑模拟器下计算和清理WebKit文件夹的WKWebKit总缓存
/*s*
 *  获取模拟器下WKWebKit路径下文件夹的大小
 *  @return 返回WKWebKit路径下文件夹的大小
 */
+ (NSString *)getSimulatorWKWebKitCacheSize;

/**
 *  清除模拟器下WKWebKit路径下文件夹的缓存
 *  @return 是否清除成功
 */
+ (BOOL)clearSimulatorWKWebKitCache;


@end
