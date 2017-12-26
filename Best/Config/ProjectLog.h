//
//  ConstantDefinition.h
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//
#ifdef DEBUG

#define DDLOG(...) printf(" %s\n",[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);
#define DDLOG_CURRENT_METHOD NSLog(@"%@-%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd))

#else

#define DDLOG(...) ;
#define DDLOG_CURRENT_METHOD ;

#endif
