//
//  BaiduMapFactory.m
//  Best
//
//  Created by Gabriella on 2017/10/23.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "BaiduMapFactory.h"
#import "BaiMapView.h"

@interface BaiduMapFactory ()

@property (nonatomic,copy) NSString           *appKey;
@end

@implementation BaiduMapFactory

-(instancetype)initWithAppKey:(NSString*)appKey{

    self = [super init];
    if (self) {
        _appKey = appKey;
    }

    return self;
}



// mapView生产线
-(id<AbstractMapView>)getMapViewWithFrame:(CGRect)frame{

    return [[BaiMapView alloc]initWithFrame:frame];

}
@end
