//
//  BaiMapView.m
//  Best
//
//  Created by Gabriella on 2017/10/25.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "BaiMapView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

@interface BaiMapView()

@property (nonatomic, strong)BMKMapView *mapView;
@end

@implementation BaiMapView

-(UIView *)getView{

    return _mapView;
}

//构造方法需要指定MapView大小
//-(instancetype)initWithFrame:(CGRect)frame{
//
//    self = [super init];
//    if (self) {
//
//        _mapView = [[BMKMapView alloc]initWithFrame:frame];
//    }
//
//    return self;
//}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super init];
    if (self) {
        _mapView = [[BMKMapView alloc]initWithFrame:frame];
    }
    // 为什么不跳出来了？
    return self;
}
@end
