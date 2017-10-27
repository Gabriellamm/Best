//
//  AbstractMapView.h
//  Best
//
//  Created by Gabriella on 2017/10/24.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AbstractMapView <NSObject>

-(UIView *)getView;

//构造方法需要指定MapView大小
-(instancetype)initWithFrame:(CGRect)frame;
@end
