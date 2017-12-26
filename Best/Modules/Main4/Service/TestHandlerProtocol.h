//
//  TestBusinessHandlerProtocol.h
//  Best
//
//  Created by Gabriella on 2017/12/6.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDDContext.h"
#import "TestModel.h"

@class CDDMutableArray;


@protocol TestHandlerProtocol <NSObject>

-(CDDMutableArray *)getDatas;

- (void)insertNewModel:(TestModel*)modle;

@end
