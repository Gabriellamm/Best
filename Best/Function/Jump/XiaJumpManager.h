//
//  XiaJumpManager.h
//  Best
//
//  Created by Gabriella on 2018/1/9.
//  Copyright © 2018年 Gabriella. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XiaJumpManager : NSObject


+(XiaJumpManager *) navigation:(UIViewController *)originalVC pushToSpecifiedVC:(NSString *)ViewControllerString;

// nav 参数
+(XiaJumpManager *) navigation:(id)originalVC pushToSpecifiedVC:(UIViewController *)ViewController withParam:(NSDictionary *)param;

// vc
+(XiaJumpManager *)currentViewController:(id )currentViewController presentToSpecifiedVC:(UIViewController *)ViewController;

// vc 参数
+(XiaJumpManager *)currentViewController:(id)currentViewController presentToSpecifiedVC:(UIViewController *)ViewController withParam:(NSDictionary *)param;

//  给对象添加属性
+ (id)object:(id)object setPropertyValues:(NSDictionary *)param ;
@end

