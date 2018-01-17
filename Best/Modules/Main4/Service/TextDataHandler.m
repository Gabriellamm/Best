//
//  TextDataHandler.m
//  Best
//
//  Created by Gabriella on 2017/12/6.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "TextDataHandler.h"
#import "TestModel.h"

#import "CDDContext.h"
#import "CDDMutableArray.h"
@interface TextDataHandler ()

@end
@implementation TextDataHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.datas = [CDDMutableArray new];
    }
    return self;
}

-(CDDMutableArray *)getDatas{
   
    return  self.datas;
}

- (void)insertNewModel:(TestModel*)modle
{
    [_datas addObject:modle];
}
@end
