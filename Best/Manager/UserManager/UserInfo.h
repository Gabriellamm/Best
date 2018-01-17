//
//  UserInfo.h
//  Best
//
//  Created by Gabriella on 2017/9/30.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameInfo.h"



typedef NS_ENUM(NSInteger,UserGender) {

    UserGenderUnknow = 0,
    UserGenderMale,
    UserGenderFemale // 女的
};
@interface UserInfo : NSObject


@property(nonatomic,assign)long long userid;//用户ID
@property (nonatomic,copy) NSString * idcard;//展示用的用户ID
@property (nonatomic,copy) NSString * photo;//头像
@property (nonatomic,copy) NSString * nickname;//昵称
@property (nonatomic, assign) UserGender sex;//性别
@property (nonatomic,copy) NSString * imId;//IM账号
@property (nonatomic,copy) NSString * imPass;//IM密码
@property (nonatomic,assign) NSInteger  degreeId;//用户等级
@property (nonatomic,copy) NSString * signature;//个性签名
@property (nonatomic,copy) NSString * token;//用户登录后分配的登录Token

@property (nonatomic,strong)GameInfo *gameInfo; // 游戏数据

@end
