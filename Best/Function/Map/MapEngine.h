//
//  MapEngine.h
//  Best
//
//  Created by Gabriella on 2017/10/23.
//  Copyright © 2017年 Gabriella. All rights reserved.
//地图引擎：专门用于动态创建具体的地图工厂
//地图引擎：本质上是一个简单工厂模式

#import <Foundation/Foundation.h>
#import "AbstractMapFactory.h"

@interface MapEngine : NSObject

@property (nonatomic,strong) id<AbstractMapFactory>  factory;

SINGLETON_FOR_HEADER(MapEngine)

// 初始化相应的map
-(void)initMap;

// 创建工厂
-(id<AbstractMapFactory>)getMapFactory;
@end
