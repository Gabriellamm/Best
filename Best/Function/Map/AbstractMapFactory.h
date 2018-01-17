//
//  AbstractMapFactory.h
//  Best
//
//  Created by Gabriella on 2017/10/23.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractMapView.h"
@protocol AbstractMapFactory <NSObject>

//每一个地图都需要appKey
-(instancetype)initWithAppKey:(NSString*)appKey;

// mapView生产线
-(id<AbstractMapView>)getMapViewWithFrame:(CGRect)frame;

@end
