//
//  ConstantDefinition.h
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#ifndef ConstantDefinition_h
#define ConstantDefinition_h


#define PAY_WXPAY @"wxpay"

#define carrier @"中国联通"
#define dbrand @"iPhone"
#define net @"wifi"
#define resolution @"750x1334"
#define device_ @"bc8009d033507ffc7c377adf82b8afd8b3a3aded2fab34bb047cbedc56b90631"
#define response_language @"zh-CN"
#define tokenn @"8af91bad552310ba6013d794e0721128"
#define  tirgge @"user"
#define user_ @"2599645"
#define  verson @"ios_8.0.2"
#define idd @"2599645"
#define cursor  @"0"
#define show_all @"1"
#define target_user_id	 @"2599645"

#define  baseApi   @"http://www.mofunenglish.com/"
#define api3  @"api3/"
#define user @"user/"
#define mb @"mb/"
/*  注意事项 */
// meapi
//   http://www.mofunenglish.com/api3/user/profile?c_carrier=%E4%B8%AD%E5%9B%BD%E8%81%94%E9%80%9A&c_dbrand=iPhone&c_dmodel=iPhone9%2C1&c_net=wifi&c_osversion=10.0.2&c_resolution=750x1334&device_id=bc8009d033507ffc7c377adf82b8afd8b3a3aded2fab34bb047cbedc56b90631&lang=zh-CN&token=8af91bad552310ba6013d794e0721128&trigger=user&user_id=2599645&v=ios_8.0.1&id=2599645
#define profile @"profile"
#define meApi [NSString stringWithFormat:@"%@%@%@%@%@",baseApi,api3,user,profile ,@"?c_carrier=%E4%B8%AD%E5%9B%BD%E8%81%94%E9%80%9A&c_dbrand=iPhone&c_dmodel=iPhone9%2C1&c_net=wifi&c_osversion=10.0.2&c_resolution=750x1334&device_id=bc8009d033507ffc7c377adf82b8afd8b3a3aded2fab34bb047cbedc56b90631&lang=zh-CN&token=8af91bad552310ba6013d794e0721128&trigger=user&user_id=2599645&v=ios_8.0.1&id=2599645"]


//  http://www.mofunenglish.com/api3/mb/my_dub_list?c_carrier=%E4%B8%AD%E5%9B%BD%E8%81%94%E9%80%9A&c_dbrand=iPhone&c_dmodel=iPhone9%2C1&c_net=wifi&c_osversion=10.0.2&c_resolution=750x1334&device_id=bc8009d033507ffc7c377adf82b8afd8b3a3aded2fab34bb047cbedc56b90631&lang=zh-CN&token=8af91bad552310ba6013d794e0721128&trigger=user&user_id=2599645&v=ios_9.1.3&cursor=0&show_all=1&target_user_id=2599645
#define my_dub_list @"my_dub_list"
#define my_Dubbing_list meApi [NSString stringWithFormat:@"%@%@%@%@%@",baseApi,api3,mb,my_dub_list,@"?c_carrier=%E4%B8%AD%E5%9B%BD%E8%81%94%E9%80%9A&c_dbrand=iPhone&c_dmodel=iPhone9%2C1&c_net=wifi&c_osversion=10.0.2&c_resolution=750x1334&device_id=bc8009d033507ffc7c377adf82b8afd8b3a3aded2fab34bb047cbedc56b90631&lang=zh-CN&token=8af91bad552310ba6013d794e0721128&trigger=user&user_id=2599645&v=ios_9.1.3&cursor=0&show_all=1&target_user_id=2599645"]


#endif /* ConstantDefinition_h */
/**
 
项目日志 
 
  网络  主题改变   tabbar 自定义    跳转使用delegate   加密解密  配置
 
 代码自动布局  视频
 */
