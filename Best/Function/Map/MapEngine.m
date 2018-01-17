//
//  MapEngine.m
//  Best
//
//  Created by Gabriella on 2017/10/23.
//  Copyright © 2017年 Gabriella. All rights reserved.

#import "MapEngine.h"
#import "PlatformXmlParser.h"
#import "Platform.h"


@interface MapEngine()
@property (nonatomic,strong) NSMutableArray          *xmlArr;


@end

@implementation MapEngine

SINGLETON_FOR_CLASS(MapEngine)
// 初始化相应的map
-(void)initMap{
    PlatformXmlParser *xmlParaser = [PlatformXmlParser new];
    _xmlArr = [xmlParaser parser];
    _factory = [self getMapFactory];

}

// 创建工厂
-(id<AbstractMapFactory>)getMapFactory{

    if (_factory !=nil) {
        return _factory;
    }

    @try {
        for (Platform *platform in _xmlArr) {
            if ([platform.isOpen isEqualToString:@"YES"]) {
                _factory = [[NSClassFromString(platform.factoryName) alloc] initWithAppKey:platform.appKey];
                return _factory;
            }
        }
    } @catch (NSException *exception) {
        DLog(@"创建工厂失败，是否配置文件有问题");//补救措施
    }

    return nil;
}
@end
