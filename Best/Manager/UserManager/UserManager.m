//
//  UserManager.m
//  Best
//
//  Created by Gabriella on 2017/9/30.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "UserManager.h"

static  UserManager * userM = nil;
@implementation UserManager

+(UserManager *)shareInstance{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userM = [[UserManager alloc]init];
    });

    return userManager;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userM = [super allocWithZone:zone];
    });

    return userManager;
}


@end
