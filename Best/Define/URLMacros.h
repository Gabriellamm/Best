//
//  URLMacros.h
//  Best
//
//  Created by Gabriella on 2017/10/17.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#ifndef URLMacros_h
#define URLMacros_h


//内部版本号 每次发版递增
#define KVersionCode 1


/**开发服务器*/
#define URL_main @"http://192.168.20.31:20000/shark-miai-service"
//#define URL_main @"http://192.168.11.122:8090" //

#pragma mark - ——————— 用户相关 ————————
//自动登录
#define URL_user_auto_login @"/api/autoLogin"
//登录
#define URL_user_login @"/api/login"
//用户详情
#define URL_user_info_detail @"/api/user/info/detail"
//修改头像
#define URL_user_info_change_photo @"/api/user/info/changephoto"
//注释
#define URL_user_info_change @"/api/user/info/change"


#endif /* URLMacros_h */
