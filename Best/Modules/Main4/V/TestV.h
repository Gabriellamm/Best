//
//  TestV.h
//  Best
//
//  Created by Gabriella on 2017/11/30.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol blueBtnDelegate <NSObject>

-(void)blueBtnAction:(UIButton *)sender;
@end


@interface TestV : UIView
@property (nonatomic,weak)id<blueBtnDelegate>blueDelegate;

-(void)buildView;
@end
