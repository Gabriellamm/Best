//
//  UserManager.h
//  Best
//
//  Created by Gabriella on 2017/9/30.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"

typedef NS_ENUM(NSInteger, UserLoginType) {
KUserLoginTypeUnkown = 0,
KUserLoginTypeWeVhat = 1,
KUserLoginTypeQQ = 2,
KUserLoginTypeZifubao = 3,
KUserLoginTypeTaobao = 4,

};

typedef void (^LoginBlock)(BOOL success,NSString *des);

#pragma mark ************* macros
#define userManager    [UserManager shareInstance]

@interface UserManager : NSObject


@property (nonatomic,strong)UserInfo *userInfo;
@property (nonatomic,assign)UserLoginType loginType;
@property (nonatomic,assign)BOOL isLogined;// 是否登陆成功

#pragma mark ************* function

+(UserManager *)shareInstance;

/**
 
 加载缓存的用户数据
 
 @return 是否加载成功
 
 */
-(BOOL)loadUserInfo;

/**
 第三方登陆

 @param loginType 登陆方式
 @param completion 登陆完成回调
 */

-(void)login:(UserLoginType )loginType completion:(LoginBlock)completion;

/**
 带参数登陆
 @param  params 表示需要手机号码登陆
 */

-(void)login:(UserLoginType )loginType params:(NSDictionary *)params completion:(LoginBlock)completion;

/**
 自动登陆

 @param completion 回调

 */
-(void)autoLoginToServer:(LoginBlock)completion;

@end
