//
//  UserManager.m
//  Best
//
//  Created by Gabriella on 2017/9/30.
//  Copyright © 2017年 Gabriella. All rights reserved.
/**
 
 UM 配置
 */

#import "UserManager.h"
#import <UMSocialCore/UMSocialCore.h>



@implementation UserManager

SINGLETON_FOR_CLASS(UserManager)
/**
 instancetype 和 id 区别

 1.instancetype 做构造器 id 做 参数
 2. 分环境   MRC ARC
 ---------ARC---------
 编译时 id 不检查类型 instancetype 会检查
  ---------MRC---------
 编译时 id 和 instancetype  不检查类型
 */
#pragma mark ————— 初始化用户管理 —————
//-(instancetype)init{
//
//    self = [super init];
//    if (self) {
//
//    }
//    return self;
//}

// 对于缓存的数据 是否缓存成功
-(BOOL)loadUserInfo{
    YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
    NSDictionary *userDic =(NSDictionary *)  [cache objectForKey:KUserModelCache];
    if (userDic) {
        self.userInfo = [UserInfo modelWithJSON:userDic];
        return YES;
    }

    return NO;
}

// 第三方登录
-(void)login:(UserLoginType )loginType completion:(LoginBlock)completion{

    [self login:loginType params:nil completion:completion];
}

// 账号登录
-(void)login:(UserLoginType )loginType params:(NSDictionary *)params completion:(LoginBlock)completion{

    //  友盟登录类型
    UMSocialPlatformType PlatFormType;
    if (loginType == KUserLoginTypeQQ) {
        PlatFormType = UMSocialPlatformType_QQ;
    }else if (loginType ==KUserLoginTypeWeChat){
        PlatFormType = UMSocialPlatformType_WechatSession;
    }else{
        PlatFormType = UMSocialPlatformType_UnKnown;
    }

    if (loginType != KUserLoginTypeUnkown) {
        [MBProgressHUD showActivityMessageInView:@"授权中。。。"];

        [[UMSocialManager defaultManager] getUserInfoWithPlatform:PlatFormType currentViewController:nil completion:^(id result, NSError *error) {
            if (error) {
                [MBProgressHUD hideHUD];
                if (completion) {
                    completion(NO,error.localizedDescription);
                }
            }else{

                UMSocialUserInfoResponse * resp = result;
                NSDictionary * params = @{@"openid":resp.openid,@"nickname":resp.name,@"photo":resp.iconurl,@"sex":[resp.unionGender isEqualToString:@"男"]?@1:@2, @"cityname":resp.originalResponse[@"city"], @"fr":@(loginType)};
                self.loginType = loginType;


                [self loginToServer:params completion:completion];

            }
        }];
    }


}

#pragma mark ————— 手动登录到服务器 —————
-(void)loginToServer:(NSDictionary *)params completion:(LoginBlock)completion{
    [MBProgressHUD showActivityMessageInView:@"登录中..."];
    [PPNetworkHelper POST:NSStringFormat(@"%@%@",URL_main,URL_user_login) parameters:params success:^(id responseObject) {
        [self LoginSuccess:responseObject completion:completion];

    } failure:^(NSError *error) {
        [MBProgressHUD hideHUD];
        if (completion) {
            completion(NO,error.localizedDescription);
        }
    }];
}
// 自动登录
-(void)autoLoginToServer:(LoginBlock)completion{

    [PPNetworkHelper POST:NSStringFormat(@"%@%@",URL_main,URL_user_auto_login) parameters:nil success:^(id responseObject) {
        [self LoginSuccess:responseObject completion:completion];

    } failure:^(NSError *error) {
        if (completion) {
            completion(NO,error.localizedDescription);
        }
    }];
}

/**
 退出登录

 @param completion 回调
 */
- (void)logout:(LoginBlock)completion{

}

-(void)LoginSuccess:(id)response completion:(LoginBlock)completion{

    if (ValidDict(response)) {
        if (ValidDict(response[@"data"])) {
            NSDictionary *data = response[@"data"];
            if (ValidStr(data[@"imId"]) && ValidStr(data[@"imPass"])) {
                // 登陆 iM

                 KPostNotification(KNotificationLoginState, @YES);

            }else{
                if (completion) {
                    completion(NO,@"IM登陆失败");
                }
            }
        }else{
            if (completion) {
                completion(NO,@"登陆返回数据异常");
            }
            KPostNotification(KNotificationLoginState, @NO);
        }


    }else{
        if (completion) {
            completion(NO,@"登陆返回数据异常");
        }
        KPostNotification(KNotificationLoginState, @NO);
    }
}
@end
