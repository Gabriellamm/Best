//
//  HttpUtils.h
//  Best
//
//  Created by Gabriella on 2017/11/30.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"


@interface HttpPayUtils : NSObject

SINGLETON_FOR_HEADER(HttpPayUtils)

//向服务器发起预支付
//例如：商品名称、商品价格、商品描述、商品数量等等...
-(void)payWithName:(NSString*)name price:(NSString*)price;
@end
