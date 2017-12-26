//
//  TextDataHandler.h
//  Best
//
//  Created by Gabriella on 2017/12/6.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestHandlerProtocol.h"
#import "CDDContext.h"
#import "CDDMutableArray.h"

@interface TextDataHandler : CDDDataHandler<TestHandlerProtocol>

@property (nonatomic, strong) CDDMutableArray*                 datas;
@end
